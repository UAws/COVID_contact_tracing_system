<template>
  <v-container fluid>
    <SideBar />
    <div style="margin-left: 270px">
      <Header />
      <GMap propmapheight="40rem" />

      <DashboardTable />
    </div>
  </v-container>
</template>

<script>
import SideBar from '@/components/admin/sideBar'
import GMap from '@/components/GMap'
import Header from '@/components/admin/Header'
import DashboardTable from '@/components/admin/dashboardTable'
export default {
  name: 'Dashboard',
  components: { DashboardTable, Header, GMap, SideBar },
  data() {
    return {

    }
  }
}
</script>

<style scoped>

</style>
