require("dotenv").config();
const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth20').Strategy;

export default class googleLoginPassport {

    public static userProfile;

    public static setup(){
        passport.serializeUser(function(user, done) {
            done(null, user);
        });

        passport.deserializeUser(function(user, done) {
            done(null, user);
        });


        passport.use(new GoogleStrategy({
                clientID: process.env.GOOGLE_CLIENT_ID,
                clientSecret: process.env.GOOGLE_CLIENT_SECRET,
                callbackURL: process.env.CALLBACK_URL
            },
            function(accessToken, refreshToken, profile, cb) {

                googleLoginPassport.userProfile = profile;

                return cb(null, profile);

            }
        ));
    }


}

