import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { UsersGames } from './usersgames.entity';
import { Repository } from 'typeorm';
import { UpdateUsersGamesDto } from './dto/update-usersgames.dto';
import { CreateUsersGamesDto } from './dto/create-usersgames.dto';

@Injectable()
export class UsersgamesService {
    constructor(@InjectRepository(UsersGames) private usersgamesRepository: Repository<UsersGames>) {}

    async getOne(userId: number, gameId: number) {
        let relation = await this.usersgamesRepository.findOneBy({ userId, gameId });

        if (!relation) {
            relation = null;
        }

        return relation;
    }

    async create(usergame: CreateUsersGamesDto) {
        const { userId, gameId, status, score, installed, platinum } = usergame;
        const alreadyCreated = await this.usersgamesRepository.findOneBy({ userId, gameId });

        if (alreadyCreated) {
            throw new ConflictException('relation already exist');
        }

        const relation = this.usersgamesRepository.create({userId, gameId, status, score, installed, platinum});

        return await this.usersgamesRepository.save(relation);
    }

    async update(userId: number, gameId: number, usergame: UpdateUsersGamesDto) {
        const relation = await this.usersgamesRepository.findOneBy({ userId, gameId });
        
        if (!relation) {
            throw new NotFoundException('Relation not found');
        }

        Object.assign(relation, usergame);
        return this.usersgamesRepository.save(relation);
    }

    async delete(userId: number, gameId: number): Promise<void> {
        const relation = await this.usersgamesRepository.findOneBy({ userId, gameId });

        if (!relation) {
            throw new NotFoundException('Relation not found');
        }

        await this.usersgamesRepository.remove(relation);
    }
}