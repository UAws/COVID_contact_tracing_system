<template>
  <v-container fluid style="padding: 0">
    <Slider />
    <v-container>
      <Header />
      <v-row>
        <EnterCheckInCode />
      </v-row>
    </v-main>
    <v-row>
      <EnterCheckInCode />
    </v-row>
    <v-row>
      <GMap propmapheight="40rem" />
    </v-row>
    <v-row>
      <CovidinfoPage propmapheight="40rem" />
    </v-row>
    <v-row>
      <Footer />
    </v-row>

    </v-container>
  </v-container>

</template>

<script>
import Header from '@/components/Header'
import Slider from '@/components/Slider'
import GMap from '@/components/GMap'
import Footer from '@/components/Footer'
import EnterCheckInCode from '@/components/EnterCheckInCode'
import CovidinfoPage from '@/components/CovidinfoPage'
export default {
  name: 'Index',
  components: { EnterCheckInCode, Slider, Footer, GMap, Header, CovidinfoPage },
  data: () => ({
    intro_text: {
      fontSize: '38px',
      lineHeight: '1.2em',
      textAlign: 'center',
      fontWeight: 'bold'
      // font-size: "38px",
      // line-height:1.2em,
      // text-align:center"
    }
  })
}
</script>

<style scoped>
.m_background {
  background: rgb(15,61,137);
}
</style>
