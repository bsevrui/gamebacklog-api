import { Module } from '@nestjs/common';
import { GamesService } from './games.service';
import { GamesController } from './games.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Game } from './game.entity';
import { GenresModule } from 'src/genres/genres.module';

@Module({
  imports: [TypeOrmModule.forFeature([Game]), GenresModule],
  providers: [GamesService],
  controllers: [GamesController]
})
export class GamesModule {}