import { Entity, Column, PrimaryGeneratedColumn } from "typeorm";

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
}