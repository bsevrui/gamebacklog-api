import { IsString, IsOptional, IsArray, IsInt } from "class-validator";

export class UpdateGameDto {
    @IsString()
    @IsOptional()
    title?: string;

    @IsString()
    @IsOptional()
    type?: string;

    @IsString()
    @IsOptional()
    cover?: string;

    @IsArray()
    @IsInt({  each: true })
    genres?: number[];
}