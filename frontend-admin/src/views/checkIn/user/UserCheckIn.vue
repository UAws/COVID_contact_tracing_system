<template>
  <div class="app-container v-app">
    <el-row :gutter="20">

      <el-col :span="18" :xs="24">
        <GMap propmapheight="82vh" />
      </el-col>

      <el-col :span="6" :xs="24">
        <v-app style="height: 85vh">

          <div style="height: 85vh;overflow:auto; max-width: 100%; padding-top: 5vh">

            <el-card>
              <el-form>
                <el-form-item label="Check In Code">
                  <el-input v-if="showVenueInfo" v-model="checkInCode" disabled />
                  <el-input v-else v-model="checkInCode" />
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="search">Search</el-button>
                </el-form-item>
                <el-form-item>
                  <el-button v-if="showVenueInfo" type="primary" @click="submit">CheckIn</el-button>
                  <el-button v-else type="primary" disabled @click="submit">CheckIn</el-button>
                </el-form-item>
              </el-form>
            </el-card>
            <div style="padding-top: 5vh">
              <VenueInfo v-if="showVenueInfo" />
            </div>
          </div>

        </v-app>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import GMap from './components/GMap'
import VenueInfo from './components/VenueInfo'
const { mapGetters } = require('vuex')
const { postUserCheckIn } = require('@/api/checkIn')
const { getVenueInfoByCheckInCode } = require('@/api/venue')

export default {
  name: 'UserCheckIn',
  components: { VenueInfo, GMap },
  data() {
    return {
      showVenueInfo: false,
      checkInCode: '',
      targetVenue: '',
      postUserCheckInTemplate: {
        venue_id: '',
        CheckInAddress: '',
        CheckInTimeStamp: '',
        Users: [
          {
            user_id: ''
          }
        ]
      }
    }
  }, computed: {
    ...mapGetters([
      'venue_id',
      'userData'
    ])
  },
  methods: {
    search() {
      getVenueInfoByCheckInCode(this.checkInCode).then(response => {
        if (response.code === 20000) {
          this.$store.dispatch('venue/changeSelectId', response.data.venue_id)
          this.targetVenue = response.data
          this.showVenueInfo = true

          this.$message({
            message: 'Venue Found, Please CheckIn',
            type: 'success'
          })
        } else {
          this.$message({
            message: 'Check In Code Can not find a venue',
            type: 'warning'
          })
        }
      }).catch(err => {
        this.$message({
          message: err,
          type: 'warning'
        })
      })
    },
    submit() {
      const data = Object.assign({}, this.postUserCheckInTemplate)
      data.venue_id = this.targetVenue.venue_id
      data.CheckInAddress = this.targetVenue.shop_address
      data.CheckInTimeStamp = new Date()
      data.Users[0].user_id = this.userData.user_id
      postUserCheckIn(data).then(response => {
        if (response.code === 20000) {
          this.checkInCode = ''
          this.showVenueInfo = false

          this.$message({
            message: 'Check In Success',
            type: 'success'
          })
        } else {
          this.$message({
            message: 'Check In Failed',
            type: 'warning'
          })
        }
      }).catch(err => {
        this.$message({
          message: err,
          type: 'warning'
        })
      })
    }
  }
}
</script>

<style scoped>
body, html,.app-container {
  overflow: hidden
}
</style>
