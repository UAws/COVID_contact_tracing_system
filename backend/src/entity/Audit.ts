import {Entity, PrimaryGeneratedColumn, Column} from "typeorm";


export abstract class Audit {

    @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP"})
    update_time : Date;

    @Column({ type: "timestamp", default: () => "CURRENT_TIMESTAMP"})
    create_time : Date;

    @Column()
    update_by : string;

    @Column()
    create_by : string;

}
