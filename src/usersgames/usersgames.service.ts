import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { UsersGames } from './usersgames.entity';
import { Repository } from 'typeorm';
import { UpdateUsersGamesDto } from './dto/update-usersgames.dto';

@Injectable()
export class UsersgamesService {
    constructor(@InjectRepository(UsersGames) private usersgamesRepository: Repository<UsersGames>) {}

    async update(userId: number, gameId: number, usergame: UpdateUsersGamesDto) {
        const relation = await this.usersgamesRepository.findOneBy({ userId, gameId });
        
        if (!relation) {
            throw new NotFoundException('Relation not found');
        }

        Object.assign(relation, usergame);
        return this.usersgamesRepository.save(relation);
    }
}