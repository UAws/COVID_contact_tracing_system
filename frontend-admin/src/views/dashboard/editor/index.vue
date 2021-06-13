<template>
  <el-row :gutter="20">
    <div class="dashboard-editor-container">
      <v-row :gutter="10">
        <!-- <img :src="emptyGif" class="emptyGif"> -->

        <!-- <v-card
          class="mx-auto"
          width="max-auto"
        > -->
        <div class="clearfix">
          <pan-thumb :image="avatar" style="float: left">
            Your roles:
            <span v-for="item in roles" :key="item" class="pan-info-roles">{{ item }}</span>
          </pan-thumb>
          <github-corner style="position: absolute; top: 0px; border: 0; right: 0;" />
          <div class="info-container">
            <span style="font-size:40px;" class="display_name">Hello, {{ name }}</span>
            <span style="font-size:20px;padding-top:90px;display:inline-block;" class="display_name">Welcome back!</span>
          </div>
        </div>
      </v-row>
      <v-row :gutter="10" style="padding-top:30px">
        <el-col :span="12" :xs="24">
          <!-- <v-img
            class="white--text rounded-circle align-end"
            height="200px"
            src="https://lh3.googleusercontent.com/proxy/xbxcM9lQGAkpot2s-DJh0DDuy607_CFrJz5LV30IYRHuaCik9L9mJIKYqPUKcwPlMZU8-prBbvKXg3mQXiu_6AVWUX01uwPGE9ntdcH5agGGU21tdzM2p5o"
          >
            </v-img> -->
          <v-list-item>
            <v-list-item-icon>
              <v-icon
                size="30"
              >
                mdi-cloud-circle
              </v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text-body-2"> 15&deg;C </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item
            link
            @click="goToSAhealth()"
          >
            <v-list-item-icon>
              <v-icon
                size="30"
              >
                mdi-map-marker-circle
              </v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title class="text-body-2"> SA Health</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <!--
          <v-card-text class="text--primary">
            <div>15&deg;C</div>

            <v-icon><mdi-history></mdi-history></v-icon>
          </v-card-text> -->
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
                mdi-home-circle
              </v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title> Home </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        <!-- </v-card> -->
        </el-col>
        <el-col :span="12" :xs="24">
          <img :src="emptyGif" class="emptyGif">
        </el-col>

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
      emptyGif: 'https://img.alicdn.com/bao/imgextra/i2/4215259796/O1CN010aCxfe2MEcLwJjyBn_!!4215259796.gif'
      // emptyGif: 'https://wpimg.wallstcn.com/0e03b7da-db9e-4819-ba10-9016ddfdaed3'
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
      this.$router.push('/documentation/index')
    },
    goToSAhealth() {
      location.href = 'https://www.sahealth.sa.gov.au/'
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
    background-color: white;
  }
  .dashboard-editor-container {
    background-color: white;
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
      width: 250px;
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
