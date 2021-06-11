import Layout from '@/layout'

const venueRouter = {
  path: '/venue',
  component: Layout,
  redirect: '/venue/',
  name: 'Venue Area',
  meta: {
    title: 'Venue Area',
    icon: 'table',
    roles: ['admin', 'venue']
  },
  children: [
    {
      path: 'check-in-list',
      component: () => import('@/views/checkIn/Venue/VenueCheckInList'),
      name: 'Venue Check In List',
      meta: { title: 'Venue Check In List', roles: ['admin', 'venue'] }

    },
    {
      path: 'venue-profile',
      component: () => import('@/views/checkIn/Venue/VenueProfile'),
      name: 'Venue Profile',
      meta: {
        title: 'Venue Profile',
        roles: ['admin', 'venue']
      }
    }
  ]
}
export default venueRouter
