import { Controller, Post, Body, Get, Param, ParseIntPipe, Delete, Patch, UseGuards } from '@nestjs/common';
import { CreateGenreDto } from './dto/create-genre.dto';
import { GenresService } from './genres.service';
import { Genre } from './genre.entity';
import { UpdateGenreDto } from './dto/update-genre.dto';
import { AuthGuard } from '@nestjs/passport';

@Controller('genres')
export class GenresController {
    constructor(private genresService: GenresService) {}

    @Post()
    @UseGuards(AuthGuard('jwt'))
    createGenre(@Body() newGenre: CreateGenreDto) {
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
    @UseGuards(AuthGuard('jwt'))
    deleteGenre(@Param('id', ParseIntPipe) id: number) {
        return this.genresService.deleteGenre(id);
    }

    @Patch(':id')
    @UseGuards(AuthGuard('jwt'))
    updateGenre(@Param('id', ParseIntPipe) id: number, @Body() genre: UpdateGenreDto) {
        return this.genresService.updateGenre(id, genre);
    }
}