<template>
  <v-container>
    <Header />
    <v-main>
      <v-row height="200px">
        <v-col cols="6" class="align-self-center text-center" style="color: white">
          <div :style="intro_text">Coronavirus(COVID-19)<br>
          </div>
          <div :style="intro_text">
            Tracing Application<br>
            For Your Safety and Health</div>
        </v-col>
        <v-col cols="6">
          <v-img
            :src="require('../assets/main-pic.webp')"
            class="my-3"
            height="600"
          />

        </v-col>
      </v-row>
    </v-main>
    <v-row height="200px" style="background: white;padding: 100px">
      <v-col cols="10">
        <v-text-field
          v-model="enter_code_text"
          style="padding: 50px 0px 25px 50px"
          outlined
          clearable
        />
      </v-col>
      <v-col cols="2">
        <v-btn
          depressed
          style="padding: 25px;margin-top: 50px"
          color="primary"
        >
          Submit
        </v-btn>
      </v-col>

    </v-row>
    <v-row>
      <GMap />
    </v-row>

  </v-container>
</template>

<script>
import Header from '@/components/Header'
import GMap from '@/components/GMap'
export default {
  name: 'Index',
  components: { GMap, Header },
  data: () => ({
    intro_text: {
      fontSize: '38px',
      lineHeight: '1.2em',
      textAlign: 'center',
      fontWeight: 'bold'
      // font-size: "38px",
      // line-height:1.2em,
      // text-align:center"
    },
    enter_code_text: 'Enter check-in code'
  })
}
</script>

<style scoped>
.m_background {
  background: rgb(15,61,137);
}
</style>
