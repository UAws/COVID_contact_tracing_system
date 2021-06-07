import {NextFunction, Request, Response, Router} from "express";
import googleLoginPassport from "../support/googleLoginPassport";
import {getCustomRepository, Repository} from "typeorm";
import {UserRepository} from "../repository/UserRepository";
import {User} from "../entity/User";
import {AuthService} from "../service/AuthService";
const passport = require('passport');
const cookieSession = require('cookie-session');

export class googleOAuthRouter{

    private googleOAuthRouter = Router();



    private setup(){
        this.googleOAuthRouter.use(cookieSession({
            name: 'session-name',
            keys: ['key1', 'key2']
        }))

        googleLoginPassport.setup();


        this.googleOAuthRouter.use(passport.initialize());
        this.googleOAuthRouter.use(passport.session());

        this.googleOAuthRouter.get("/", function (req: Request, res: Response, next: NextFunction) {
            res.send('oauth');
        });

        let redirect_uri ;

        this.googleOAuthRouter.get("/google", function (req: Request, res: Response, next: NextFunction) {

            redirect_uri = req.query.redirect_uri;
            next();

        });

        this.googleOAuthRouter.get("/google", passport.authenticate('google', {scope: ['profile', 'email']}));





        this.googleOAuthRouter.get('/google/callback', passport.authenticate('google', { failureRedirect: '/failed' }),
            async function (req, res, next: NextFunction) {

                const userRepository = getCustomRepository(UserRepository);

                const receivedUser: User = new User();

                receivedUser.username = googleLoginPassport.userProfile.displayName;
                receivedUser.emailAddress = googleLoginPassport.userProfile.emails[0].value;


                const result = await userRepository.findOrCreateUser(receivedUser);

                result.password = '123456';

                // console.log(result);

                const {user, accessToken} = await userRepository.findAndGenerateToken(result);

                const token = await AuthService.generateTokenResponse(user, accessToken);

                // set cookie to bypass login

                res.cookie('Admin-Token', JSON.stringify(token));
                res.cookie('User-Info', JSON.stringify(user));


                // res.send(googleLoginPassport.userProfile);
                res.redirect(redirect_uri);
            }
        );
    }

    public get(){
        this.setup()
        return this.googleOAuthRouter;
    }


}
