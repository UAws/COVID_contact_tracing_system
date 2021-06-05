<template>
  <div class="app-container v-app">
    <el-row :gutter="20">

      <el-col :span="18" :xs="24">
        <GMap propmapheight="82vh" />
      </el-col>

      <el-col :span="6" :xs="24">
        <v-app style="height: 85vh">

          <div style="height: 85vh;overflow:auto; max-width: 100%">
            <VenueInfo />
          </div>
        </v-app>

      </el-col>

    </el-row>
  </div>
</template>

<script>
import GMap from '@/views/hotspot/components/GMap'
import VenueInfo from '@/views/hotspot/components/VenueInfo'
export default {
  name: 'ManageHotspot',
  components: { VenueInfo, GMap }
}
</script>

<style scoped>
body, html,.app-container {
  overflow: hidden
}
</style>
