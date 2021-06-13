<template>
  <v-card>
    <div
      v-for="venue in list"
      id="content_div"
      :key="venue.venue_id"
      style="padding-bottom: 20px"
    >
      <v-card
        class="mx-auto"
        max-width="100%"
      >
        <v-img
          class="white--text align-end"
          height="200px"
          src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
        >
          <v-card-title>{{ venue.venue_name }}</v-card-title>
        </v-img>

        <v-card-subtitle class="pb-0">
          Address : {{ venue.shop_address }}
        </v-card-subtitle>

        <v-card-text class="text--primary">
          <div>Venue ID:  {{ venue.venue_id }}</div>
          <div>HotSpot:
            <v-btn v-if="!venue.is_hotspot" size="mini" type="danger">
              In HotSpot
            </v-btn>
            <v-btn v-if="venue.is_hotspot" size="mini" type="success">
              Not In HotSpot
            </v-btn>
          </div>
          <div>Check In Code:  {{ venue.check_in_code }}</div>
          <div>Email : {{ venue.email_address }}</div>
          <div>Risk : {{ venue.risk_display_name }}</div>
        </v-card-text>

      </v-card>
    </div>
  </v-card>
</template>

<script>
const axios = require('axios').default

const risk_level = [
  { key: '3', display_name: 'Low' },
  { key: '2', display_name: 'Medium' },
  { key: '1', display_name: 'High' }
]

export default {
  name: 'VenueInfo',
  data() {
    return {
      total: 5,
      dataTemp: {
        update_time: '2021-05-30T03:50:32.000Z',
        create_time: '2021-05-30T03:38:46.000Z',
        update_by: 'Super Admin',
        create_by: 'Super Admin',
        venue_id: 2,
        check_in_code: '100002',
        email_address: 'aaaa@adelaide.edu.au',
        venue_name: 'Killision',
        shop_address: '22 hendly st, Adelaide',
        is_hotspot: false,
        Users: []
      },
      list: [],
      risk_level: risk_level
    }
  }, computed: {
  },
  created() {
    this.getList()
  }, methods: {
    listVenue() {
      return axios.get('/api/public/venue/info')
    },
    getList() {
      this.listVenue().then(response => {
        this.list = response.data.list
        this.total = response.data.total

        for (const listElement of this.list) {
          for (const risk of risk_level) {
            if (parseInt(risk.key) === parseInt(listElement.risk_level)) {
              listElement.risk_display_name = risk.display_name
              break
            }
          }
        }

        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    }
  }
}
</script>

<style scoped>

</style>
