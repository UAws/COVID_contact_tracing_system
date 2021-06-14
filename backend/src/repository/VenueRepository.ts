import {Venue} from "../entity/Venue";
import {EntityRepository, getManager, getRepository, Repository} from "typeorm";
import {badRequest} from "@hapi/boom";
import {venueHotSpotOptions} from "../support/venueHotSpotOptions";
import to from "await-to-js";

@EntityRepository(Venue)
export class VenueRepository extends Repository<Venue>{

    private repository = getRepository(Venue);
    private VenueQueryBuilder = this.repository.createQueryBuilder();
    private connection = getManager().connection;

    public get() {
        return this.repository;
    }

    public async changeInHotSport(venueId: number) {

        try {
            let dbVenue: Venue = await this.findOne(venueId);


            if (dbVenue) {
                const rawData = await this.manager.query(`
                            update venue set is_hotspot = ? where venue_id = ?
                `,
                    [(dbVenue.is_hotspot !== true), venueId]);

                dbVenue = await this.findOne(venueId);

                // update all of people who has been checked into this venue
                if (dbVenue.is_hotspot === true) {

                    const [error,result] = await to(this.manager.query(`
                        update user
                        set user.is_in_hotspot = true
                        where user_id in (
                            select u.user_id
                            from user_check_in
                                     inner join venue v on user_check_in.venueVenueId = v.venue_id
                                     inner join user__user_check_in_user_check_in uuciuci
                                                on user_check_in.check_in_id = uuciuci.userCheckInCheckInId
                                     inner join user u on uuciuci.userUserId = u.user_id
                            where v.is_hotspot = true
                              AND v.venue_id = ?
                            group by user_id
                        )
                    `, [dbVenue.venue_id]));

                    if (error) {
                        throw error;
                    }
                }

                return rawData;
            } else {
                return badRequest("Venue not found");
            }

        } catch (error) {
            return error
        }
    }

    public async changeCoordinates(venueId: number, options: venueHotSpotOptions) {
        try {
            const dbVenue: Venue = await this.findOne(venueId);


            if (dbVenue) {

                return await this
                    .createQueryBuilder()
                    .update(Venue)
                    .set({
                        lat: options.lat,
                        lng: options.lng,
                        risk_level: options.risk_level
                    })
                    .where("venue_id = :venue_id", {
                        venue_id: venueId
                    })
                    .execute()

            } else {

                return badRequest("Venue not found");

            }

        } catch (error) {

            return error

        }

    }

    public async CheckInCodeGenerator() : Promise<number>{
        const [error,result] = await to(this.findOne({
            order: {venue_id: 'DESC'},
        }))

        if (error) {
            throw error;
        }

        if (result) {
            return parseInt(result.check_in_code) + 1;
        } else {
            return 100000;
        }

    }
}
