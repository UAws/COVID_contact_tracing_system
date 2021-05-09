import {getRepository} from "typeorm";
import {NextFunction, Request, Response} from "express";
import {Role} from "../entity/Role";

export class RoleController {

    private roleRepository = getRepository(Role);

    async getRoles(req: Request, res: Response, next: NextFunction) {
        return this.roleRepository.find();
    }

    async getRoleById(req: Request, res: Response, next: NextFunction) {
        return this.roleRepository.findOne(req.params.id ,{relations:  ['Users']});
    }

}
