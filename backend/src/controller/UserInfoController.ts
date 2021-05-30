import { NextFunction, Request, Response } from 'express'
import { getRepository, Like } from 'typeorm'
import { User } from '../entity/User'
import { ApiResultBean } from '../support/ApiResultBean'

export class UserInfoController {

  private userRepository = getRepository(User)

  async all(request: Request, response: Response, next: NextFunction) {


    const limit = Number(request.query.limit) || 10
    const page = Number(request.query.page) || 1
    const keyword = request.query.keyword || ''
    const sort = request.query.sort || 'ASC'

    const [list, total] = await this.userRepository.findAndCount({
      where: { username: Like('%' + keyword + '%') },
      order: { user_id: sort },
      take: limit,
      skip: (page - 1) * limit,
      relations: ['Role'],
    } as any)


    return ApiResultBean.success({ total, list })


  }

  async one(request: Request, response: Response, next: NextFunction) {
    return ApiResultBean.success(await this.userRepository.findOne(
      request.params.id,
      { relations: ['Role', 'UserCheckIn', 'Venue'] },
    ))
  }

  async save(request: Request, response: Response, next: NextFunction) {
    return ApiResultBean.success(await this.userRepository.save(request.body))
  }

  async remove(request: Request, response: Response, next: NextFunction) {
    let userToRemove = await this.userRepository.findOne(request.params.id)
    await this.userRepository.remove(userToRemove)
    return ApiResultBean.success()
  }

}
