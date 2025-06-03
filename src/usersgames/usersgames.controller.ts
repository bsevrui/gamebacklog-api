import { Controller, Param, ParseIntPipe, Patch, Body, Delete } from '@nestjs/common';
import { UsersgamesService } from './usersgames.service';
import { UpdateUsersGamesDto } from './dto/update-usersgames.dto';

@Controller('usersgames')
export class UsersgamesController {
    constructor(private usersgamesService: UsersgamesService) {}

    @Patch(':userId/:gameId')
    async update(
        @Param('userId', ParseIntPipe) userId: number,
        @Param('gameId', ParseIntPipe) gameId: number,
        @Body() usergame: UpdateUsersGamesDto
    ) {
        return this.usersgamesService.update(userId, gameId, usergame);
    }

    @Delete(':userId/:gameId')
    async delete(
        @Param('userId', ParseIntPipe) userId: number,
        @Param('gameId', ParseIntPipe) gameId: number
    ) {
        return this.usersgamesService.delete(userId, gameId);
    }
}