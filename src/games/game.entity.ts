import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

@Entity({name: 'games', synchronize: false})
export class Game {
    @PrimaryGeneratedColumn()
    id: number
    @Column({unique: true, type: 'varchar', length: 255})
    title: string
    @Column({type: 'enum', enum: ['Game', 'DLC/Expansion', 'Demo/Beta'], default: 'Game'})
    type: string
    @Column({nullable: true, type: 'varchar', length: 255})
    cover: string
}