import { RoleController } from './controller/RoleController'
import { UserCheckInController } from './controller/UserCheckInController'
import { UserInfoController } from './controller/UserInfoController'
import { venueController } from './controller/venueController'

export const Routes = [
  {
    method: 'get',
    route: '/api/user/info',
    controller: UserInfoController,
    action: 'all',
  }, {
    method: 'get',
    route: '/api/user/info/:id',
    controller: UserInfoController,
    action: 'one',
  }, {
    method: 'post',
    route: '/api/user/info',
    controller: UserInfoController,
    action: 'save',
  }, {
    method: 'delete',
    route: '/api/user/info/:id',
    controller: UserInfoController,
    action: 'remove',
  }, {
    method: 'get',
    route: '/api/user/role/',
    controller: RoleController,
    action: 'getRoles',
  }, {
    method: 'get',
    route: '/api/user/role/:id',
    controller: RoleController,
    action: 'getRoleById',
  }, {
    method: 'get',
    route: '/api/user/checkIn/:id',
    controller: UserCheckInController,
    action: 'getUserCheckIn',
  }, {
    method: 'post',
    route: '/api/user/checkIn/:id',
    controller: UserCheckInController,
    action: 'postUserCheckIn',
  }, {
    method: 'get',
    route: '/api/venue/venueID/:id',
    controller: venueController,
    action: 'getVenueInfo',
  }, {
    method: 'post',
    route: '/api/venue/venueID/:id',
    controller: venueController,
    action: 'postVenueInfo',
  },
  {
    method: 'get',
    route: '/api/venue/info',
    controller: venueController,
    action: 'all',
  }, {
    method: 'delete',
    route: '/api/venue/info/:id',
    controller: venueController,
    action: 'remove',
  },
  {
    method: 'post',
    route: '/api/venue/info',
    controller: venueController,
    action: 'save',
  },
]
