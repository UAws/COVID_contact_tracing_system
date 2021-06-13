<template>
  <div class="app-container">
    <el-table
      :data="myData"
      border
      fit
      highlight-current-row
      style="width: 100%;"
    >
      <el-table-column label="Check In ID" prop="id" align="center" width="80">
        <template slot-scope="{row}">
          <span>{{ row.check_in_id }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Username" width="200px">
        <template slot-scope="{row}">
          <span class="link-type"> {{ row.create_by }}     </span>
        </template>
      </el-table-column>
      <el-table-column label="TimeStamp" min-width="100px" align="center">
        <template slot-scope="{row}">
          <span>{{ row.CheckInTimeStamp }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Address" width="180px" align="center">
        <template slot-scope="{row}">
          <span>{{ row.CheckInAddress }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Venue ID" width="100px">
        <template slot-scope="{row}">
          <span> {{ row.venue_id }}</span>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import waves from '@/directive/waves'

const { getVenueById } = require('@/api/venue')
const { mapGetters } = require('vuex')
const { getInfo } = require('@/api/user')

export default {
  name: 'VenueCheckInList',
  directives: { waves },
  data() {
    return {
      myData: [
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
      ],
      total: 0,
      managed_venue: [{

      }]
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
          for (const userCheckIn of response.data.userCheckIns) {
            this.myData.push(userCheckIn)
          }

          // Just to simulate the time of the request
          // setTimeout(() => {
          //   this.listLoading = false
          // }, 1.5 * 1000)
        })
      }

      for (const user of this.myData) {
        user.CheckInTimeStamp = new Date(user.CheckInTimeStamp).toString()
      }
    }
  }
}
</script>
