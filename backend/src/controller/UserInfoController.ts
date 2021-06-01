import {getRepository, In, Like, SelectQueryBuilder} from "typeorm";
import {NextFunction, Request, Response} from "express";
import {User} from "../entity/User";
import {ApiResultBean} from "../support/ApiResultBean";
import {Role} from "../entity/Role";
import {error, log} from "util";

export class UserInfoController {

    private userRepository = getRepository(User);
    private qb = this.userRepository.createQueryBuilder("user");

    async all(request: Request, response: Response, next: NextFunction) {


        const limit = Number(request.query.limit) || 10
        const page = Number(request.query.page) || 1
        const keyword = String(request.query.keyword) || ''
        const sort = request.query.sort || 'ASC'
        const userType = request.query.type || null

        let [list, total] = [null, null];

        try {

            // username : Like('%' + keyword + '%')
            [list, total] = await this.userRepository.findAndCount({
                where: qb =>{
                    qb.where({
                        username: Like('%' + keyword + '%')
                    })

                    if (userType !== null) {
                        qb.andWhere('User__Role.level = :level', {level: userType});
                    }

                },
                order: {user_id: sort},
                take: limit,
                skip: (page - 1) * limit,
                relations: ['Role']
            });



        } catch (error) {
            console.log(error);
        }

        if (list != null && total != null) {
            return ApiResultBean.success({total, list});
        } else {
            return ApiResultBean.error();
        }



    }

    async one(request: Request, response: Response, next: NextFunction) {
        return ApiResultBean.success(await this.userRepository.findOne(request.params.id, {relations: ['Role', 'UserCheckIn', 'Venue']}));
    }

    async save(request: Request, response: Response, next: NextFunction) {
        return ApiResultBean.success(await this.userRepository.save(request.body));
    }

    async remove(request: Request, response: Response, next: NextFunction) {
        let userToRemove = await this.userRepository.findOne(request.params.id);
        await this.userRepository.remove(userToRemove);
        return ApiResultBean.success();
    }

}
