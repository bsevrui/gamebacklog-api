import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/users/user.entity';
import { PassportModule } from '@nestjs/passport';
import { JwtStrategy } from './jwt.strategy';
import { JwtModule } from '@nestjs/jwt';

@Module({
    imports: [TypeOrmModule.forFeature([User]), PassportModule.register({defaultStrategy: 'jwt'}), JwtModule.register({secret: 'gamebacklog-api'})],
    providers: [AuthService, JwtStrategy],
    controllers: [AuthController]
})
export class AuthModule {}