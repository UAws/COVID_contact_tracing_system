import {EntityRepository, Repository} from "typeorm";
import {RefreshToken} from "../entity/RefreshToken";
import {User} from "../entity/User";
import {randomBytes} from "crypto";
import * as Dayjs from 'dayjs';



@EntityRepository(RefreshToken)
export class RefreshTokenRepository extends Repository<RefreshToken> {

    constructor() {
        super();
    }


    createNewToken(user: User): RefreshToken {

        const token = `${user.user_id}.${randomBytes(40).toString('hex')}`;
        const expiry = Dayjs().add(1, "weeks").toDate();


        return new RefreshToken(token, user, expiry);
    }

    generate(user: User): RefreshToken {
        const refreshToken = this.createNewToken(user);
        void this.save(refreshToken);
        return refreshToken;
    }


}
