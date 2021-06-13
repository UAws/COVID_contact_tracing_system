/** When your routing table is too long, you can split it into small modules **/

import Layout from '@/layout'

const tableRouter = {
  path: '/administration',
  component: Layout,
  redirect: '/table/complex-table',
  name: 'Admin Area',
  meta: {
    title: 'Admin Area',
    icon: 'table',
    roles: ['admin']
  },
  children: [
    {
      path: 'manager-user',
      component: () => import('@/views/table/complex-table-userlist'),
      name: 'User Manage',
      meta: { title: 'User Manage', roles: ['admin'] }
    }, {
      path: 'manager-venue',
      component: () => import('@/views/table/venue'),
      name: 'Venue Manage',
      meta: { title: 'Venue Manage', roles: ['admin'] }
    }, {
      path: 'manage-hotspot',
      component: () => import('@/views/hotspot/manageHotspot'),
      name: 'HotSpot Manage',
      meta: { title: 'HotSpot Manage', roles: ['admin'] }
    }, {
      path: 'manage-checkIn',
      component: () => import('@/views/table/complex-table-checkin'),
      name: 'Check In Manage',
      meta: { title: 'Check In Manage', roles: ['admin'] }
    }
  ]
}
export default tableRouter
