import {getRepository, Like} from "typeorm";
import {User} from "../entity/User";
import {reqParamsOptionsInterface} from "../support/reqParamsOptions.Interface";

export class userRepository {

    private repository = getRepository(User);
    private userSelectQueryBuilder = this.repository.createQueryBuilder();

    public get(){
        return this.repository;
    }

    public async listAllUsers(params: reqParamsOptionsInterface){

        try {
            const [list, total] = await this.repository.findAndCount({
                where: qb => {
                    qb.where({
                        username: Like('%' + params.keyword + '%')
                    })

                    if (params.userType !== null) {
                        qb.andWhere('User__Role.level = :level', {level: params.userType});
                    }

                },
                order: {user_id: params.sort},
                take: params.limit,
                skip: (params.page - 1) * params.limit,
                relations: ['Role']
            });

            return [list, total];

        } catch (error){
            return [error];
        }



    }

    public async saveUser(user: User) {

        try {
            user.user_id = null;
            return await this.repository.save(user);

        }catch (error){
            return error;
        }

    }



}
