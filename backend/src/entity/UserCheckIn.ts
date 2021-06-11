import {Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable, ManyToOne,} from "typeorm";
import { Audit } from "./Audit";
import {User} from "./User";
import {Venue} from "./Venue";

@Entity()
export class UserCheckIn extends Audit {

    @PrimaryGeneratedColumn()
    check_in_id: number;

    @Column()
    venue_id: number;

    @Column()
    CheckInAddress : string

    @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP"})
    CheckInTimeStamp : Date;

    @ManyToMany(() => User, user => user.UserCheckIn)
    Users : User[];

    @ManyToOne(() => Venue, venue => venue.userCheckIns)
    venue: Venue;

}
