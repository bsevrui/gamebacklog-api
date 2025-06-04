import { Controller, Param, ParseIntPipe, Patch, Body, Delete, Get, UseGuards, Post } from '@nestjs/common';
import { UsersgamesService } from './usersgames.service';
import { UpdateUsersGamesDto } from './dto/update-usersgames.dto';
import { AuthGuard } from '@nestjs/passport';
import { CreateUsersGamesDto } from './dto/create-usersgames.dto';

@Controller('usersgames')
export class UsersgamesController {
    constructor(private usersgamesService: UsersgamesService) {}

    @Get(':userId/:gameId')
    @UseGuards(AuthGuard('jwt'))
    async getOne(
        @Param('userId', ParseIntPipe) userId: number,
        @Param('gameId', ParseIntPipe) gameId: number
    ) {
        return this.usersgamesService.getOne(userId, gameId);
    }

    @Post()
    @UseGuards(AuthGuard('jwt'))
    async create(@Body() usergame: CreateUsersGamesDto) {
        return this.usersgamesService.create(usergame);
    }

    @Patch(':userId/:gameId')
    @UseGuards(AuthGuard('jwt'))
    async update(
        @Param('userId', ParseIntPipe) userId: number,
        @Param('gameId', ParseIntPipe) gameId: number,
        @Body() usergame: UpdateUsersGamesDto
    ) {
        return this.usersgamesService.update(userId, gameId, usergame);
    }

    @Delete(':userId/:gameId')
    @UseGuards(AuthGuard('jwt'))
    async delete(
        @Param('userId', ParseIntPipe) userId: number,
        @Param('gameId', ParseIntPipe) gameId: number
    ) {
        return this.usersgamesService.delete(userId, gameId);
    }
}