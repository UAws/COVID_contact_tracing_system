import {UserInfoController} from "./controller/UserInfoController";
import {RoleController} from "./controller/RoleController";
import {UserCheckInController} from "./controller/UserCheckInController";
import {venueController} from "./controller/venueController";
import {AuthController} from "./controller/AuthController";

export const Routes = [{
    method: "get",
    route: "/api/user/info",
    controller: UserInfoController,
    action: "all"
}, {
    method: "get",
    route: "/api/user/info/:id",
    controller: UserInfoController,
    action: "one"
}, {
    method: "post",
    route: "/api/user/info",
    controller: UserInfoController,
    action: "create"
},{
    method: "put",
    route: "/api/user/info",
    controller: UserInfoController,
    action: "update"
},{
    method: "put",
    route: "/api/user/info/changeHotSpot/:id",
    controller: UserInfoController,
    action: "changeInHotSport"
}, {
    method: "delete",
    route: "/api/user/info/:id",
    controller: UserInfoController,
    action: "remove"
}, {
    method: "get",
    route: "/api/user/role/",
    controller: RoleController,
    action: "getRoles"
}, {
    method: "get",
    route: "/api/user/role/:id",
    controller: RoleController,
    action: "getRoleById"
}, {
    method: "get",
    route: "/api/user/checkIn/:userId",
    controller: UserCheckInController,
    action: "getUserCheckIn"
},{
    method: "get",
    route: "/api/user/checkIn/",
    controller: UserCheckInController,
    action: "getAllUserCheckIN"
}, {
    method: "post",
    route: "/api/user/checkIn/",
    controller: UserCheckInController,
    action: "postUserCheckIn"
}, {
    method: 'get',
    route: '/api/venue/venueID/:id',
    controller: venueController,
    action: 'getVenueInfo',
},{
    method: 'get',
    route: '/api/venue/checkIn/:code',
    controller: venueController,
    action: 'getVenueInfoByCheckInCode',
}, {
    method: 'post',
    route: '/api/venue/venueID/:id',
    controller: venueController,
    action: 'postVenueInfo',
}, {
    method: 'get',
    route: '/api/venue/info',
    controller: venueController,
    action: 'all',
}, {
    method: 'delete',
    route: '/api/venue/info/:id',
    controller: venueController,
    action: 'remove',
}, {
    method: 'post',
    route: '/api/venue/info',
    controller: venueController,
    action: 'save',
}, {
        method: "put",
        route: "/api/venue/info/changeHotSpot/:id",
        controller: venueController,
        action: "changeInHotSport"
},{
        method: "post",
        route: "/api/venue/info/changeCoordinates/:id",
        controller: venueController,
        action: "changeCoordinates"
},{
        method: "get",
        route: "/api/venue/info/qrcode/:id",
        controller: venueController,
        action: "getQRCode"
},{
    method: 'post',
    route: '/api/auth/register',
    controller: AuthController,
    action: 'register',
}, {
    method: 'post',
    route: '/api/auth/login',
    controller: AuthController,
    action: 'login',
}, {
    method: 'post',
    route: '/api/auth/logout',
    controller: AuthController,
    action: 'logout',
}
];
