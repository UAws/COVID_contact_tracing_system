
<template>
  <v-navigation-drawer v-model="drawer" app dark class="primary">
    <v-list>
      <v-list-item to="/">
        <v-list-item-content>
          <v-list-item-title class="title">
            <span class="font-weight-bold">Covid-19 Tracing</span>
          </v-list-item-title>
          <v-list-item-subtitle>Tracing Management</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
      <v-divider />
      <v-list-group v-for="navLink in navLinks" :key="navLink.text" no-action>
        <v-list-item slot="activator" :to="navLink.route">
          <v-list-item-icon>
            <v-icon>{{ navLink.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-title>{{ navLink.text }}</v-list-item-title>
        </v-list-item>
        <v-list-item v-for="sub in navLink.subLinks" :key="sub.text">
          <v-list-item-title :to="sub.route">{{ sub.text }}</v-list-item-title>
        </v-list-item>
      </v-list-group>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
export default {
  name: 'SideBar',
  data() {
    return {
      drawer: true,

      navLinks: [
        { icon: 'dashboard', text: 'Dashboard', route: '/admin/dashboard' },
        { icon: 'star', text: 'User', route: '/admin/user' },
        {
          icon: 'person_outline',
          text: 'Manager',
          route: '/admin/manager',
          subLinks: [
            { text: 'Add Manager', route: '/managers/add' },
            { text: 'Managers', route: '/managers' }
          ]
        },
        { icon: 'person', text: 'Admin', route: '/admin/admin' }
      ]
    }
  }
}
</script>

<style scoped>

</style>
