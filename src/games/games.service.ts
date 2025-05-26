import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Game } from './game.entity';
import { Repository } from 'typeorm';
import { CreateGameDto } from './dto/create-game.dto';
import { UpdateGameDto } from './dto/update-game.dto';
import { format } from 'date-fns';

@Injectable()
export class GamesService {
    constructor(@InjectRepository(Game) private gameRepository: Repository<Game>) {}

    async createGame(game: CreateGameDto) {
        const gameFound = await this.gameRepository.findOne({
            where: {
                title: game.title
            }
        });

        if (gameFound) {
            return new HttpException('Game already exist', HttpStatus.CONFLICT);
        } else {
            const newGame = this.gameRepository.create(game);
            return this.gameRepository.save(newGame);
        }
    }

    getGames() {
        return this.gameRepository.find({
            order: {
                title: "ASC"
            }
        });
    }

    getRecentlyAdded() {
        return this.gameRepository.find({
            order: {
                id: "DESC"
            },
            take: 20
        });
    }

    async getTopRated(): Promise<any> {
        return this.gameRepository.createQueryBuilder('games')
            .leftJoin('games.users', 'usersgames')
            .select('games.id', 'id')
            .addSelect('games.title', 'title')
            .addSelect('games.type', 'type')
            .addSelect('games.cover', 'cover')
            .addSelect('ROUND(AVG(usersgames.score), 2)', 'averageScore')
            .groupBy('games.id')
            .addGroupBy('games.title')
            .addGroupBy('games.type')
            .addGroupBy('games.cover')
            .orderBy('ROUND(AVG(usersgames.score), 2)', 'DESC')
            .addOrderBy('games.title', 'ASC')
            .limit(20)
            .getRawMany();
    }

    async getMostPopular(): Promise<any> {
        return this.gameRepository.createQueryBuilder('games')
            .leftJoin('games.users', 'usersgames')
            .select('games.id', 'id')
            .addSelect('games.title', 'title')
            .addSelect('games.cover', 'cover')
            .addSelect('COUNT(usersgames.gameId)', 'popularity')
            .groupBy('games.id')
            .addGroupBy('games.title')
            .addGroupBy('games.cover')
            .orderBy('COUNT(usersgames.gameId)', 'DESC')
            .addOrderBy('games.title', 'ASC')
            .limit(20)
            .getRawMany();
    }

    async getGamesByPlatform(platformId: number): Promise<any> {
        const result = this.gameRepository.createQueryBuilder('games')
            .leftJoinAndSelect('games.platforms', 'pg')
            .where('pg.platformId = :platformId', { platformId })
            .select([
                'games.id AS id',
                'games.title AS title',
                'games.type AS type',
                'games.cover AS cover',
                'pg.releaseDate AS releaseDate',
            ])
            .orderBy('games.title', 'ASC')
            .getRawMany();
        return (await result).map(games => ({
            ...games,
            releaseDate: games.releaseDate
                ? format(new Date(games.releaseDate), 'yyyy-MM-dd')
                : null,
        }));
    }

    async getGame(id: number) {
        const gameFound = await this.gameRepository.findOne({
            where: {
                id: id
            },
            relations: {
                genres: true,
                platforms: true
            }
        });

        if (!gameFound) {
            return new HttpException('Game Not Found', HttpStatus.NOT_FOUND);
        } else {
            return gameFound;
        }
    }

    async deleteGame(id: number) {
        const result = await this.gameRepository.delete({id: id});

        if (result.affected === 0) {
            return new HttpException('Game Not Found', HttpStatus.NOT_FOUND);
        } else {
            return result;
        }
    }

    async updateGame(id: number, game: UpdateGameDto) {
        const gameFound = await this.gameRepository.findOne({
            where: {
                id: id
            }
        });

        if (!gameFound) {
            return new HttpException('Game Not Found', HttpStatus.NOT_FOUND);
        } else {
            const updatedGame = Object.assign(gameFound, game);
            return this.gameRepository.save(updatedGame);
        }
    }
}