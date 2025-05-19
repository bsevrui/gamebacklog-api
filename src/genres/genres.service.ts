import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Genre } from './genre.entity';
import { Repository } from 'typeorm';
import { CreateGenreDto } from './dto/create-genre.dto';

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
}