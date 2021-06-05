<template>
  <el-card>
    <v-row>
      <v-col cols="12">
        <v-sheet
          :class="[computedMargin]"
          rounded
        >
          <div
            :class="[computedPadding]"
            style="max-width: 100%;"
          >
            <div id="map_div">

              <!--            <p>{{ mapHeight }}</p>-->
              <GmapMap
                :center="center"
                :zoom="zoom"
                map-type-id="terrain"
                style="width: 100%; "
                :style="map_height"
              >

                <!--                <GmapMarker-->
                <!--                  v-for="(m, index) in markers"-->
                <!--                  :key="index"-->
                <!--                  :position="m.position"-->
                <!--                  :clickable="true"-->
                <!--                  :draggable="true"-->
                <!--                  :shape="shape"-->
                <!--                  @click="center=m.position"-->
                <!--                />-->
                <GmapCircle
                  :center="!changeSelectableArea?selectMapCoordinate:changeSelectableArea.position"
                  :radius="200"
                  :draggable="true"
                  :editable="true"
                  :options="shape_options"
                  @center_changed="updateSelect"
                />

                <GmapCircle
                  v-for="(m) in markers"
                  :key="m.venue_id"
                  :center="m.position"
                  :radius="200"
                  :options="m.options"
                />
              </GmapMap>
            </div>
          </div>

        </v-sheet>

      </v-col>
    </v-row>
  </el-card>

</template>

<script>
import * as GmapVue from 'gmap-vue'
import Vue from 'vue'
import { gmapApi } from 'gmap-vue'
const { listVenue } = require('@/api/venue')
import { mapGetters } from 'vuex'

export default {
  name: 'GMap',
  props: {
    propmapheight: {
      type: String,
      default: '40rem'
    }
  },
  data() {
    // padding and margin
    // https://vuetifyjs.com/en/styles/spacing/#how-it-works
    const spacers = Array.from({ length: 17 }, (val, i) => `${i}`)
    const nspacers = Array.from({ length: 16 }, (val, i) => `n${i + 1}`)
    const defaults = ['auto', ...spacers]

    return {
      directions: ['t', 'b', 'l', 'r', 's', 'e', 'x', 'y', 'a'],
      marginDirection: 'a',
      marginSize: '2',
      marginSizes: [...defaults, ...nspacers],
      paddingDirection: 'a',
      paddingSize: '6',
      paddingSizes: defaults,
      // Google map
      map_height: {
        height: this.propmapheight
      },
      center: {
        lat: -34.9269366,
        lng: 138.597582
      },
      zoom: 14.05,
      // https://diegoazh.github.io/gmap-vue/examples/marker.html#source-code
      markers: [{
        position: {
          lat: '',
          lng: ''
        }
      }, {
        position: {
          lat: '',
          lng: ''
        }
      }
      ],
      shape: {
        coords: [10, 10, 10, 15, 15, 15, 15, 10],
        type: 'poly'
      },
      shape_options: {
        strokeColor: '#0080ff',
        fillColor: '#0080ff',
        fillOpacity: 0.35
      },
      selectMapCoordinate: {},
      list: []
    }
  },
  computed: {

    computedPadding() {
      return `p${this.paddingDirection}-${this.paddingSize}`
    },
    computedMargin() {
      return `m${this.marginDirection}-${this.marginSize}`
    },
    google: gmapApi,
    ...mapGetters([
      'venue_id'
    ]),

    changeSelectableArea() {
      for (const listElement of this.markers) {
        if (listElement.venue_id === this.venue_id) {
          return listElement
        }
      }

      return { position: this.center }
    }
  },
  created() {
    this.getList()
    this.selectMapCoordinate = this.center
  },
  mounted() {

  },
  methods: {
    getList() {
      listVenue().then(response => {
        this.list = response.data.list
        this.total = response.data.total

        const list = this.list
        this.markers = []
        let shape_options = {
          strokeColor: '#FF0000',
          fillColor: '#FF0000',
          fillOpacity: 0.35
        }
        for (const listElement of list) {
          if (listElement.lat != null && listElement.lng != null) {
            switch (listElement.risk_level) {
              case 1:
                shape_options = {
                  strokeColor: '#FF0000',
                  fillColor: '#FF0000',
                  fillOpacity: 0.35
                }
                break
              case 2:
                shape_options = {
                  strokeColor: '#ff00ff',
                  fillColor: '#ff00ff',
                  fillOpacity: 0.35
                }
                break
              case 3:
                shape_options = {
                  strokeColor: '#ffff00',
                  fillColor: '#ffff00',
                  fillOpacity: 0.35
                }
            }

            this.markers.push({
              position: {
                lat: listElement.lat,
                lng: listElement.lng
              },
              options: shape_options,
              venue_id: listElement.venue_id
            })
          }
        }

        console.log(this.markers)

        // Just to simulate the time of the request
        setTimeout(() => {
          this.listLoading = false
        }, 1.5 * 1000)
      })
    },
    updateSelect(latLng) {
      this.selectMapCoordinate = {
        lat: latLng.lat(),
        lng: latLng.lng()
      }
      // console.log(this.selectMapCoordinate)

      this.$store.dispatch('venue/changeLat', this.selectMapCoordinate.lat)
      this.$store.dispatch('venue/changeLng', this.selectMapCoordinate.lng)
    }
  }
}

// set up google map
Vue.use(GmapVue, {
  load: {
    key: 'AIzaSyB7HDbPFShzxlrVUPn6dwWU1O9fdTpdp7k',
    libraries: 'places' // This is required if you use the Autocomplete plugin
    // OR: libraries: 'places,drawing'
    // OR: libraries: 'places,drawing,visualization'
    // (as you require)

    // // If you want to set the version, you can do so:
    // v: '3.26',
  },

  // // If you intend to programmatically custom event listener code
  // // (e.g. `this.$refs.gmap.$on('zoom_changed', someFunc)`)
  // // instead of going through Vue templates (e.g. `<GmapMap @zoom_changed="someFunc">`)
  // // you might need to turn this on.
  // autobindAllEvents: false,

  // // If you want to manually install components, e.g.
  // // import {GmapMarker} from 'gmap-vue/src/components/marker'
  // // Vue.component('GmapMarker', GmapMarker)
  // // then set installComponents to 'false'.
  // // If you want to automatically install all the components this property must be set to 'true':
  installComponents: true
})

</script>

<style scoped>

</style>
