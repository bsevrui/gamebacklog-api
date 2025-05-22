import { PlatformsGames } from "src/platformsgames/platformsgames.entity";
import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from "typeorm";

@Entity({name: 'platforms', synchronize: false})
export class Platform {
    @PrimaryGeneratedColumn()
    id: number;
    @Column({unique: true, type: 'varchar', length: 100})
    name: string;
    @Column({type: 'date'})
    release_date: Date;
    @Column({nullable: true, type: 'varchar', length: 255})
    detail: string;
    @Column({nullable: true, type: 'varchar', length: 255})
    picture: string;

    @OneToMany(() => PlatformsGames, platformsgames => platformsgames.platform)
    games: PlatformsGames[]
}