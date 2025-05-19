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
        return this.genreRepository.find();
    }

    async getGenre(id: number) {
        const genreFound = await this.genreRepository.findOne({
            where: {
                id: id
            }
        })

        if (!genreFound) {
            return new HttpException('Genre Not Found', HttpStatus.NOT_FOUND);
        } else {
            return genreFound;
        }
    }

    async deleteGenre(id: number) {
        const genreFound = await this.genreRepository.delete({id: id});

        if (!genreFound) {
            return new HttpException('Genre Not Found', HttpStatus.NOT_FOUND);
        } else {
            return genreFound;
        }
    }

    updateGenre(id: number, genre: UpdateGenreDto) {
        return this.genreRepository.update({id: id}, genre);
    }
}