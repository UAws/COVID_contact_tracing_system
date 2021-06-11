import {
    EntityRepository,
    getCustomRepository,
    getManager,
    getRepository,
    Like,
    Repository
} from "typeorm";
import {User} from "../entity/User";
import {reqParamsOptionsInterface} from "../support/reqParamsOptions.Interface";
import {tokenOptions} from "../support/tokenOptions";
import {badRequest, notFound, unauthorized} from "@hapi/boom";
import * as Dayjs from 'dayjs';
import {Role} from "../entity/Role";
import to from "await-to-js";


@EntityRepository(User)
export class UserRepository extends Repository<User>{


    private repository = getRepository(User);
    private userSelectQueryBuilder = this.repository.createQueryBuilder();
    private connection = getManager().connection;

    public get() {
        return this.repository;
    }

    public async listAllUsers(params: reqParamsOptionsInterface) {

        try {
            const [list, total] = await this.repository.findAndCount({
                where: qb => {
                    qb.where({
                        username: Like('%' + params.keyword + '%')
                    })

                    if (params.userType !== null) {
                        qb.andWhere('User__Role.role_id = :role_id', {role_id: params.userType});
                    }

                },
                order: {user_id: params.sort},
                take: params.limit,
                skip: (params.page - 1) * params.limit,
                relations: ['Role']
            });

            return [list, total];

        } catch (error) {
            throw error;
        }


    }

    public async saveUser(user: User) {

        try {

            if (!await this.findOne({
                where: {user_id: user.user_id},
            })) {

                user.user_id = null;

                if (!user.create_by) {
                    user.create_by = "System admin";
                }
                if (!user.update_by) {
                    user.update_by = "System admin";
                }
                    user.create_time = Dayjs().toDate();
                    user.update_time = Dayjs().toDate();

                const dbuser = await this.repository.save(user);
                return await this.findOne({
                    relations: ['Role'],
                    where: {user_id: dbuser.user_id}
                });

            }{
                throw badRequest("user already exists");
            }


        } catch (error) {
            throw error;
        }

    }


    public async updateUser(user: User) {

        let error, dbuser: User;

        [error, dbuser] = await to(this.findOne({
            where: {user_id: user.user_id},
            relations: ['Role'],
        }));

        if (error) {
            throw error;
        }

            if (dbuser) {

                // merge request user to database user
                // for (const dbuserKey in dbuser) {
                //     if (user[dbuserKey]) {
                //         dbuser[dbuserKey] = user[dbuserKey];
                //     }
                // }

                if (!user.update_by) {
                    user.update_by = "System admin";
                }

                user.update_time = Dayjs().toDate();

                [error, dbuser] = await to(this.repository.save(user));

                if (error) {
                    throw error;
                }
                [error, dbuser] = await to(this.findOne({
                    relations: ['Role'],
                    where: {user_id: dbuser.user_id}
                }));

                if (error) {
                    throw error;
                }

                return dbuser;

            } else {
                return "user not already exists";
            }

    }

    public async findAndGenerateToken(options: tokenOptions): Promise<{ user: User, accessToken: string; }> {

            const {username, emailAddress, password, refreshToken} = options;

            if (!emailAddress && !username) {
                throw badRequest("An email address or username is required to generate a token");
            }

            let user;

            try {
                user = await this.findOne({
                    relations: ['Role'],
                    where: emailAddress ? {emailAddress: emailAddress} : {username: username}
                });
            }catch (error) {
                throw error;
            }


            if (!user) {
                throw notFound('User not found');
            } else if (password && await user.passwordMatches(password.toString()) === false) {
                throw unauthorized('Password must match to authorize a token generating');
            } else if (refreshToken && refreshToken.user.emailAddress === emailAddress && Dayjs(refreshToken.expires).isBefore(Dayjs())) {
                throw unauthorized('Invalid refresh token');
            }
            return {user, accessToken: user.token()};

    }

    public async changeInHotSport(userId: number) {

        try {
            const dbUser: User = await this.findOne(userId);


            if (dbUser) {
                const rawData = await this.manager.query(`update user
                                                          set is_in_hotspot = ?
                                                          where user_id = ?`,
                    [(dbUser.is_in_hotspot !== true), userId]);

                return rawData;
            } else {
                throw badRequest("User not found");
            }

        } catch (error) {
            throw error
        }

    }

    public async findOrCreateUser(user: User) {

        let dbUser = await this.findOne({
            relations: ['Role'],
            where: qb => {
                qb.where("User.username = :username",{username: user.username})
                    .orWhere("User.emailAddress = :address",{address: user.emailAddress});
            }
        });


        if (dbUser) {

            dbUser.emailAddress ? dbUser.emailAddress = user.emailAddress : null;
            dbUser.username ? dbUser.username = user.username : null;
            dbUser.password = '123456'

            return await this.updateUser(dbUser);

        } else {

            // set default role -- > user
            const tempRow = new Role();
            tempRow.role_id = 3;
            user.Role = [tempRow];

            // set default password
            user.password = '123456';
            user.address = '';
            user.is_approval = false;
            user.is_in_hotspot = false;
            return await this.saveUser(user);
        }

    }


}
