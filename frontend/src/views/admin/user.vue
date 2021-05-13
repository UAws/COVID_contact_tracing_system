<template>
  <v-container fluid>
    <SideBar />
    <div style="margin-left: 270px">
      <Header />
      <UserInfoForm />
      <DashboardTable />
    </div>
  </v-container>
</template>

<script>
import SideBar from '@/components/admin/sideBar'
import Header from '@/components/admin/Header'
import DashboardTable from '@/components/admin/dashboardTable'
import UserInfoForm from '@/components/admin/UserInfoForm'
export default {
  name: 'User',
  components: { DashboardTable, Header, SideBar, UserInfoForm }

}
</script>

<style scoped>

</style>
