import "reflect-metadata";
import {createConnection} from "typeorm";
import * as express from "express";
import * as bodyParser from "body-parser";
import {Request, Response} from "express";
var cookieParser = require('cookie-parser');
import {Routes} from "./routes";
import cors from "cors";
import * as path from "path";
import {googleOAuthRouter} from "./routes/googleOAuthRouter";
import {JWTAuthInterceptor} from "./routes/JWTAuthInterceptor";

createConnection().then(async connection => {

    // create express app
    const app = express();

    app.use(cookieParser());

    // handle the static files
    app.use('/', express.static(path.join(__dirname, 'public')))

    app.use(bodyParser.json());

    // Add headers
    app.use('/*', function (req: Request, res: Response, next: Function) {

        // Website you wish to allow to connect
        res.setHeader('Access-Control-Allow-Origin', '*');

        // Request methods you wish to allow
        res.setHeader('Access-Control-Allow-Methods', '*');

        // Request headers you wish to allow
        res.setHeader('Access-Control-Allow-Headers', '*');

        // Set to true if you need the website to include cookies in the requests sent
        // to the API (e.g. in case you use sessions)
        res.setHeader('Access-Control-Allow-Credentials', true);

        // Pass to next layer of middleware
        next();
    });

    // app.use(cors());
    const jwtRouter = new JWTAuthInterceptor();
    app.use('/api/*', jwtRouter.get());

    // register express routes from defined application routes
    Routes.forEach(route => {
        (app as any)[route.method](route.route, (req: Request, res: Response, next: Function) => {
            const result = (new (route.controller as any))[route.action](req, res, next);
            if (result instanceof Promise) {
                result.then(result => result !== null && result !== undefined ? res.send(result) : undefined);

            } else if (result !== null && result !== undefined) {
                res.json(result);
            }
        });
    });

    const local_googleOAuthRouter = new googleOAuthRouter();
    app.use('/api/auth/oauth', local_googleOAuthRouter.get());
    // setup express app here
    // ...

    // start express server
    app.listen(3000);

    // insert new users for test
    // await connection.manager.save(connection.manager.create(User, {
    //     firstName: "Timbloer",
    //     lastName: "Saw",
    //     age: 27
    // }));
    // await connection.manager.save(connection.manager.create(User, {
    //     firstName: "Phantom",
    //     lastName: "Assassin",
    //     age: 24
    // }));

    console.log("Express server has started on port 3000. Open http://localhost:3000/api to see results");

}).catch(error => console.log(error));
