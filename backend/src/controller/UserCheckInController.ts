import {getRepository} from "typeorm";
import {NextFunction, Request, Response} from "express";
import {UserCheckIn} from "../entity/UserCheckIn";
import StatusCodes from 'http-status-codes';
const { BAD_REQUEST, CREATED, OK } = StatusCodes;


export class UserCheckInController {

    private userCheckInRepository = getRepository(UserCheckIn);

    async getUserCheckIn(req: Request, res: Response, next: NextFunction) {
        return this.userCheckInRepository.findOne(req.params.id, {relations: ['Users']});
    }

    async postUserCheckIn(req: Request, res: Response, next: NextFunction) {

        let tempCheckIn = req.body;

        await this.userCheckInRepository.save(tempCheckIn);
        return res.status(OK).send;

    }



}
