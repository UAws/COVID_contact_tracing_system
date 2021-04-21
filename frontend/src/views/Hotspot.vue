<template>
  <v-container fluid>
    <Header />
    <v-row style="padding-top: 5vh">
      <v-col cols="12" xl="4" lg="4" style="max-height: 92vh;overflow:hidden;padding-top: 5vh">
        <div style="height: 100%;overflow:auto; max-width: 100%">
          <HotSpotList />
        </div>
      </v-col>
      <v-col cols="12" xl="8" lg="8">
        <GMap propmapheight="86vh" />
      </v-col>
    </v-row>
  </v-container>

</template>

<script>
import GMap from '@/components/GMap'
import Header from '@/components/Header'
import HotSpotList from '@/components/HotSpotList'
export default {
  name: 'Hotspot',
  components: { HotSpotList, Header, GMap },
  data() {
    return {

    }
  }
}
</script>

<style scoped>

</style>
