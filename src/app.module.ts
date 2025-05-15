import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { GenresService } from './genres/genres.service';
import { GenresController } from './genres/genres.controller';
import { GenresModule } from './genres/genres.module';

@Module({
  imports: [UsersModule, GenresModule],
  controllers: [AppController, GenresController],
  providers: [AppService, GenresService],
})
export class AppModule {}
