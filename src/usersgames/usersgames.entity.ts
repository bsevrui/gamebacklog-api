import { Entity, Column, ManyToOne, PrimaryColumn, JoinColumn } from "typeorm";
import { User } from "src/users/user.entity";
import { Game } from "src/games/game.entity";

@Entity({name: 'usersgames', synchronize: false})
export class UsersGames {
    @PrimaryColumn()
    userId: number;
    @PrimaryColumn()
    gameId: number;
    @Column({type: 'enum', enum: ['Played', 'Playing', 'Completed', 'Dropped', 'On-Hold', 'Plan-To-Play']})
    status: string;
    @Column({nullable: true, type: 'int'})
    score: number;
    @Column({type: 'tinyint', default: 0})
    installed: boolean;
    @Column({type: 'tinyint', default: 0})
    platinum: boolean;

    @ManyToOne(() => User, user => user.games, { onDelete: 'CASCADE' })
    @JoinColumn({name: 'userId'})
    user: User;

    @ManyToOne(() => Game, game => game.users, { onDelete: 'CASCADE' })
    @JoinColumn({name: 'gameId'})
    game: Game;
}