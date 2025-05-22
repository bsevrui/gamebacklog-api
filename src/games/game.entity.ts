import { Genre } from "src/genres/genre.entity";
import { PlatformsGames } from "src/platformsgames/platformsgames.entity";
import { Entity, Column, PrimaryGeneratedColumn, ManyToMany, OneToMany } from "typeorm";

@Entity({name: 'games', synchronize: false})
export class Game {
    @PrimaryGeneratedColumn()
    id: number;
    @Column({unique: true, type: 'varchar', length: 255})
    title: string;
    @Column({type: 'enum', enum: ['Game', 'DLC/Expansion'], default: 'Game'})
    type: string
    @Column({nullable: true, type: 'varchar', length: 255})
    cover: string;

    @ManyToMany(() => Genre, (genre) => genre.games)
    genres: Genre[];

    @OneToMany(() => PlatformsGames, platformsgames => platformsgames.game)
    platforms: PlatformsGames[];
}