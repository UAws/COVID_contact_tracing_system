import {getRepository,Like} from "typeorm";
import {NextFunction, Request, Response} from "express";
import StatusCodes from 'http-status-codes';
import {Venue} from "../entity/Venue";
const { BAD_REQUEST, CREATED, OK } = StatusCodes;
import {ApiResultBean} from "../support/ApiResultBean";

export class venueController {
    private venueRepository = getRepository(Venue);

    async all(request: Request, response: Response, next: NextFunction) {
        const limit = Number(request.query.limit) || 10
        const page = Number(request.query.page) || 1
        const keyword = request.query.keyword || ''
        const sort = request.query.sort || 'ASC'
        const checkInCode= request.query.checkInCode ||''
        const [list, total] = await this.venueRepository.findAndCount({
            where: {venue_name: Like('%' + keyword + '%'),check_in_code: Like('%' + checkInCode + '%')},
            order: {venue_id: sort},
            take: limit,
            skip: (page - 1) * limit,
            relations: ['Users'],
        } as any)
        return ApiResultBean.success({total, list})
    }

    async getVenueInfo(request: Request, response: Response, next: NextFunction) {
        return this.venueRepository.findOne(request.params.id, {relations: ['Users']});
    }

    async postVenueInfo(request: Request, response: Response, next: NextFunction) {
        return ApiResultBean.success(await this.venueRepository.save(request.body))
    }

    async save(request: Request, response: Response, next: NextFunction) {
        return ApiResultBean.success(await this.venueRepository.save(request.body))
    }

    async remove(request: Request, response: Response, next: NextFunction) {
        let venueToRemove = await this.venueRepository.findOne(request.params.id);
        await this.venueRepository.remove(venueToRemove);
        return ApiResultBean.success();
    }

}
