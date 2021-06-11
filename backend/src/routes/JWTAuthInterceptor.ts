import {NextFunction, Router} from "express";
import {JwtConstants} from "../constants/JwtConstants";
import * as Jwt from "jwt-simple";
import {Routes} from "../routes";
import to from "await-to-js";
import {ApiResultBean} from "../support/ApiResultBean";
import {log} from "util";

const url = require('url');

// TODO authorization layer consideration
export class JWTAuthInterceptor {

    private JWTAuthInterceptor = Router();

    private static UserLevelAllowedRoutes = [
        {
            method: "get",
            route: "/api/user/info/:id"
        },{
            method: "put",
            route: "/api/user/info/"
        },{
            method: 'get',
            route: '/api/venue/info',
        }, {
            method: "post",
            route: "/api/user/checkIn/"
        },{
            method: 'get',
            route: '/api/venue/checkIn/:code',
        }

    ]

    private static fullUrl(req) {
        return url.format({
            protocol: req.protocol,
            host: req.get('host'),
            pathname: req.originalUrl
        }) + " " + req.method;
    }

    private checkJwt(){
        this.JWTAuthInterceptor.all('/*', function (req, res, next:NextFunction) {

            console.log(JWTAuthInterceptor.fullUrl(req));

            if (req.method === "OPTIONS") {
                next();
                return;
            }

            if (req.originalUrl.split('/')[2] === 'auth') {
                next();
                return;
            }


            // check Authorization header
            const auth = req.headers.authorization;
            if (auth && auth.split(' ')[0] === 'Bearer') {

                const token = auth.split(' ')[1];
                // console.log(req.headers.authorization);
                // console.log(Jwt.decode(token, JwtConstants.SECRET));
                try {

                    req.tokenInfo = Jwt.decode(token, JwtConstants.SECRET);

                } catch (error){

                    console.log(error);
                    return res.status(500).send(ApiResultBean.error(req, error));

                }
                next();
                return;

                // check Authorization token
            } else if (req.query.token) {

                const token = req.query.token;

                try {

                    req.tokenInfo = Jwt.decode(token, JwtConstants.SECRET);

                } catch (error){

                    return res.status(500).send(ApiResultBean.error(req, error));

                }

                next();
                return;

            }else {
                res.status(403).send('Access denied');
            }
        });
    }

    private JwtAuthorityCheck() {
        this.JWTAuthInterceptor.all('/*', function (req, res, next: NextFunction) {

            if (req.method === "OPTIONS") {
                next();
                return;
            }

            if (req.originalUrl.split('/')[2] === 'auth') {
                next();
                return;
            }

            switch (req.tokenInfo.user_level.level) {
                case 1:
                    for (const route of JWTAuthInterceptor.UserLevelAllowedRoutes) {
                        if (
                            (req.originalUrl.split('?')[0]).search(route.route.split(':')[0]) !== -1 &&
                            route.method === req.method.toLowerCase()
                        ) {

                            next();
                            return;

                        }
                    }
                    break;
                case 2:

                    next();
                    return;
                    break;
                case 3:
                    for (const route of Routes) {
                        if (
                            (req.originalUrl.split('?')[0]).search(route.route.split(':')[0]) !== -1 &&
                            route.method === req.method.toLowerCase()
                        ) {

                            next();
                            return;

                        }
                    }

                    break;
            }


            res.status(403).send('Forbidden !! Access denied');

        })};

    public get() {
        this.checkJwt();
        this.JwtAuthorityCheck();
        return this.JWTAuthInterceptor;
    }

}
