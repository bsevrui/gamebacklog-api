import { Controller , Post, Body, Get, Param, ParseIntPipe, Delete, Patch} from '@nestjs/common';
import { PlatformsService } from './platforms.service';
import { Platform } from './platform.entity';
import { CreatePlatformDto } from './dto/create-platform.dto';
import { UpdatePlatformDto } from './dto/update-platform.dto';

@Controller('platforms')
export class PlatformsController {
    constructor(private platformsService: PlatformsService) {}

    @Post()
    createPlatform(@Body() newPlatform: CreatePlatformDto) {
        return this.platformsService.createPlatform(newPlatform);
    }

    @Get()
    getPlatforms(): Promise<Platform[]> {
        return this.platformsService.getPlatforms();
    }

    @Get(':id')
    getPlatform(@Param('id', ParseIntPipe) id: number) {
        return this.platformsService.getPlatform(id);
    }

    @Delete(':id')
    deletePlatform(@Param('id', ParseIntPipe) id: number) {
        return this.platformsService.deletePlatform(id);
    }

    @Patch(':id')
    updatePlatform(@Param('id', ParseIntPipe) id: number, @Body() platform: UpdatePlatformDto) {
        return this.platformsService.updatePlatform(id, platform);
    }
}