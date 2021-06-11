/** When your routing table is too long, you can split it into small modules **/

import Layout from '@/layout'

const tableRouter = {
  path: '/administration',
  component: Layout,
  redirect: '/table/complex-table',
  name: 'Admin Area',
  meta: {
    title: 'Admin Area',
    icon: 'table'
  },
  children: [
    // {
    //   path: 'dynamic-table',
    //   component: () => import('@/views/table/dynamic-table/index'),
    //   name: 'DynamicTable',
    //   meta: { title: 'Dynamic Table' }
    // },
    // {
    //   path: 'drag-table',
    //   component: () => import('@/views/table/drag-table'),
    //   name: 'DragTable',
    //   meta: { title: 'Drag Table' }
    // },
    // {
    //   path: 'inline-edit-table',
    //   component: () => import('@/views/table/inline-edit-table'),
    //   name: 'InlineEditTable',
    //   meta: { title: 'Inline Edit' }
    // },
    // {
    //   path: 'complex-table',
    //   component: () => import('@/views/table/complex-table'),
    //   name: 'ComplexTable',
    //   meta: { title: 'Complex Table' }
    // },
    {
      path: 'manager-user',
      component: () => import('@/views/table/complex-table-userlist'),
      name: 'User Manage',
      meta: { title: 'User Manage' }
    }, {
      path: 'manager-venue',
      component: () => import('@/views/table/venue'),
      name: 'Venue Manage',
      meta: { title: 'Venue Manage' }
    }, {
      path: 'manage-hotspot',
      component: () => import('@/views/hotspot/manageHotspot'),
      name: 'HotSpot Manage',
      meta: { title: 'HotSpot Manage' }
    }, {
      path: 'manage-checkIn',
      component: () => import('@/views/table/complex-table-checkin'),
      name: 'Check In Manage',
      meta: { title: 'Check In Manage' }
    }
  ]
}
export default tableRouter
