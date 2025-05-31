import { Controller, Post, Body, Get, Param, ParseIntPipe, Delete, Patch, UseGuards } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { AuthGuard } from '@nestjs/passport';

@Controller('users')
export class UsersController {
    constructor(private usersService: UsersService) {}

    @Post()
    @UseGuards(AuthGuard('jwt'))
    createUser(@Body() newUser: CreateUserDto) {
        return this.usersService.createUser(newUser)
    }

    @Get()
    @UseGuards(AuthGuard('jwt'))
    getUsers() {
        return this.usersService.getUsers();
    }

    @Get(':id')
    @UseGuards(AuthGuard('jwt'))
    getUser(@Param('id', ParseIntPipe) id: number) {
        return this.usersService.getUser(id);
    }

    @Delete(':id')
    @UseGuards(AuthGuard('jwt'))
    deleteUser(@Param('id', ParseIntPipe) id: number) {
        return this.usersService.deleteUser(id);
    }

    @Patch(':id')
    @UseGuards(AuthGuard('jwt'))
    updateUser(@Param('id', ParseIntPipe) id: number, @Body() user: UpdateUserDto) {
        return this.usersService.updateUser(id, user);
    }
}