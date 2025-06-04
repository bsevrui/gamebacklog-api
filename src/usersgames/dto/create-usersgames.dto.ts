import { IsInt, IsEnum, IsOptional, IsBoolean, IsNumber } from "class-validator";

export class CreateUsersGamesDto {
    @IsInt()
    userId: number;

    @IsInt()
    gameId: number;

    @IsEnum(['Played', 'Playing', 'Completed', 'Dropped', 'On-Hold', 'Plan-To-Play'])
    status: string;

    @IsOptional()
    @IsNumber()
    score: number;

    @IsBoolean()
    installed: boolean;

    @IsBoolean()
    platinum: boolean;
}