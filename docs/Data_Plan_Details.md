# Data Plan Details

## Server Routes



#### Server Routes

| Method                                                       | URL                             | Purpose                                                      | Request/Response                                             | Response                                                     |
| :----------------------------------------------------------- | :------------------------------ | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
|                                                              | Public Access:                  |                                                              |                                                              |                                                              |
| [Post](https://www.notion.so/Post-32885a7472a84f04b6bd1d6f5d34f6aa) | /auth/login                     | Authorize User Login                                         | password, username or email address                          | a JWT token and user details object                          |
| [Post](https://www.notion.so/Post-3bf8ef8c359e447c9b3dfe0f04b3d0bb) | /auth/logout                    | User Logout                                                  | JWT token                                                    | success code                                                 |
| [Post](https://www.notion.so/Post-672e4bf1cd6a49da8d1d91253000dac3) | /auth/register                  | User Registration (venue management and admin need further approval ) | password, username, email address, phone number, user role   | success code:20000                                           |
| [GET](https://www.notion.so/GET-d529a22ed2fb41f8907c4c3619c050f0) | /public/hotspot                 | Retrieve hotspot location                                    | JWT token                                                    | A array of current hotspot location then render location to map |
|                                                              | Authorized Access:              |                                                              |                                                              |                                                              |
| [GET](https://www.notion.so/GET-2def27c1b0894e3ca9c17f9a8ffb8b3e) | /user/                          | Retrieve All User Info, admin only                           | JWT token                                                    | All user details objects in an array                         |
| [GET](https://www.notion.so/GET-fa6f8a4dbc8b403ca5389acf87636285) | /user/info/{userid}             | retrieve user details by id                                  | user id, and JWT token                                       | single user details object, and success code                 |
| [Post](https://www.notion.so/Post-3fe1f2194d914f0085a739b2920e7835) | /user/info/{userid}             | Update User Info                                             | Post a modified existing user details object which retrieved from get user by id | success code and processed user details object               |
| [DELETE](https://www.notion.so/DELETE-607b87cab15744a899badec812add155) | /user/info/{userid}             | Delete User (admin only)                                     | user id, and JWT token                                       | success code                                                 |
| [GET](https://www.notion.so/GET-412b25d6cc724a78baf82389ed30848f) | /user/role/{level}              | Retrieve All User in specific level. For example, admin can get all level user info, venue manager only allowed to get guest info | JWT token and Level in number                                | Specific Level user details objects in an array              |
| [Post](https://www.notion.so/Post-b1f027e8681041128f838d97537805bb) | /user/checkIn/{userId}          | User check into the venue                                    | user id, location, timestamp, venue id, and JWT token        | success code                                                 |
| [GET](https://www.notion.so/GET-48db06de09a948fdad458dc703d062fe) | /user/checkIn/{userId}          | Retrieve User check in history                               | user id, and JWT token                                       | Array contains user checkin history and been in hotpot or not |
| [GET](https://www.notion.so/GET-26a39281b6dd487884ae13e7dab37b39) | /user/message/{userId}          | Retrieve User message                                        | user id, and JWT token                                       | Array contains user message                                  |
|                                                              | Venue Manager Access:           |                                                              |                                                              |                                                              |
| [GET](https://www.notion.so/GET-f0201db7a78947beaf70d946cd35ffd5) | /venue/venueID/{venueid}        | Retrieve venue information                                   | venue id, JWT token                                          | Single Venue information in a object.                        |
| [Post](https://www.notion.so/Post-ea0e6a3ab1a040c884fa4899d5ffe2b3) | /venue/venueID/{venueid}        | Modify venue information                                     | Post a modified existing venue details object which retrieved from get venue by id | success code and processed information object                |
| [POST](https://www.notion.so/POST-6d8c2646b7ca4797b6f58afb3f909fe8) | /venue/qrcode/{venueid}         | Request new qrcode                                           | venue id, JWT token                                          | a new url contains qrcode                                    |
| [GET](https://www.notion.so/GET-0af44b1fc2424fb3be5411838c9756a1) | /venue/qrcode/{venueid}         | Retrieve qrcode                                              | venue id, JWT token                                          | a new url contains qrcode                                    |
| [GET](https://www.notion.so/GET-8a88d6c292c044e1bf4d0d2cc6c02962) | /venue/history/{venueid}        | Retrieve user details which has been visited venue           | venue id, JWT token                                          | An Array of User details, and user checkin history           |
|                                                              | Admin/ Medical Official Access: |                                                              |                                                              |                                                              |
| [GET](https://www.notion.so/GET-075c5a20570c45e0a6fa24911fba209b) | /admin/approval/                | GET approvals pending list                                   | JWT token                                                    | A array of user details which is pending approvals           |
| [PATH](https://www.notion.so/PATH-ca5d68c1f197455aa35ef446a23c303d) | /admin/approval/{userid}        | Approve venue manager and new admin into system              | user id, and JWT token                                       | Success Code                                                 |
| [POST](https://www.notion.so/POST-60dde8c34b6843cbaa9d959ef5d21f1f) | /admin/hotspot                  | Make a flag for new hotspot                                  | Location, time, JWT token                                    | Success code, and A array of current hotspot location        |
| [GET](https://www.notion.so/GET-b601811e8e844621ae062ded24618df3) | /admin/hotspot                  | Retrieve hotspot location                                    | JWT token                                                    | A array of current hotspot location then render location to map |



## Object Example TODO

User Info response json example :

```json
{
  "update_time": "2021-05-09T13:36:45.000Z",
  "create_time": "2021-05-09T13:36:47.000Z",
  "update_by": "Akide_Liu",
  "create_by": "Akide_Liu",
  "user_id": 1,
  "username": "Akide_Liu",
  "password": "123456",
  "address": "5 allan st, prospect, SA",
  "emailAddress": "mail@llycloud.com",
  "is_in_hotspot": false,
  "is_approval": true,
  "phone": 450460166,
  "Role": [
    {
      "update_time": "2021-05-09T13:37:33.000Z",
      "create_time": "2021-05-09T13:37:35.000Z",
      "update_by": "Akide_Liu",
      "create_by": "Akide_Liu",
      "role_id": 1,
      "level": 3,
      "role_name": "admin",
      "description": "administrators"
    }
  ],
  "UserCheckIn": [
    {
      "update_time": "2021-05-09T14:16:06.000Z",
      "create_time": "2021-05-09T14:16:07.000Z",
      "update_by": "Akide_Liu",
      "create_by": "Akide_Liu",
      "check_in_id": 1,
      "venue_id": 1,
      "CheckInAddress": "156 george st ,Adelaide",
      "CheckInTimeStamp": "2021-05-09T14:16:30.000Z"
    }
  ],
  "Venue": [
    {
      "update_time": "2021-05-09T14:23:38.000Z",
      "create_time": "2021-05-09T14:23:39.000Z",
      "update_by": "Akide_Liu",
      "create_by": "Akide_Liu",
      "venue_id": 1,
      "check_in_code": "1000001",
      "email_address": "mail@adelaide.edu.au",
      "venue_name": "University of Adelaide",
      "shop_address": "The University of Adelaide\nSA 5005\nAUSTRALIA",
      "is_hotspot": false
    }
  ]
}
```


## 



## Client/Server Interactions

#### Client/Server Interactions

| Page                                                         | Interaction                                                  |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [All](https://www.notion.so/All-d064b5ab88824d2aaee5b3e5811988dc) | Each page is served up statically by the server              |
| [Home](https://www.notion.so/Home-6ac1e27651a54513b27679910b7a4952) | The Client request hotspot and render to map, different level of user might have different view. higher level authority have some manage features |
| [Personal Information](https://www.notion.so/Personal-Information-ee11ddacad29485b99dde8ce42f776b9) | The Client request specific user info it should display and can be modify. |
| [User Information](https://www.notion.so/User-Information-b90d44ce977b43e399b8e6525ad3cb2d) | The Admin request all user info and render as a table it should display and can be modify. |
| [venue information](https://www.notion.so/venue-information-137ae69c50e64d2195f47c70cb5bcdfe) | The venue manager request belonged venue and update venue information |
| [Admin](https://www.notion.so/Admin-882cca2463034924b16052f3da6dff5d) | The Admin or Medical official request admin interface it should display all information in entire system and administrative features. |
