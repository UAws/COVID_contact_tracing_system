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
            const dbVenue: Venue = await this.findOne(venueId);


            if (dbVenue) {
                const rawData = await this.manager.query(`
                            update venue set is_hotspot = ? where venue_id = ?
                `,
                    [(dbVenue.is_hotspot !== true), venueId]);

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
