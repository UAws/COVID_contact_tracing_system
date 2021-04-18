<template>
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
            <GmapMap
              :center="center"
              :zoom="zoom"
              map-type-id="terrain"
              style="width: 100%; height: 40rem"
            >
              <GmapMarker
                v-for="(m, index) in markers"
                :key="index"
                :position="m.position"
                :clickable="true"
                :draggable="true"
                :shape="shape"
                @click="center=m.position"
              />
              <GmapCircle
                :center="center"
                :radius="200"
                :draggable="true"
                :editable="true"
              />
            </GmapMap>
          </div>
        </div>

      </v-sheet>

    </v-col>
  </v-row>

</template>

<script>
import * as GmapVue from 'gmap-vue'
import Vue from 'vue'

export default {
  name: 'GMap',
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
      center: {
        lat: -34.9269366,
        lng: 138.597582
      },
      zoom: 14.05,
      // https://diegoazh.github.io/gmap-vue/examples/marker.html#source-code
      markers: [{
        position: {
          lat: -34.9269366,
          lng: 138.587581
        }
      }, {
        position: {
          lat: 11.0,
          lng: 11.0
        }
      }],
      shape: {
        coords: [10, 10, 10, 15, 15, 15, 15, 10],
        type: 'poly'
      }
    }
  },

  computed: {
    computedPadding() {
      return `p${this.paddingDirection}-${this.paddingSize}`
    },
    computedMargin() {
      return `m${this.marginDirection}-${this.marginSize}`
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
