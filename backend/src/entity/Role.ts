import {Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable,} from "typeorm";
import { Audit } from "./Audit";
import {Menu} from "./Menu";
import {User} from "./User";

@Entity()
export class Role extends Audit{

    @PrimaryGeneratedColumn()
    role_id: number;

    @Column()
    level: number;

    @Column()
    role_name : string;

    @Column()
    description : string;

    @ManyToMany(()=>Menu)
    @JoinTable()
    Menu : Menu[];

    @ManyToMany(()=>User, user=> user.Role)
    Users : User[];


}
