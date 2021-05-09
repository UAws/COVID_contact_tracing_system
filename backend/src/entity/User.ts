import {Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable,} from "typeorm";
import { Audit } from "./Audit";
import { Role } from "./Role";
import { UserCheckIn } from "./UserCheckIn";
import { Venue } from "./Venue";

@Entity()
export class User extends Audit {

    @PrimaryGeneratedColumn()
    user_id: number;

    @Column()
    username: string;

    @Column()
    password: string;

    @Column()
    address: string;

    @Column()
    emailAddress: string;

    @Column()
    is_in_hotspot : boolean;

    @Column()
    is_approval : boolean;

    @Column()
    phone : number;

    // many to many
    // https://typeorm.io/#/many-to-many-relations

    @ManyToMany(() => Role, role => role.Users)
    @JoinTable()
    Role: Role[];

    @ManyToMany(() => UserCheckIn, UserCheckIn => UserCheckIn.Users)
    @JoinTable()
    UserCheckIn : UserCheckIn[];

    @ManyToMany(() => Venue, venue => venue.Users)
    @JoinTable()
    Venue: Venue[];

}
