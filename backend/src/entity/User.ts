import {
    Entity,
    PrimaryGeneratedColumn,
    Column,
    ManyToMany,
    JoinTable,
    AfterLoad,
    BeforeInsert, BeforeUpdate,
} from "typeorm";
import * as Bcrypt from 'bcrypt';
import * as Dayjs from 'dayjs';
import * as Jwt from 'jwt-simple';
import { Audit } from "./Audit";
import { Role } from "./Role";
import { UserCheckIn } from "./UserCheckIn";
import { Venue } from "./Venue";
import {JwtConstants} from "../constants/JwtConstants";
import {badImplementation} from "@hapi/boom";

@Entity()
export class User extends Audit {



    constructor(payload?: Record<string, unknown>) {
        super();
        Object.assign(this, payload);
    }

    @PrimaryGeneratedColumn()
    user_id: number;

    @Column()
    username: string;

    @Column()
    password: string;

    @Column({nullable:true})
    address: string;

    @Column()
    emailAddress: string;

    @Column({nullable:true})
    is_in_hotspot: boolean;

    @Column({nullable:true})
    is_approval: boolean;

    @Column({nullable:true})
    phone: number;

    // many to many
    // https://typeorm.io/#/many-to-many-relations

    @ManyToMany(() => Role, role => role.Users)
    @JoinTable()
    Role: Role[];

    @ManyToMany(() => UserCheckIn, UserCheckIn => UserCheckIn.Users)
    @JoinTable()
    UserCheckIn: UserCheckIn[];

    @ManyToMany(() => Venue, venue => venue.Users)
    @JoinTable()
    Venue: Venue[];

    private temporaryPassword;

    @AfterLoad()
    storeTemporaryPassword(): void {
        this.temporaryPassword = this.password;
    }

    @BeforeInsert()
    @BeforeUpdate()
    async hashPassword(): Promise<string | boolean> {
        try {
            this.password = await Bcrypt.hash(this.password, 10);
            return true;
        } catch (error) {
            throw badImplementation();
        }
    }


    async passwordMatches(password: string): Promise<boolean> {
        return await Bcrypt.compare(password, this.password);
    }

    token(duration: number = null): string {
        const payload = {
            exp: Dayjs().add(duration, 'minutes').unix(),
            iat: Dayjs().unix(),
            sub: this.user_id
        };
        return Jwt.encode(payload, JwtConstants.SECRET);
    }

}

