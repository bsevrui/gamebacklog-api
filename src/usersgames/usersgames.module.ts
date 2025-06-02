import { Module } from '@nestjs/common';
import { UsersgamesController } from './usersgames.controller';
import { UsersgamesService } from './usersgames.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersGames } from './usersgames.entity';

@Module({
  imports: [TypeOrmModule.forFeature([UsersGames])],
  controllers: [UsersgamesController],
  providers: [UsersgamesService]
})
export class UsersgamesModule {}