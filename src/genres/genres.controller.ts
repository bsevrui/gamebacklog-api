import { Controller, Post, Body, Get, Param, ParseIntPipe, Delete } from '@nestjs/common';
import { CreateGenreDto } from './dto/create-genre.dto';
import { GenresService } from './genres.service';
import { Genre } from './genre.entity';

@Controller('genres')
export class GenresController {
    constructor(private genresService: GenresService) {}

    @Post()
    createGenre(@Body() newGenre: CreateGenreDto): Promise<Genre> {
        return this.genresService.createGenre(newGenre);
    }

    @Get()
    getGenres(): Promise<Genre[]> {
        return this.genresService.getGenres();
    }

    @Get(':id')
    getGenre(@Param('id', ParseIntPipe) id: number) {
        return this.genresService.getGenre(id);
    }

    @Delete(':id')
    deleteGenre(@Param('id', ParseIntPipe) id: number) {
        return this.genresService.deleteGenre(id);
    }
}