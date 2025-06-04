import { Controller, Param, ParseIntPipe, Patch, Body, Delete, Get, UseGuards } from '@nestjs/common';
import { UsersgamesService } from './usersgames.service';
import { UpdateUsersGamesDto } from './dto/update-usersgames.dto';
import { AuthGuard } from '@nestjs/passport';

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