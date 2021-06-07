import {Request, Response} from "express";
import {UserRepository} from "../repository/UserRepository";
import {User} from "../entity/User";
import {UserLevel} from "../constants/UserLevel";
import {AuthService} from "../service/AuthService";
import {ApiResultBean} from "../support/ApiResultBean";
import {getCustomRepository} from "typeorm";

export class AuthController {


    private userRepository = getCustomRepository(UserRepository);

    async register(req: Request, res: Response) {


        try {
            const user : User = new User(req.body);

            const count = await this.userRepository.count();
            if (count === 0) {
                // set to admin
                user.Role[0].role_id = UserLevel.ADMIN;
            }

            const resultUser : User = await this.userRepository.saveUser(user);
            const token = await AuthService.generateTokenResponse(user, user.token());

            return ApiResultBean.success({token, resultUser});
        } catch (error){

            return ApiResultBean.error(req, error);

        }

    }

    async login(req: Request, res: Response) {

        try {
            const {user, accessToken} = await this.userRepository.findAndGenerateToken(req.body);

            const token = await AuthService.generateTokenResponse(user, accessToken);

            if (user.Role[0].role_id !== 3 && user.is_approval === false) {
                return ApiResultBean.errorMessage("User need to be approve!!");
            }

            if (token instanceof Error) {
                return ApiResultBean.error(req, token);
            }

            return ApiResultBean.success({token, user});

        } catch (error){

            // res.status(error.statusCode)
            console.log(error);
            if (error.output.payload) {
                return ApiResultBean.error(req, error,error.output.payload.message);
            }
            return ApiResultBean.error(req, error);

        }


    }


    async logout(req: Request, res: Response): Promise<ApiResultBean> {
        await AuthService.revokeRefreshToken(req.user);
        return ApiResultBean.success({}, "Logout Success");
    }



}
