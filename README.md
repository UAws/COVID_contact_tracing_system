## COVID contact tracing system

![image-20210614215541005](https://minio.llycloud.com/image/uPic/image-20210614rTvHmG.png)

## Authors

Group member: Akide Liu, Chi Wang, Ziqi Zhang, Zihan Wang..

This project is supervisored by University of Adelaide course [Web & Database Computing](https://www.adelaide.edu.au/course-outlines/108960/1/sem-1/)


## Github Actions CI Status：[![CI](https://github.com/UAws/COVID_contact_tracing_system/actions/workflows/vue-ci.yaml/badge.svg?branch=master)](https://github.com/UAws/COVID_contact_tracing_system/actions/workflows/vue-ci.yaml)

## Project Overview

### [Design document](https://github.com/UAws/COVID_contact_tracing_system/tree/master/docs) 

TRACING is an important tool to reduce the spread of the infectious diseases — COVID-19. Based on different user level (user, venue and admin), registered users are able to sign up and log in to the system in order to: 

- ### LEVEL 1 — User: 

  - Manage their user information.
  - Check-in to locations by entering a check-in code.
  - View their check-in history on a map.
  - See current hotspots on a map.
  - See if they've been to a hotspot.

- ### LEVEL 2 — Venue

  - Manage their venue information.

  - View the check-in history for their venue.

    

- ### LEVEL 3 — Admins/Health Officials

  - Manage their user information.
  - Create and manage hotspot areas/venues & timeframes.
  - View the check-in history for users and venues.
  - See current hotspots on a map.
  - Manage Users/Venues.
  - Sign-up other Health Officials.



- Advanced functions:

  - Users/venue managers are able to choose to link a social media/email/other account, allowing login via that platform, to make logging in easier.
  - GPS Location — Users can check in using their browser's location.
  - QR Code scanning Check-In

  ---


## Dependency review 

- Frontend 
  - [Vue](https://vuejs.org/) 2.x, Vue-router, Vuex
  - [Axios](https://github.com/axios/axios) -- Ajax Request 
  - [Vuetify](https://github.com/vuetifyjs/vuetify) 2.4.x -- UI Framework
  - [Enlist](https://github.com/enlist) -- style and validation
  - [Material Design Icons](https://materialdesignicons.com/)
- Frontend-admin
  - [Vue](https://vuejs.org/) 2.x, Vue-router, Vuex
  - [Axios](https://github.com/axios/axios) -- Ajax Request 
  - [Vuetify](https://github.com/vuetifyjs/vuetify) 2.4.x -- UI Framework
  - [Enlist](https://github.com/enlist) -- style and validation
  - [Material Design Icons](https://materialdesignicons.com/)
  - [Element UI](https://github.com/ElemeFE/element) 2.x-- UI Framework (YES,we combined Vuetify with it)
  - [Vue-element-admin](https://github.com/PanJiaChen/vue-element-admin) -- dashboard support
  - [Gmap-vue](https://www.npmjs.com/package/gmap-vue) -- HotSpot Map
  - [js-cookie](https://github.com/js-cookie/js-cookie) -- Cookie support
- Backend
  - [Typescript](https://www.typescriptlang.org/)/ts-node -- **Typed JavaScript at Any Scale.**
  - [await-to-js](https://github.com/scopsy/await-to-js) -- Promise error handler
  - [bcrypt](https://www.npmjs.com/package/bcrypt) -- password encode
  - [@type/Express](https://www.npmjs.com/package/@types/express) -- Express framework 
  - [jwt-simple](https://www.npmjs.com/package/jwt-simple) -- Json web token (Security)
  - [passportjs](http://www.passportjs.org/) -- google OAuth and JWT
  - [qrcode](https://www.npmjs.com/package/qrcode) -- QRCode generator
  - [typeorm](https://typeorm.io/#/) -- Persistent Layer Integration 
  - [nodemon](https://www.npmjs.com/package/nodemon) -- Auto Reload
  - [dotenv](https://www.npmjs.com/package/dotenv) -- Environment variable detection
- Development environment
  - Mysql 8.0.25
  - Node v12.22.1
  - npm 6.14.12
  - Jetbrains IDEA
  - VSCode
  - CS50
- Continuous integration/Continuous deployment.
  - [Github Action](https://github.com/UAws/COVID_contact_tracing_system) 
  - [Argo CD](https://argoproj.github.io/argo-cd/)

## Example SQL Query

### Database dump file : **[dump.sql](https://github.com/UAws/COVID_contact_tracing_system/blob/master/backend/sql_dump/dump.sql)**

[VenueRepository.ts](https://github.com/UAws/COVID_contact_tracing_system/blob/e636812ea042eca31719573dc1cb19ec9521b78b/backend/src/repository/VenueRepository.ts#L35-L51)

```typescript
const [error, result] = await to(this.manager.query(`
    update user as outUser
    set outUser.is_in_hotspot = true
    where outUser.user_id in (
        select user_id
        from (
                 select u.user_id
                 from user_check_in
                          inner join venue v on user_check_in.venueVenueId = v.venue_id
                          inner join user__user_check_in_user_check_in uuciuci
                                     on user_check_in.check_in_id = uuciuci.userCheckInCheckInId
                          inner join user u on uuciuci.userUserId = u.user_id
                 where v.is_hotspot = true
                   AND v.venue_id = ?
                 group by user_id
             ) as u
    );

`, [dbVenue.venue_id]));
```

## Setup Instructions

![2021-06-14_21-56-58](https://minio.llycloud.com/image/uPic/image-202106149FBU08.png)

### Global Start :

1. Run on official ide.cs50.io

In shared cs50, go to directory : `/home/ubuntu/wdc/COVID_contact_tracing_system/script`

This cs50 has been authorized to `ian-knight-uofa` and `wdc-marker-uofa` with following link: https://ide.cs50.io/d8e35ee8ab724f2db147fb4a556d67b1

After `npm run serve ` the project would be viewed on the following link: https://ide-d8e35ee8ab724f2db147fb4a556d67b1-8081.cs50.ws/

**Important : The default server port for project frontend is 8081**

Declaration : the following script will fetch the latest release version on our github project release page. Therefore, Internet connection is required.

```shell
cd /home/ubuntu/wdc/COVID_contact_tracing_system/script
./run_production_on_CS50.sh
```

**known issues :** If the backend nodejs unfortunately started failed, please rerun the script above. As average, the backend node would be successfully start by run above script **2-3 times.**

![img](https://minio.llycloud.com/image/uPic/image-20210614y3e1VW.png)

When server started successfully :

![2021-06-14_21-25-08](https://minio.llycloud.com/image/uPic/image-20210614F7d0ZI.png)

After that, preview could be found by following click :

https://ide-d8e35ee8ab724f2db147fb4a556d67b1-8081.cs50.ws/

2. Run on Selfhost CS50

There is another script provide ability to build `frontend` and `frontend-admin` on CS50, but as the limited resources provide by cs50 (disk space / memory/ CPU), we would strongly recommend build these parts in our self host cs50 environment or on the local machine

```shell
cd /home/ubuntu/wdc/COVID_contact_tracing_system/script
./run_build.sh
```

1. Run CS50 on local computer via docker (only test on MacOS and ubuntu ). As the size of cs50 base docker image, there are at latest 10GB space available on the local machine

   ```shell
   docker run --name cs50 -p 1337:1337 -p 8081:8081 -p 8080:8080 -d cs50/ide:latest
   ```

2. Self Hosted CS50 (Internal only)



## Licensed Under GPL-v3

```bash
Authors: All team member of UAws/wdc-team 

COVID_contact_tracing_system
Copyright (C) <2021>  UAws/wdc-team

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
