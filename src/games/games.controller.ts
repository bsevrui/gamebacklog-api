import { Controller, Post, Body, Get, Param, ParseIntPipe, Delete, Patch } from '@nestjs/common';
import { GamesService } from './games.service';
import { Game } from './game.entity';
import { CreateGameDto } from './dto/create-game.dto';
import { UpdateGameDto } from './dto/update-game.dto';

@Controller('games')
export class GamesController {
    constructor(private gameService: GamesService) {}

    @Post()
    createGame(@Body() newGame: CreateGameDto) {
        return this.gameService.createGame(newGame);
    }

    @Get()
    getGames(): Promise<Game[]> {
        return this.gameService.getGames();
    }

    @Get(':id')
    getGame(@Param('id', ParseIntPipe) id: number) {
        return this.gameService.getGame(id);
    }

    @Delete(':id')
    deleteGame(@Param('id', ParseIntPipe) id: number) {
        return this.gameService.deleteGame(id);
    }

    @Patch(':id')
    updateGame(@Param('id', ParseIntPipe) id: number, @Body() game: UpdateGameDto) {
        return this.gameService.updateGame(id, game);
    }
}