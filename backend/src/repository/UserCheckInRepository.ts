import {EntityRepository, Like, Repository} from "typeorm";
import {UserCheckIn} from "../entity/UserCheckIn";
import {reqParamsOptionsInterface} from "../support/reqParamsOptions.Interface";
import to from "await-to-js";

@EntityRepository(UserCheckIn)
export class UserCheckInRepository extends Repository<UserCheckIn> {

    public get(){
        return this;
    }

    public async listAllCheckIn(params: reqParamsOptionsInterface) {

        // reference sql :
        /*


    query: SELECT DISTINCT `distinctAlias`.`UserCheckIn_check_in_id` as "ids_UserCheckIn_check_in_id", `distinctAlias`.`UserCheckIn_check_in_id` FROM (SELECT `UserCheckIn`.`update_time` AS `UserCheckIn_update_time`, `UserCheckIn`.`create_time` AS `UserCheckIn_create_time`, `UserCheckIn`.`update_by` AS `UserCheckIn_update_by`, `UserCheckIn`.`create_by` AS `UserCheckIn_create_by`, `UserCheckIn`.`check_in_id` AS `UserCheckIn_check_in_id`, `UserCheckIn`.`venue_id` AS `UserCheckIn_venue_id`, `UserCheckIn`.`CheckInAddress` AS `UserCheckIn_CheckInAddress`, `UserCheckIn`.`CheckInTimeStamp` AS `UserCheckIn_CheckInTimeStamp`, `UserCheckIn`.`venueVenueId` AS `UserCheckIn_venueVenueId`, `UserCheckIn__Users`.`update_time` AS `UserCheckIn__Users_update_time`, `UserCheckIn__Users`.`create_time` AS `UserCheckIn__Users_create_time`, `UserCheckIn__Users`.`update_by` AS `UserCheckIn__Users_update_by`, `UserCheckIn__Users`.`create_by` AS `UserCheckIn__Users_create_by`, `UserCheckIn__Users`.`user_id` AS `UserCheckIn__Users_user_id`, `UserCheckIn__Users`.`username` AS `UserCheckIn__Users_username`, `UserCheckIn__Users`.`password` AS `UserCheckIn__Users_password`, `UserCheckIn__Users`.`address` AS `UserCheckIn__Users_address`, `UserCheckIn__Users`.`emailAddress` AS `UserCheckIn__Users_emailAddress`, `UserCheckIn__Users`.`is_in_hotspot` AS `UserCheckIn__Users_is_in_hotspot`, `UserCheckIn__Users`.`is_approval` AS `UserCheckIn__Users_is_approval`, `UserCheckIn__Users`.`phone` AS `UserCheckIn__Users_phone`, `UserCheckIn__venue`.`update_time` AS `UserCheckIn__venue_update_time`, `UserCheckIn__venue`.`create_time` AS `UserCheckIn__venue_create_time`, `UserCheckIn__venue`.`update_by` AS `UserCheckIn__venue_update_by`, `UserCheckIn__venue`.`create_by` AS `UserCheckIn__venue_create_by`, `UserCheckIn__venue`.`venue_id` AS `UserCheckIn__venue_venue_id`, `UserCheckIn__venue`.`check_in_code` AS `UserCheckIn__venue_check_in_code`, `UserCheckIn__venue`.`email_address` AS `UserCheckIn__venue_email_address`, `UserCheckIn__venue`.`venue_name` AS `UserCheckIn__venue_venue_name`, `UserCheckIn__venue`.`shop_address` AS `UserCheckIn__venue_shop_address`, `UserCheckIn__venue`.`is_hotspot` AS `UserCheckIn__venue_is_hotspot`, `UserCheckIn__venue`.`lng` AS `UserCheckIn__venue_lng`, `UserCheckIn__venue`.`lat` AS `UserCheckIn__venue_lat`, `UserCheckIn__venue`.`risk_level` AS `UserCheckIn__venue_risk_level` FROM `user_check_in` `UserCheckIn` LEFT JOIN `user__user_check_in_user_check_in` `UserCheckIn__Users_UserCheckIn` ON `UserCheckIn__Users_UserCheckIn`.`userCheckInCheckInId`=`UserCheckIn`.`check_in_id` LEFT JOIN `user` `UserCheckIn__Users` ON `UserCheckIn__Users`.`user_id`=`UserCheckIn__Users_UserCheckIn`.`userUserId`  LEFT JOIN `venue` `UserCheckIn__venue` ON `UserCheckIn__venue`.`venue_id`=`UserCheckIn`.`venueVenueId` WHERE `UserCheckIn`.`CheckInAddress` LIKE ? OR `UserCheckIn__Users`.`username` like ? OR `UserCheckIn__venue`.`venue_name` like ?) `distinctAlias` ORDER BY `distinctAlias`.`UserCheckIn_check_in_id` ASC, `UserCheckIn_check_in_id` ASC LIMIT 10 -- PARAMETERS: ["%Akide%","%Akide%","%Akide%"]

    query: SELECT `UserCheckIn`.`update_time` AS `UserCheckIn_update_time`, `UserCheckIn`.`create_time` AS `UserCheckIn_create_time`, `UserCheckIn`.`update_by` AS `UserCheckIn_update_by`, `UserCheckIn`.`create_by` AS `UserCheckIn_create_by`, `UserCheckIn`.`check_in_id` AS `UserCheckIn_check_in_id`, `UserCheckIn`.`venue_id` AS `UserCheckIn_venue_id`, `UserCheckIn`.`CheckInAddress` AS `UserCheckIn_CheckInAddress`, `UserCheckIn`.`CheckInTimeStamp` AS `UserCheckIn_CheckInTimeStamp`, `UserCheckIn`.`venueVenueId` AS `UserCheckIn_venueVenueId`, `UserCheckIn__Users`.`update_time` AS `UserCheckIn__Users_update_time`, `UserCheckIn__Users`.`create_time` AS `UserCheckIn__Users_create_time`, `UserCheckIn__Users`.`update_by` AS `UserCheckIn__Users_update_by`, `UserCheckIn__Users`.`create_by` AS `UserCheckIn__Users_create_by`, `UserCheckIn__Users`.`user_id` AS `UserCheckIn__Users_user_id`, `UserCheckIn__Users`.`username` AS `UserCheckIn__Users_username`, `UserCheckIn__Users`.`password` AS `UserCheckIn__Users_password`, `UserCheckIn__Users`.`address` AS `UserCheckIn__Users_address`, `UserCheckIn__Users`.`emailAddress` AS `UserCheckIn__Users_emailAddress`, `UserCheckIn__Users`.`is_in_hotspot` AS `UserCheckIn__Users_is_in_hotspot`, `UserCheckIn__Users`.`is_approval` AS `UserCheckIn__Users_is_approval`, `UserCheckIn__Users`.`phone` AS `UserCheckIn__Users_phone`, `UserCheckIn__venue`.`update_time` AS `UserCheckIn__venue_update_time`, `UserCheckIn__venue`.`create_time` AS `UserCheckIn__venue_create_time`, `UserCheckIn__venue`.`update_by` AS `UserCheckIn__venue_update_by`, `UserCheckIn__venue`.`create_by` AS `UserCheckIn__venue_create_by`, `UserCheckIn__venue`.`venue_id` AS `UserCheckIn__venue_venue_id`, `UserCheckIn__venue`.`check_in_code` AS `UserCheckIn__venue_check_in_code`, `UserCheckIn__venue`.`email_address` AS `UserCheckIn__venue_email_address`, `UserCheckIn__venue`.`venue_name` AS `UserCheckIn__venue_venue_name`, `UserCheckIn__venue`.`shop_address` AS `UserCheckIn__venue_shop_address`, `UserCheckIn__venue`.`is_hotspot` AS `UserCheckIn__venue_is_hotspot`, `UserCheckIn__venue`.`lng` AS `UserCheckIn__venue_lng`, `UserCheckIn__venue`.`lat` AS `UserCheckIn__venue_lat`, `UserCheckIn__venue`.`risk_level` AS `UserCheckIn__venue_risk_level` FROM `user_check_in` `UserCheckIn` LEFT JOIN `user__user_check_in_user_check_in` `UserCheckIn__Users_UserCheckIn` ON `UserCheckIn__Users_UserCheckIn`.`userCheckInCheckInId`=`UserCheckIn`.`check_in_id` LEFT JOIN `user` `UserCheckIn__Users` ON `UserCheckIn__Users`.`user_id`=`UserCheckIn__Users_UserCheckIn`.`userUserId`  LEFT JOIN `venue` `UserCheckIn__venue` ON `UserCheckIn__venue`.`venue_id`=`UserCheckIn`.`venueVenueId` WHERE ( `UserCheckIn`.`CheckInAddress` LIKE ? OR `UserCheckIn__Users`.`username` like ? OR `UserCheckIn__venue`.`venue_name` like ? ) AND ( `UserCheckIn`.`check_in_id` IN (5, 6, 7, 8, 9, 10) ) ORDER BY `UserCheckIn`.`check_in_id` ASC -- PARAMETERS: ["%Akide%","%Akide%","%Akide%"]

    query: SELECT COUNT(DISTINCT `UserCheckIn`.`check_in_id`) AS `cnt` FROM `user_check_in` `UserCheckIn` LEFT JOIN `user__user_check_in_user_check_in` `UserCheckIn__Users_UserCheckIn` ON `UserCheckIn__Users_UserCheckIn`.`userCheckInCheckInId`=`UserCheckIn`.`check_in_id` LEFT JOIN `user` `UserCheckIn__Users` ON `UserCheckIn__Users`.`user_id`=`UserCheckIn__Users_UserCheckIn`.`userUserId`  LEFT JOIN `venue` `UserCheckIn__venue` ON `UserCheckIn__venue`.`venue_id`=`UserCheckIn`.`venueVenueId` WHERE `UserCheckIn`.`CheckInAddress` LIKE ? OR `UserCheckIn__Users`.`username` like ? OR `UserCheckIn__venue`.`venue_name` like ? -- PARAMETERS: ["%Akide%","%Akide%","%Akide%"]


         */

        const [error, [list, total]] = await to(this.findAndCount(
            {

                where: qb => {
                    qb.where({
                        CheckInAddress: Like('%' + params.keyword + '%')
                    });

                    if (params.keyword) {

                        qb.orWhere('UserCheckIn__Users.username like :username', {username: `%${params.keyword}%`});


                        qb.orWhere('UserCheckIn__venue.venue_name like :name', {name: `%${params.keyword}%`})
                    }


                },
                order: {check_in_id: params.sort},
                take: params.limit,
                skip: (params.page - 1) * params.limit,
                relations: ['Users', 'venue']
            },
        ));


        if (error) {
            throw error;
        }

        return [list, total];

    }

}
