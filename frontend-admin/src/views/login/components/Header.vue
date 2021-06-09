<template>
  <v-container>
    <v-navigation-drawer
      v-model="drawer"
      app
      temporary
      color="rgb(16,37,53)"
    >
      <v-list
        nav
        dense
      >
        <v-list-item-group
          v-model="group"
          active-class="blue--text text--accent-4"
        >
          <v-list-item @click="redirect('/')">
            <v-list-item-title class="white--text">HOME</v-list-item-title>
          </v-list-item>
          <v-list-item @click="redirect('/?to=map_div')">
            <v-list-item-title class="white--text">MAP</v-list-item-title>
          </v-list-item>
          <v-list-item @click="redirect('/hotspot')">
            <v-list-item-title class="white--text">HOTSPOT</v-list-item-title>
          </v-list-item>
          <v-list-item @click="redirect('/about')">
            <v-list-item-title class="white--text">ABOUT US</v-list-item-title>
          </v-list-item>
          <v-list-item to="/signup">
            <v-list-item-title class="white--text">SIGN UP</v-list-item-title>
          </v-list-item>
          <v-list-item to="/login">
            <v-list-item-title class="white--text">LOG IN</v-list-item-title>
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
      <v-row />
      <v-col cols="12" sm="4">
        <v-hover
          v-slot="{ hover }"
          disabled
        >
          <v-card
            :elevation="hover ? 12:2"
            class="mx-auto"
            :height="boxH"
            max-width="160"
            style="padding-left: 5px; padding-right: 5px; padding-bottom: 10px"
            color="rgb(16,37,53)"
          >
            <!-- TODO url must replaced -->
            <v-img
              class="mx-0"
              src="https://minio.llycloud.com/image/uPic/image-20210525CrybJa.png"
              style="padding-left: 5px; padding-right: 5px; padding-bottom: 10px"
              :height="imgH+'px'"
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
        <v-tab @click="redirect('/')">
          HOME
        </v-tab>
        <v-tab @click="redirect('/?to=map_div')">
          MAP
        </v-tab>
        <v-tab @click="redirect('/hotspot')">
          HOTSPOT
        </v-tab>
        <v-tab @click="redirect('/about')">
          ABOUT US
        </v-tab>
      </v-tabs>
      <v-spacer />
      <div class="mx-5">
        <v-btn color="white" to="/login">
          <span class="black--text">Log in</span>
        </v-btn>
      </div>
      <div class="mx-5">
        <v-btn color="#1976D2" to="/signup">
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
    group: null,

    imgH: 400,
    boxH: 280
  }),
  watch: {
    group() {
      this.drawer = false
    }
  },
  created() {
    let prevScrollpos = window.pageYOffset
    window.onscroll = () => {
      const currentScrollPos = window.pageYOffset
      if (prevScrollpos > currentScrollPos) {
        document.getElementById('navbar').style.top = '0'
      } else {
        document.getElementById('navbar').style.top = '-180px'
      }
      prevScrollpos = currentScrollPos
      if (prevScrollpos < 20) {
        this.boxH = 260
        this.imgH = 400
      } else {
        this.boxH = 64
        this.imgH = 64
      }
    }
  },
  methods: {
    goto(id) {
      this.$nextTick(() => {
        this.$vuetify.goTo(document.getElementById(id).offsetTop + 40)
      })
    },
    redirect(path) {
      window.location.replace(path)
    }
  }
}
</script>

<style scoped>

</style>
