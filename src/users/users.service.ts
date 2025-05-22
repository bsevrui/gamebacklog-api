import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from './user.entity';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';

@Injectable()
export class UsersService {
    constructor(@InjectRepository(User) private userRepository: Repository<User>) {}

    async createUser(user: CreateUserDto) {
        const userFound = await this.userRepository.findOne({
            where: {
                email: user.email,
                username: user.username
            }
        });

        if (userFound) {
            return new HttpException('User already exist', HttpStatus.CONFLICT);
        } else {
            const newUser = this.userRepository.create(user);
            return this.userRepository.save(newUser);
        }
    }

    getUsers() {
        return this.userRepository.find({
            order: {
                username: "ASC"
            }
        });
    }

    async getUser(id: number) {
        const userFound = await this.userRepository.findOne({
            where: {
                id: id
            },
            relations: {
                games: true
            }
        });

        if (!userFound) {
            return new HttpException('User Not Found', HttpStatus.NOT_FOUND);
        } else {
            return userFound;
        }
    }

    async deleteUser(id: number) {
        const result = await this.userRepository.delete({id: id});

        if (result.affected === 0) {
            return new HttpException('User Not Found', HttpStatus.NOT_FOUND);
        } else {
            return result;
        }
    }

    async updateUser(id: number, user: UpdateUserDto) {
        const userFound = await this.userRepository.findOne({
            where: {
                id: id
            }
        });

        if (!userFound) {
            return new HttpException('User Not Found', HttpStatus.NOT_FOUND);
        } else {
            const updatedUser = Object.assign(userFound, user);
            return this.userRepository.save(updatedUser);
        }
    }
}