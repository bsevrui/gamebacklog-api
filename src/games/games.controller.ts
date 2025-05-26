import { Controller, Post, Body, Get, Param, ParseIntPipe, Delete, Patch } from '@nestjs/common';
import { GamesService } from './games.service';
import { Game } from './game.entity';
import { CreateGameDto } from './dto/create-game.dto';
import { UpdateGameDto } from './dto/update-game.dto';

@Controller('games')
export class GamesController {
    constructor(private gamesService: GamesService) {}

    @Post()
    createGame(@Body() newGame: CreateGameDto) {
        return this.gamesService.createGame(newGame);
    }

    @Get()
    getGames(): Promise<Game[]> {
        return this.gamesService.getGames();
    }

    @Get('recentlyadded')
    getRecentlyAdded(): Promise<Game[]> {
        return this.gamesService.getRecentlyAdded();
    }

    @Get('toprated')
    getTopRated(): Promise<Game[]> {
        return this.gamesService.getTopRated();
    }

    @Get('mostpopular')
    getMostPopular(): Promise<Game[]> {
        return this.gamesService.getMostPopular();
    }

    @Get('byplatform/:id')
    getGamesByPlatform(@Param('id', ParseIntPipe) id: number) {
        return this.gamesService.getGamesByPlatform(id);
    }

    @Get(':id')
    getGame(@Param('id', ParseIntPipe) id: number) {
        return this.gamesService.getGame(id);
    }

    @Delete(':id')
    deleteGame(@Param('id', ParseIntPipe) id: number) {
        return this.gamesService.deleteGame(id);
    }

    @Patch(':id')
    updateGame(@Param('id', ParseIntPipe) id: number, @Body() game: UpdateGameDto) {
        return this.gamesService.updateGame(id, game);
    }
}