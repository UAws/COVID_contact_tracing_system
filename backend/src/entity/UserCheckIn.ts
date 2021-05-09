import {Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable,} from "typeorm";
import { Audit } from "./Audit";
import {User} from "./User";

@Entity()
export class UserCheckIn extends Audit {

    @PrimaryGeneratedColumn()
    check_in_id: number;

    @Column()
    venue_id: number;

    @Column()
    CheckInAddress : string

    @Column()
    CheckInTimeStamp : Date;

    @ManyToMany(() => User, user => user.UserCheckIn)
    Users : User[];

}
