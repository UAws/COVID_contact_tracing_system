<template>
  <unified-margin-padding-slot style="padding: 50px">
    <v-card style="padding: 50px">

      <el-form>
        <el-form-item label="Venue Name">
          <el-input v-model="my_venue.venue_name" />
        </el-form-item>
        <el-form-item label="Address">
          <el-input v-model.trim="my_venue.shop_address" />
        </el-form-item>
        <el-form-item label="Check In Code">
          <el-input v-model="my_venue.check_in_code" disabled />
        </el-form-item>
        <el-form-item label="Risk Level">
          <el-tag v-if="my_venue.risk_level === 1" type="danger">High</el-tag>
          <el-tag v-if="my_venue.risk_level === 2" type="primary">Medium</el-tag>
          <el-tag v-if="my_venue.risk_level === 3" type="success">Low</el-tag>
        </el-form-item>
        <el-form-item label="Email">
          <el-input v-model="my_venue.email_address" />
        </el-form-item>
        <el-form-item label="Update Time" prop="timestamp">
          <el-date-picker v-model="my_venue.update_time" type="datetime" placeholder="Please pick a date" />
        </el-form-item>

        <el-form-item label="HotSpot Status">
          <el-radio-group v-model="my_venue.is_hotspot">
            <el-radio :label="true">Yes</el-radio>
            <el-radio :label="false"> No </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submit">Update</el-button>
        </el-form-item>
      </el-form>
    </v-card>
  </unified-margin-padding-slot>

</template>

<script>

import UnifiedMarginPaddingSlot from '@/components/Self/unified_margin_padding_slot'

const { editVenue } = require('@/api/venue')

const { getVenueById } = require('@/api/venue')
const { getInfo } = require('@/api/user')
const { mapGetters } = require('vuex')

export default {
  name: 'VenueProfile',
  components: { UnifiedMarginPaddingSlot },
  data() {
    return {
      my_venue: {
        update_time: '',
        create_time: '',
        update_by: '',
        create_by: '',
        venue_id: 0,
        check_in_code: '',
        email_address: '',
        venue_name: '',
        shop_address: '',
        is_hotspot: false,
        lng: 0,
        lat: 0,
        risk_level: 0,
        Users: [
          {
            user_id: 0
          }
        ],
        userCheckIns: [
          {
            update_time: '',
            create_time: '',
            update_by: '',
            create_by: '',
            check_in_id: 0,
            venue_id: 0,
            CheckInAddress: '',
            CheckInTimeStamp: ''
          }
        ]
      },
      managed_venue: []
    }
  },
  computed: {
    ...mapGetters([
      'venue_id',
      'userData'
    ]) },
  created() {
    this.getList()
  },
  methods: {
    async getList() {
      this.listLoading = true

      await getInfo(this.userData.user_id).then(response => {
        this.managed_venue = response.data.Venue
      })

      this.myData = []

      for (const managedVenueElement of this.managed_venue) {
        getVenueById(managedVenueElement.venue_id).then(response => {
          // this.myData = response.data.UserCheckIn
          this.my_venue = response.data
        })
      }
    },
    submit() {
      editVenue(this.managed_venue[0].venue_id, this.my_venue).then(response => {
        if (response.code === 20000) {
          this.my_venue = response.data
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
      })
    }
  }
}
</script>

<style scoped>

</style>
