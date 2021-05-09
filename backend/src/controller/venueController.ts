import {getRepository} from "typeorm";
import {NextFunction, Request, Response} from "express";
import StatusCodes from 'http-status-codes';
import {Venue} from "../entity/Venue";
const { BAD_REQUEST, CREATED, OK } = StatusCodes;

export class venueController {
    private venueRepository = getRepository(Venue);

    async getVenueInfo(request: Request, response: Response, next: NextFunction){
        return this.venueRepository.findOne(request.params.id, {relations: ['Users']});
    }

    async postVenueInfo(request: Request, response: Response, next: NextFunction) {
        return this.venueRepository.save(request.body);
    }

}
