<template>
  <v-container>
    <Header />
    <v-main>
      <v-row height="200px" style="padding-bottom: 1rem">
        <v-col cols="12" xl="4" lg="4" sm="12" class="align-self-center text-center" style="color: white">
          <h3
            class="
            text-h4
            text-md-h2
            text-lg-h3
            text-xl-h3
            text-truncate"
          > Coronavirus(COVID-19)</h3>
          <h4
            class="
            text-h4
            text-md-h3
            text-lg-h4
            text-xl-h4
            text-truncate"
          > Tracing Application<br>
            For Your Safety and Health</h4>
        </v-col>
        <v-col cols="12" xl="8" lg="8" sm="12" class="align-self-center text-center">
          <v-img
            :src="require('../assets/main-pic.webp')"
            class="my-3"
            style="border-radius: 5%"
            max-height="100%"
            max-width="100%"
          />
        </v-col>
      </v-row>
    </v-main>
    <v-row>
      <EnterCheckInCode />
    </v-row>
    <v-row>
      <GMap propmapheight="40rem" />
    </v-row>
    <v-row>
      <Footer />
    </v-row>

  </v-container>
</template>

<script>
import Header from '@/components/Header'
import GMap from '@/components/GMap'
import Footer from '@/components/Footer'
import EnterCheckInCode from '@/components/EnterCheckInCode'
export default {
  name: 'Index',
  components: { EnterCheckInCode, Footer, GMap, Header },
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
