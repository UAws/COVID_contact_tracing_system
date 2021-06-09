import {getCustomRepository, getRepository, Like} from "typeorm";
import {NextFunction, Request, Response} from "express";
import {ApiResultBean} from "../support/ApiResultBean";
import {VenueRepository} from "../repository/VenueRepository";
import {venueHotSpotOptions} from '../support/venueHotSpotOptions'
import to from "await-to-js";

export class venueController {
    private venueRepository = getCustomRepository(VenueRepository)

    async all(request: Request, response: Response, next: NextFunction) {
        const limit = Number(request.query.limit) || 10
        const page = Number(request.query.page) || 1
        const keyword = request.query.keyword || ''
        const sort = request.query.sort || 'ASC'

        const [list, total] = await this.venueRepository.findAndCount({
            where: {venue_name: Like('%' + keyword + '%')},
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

    async getVenueInfoByCheckInCode(request: Request, response: Response, next: NextFunction) {
        const [error, venue] = await to(this.venueRepository.findOne({
                where: {check_in_code: request.params.code},
                relations: ['Users']
            }
        ));

        if (error) {
            ApiResultBean.error(request, error);
        }

        if (venue) {
            return ApiResultBean.success(venue);
        } else {
            return ApiResultBean.errorMessage("venue not found");
        }

    }

    async postVenueInfo(request: Request, response: Response, next: NextFunction) {
        return this.venueRepository.save(request.body)
    }

    async save(request: Request, response: Response, next: NextFunction) {
        return ApiResultBean.success(await this.venueRepository.save(request.body))
    }

    async remove(request: Request, response: Response, next: NextFunction) {
        let venueToRemove = await this.venueRepository.findOne(request.params.id);
        await this.venueRepository.remove(venueToRemove);
        return ApiResultBean.success();
    }

    async changeInHotSport(request: Request, response: Response, next: NextFunction) {

        const result = await this.venueRepository.changeInHotSport(request.params.id);

        if (result instanceof Error) {

            return ApiResultBean.error(request,result);

        }
        return ApiResultBean.success(result);


    }

    async changeCoordinates(request: Request, response:Response, next: NextFunction) {

        const options: venueHotSpotOptions = {
            lat: request.body.lat,
            lng: request.body.lng,
            risk_level : request.body.risk_level
        }

        const result = await this.venueRepository.changeCoordinates(request.params.id, options);


        if (result instanceof Error) {

            return ApiResultBean.error(request,result);

        }
        return ApiResultBean.success(result);

    }

}
