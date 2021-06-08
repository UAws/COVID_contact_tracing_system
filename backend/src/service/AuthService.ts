import {User} from "../entity/User";
import {getCustomRepository, getRepository} from "typeorm";
import {badData} from "@hapi/boom";
import {RefreshToken} from "../entity/RefreshToken";
import {RefreshTokenRepository} from "../repository/RefreshTokenRepository";
import * as Dayjs from 'dayjs';
import {JwtConstants} from "../constants/JwtConstants";

class AuthService {


    // instance getter
    private static instance: AuthService;

    static get(): AuthService {

        if (!AuthService.instance) {
            AuthService.instance = new AuthService();
        }
        return AuthService.instance;

    }

    async generateTokenResponse(user: User, accessToken: string): Promise<{ tokenType, accessToken, refreshToken, expiresIn }|Error> {
        if (!user || !(user instanceof User) || !user.user_id) {
            throw badData('User is not an instance of User');
        }
        if (!accessToken) {
            throw badData('Access token cannot be retrieved');
        }
        const tokenType = 'Bearer';
        const oldToken = await getRepository(RefreshToken).findOne({ where : { user } });
        if (oldToken) {
            await getRepository(RefreshToken).remove(oldToken)
        }
        const refreshToken = getCustomRepository(RefreshTokenRepository).generate(user).token;
        const expiresIn = Dayjs().add(JwtConstants.TOKEN_DURATION, JwtConstants.TOKEN_DURATION_UNIT);
        return { tokenType, accessToken, refreshToken, expiresIn };
    }


    async revokeRefreshToken(user: User): Promise<void|Error> {

        if (!user || !(user instanceof User) || !user.user_id) {
            return badData('User is not an instance of User');
        }

        const oldToken = await getRepository(RefreshToken).findOne({ where : { user } });

        if (oldToken) {
            await getRepository(RefreshToken).remove(oldToken)
        }
    }
}

const authService = AuthService.get();

export { authService as AuthService }
