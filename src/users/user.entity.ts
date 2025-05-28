import { UsersGames } from "src/usersgames/usersgames.entity";
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm"

@Entity({name: 'users', synchronize: false})
export class User {
    @PrimaryGeneratedColumn()
    id: number;
    @Column({unique: true, type: 'varchar', length: 100})
    email: string;
    @Column({unique: true, type: 'varchar', length: 50})
    username: string;
    @Column({type: 'varchar', length: 255})
    password: string;
    @Column({type: 'enum', enum: ['ADMIN', 'USER'], default: 'USER'})
    role: string;
    @Column({type: 'timestamp', default: () => 'CURRENT_TIMESTAMP'})
    registrationDate: Date;
    @Column({type: 'date'})
    birthdate: Date;
    @Column({nullable: true, type: 'varchar', length: 75})
    firstName: string;
    @Column({nullable: true, type: 'varchar', length: 100})
    lastName: string;
    @Column({nullable: true, type: 'varchar', length: 255})
    profilePicture: string;

    @OneToMany(() => UsersGames, usersgames => usersgames.user)
    games: UsersGames[];
}