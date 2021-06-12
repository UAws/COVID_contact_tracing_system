<template>
  <v-carousel
    height="85vh"
    hide-delimiter-background
    show-arrows-on-hover
    cycle
  >

    <v-carousel-item
      :src="require('../assets/checkin.jpg')"
      target="_blank"
      @click.stop
    >
      <v-row
        class="fill-height"
        align="center"
        justify="center"
      >
        <v-container style="background-color: rgba(24,36,74,0.3)">
          <div class="display-3 text-center font-weight-bold">
            COVID-19 Tracing Application
          </div>
          <div class="display-1 text-center font-weight-medium">For Your Safety and Health</div>
        </v-container>
      </v-row>
    </v-carousel-item>
    <v-carousel-item
      v-for="(slide) in slides"
      :key="slide"
      :src="slide.src"
      :href="slide.link"
      target="_blank"
    />
  </v-carousel>
</template>

<script>
export default {
  data() {
    return {
      slides: [
        {
          src: require('../assets/covid-19-vaccine.jpg'),
          link: 'https://www.covid-19.sa.gov.au/vaccination?gclid=CjwKCAjw-e2EBhAhEiwAJI5jgwy0UFn5Pa4JvOFVTx1vCHC_ZJ2Xd43QInzKR9F4OUm-68cqaI0-3BoCCQoQAvD_BwE'

        },
        {
          src: require('../assets/COVIDUN-2.png'),
          link: 'https://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/conditions/infectious+diseases/covid-19/testing+and+tracing/covid-19+clinics+and+testing+centres/covid-19+clinics+and+testing+centres'
        }
      ]
    }
  }
}
</script>