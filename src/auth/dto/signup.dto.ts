import { IsEmail, IsString, IsOptional, IsDateString } from "class-validator";

export class SignupDto {
    @IsEmail()
    email: string;

    @IsString()
    username: string;

    @IsString()
    password: string;

    @IsDateString()
    birthdate?: string;

    @IsOptional()
    @IsString()
    firstName?: string;

    @IsOptional()
    @IsString()
    lastName?: string;
}