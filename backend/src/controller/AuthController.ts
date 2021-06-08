import {Request, Response} from "express";
import {UserRepository} from "../repository/UserRepository";
import {User} from "../entity/User";
import {UserLevel} from "../constants/UserLevel";
import {AuthService} from "../service/AuthService";
import {ApiResultBean} from "../support/ApiResultBean";
import {getCustomRepository} from "typeorm";
import to from 'await-to-js'

export class AuthController {


    private userRepository = getCustomRepository(UserRepository);

    async register(req: Request, res: Response) {

        let error, count: number, resultUser: User, token;

        const user: User = new User(req.body);

        [error, count] = await to(this.userRepository.count());

            if (error){
                return ApiResultBean.error(req, error);
            }

            if (count === 0) {
                // set to admin
                user.Role[0].role_id = UserLevel.ADMIN;
            }

        [error, resultUser] = await to(this.userRepository.saveUser(user));

        if (error) {
            return ApiResultBean.error(req, error);
        }

        [error, token] = await to(AuthService.generateTokenResponse(user, user.token()));

        if (error) {
            return ApiResultBean.error(req, error);
        }

        return ApiResultBean.success({token, resultUser});

    }

    async login(req: Request, res: Response) {

        let error, user:User, accessToken:string, token,result;

        [error, result] = await to(this.userRepository.findAndGenerateToken(req.body));

        if (error) {

            return ApiResultBean.error(req, error);

        }else {
            user = result.user;
            accessToken = result.accessToken;
        }

        [error, token] = await to(AuthService.generateTokenResponse(user, accessToken));

        if (error) {
            return ApiResultBean.error(req, error);
        }

        if (user.Role[0].role_id !== 3 && user.is_approval === false) {
            return ApiResultBean.errorMessage("User need to be approve!!");
        }


        return ApiResultBean.success({token, user});

    }


    async logout(req: Request, res: Response): Promise<ApiResultBean> {
        const [error, info] = await to(AuthService.revokeRefreshToken(req.user));

        if (error) {
            return ApiResultBean.error(req, error);
        }

        return ApiResultBean.success({}, "Logout Success");
    }



}
