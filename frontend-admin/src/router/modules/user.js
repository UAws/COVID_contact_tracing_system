/** When your routing table is too long, you can split it into small modules **/

import Layout from '@/layout'

const userRouter = {
  path: '/user',
  component: Layout,
  redirect: '/user/',
  name: 'User Area',
  meta: {
    title: 'User Area',
    icon: 'table'
  },
  children: [
    {
      path: 'check-in',
      component: () => import('@/views/checkIn/user/UserCheckIn'),
      name: 'Check In',
      meta: { title: 'Check In' }
    }
  ]
}
export default userRouter
