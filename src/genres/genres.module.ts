import { Module } from '@nestjs/common';
import { GenresController } from './genres.controller';
import { GenresService } from './genres.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Genre } from './genre.entity';

@Module({
    imports: [TypeOrmModule.forFeature([Genre])],
    controllers: [GenresController],
    providers: [GenresService],
    exports: [TypeOrmModule]
})
export class GenresModule {}