import {getCustomRepository, getRepository} from "typeorm";
import {NextFunction, Request, Response} from "express";
import {UserCheckIn} from "../entity/UserCheckIn";
import StatusCodes from 'http-status-codes';
import to from "await-to-js";
import {ApiResultBean} from "../support/ApiResultBean";
import {UserRepository} from "../repository/UserRepository";
import {User} from "../entity/User";
const { BAD_REQUEST, CREATED, OK } = StatusCodes;


export class UserCheckInController {

    private userCheckInRepository = getRepository(UserCheckIn);
    private userRepository = getCustomRepository(UserRepository);

    async getUserCheckIn(req: Request, res: Response, next: NextFunction) {

        return this.userCheckInRepository.findOne(req.params.id, {relations: ['Users']});


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
