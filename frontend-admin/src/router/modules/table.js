/** When your routing table is too long, you can split it into small modules **/

import Layout from '@/layout'

const tableRouter = {
  path: '/table',
  component: Layout,
  redirect: '/table/complex-table',
  name: 'Table',
  meta: {
    title: 'Table',
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
      path: 'Users',
      component: () => import('@/views/table/complex-table-userlist'),
      name: 'Users',
      meta: { title: 'Users' }
    }, {
      path: 'Venue',
      component: () => import('@/views/table/venue'),
      name: 'venue',
      meta: { title: 'Venue' }
    }, {
      path: 'CheckIn',
      component: () => import('@/views/table/check-in-table'),
      name: 'CheckIn',
      meta: { title: 'CheckIn' }
    }
  ]
}
export default tableRouter
