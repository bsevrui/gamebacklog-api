import { IsEnum, IsInt, IsOptional, IsBoolean } from "class-validator";

export class UpdateUsersGamesDto {
    @IsOptional()
    @IsEnum(['Played', 'Playing', 'Completed', 'Dropped', 'On-Hold', 'Plan-To-Play'])
    status?: string;

    @IsOptional()
    @IsInt()
    score?: number;

    @IsOptional()
    @IsBoolean()
    installed?: boolean;

    @IsOptional()
    @IsBoolean()
    platinum?: boolean;
}