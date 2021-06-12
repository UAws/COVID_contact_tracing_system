import {getCustomRepository, getRepository, Like} from "typeorm";
import {NextFunction, Request, Response} from "express";
import {ApiResultBean} from "../support/ApiResultBean";
import {VenueRepository} from "../repository/VenueRepository";
import {venueHotSpotOptions} from '../support/venueHotSpotOptions'
import to from "await-to-js";
import {error} from "util";
import {Venue} from "../entity/Venue";
var QRCode = require('qrcode')


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
        const [error, result] = await to(this.venueRepository.findOne(request.params.id, {relations: ['Users', 'userCheckIns']}));

        if (error) {
            return ApiResultBean.error(request, error);
        }

        return ApiResultBean.success(result);


    }

    async getVenueInfoByCheckInCode(request: Request, response: Response, next: NextFunction) {
        const [error, venue] = await to(this.venueRepository.findOne({
                where: {check_in_code: request.params.code},
                relations: ['Users','userCheckIns']
            }
        ));

        if (error) {
            return ApiResultBean.error(request, error);
        }

        if (venue) {
            return ApiResultBean.success(venue);
        } else {
            return ApiResultBean.errorMessage("venue not found");
        }

    }

    async postVenueInfo(request: Request, response: Response, next: NextFunction) {

        const [error, venue] = await to(this.venueRepository.save(request.body));

        if (error) {
            return ApiResultBean.error(request, error);
        }

        if (venue) {
            return ApiResultBean.success(venue);
        } else {
            return ApiResultBean.errorMessage("venue not found");
        }
    }

    async save(request: Request, response: Response, next: NextFunction) {


        let error, result: Object;

        [error, result] = await to(this.venueRepository.findOne(request.body.venue_id));

        if (error) {
            return ApiResultBean.error(request, error);
        }

        if (result) {
            [error, request.body.check_in_code] = await to(this.venueRepository.CheckInCodeGenerator());
            if (error) {
                return ApiResultBean.error(request, error);
            }
        }

        [error, result] = await to(this.venueRepository.save(request.body));
        if (error) {
            return ApiResultBean.error(request, error);
        }

        return ApiResultBean.success(result);
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


    private static qrcode;

    async getQRCode(request: Request, response: Response, next: NextFunction) {

        let error, result: Venue;

        [error, result] = await to(this.venueRepository.findOne(request.params.id));

        if (error) {
            return ApiResultBean.error(request,error);
        }


        const fullUrl = request.protocol + '://' + request.get('host');

        const checkInUrl = fullUrl + '/admin/#/user/check-in/' + `?code=${result.check_in_code}`


        QRCode.toDataURL(checkInUrl)
            .then(url => {
                venueController.qrcode = url;
                console.log(url)
            })
            .catch(err => {
                console.error(err)
            })

        return ApiResultBean.success(venueController.qrcode);



    }

}
