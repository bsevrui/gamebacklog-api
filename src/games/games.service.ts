import { Injectable, HttpException, HttpStatus, ConflictException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Game } from './game.entity';
import { Repository } from 'typeorm';
import { CreateGameDto } from './dto/create-game.dto';
import { UpdateGameDto } from './dto/update-game.dto';

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
            throw new ConflictException('game already registered');
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

    async getGame(id: number) {
        const gameFound = await this.gameRepository.findOne({
            where: {
                id: id
            },
            relations: {
                genres: true,
                platforms: {
                    platform: true
                }
            }
        });

        if (!gameFound) {
            return new HttpException('Game Not Found', HttpStatus.NOT_FOUND);
        } else {
            gameFound.genres = gameFound.genres.sort((a, b) => a.name.localeCompare(b.name));
            gameFound.platforms = gameFound.platforms.sort((a, b) => a.platform.name.localeCompare(b.platform.name));

            const stats = await this.gameRepository.createQueryBuilder('games')
                .leftJoin('games.users', 'usersgames')
                .select('games.id', 'id')
                .addSelect('COUNT(usersgames.gameId)', 'popularity')
                .addSelect('ROUND(AVG(usersgames.score), 2)', 'averageScore')
                .where('games.id = :id', { id })
                .groupBy('games.id')
                .getRawOne();
            const popularity = stats?.popularity ? parseInt(stats.popularity, 10) : 0;
            const averageScore = stats?.averageScore ? parseFloat(stats.averageScore) : null;

            return {
                ...gameFound,
                popularity,
                averageScore
            };
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
            throw new HttpException('Game not found', HttpStatus.NOT_FOUND);
        } else {
            if (game.title && game.title != gameFound.title) {
                const repeatedEntry = await this.gameRepository.findOne({
                    where: {
                        title: game.title
                    }
                });

                if (repeatedEntry) {
                    throw new ConflictException('game title already registared');
                }
            }

            const updatedGame = Object.assign(gameFound, game);

            return this.gameRepository.save(updatedGame);
        }
    }
}