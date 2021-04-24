<template>
  <v-app-bar
    id="navbar"
    app
    color="rgb(16,37,53)"
  >
    <v-col
      cols="12"
      sm="4"
    >
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
    <v-btn color="#1976D2">
      Sign up
    </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  name: 'Header',
  methods: {
    goto(id) {
      this.$vuetify.goTo(document.getElementById(id).offsetTop + 40)
    }
  }
}

var prevScrollpos = window.pageYOffset
window.onscroll = function() {
  var currentScrollPos = window.pageYOffset
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
