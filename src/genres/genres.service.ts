import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Genre } from './genre.entity';
import { Repository } from 'typeorm';
import { CreateGenreDto } from './dto/create-genre.dto';
import { UpdateGenreDto } from './dto/update-genre.dto';

@Injectable()
export class GenresService {
    constructor(@InjectRepository(Genre) private genreRepository: Repository<Genre>) {}

    createGenre(genre: CreateGenreDto) {
        const newGenre = this.genreRepository.create(genre);
        return this.genreRepository.save(newGenre);
    }

    getGenres() {
        return this.genreRepository.find();
    }

    getGenre(id: number) {
        return this.genreRepository.findOne({
            where: {
                id: id
            }
        })
    }

    deleteGenre(id: number) {
        return this.genreRepository.delete({id: id});
    }

    updateGenre(id: number, genre: UpdateGenreDto) {
        return this.genreRepository.update({id: id}, genre);
    }
}