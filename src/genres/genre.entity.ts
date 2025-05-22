import { Game } from "src/games/game.entity";
import { Entity, Column, PrimaryGeneratedColumn, ManyToMany, JoinTable } from "typeorm";

@Entity({name: 'genres', synchronize: false})
export class Genre {
    @PrimaryGeneratedColumn()
    id: number;
    @Column({unique: true, type: 'varchar', length: 75})
    name: string;
    @Column({nullable: true, type: 'varchar', length: 255})
    description: string;

    @ManyToMany(() => Game, (game) => game.genres)
    @JoinTable({name: "gamegenres", joinColumn: {name: "genre"}, inverseJoinColumn: {name: "game"}})
    games: Game[];
}