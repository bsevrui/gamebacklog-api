import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Game } from './game.entity';
import { DataSource, Repository } from 'typeorm';
import { CreateGameDto } from './dto/create-game.dto';
import { UpdateGameDto } from './dto/update-game.dto';

@Injectable()
export class GamesService {
    constructor(
        @InjectRepository(Game) private gameRepository: Repository<Game>,
        private readonly dataSource: DataSource
    ) {}

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
        const result = await this.dataSource.query(`SELECT games.id, games.title, games.type, games.cover, ROUND(AVG(usersgames.score), 2) AS averagescore FROM games LEFT JOIN usersgames ON games.id = usersgames.gameId GROUP BY games.title ORDER BY ROUND(AVG(usersgames.score), 2) DESC, games.title ASC LIMIT 20`);
        return result;
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