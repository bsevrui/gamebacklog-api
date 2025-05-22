import { Column, Entity, PrimaryGeneratedColumn } from "typeorm"

@Entity({name: 'users', synchronize: false})
export class User {
    @PrimaryGeneratedColumn()
    id: number;
    @Column({unique: true, type: 'varchar', length: 100})
    email: string;
    @Column({unique: true, type: 'varchar', length: 50})
    username: string;
    @Column({type: 'varchar', length: 120})
    password: string;
    @Column({type: 'enum', enum: ['ADMIN', 'USER'], default: 'USER'})
    role: string;
    @Column({type: 'timestamp', default: () => 'CURRENT_TIMESTAMP'})
    registrationdate: Date;
    @Column({type: 'date'})
    birthdate: Date;
    @Column({nullable: true, type: 'varchar', length: 75})
    first_name: string;
    @Column({nullable: true, type: 'varchar', length: 100})
    last_name: string;
    @Column({nullable: true, type: 'varchar', length: 255})
    profile_picture: string;
}