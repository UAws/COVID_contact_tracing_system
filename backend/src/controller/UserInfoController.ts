import {getCustomRepository, getRepository, In, Like, SelectQueryBuilder} from "typeorm";
import {NextFunction, Request, Response} from "express";
import {User} from "../entity/User";
import {ApiResultBean} from "../support/ApiResultBean";
import {Role} from "../entity/Role";
import {reqParamsOptionsInterface} from "../support/reqParamsOptions.Interface";
import {UserRepository} from "../repository/UserRepository";
import to from "await-to-js";

export class UserInfoController {

    private userRepository = getCustomRepository(UserRepository);
    // private qb = this.userRepository.createQueryBuilder();

    async all(request: Request, response: Response, next: NextFunction) {

        const reqParams : reqParamsOptionsInterface = {
            limit : request.query.limit || 10,
            page : request.query.page || 1,
            keyword: request.query.keyword || '',
            sort : request.query.sort || 'ASC',
            userType : request.query.type || null
        }

        // console.log(reqParams);


        const [error, [list, total]] = await to(this.userRepository.listAllUsers(reqParams));

        // handle repository layer error

        if (error) {
            return ApiResultBean.error(request, error);
        }

        if (list != null && total != null) {

            return ApiResultBean.success({total, list});

        } else {

            return ApiResultBean.error();

        }


    }

    async one(request: Request, response: Response, next: NextFunction) {
        try {
            const user : User = await this.userRepository.get().findOne(request.params.id, {relations: ['Role', 'UserCheckIn', 'Venue']});

            return ApiResultBean.success(user);

        } catch (error) {

            console.log(error);

            return ApiResultBean.error(request,error);

        }
    }

    async create(request: Request, response: Response, next: NextFunction) {

        const user : User = new User(request.body);
        let [error, saved] = await to(this.userRepository.saveUser(user));


        // handle repository layer error

        if (error) {
            return ApiResultBean.error(request, error);
        }
            return ApiResultBean.success(saved);

    }

    async update(request: Request, response: Response, next: NextFunction) {

        const user : User = new User(request.body);

        let [error, saved] = await to(this.userRepository.updateUser(user));

        if (error) {
            return ApiResultBean.error(request, error);
        }


        // handle repository layer error
            return ApiResultBean.success(saved);


    }


    async remove(request: Request, response: Response, next: NextFunction) {
        let userToRemove = await this.userRepository.get().findOne(request.params.id);
        await this.userRepository.get().remove(userToRemove);
        return ApiResultBean.success();
    }

    async changeInHotSport(request: Request, response: Response, next: NextFunction) {

        const [error, result] = await to(this.userRepository.changeInHotSport(request.params.id));

        if (error) {
            return ApiResultBean.error(request, error);
        }

        return ApiResultBean.success(result);

    }

}
