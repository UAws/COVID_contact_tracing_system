import {getCustomRepository, getRepository} from "typeorm";
import {NextFunction, Request, Response} from "express";
import {UserCheckIn} from "../entity/UserCheckIn";
import StatusCodes from 'http-status-codes';
import to from "await-to-js";
import {ApiResultBean} from "../support/ApiResultBean";
import {UserRepository} from "../repository/UserRepository";
import {User} from "../entity/User";
import {reqParamsOptionsInterface} from "../support/reqParamsOptions.Interface";
import {UserCheckInRepository} from "../repository/UserCheckInRepository";
const { BAD_REQUEST, CREATED, OK } = StatusCodes;


export class UserCheckInController {

    private userCheckInRepository = getCustomRepository(UserCheckInRepository);
    private userRepository = getCustomRepository(UserRepository);

    async getUserCheckIn(req: Request, res: Response, next: NextFunction) {

        return this.userCheckInRepository.findOne(req.params.id, {relations: ['Users']});

    }

    async getAllUserCheckIN(request: Request, res: Response, next: NextFunction) {



        const reqParams : reqParamsOptionsInterface = {
            limit : request.query.limit || 10,
            page : request.query.page || 1,
            keyword: request.query.keyword || '',
            sort : request.query.sort || 'ASC',
            userType : request.query.type || null
        }

        let error, list, total, result_object;

        [error, result_object] = await to(this.userCheckInRepository.listAllCheckIn(reqParams));

        if (result_object) {
            [list, total] = result_object;
        }

        if (error) {
            return ApiResultBean.error(request, error);
        } else if (list != null && total != null) {
            return ApiResultBean.success({list, total});
        } else {
            return ApiResultBean.errorMessage("CheckInNotFound");
        }




    }

    async postUserCheckIn(req: Request, res: Response, next: NextFunction) {

        let error, checkIn, user:User;

        let tempCheckIn : UserCheckIn = req.body;


        const checkInUserId = tempCheckIn.Users[0].user_id;

        if (!checkInUserId) {
            return ApiResultBean.errorMessage("No User Id Received");
        }

        [error, user] = await to(this.userRepository.findOne(checkInUserId));

        if (error) {
            return ApiResultBean.error(req, error);
        }

        if (!user) {
            return ApiResultBean.errorMessage("User Not Found");
        }

        tempCheckIn.update_by = user.username;
        tempCheckIn.create_by = user.username;
        tempCheckIn.update_time = new Date();
        tempCheckIn.create_time = new Date();
        tempCheckIn.CheckInTimeStamp ? tempCheckIn.CheckInTimeStamp = new Date() : null;

        [error, checkIn] = await to(this.userCheckInRepository.save(tempCheckIn));

        if (error) {
            return ApiResultBean.error(req, error);
        }

        return ApiResultBean.success(checkIn);

    }



}
