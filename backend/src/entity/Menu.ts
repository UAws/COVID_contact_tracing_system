import {Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable, }  from "typeorm";
import { Audit } from "./Audit";
@Entity()
export class Menu extends Audit {
    @PrimaryGeneratedColumn()
    menu_id: number;

    @Column()
    permissions: string;

    @Column()
    requirements: string;

    @Column()
    hotspot: string;

    @Column( {length: 1000})
    icon: string;




}
