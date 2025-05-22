import { Entity, Column, ManyToOne, PrimaryColumn, JoinColumn } from "typeorm";
import { Platform } from "src/platforms/platform.entity";
import { Game } from "src/games/game.entity";

@Entity({name: 'platformsgames', synchronize: false})
export class PlatformsGames {
    @PrimaryColumn()
    platformId: number;
    @PrimaryColumn()
    gameId: number;
    @Column({type: 'date'})
    releaseDate: Date;

    @ManyToOne(() => Platform, platform => platform.games, { onDelete: 'CASCADE' })
    @JoinColumn({name: 'platformId'})
    platform: Platform;

    @ManyToOne(() => Game, game => game.platforms, { onDelete: 'CASCADE' })
    @JoinColumn({name: 'gameId'})
    game: Game;
}