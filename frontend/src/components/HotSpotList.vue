<template>
  <unified-margin-padding-slot>
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
              <v-btn v-if="venue.is_hotspot" size="mini" color="error">
                In HotSpot
              </v-btn>
              <v-btn v-if="!venue.is_hotspot" size="mini" color="success">
                Not In HotSpot
              </v-btn>
            </div>
            <div>
              QR Code:
              <v-btn
                color="blue"
                @click="handleQRCode(venue)"
              >
                Click Me
              </v-btn>
            </div>

            <div>Check In Code:  {{ venue.check_in_code }}</div>
            <div>Email : {{ venue.email_address }}</div>
            <div>Risk : {{ venue.risk_display_name }}</div>
          </v-card-text>

        </v-card>
      </div>
    </v-card>
    <div v-if="dialog">
      QR Code :
      <v-dialog
        v-model="dialog"
        width="500"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="blue"
            v-bind="attrs"
            v-on="on"
          >
            Click Me
          </v-btn>
        </template>

        <v-card>
          <v-card-title class="text-h5 lighten-2">
            QR CODE
          </v-card-title>

          <v-img :src="qrCode" />

          <v-divider />

          <v-card-actions>
            <v-spacer />
            <v-btn
              color="primary"
              text
              @click="dialog = false"
            >
              Got it
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </div>
  </unified-margin-padding-slot>

</template>

<script>
import UnifiedMarginPaddingSlot from '@/components/slots/unified_margin_padding_slot'
const axios = require('axios').default

const risk_level = [
  { key: '3', display_name: 'Low' },
  { key: '2', display_name: 'Medium' },
  { key: '1', display_name: 'High' }
]

export default {
  name: 'VenueInfo',
  components: { UnifiedMarginPaddingSlot },
  data() {
    return {
      total: 5,
      dataTemp: {
        update_time: '',
        create_time: '',
        update_by: '',
        create_by: '',
        venue_id: 2,
        check_in_code: '',
        email_address: '',
        venue_name: '',
        shop_address: '',
        is_hotspot: false,
        Users: []
      },
      list: [],
      risk_level: risk_level,
      dialog: false,
      qrCode: null
    }
  }, computed: {
  },
  created() {
    this.getList()
  }, methods: {
    listVenue() {
      // return axios.get('http://localhost:3000/api/public/venue/info')
      return axios.get('/api/public/venue/info/')
    },
    getList() {
      this.listVenue().then(response => {
        this.list = response.data.data.list
        this.total = response.data.data.total

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
    },
    getVenueQrCode(id) {
      // return axios.get(`http://localhost:3000/api/public/venue/info/qrcode/${id}`)
      return axios.get(`/api/public/venue/info/qrcode/${id}`)
    },
    handleQRCode(row) {
      this.getVenueQrCode(row.venue_id).then(response => {
        if (response.data.code === 20000) {
          this.dialog = true
          this.qrCode = response.data.data
          console.log(response.data.data)
        }
      })
    }
  }
}
</script>

<style scoped>

</style>
