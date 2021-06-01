import {RefreshToken} from "../entity/RefreshToken";

export interface tokenOptions {
    username?: string;
    password: string;
    emailAddress?: string;
    refreshToken: RefreshToken;
}
