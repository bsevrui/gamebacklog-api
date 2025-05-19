import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module';
import { GenresModule } from './genres/genres.module';
import { GamesModule } from './games/games.module';
import { PlatformsModule } from './platforms/platforms.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mariadb',
      host: 'localhost',
      port: 3306,
      username: 'api',
      password: 'access4api#',
      database: 'gamebacklog',
      entities: [__dirname + '/**/*.entity{.ts,.js}'],
      synchronize: true
    }),
    UsersModule,
    GenresModule,
    GamesModule,
    PlatformsModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}