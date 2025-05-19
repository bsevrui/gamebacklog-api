import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

@Entity({name: 'genres', synchronize: false})
export class Genre {
    @PrimaryGeneratedColumn()
    id: number
    @Column({unique: true, type: 'varchar', length: 75})
    name: string
    @Column({nullable: true, type: 'varchar', length: 255})
    description: string
}