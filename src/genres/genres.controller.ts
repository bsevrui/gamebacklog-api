import { Controller, Post, Body } from '@nestjs/common';
import { CreateGenreDto } from './dto/create-genre.dto';
import { GenresService } from './genres.service';

@Controller('genres')
export class GenresController {
    constructor(private genresService: GenresService) {}

    @Post()
    createGenre(@Body() newGenre: CreateGenreDto) {
        return this.genresService.createGenre(newGenre)
    }
}