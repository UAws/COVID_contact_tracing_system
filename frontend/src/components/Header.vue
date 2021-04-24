<template>
  <v-container>
    <v-navigation-drawer
      v-model="drawer"
      absolute
      bottom
      temporary
    >
      <v-list
        nav
        dense
      >
        <v-list-item-group
          v-model="group"
          active-class="blue--text text--accent-4"
        >
          <v-list-item>
            <v-list-item-title>HOME</v-list-item-title>
          </v-list-item>
          <v-list-item>
            <v-list-item-title>MAP</v-list-item-title>
          </v-list-item>
          <v-list-item>
            <v-list-item-title>HOTSPOT</v-list-item-title>
          </v-list-item>
          <v-list-item>
            <v-list-item-title>ABOUT US</v-list-item-title>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar
      id="navbar"
      app
      color="rgb(16,37,53)"
    >
      <v-app-bar-nav-icon color="white" @click.stop="drawer = !drawer" />
      <v-row>

      </v-row>
      <v-col>
        <v-hover
          v-slot="{ hover }"
          disabled
        >
          <v-card
            :elevation="hover ? 12:2"
            class="mx-auto"
            height="280"
            max-width="160"
            color="rgb(16,37,53)"
          >
            <v-img
              class="mx-0"
              src="../assets/Tracing_logo.png"
              height="400px"
              contain
            >
              <div class="d-flex align-center" />
            </v-img>
          </v-card>
        </v-hover>
      </v-col>
      <v-tabs
        fixed-tabs
        background-color="rgb(16,37,53)"
        dark
      >
        <v-tab to="/">
          HOME
        </v-tab>
        <v-tab @click="goto('map_div')">
          MAP
        </v-tab>
        <v-tab to="/hotspot">
          HOTSPOT
        </v-tab>
        <v-tab to="/about">
          ABOUT US
        </v-tab>
      </v-tabs>
      <v-spacer />
      <div class="mx-5">
        <v-btn color="white">
          <span class="black--text">Log in</span>
        </v-btn>
      </div>
      <div class="mx-5">
        <v-btn color="#1976D2">
          Sign up
        </v-btn>
      </div>
    </v-app-bar>
  </v-container>
</template>

<script>
export default {
  name: 'Header',

  data: () => ({
    drawer: false,
    group: null
  }),

  watch: {
    group() {
      this.drawer = false
    }
  },
  methods: {
    goto(id) {
      this.$vuetify.goTo(document.getElementById(id).offsetTop + 40)
    }
  }
}
let prevScrollpos = window.pageYOffset
window.onscroll = function() {
  const currentScrollPos = window.pageYOffset
  if (prevScrollpos > currentScrollPos) {
    document.getElementById('navbar').style.top = '0'
  } else {
    document.getElementById('navbar').style.top = '-180px'
  }
  prevScrollpos = currentScrollPos
}
</script>

<style scoped>

</style>
