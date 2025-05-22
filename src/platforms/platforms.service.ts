import { Injectable, HttpException, HttpStatus } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Platform } from './platform.entity';
import { Repository } from 'typeorm';
import { CreatePlatformDto } from './dto/create-platform.dto';
import { UpdatePlatformDto } from './dto/update-platform.dto';

@Injectable()
export class PlatformsService {
    constructor(@InjectRepository(Platform) private platformRepository: Repository<Platform>) {}

    async createPlatform(platform: CreatePlatformDto) {
        const platformFound = await this.platformRepository.findOne({
            where: {
                name: platform.name
            }
        });

        if (platformFound) {
            return new HttpException('Platform already exist', HttpStatus.CONFLICT);
        } else {
            const newPlatform = this.platformRepository.create(platform);
            return this.platformRepository.save(newPlatform);
        }
    }

    getPlatforms() {
        return this.platformRepository.find({
            order: {
                name: "ASC"
            }
        });
    }

    async getPlatform(id: number) {
        const platformFound = await this.platformRepository.findOne({
            where: {
                id: id
            },
            relations: {
                games: true
            }
        });

        if (!platformFound) {
            return new HttpException('Platform Not Found', HttpStatus.NOT_FOUND);
        } else {
            return platformFound
        }
    }

    async deletePlatform(id: number) {
        const result = await this.platformRepository.delete({id: id});

        if (result.affected === 0) {
            return new HttpException('Platform Not Found', HttpStatus.NOT_FOUND);
        } else {
            return result;
        }
    }

    async updatePlatform(id: number, platform: UpdatePlatformDto) {
        const platformFound = await this.platformRepository.findOne({
            where: {
                id: id
            }
        });

        if (!platformFound) {
            return new HttpException('Platform Not Found', HttpStatus.NOT_FOUND);
        } else {
            const updatedPlatform = Object.assign(platformFound, platform);
            return this.platformRepository.save(updatedPlatform);
        }
    }
}