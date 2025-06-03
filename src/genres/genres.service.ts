import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Genre } from './genre.entity';
import { Repository } from 'typeorm';
import { CreateGenreDto } from './dto/create-genre.dto';
import { UpdateGenreDto } from './dto/update-genre.dto';

@Injectable()
export class GenresService {
    constructor(@InjectRepository(Genre) private genreRepository: Repository<Genre>) {}

    async createGenre(genre: CreateGenreDto) {
        const genreFound = await this.genreRepository.findOne({
            where: {
                name: genre.name
            }
        });
        
        if (genreFound) {
            return new HttpException('Genre already exist', HttpStatus.CONFLICT);
        } else {
            const newGenre = this.genreRepository.create(genre);
            return this.genreRepository.save(newGenre);
        }
    }

    getGenres() {
        return this.genreRepository.find({
            order: {
                name: "ASC"
            }
        });
    }

    async getGenre(id: number) {
        const genreFound = await this.genreRepository.findOne({
            where: {
                id: id
            },
            relations: {
                games: true
            }
        });

        if (!genreFound) {
            return new HttpException('Genre Not Found', HttpStatus.NOT_FOUND);
        } else {
            genreFound.games = genreFound.games.sort((a, b) => a.title.localeCompare(b.title));

            return genreFound;
        }
    }

    async deleteGenre(id: number) {
        const result = await this.genreRepository.delete({id: id});
        
        if (result.affected === 0) {
            return new HttpException('Genre Not Found', HttpStatus.NOT_FOUND);
        } else {
            return result;
        }
    }

    async updateGenre(id: number, genre: UpdateGenreDto) {
        const genreFound = await this.genreRepository.findOne({
            where: {
                id: id
            }
        })

        if (!genreFound) {
            return new HttpException('Genre Not Found', HttpStatus.NOT_FOUND);
        } else {
            const updatedGenre = Object.assign(genreFound, genre);
            return this.genreRepository.save(updatedGenre);
        }
    }
}