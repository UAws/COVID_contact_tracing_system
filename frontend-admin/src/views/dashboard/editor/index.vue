<template>
  <el-row :gutter="20">
    <div class="dashboard-editor-container">
      <div class=" clearfix">
        <pan-thumb :image="avatar" style="float: left">
          Your roles:
          <span v-for="item in roles" :key="item" class="pan-info-roles">{{ item }}</span>
        </pan-thumb>
        <github-corner style="position: absolute; top: 0px; border: 0; right: 0;" />
        <div class="info-container">
          <span style="font-size:40px;" class="display_name">{{ name }}</span>
          <span style="font-size:25px;padding-top:20px;display:inline-block;">Welcome!</span>
        </div>
      </div>
      <v-row :gutter="10">
        <img :src="emptyGif" class="emptyGif">

        <v-card
          class="mx-auto"
          max-width="400"
        >
          <v-img
            class="white--text align-end"
            height="200px"
            src="https://lh3.googleusercontent.com/proxy/YilJI16h1beNfsmjjmRLRKk5lOZbS7NR5FJG2TGFN4HuBrSiub3kdgOez5T-cEof9dCsJDrNBKrTv557ultTK9RcYX-xQeH6cE7ivYxBaz-PCmbP7GP0kAs"
          />

          <v-card-title>
            South Australia
          </v-card-title>

          <v-card-text class="text--primary">
            <div>15&deg;C</div>

            <v-icon>mdi-cloud</v-icon>
          </v-card-text>
          <v-list-item
            link
            @click="goToProfile()"
          >
            <v-list-item-icon>
              <v-icon
                size="30"
              >
                mdi-account-circle
              </v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text-body-2"> View Profile </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item
            link
            @click="goToCheckIn()"
          >
            <v-list-item-icon>
              <v-icon
                size="30"
              >
                mdi-clock-start
              </v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title> Check In </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item
            link
            @click="goToHome()"
          >
            <v-list-item-icon>
              <v-icon
                size="30"
              >
                mdi-home
              </v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title> Home </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-card>
      </v-row>
    </div>
  </el-row>
</template>

<script>
import { mapGetters } from 'vuex'
import PanThumb from '@/components/PanThumb'
import GithubCorner from '@/components/GithubCorner'

export default {
  name: 'DashboardEditor',
  components: { PanThumb, GithubCorner },
  data() {
    return {
      // emptyGif: 'https://media0.giphy.com/media/QuslVm3lEHtubdaJ1u/giphy.gif'
      emptyGif: 'https://wpimg.wallstcn.com/0e03b7da-db9e-4819-ba10-9016ddfdaed3'
      // items: [
      //   { icon: 'mdi-account-circle', title: 'Profile' },
      //   { icon: 'mdi-clock-start', title: 'Check-in' },
      //   { icon: 'mdi-email', title: 'Inbox' }
      // ]
    }
  },
  computed: {
    ...mapGetters([
      'name',
      'avatar',
      'roles'
    ])
  },
  methods: {
    goToProfile() {
      this.$router.push('/profile/index')
    },
    goToCheckIn() {
      this.$router.push('/user/check-in')
    },
    goToHome() {
      window.location.replace('/')
    }
  }
}
</script>

<style lang="scss" scoped>
  .emptyGif {
    display: block;
    width: 50%;
    padding: 20px 20px 0px;
  }
  .mx-auto {
    background-color: #fcfcfcd7;
  }
  .dashboard-editor-container {
    background-color: #e3e3e3;
    min-height: 100vh;
    padding: 50px 60px 0px;
    .pan-info-roles {
      font-size: 12px;
      font-weight: 700;
      color: #333;
      display: block;
    }
    .info-container {
      position: relative;
      margin-left: 190px;
      height: 150px;
      line-height: 200px;
      .display_name {
        font-size: 48px;
        line-height: 48px;
        color: #212121;
        position: absolute;
        top: 25px;
      }
    }
  }
</style>
