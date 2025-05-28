import { Injectable } from '@nestjs/common';
import { User } from 'src/users/user.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcryptjs';
import { SignupDto } from './dto/signup.dto';
import { LoginDto } from './dto/login.dto';
import { JwtService } from '@nestjs/jwt';
import { instanceToPlain } from 'class-transformer';

@Injectable()
export class AuthService {
    constructor(
        @InjectRepository(User)
        private readonly userRepository: Repository<User>,
        private jwtService: JwtService
    ) {}

    async signup(signupDto: SignupDto): Promise<User> {
        const { email, username, password, birthdate, firstName, lastName } = signupDto;
        const hashedPassword = await bcrypt.hash(password, 10);
        const user = this.userRepository.create({email,username,password: hashedPassword, birthdate, firstName, lastName});
        return await this.userRepository.save(user);
    }

    async login(loginDto: LoginDto) {
        const { email, password } = loginDto;
        const user = await this.userRepository.findOne({where: {email}});

        if (!user) {
            throw new Error('User Not Found');
        }

        const isMatch = await bcrypt.compare(password, user.password);

        if (!isMatch) {
            throw new Error('Wrong Password');
        }

        const payload = { userId: user.id, email: user.email };
        const accessToken = this.jwtService.sign(payload);

        return {
            accessToken,
            user: instanceToPlain(user)
        };
    }
}