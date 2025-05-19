import { Module } from '@nestjs/common';
import { PlatformsService } from './platforms.service';
import { PlatformsController } from './platforms.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Platform } from './platform.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Platform])],
  providers: [PlatformsService],
  controllers: [PlatformsController]
})
export class PlatformsModule {}