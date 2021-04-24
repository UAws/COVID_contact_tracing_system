<template>
  <v-carousel
    height="100vh"
    hide-delimiter-background
    show-arrows-on-hover
    cycle
  >

    <v-carousel-item
      :src="require('../assets/main-pic.webp')"
      href="https://www.apple.com"
      target="_blank"
      @click.stop
    >
      <v-row
        class="fill-height"
        align="center"
        justify="center"
      >
        <div class="display-3">
          Coronavirus(COVID-19) Tracing Application For Your Safety and Health
        </div>
      </v-row>
    </v-carousel-item>

    <v-carousel-item
      :src="require('../assets/main-pic.webp')"
      href="https://www.apple.com"
      target="_blank"
    >
      <v-row
        class="fill-height"
        align="center"
        justify="center"
      >
        <div class="display-3">
          apple
        </div>
      </v-row>
    </v-carousel-item>
    <v-carousel-item
      :src="require('../assets/main-pic.webp')"
      href="https://www.apple.com"
      target="_blank"
    >
      <v-row
        class="fill-height"
        align="center"
        justify="center"
      >
        <div class="display-3">
          banana
        </div>
      </v-row>
    </v-carousel-item>
    <v-carousel-item
      :src="require('../assets/main-pic.webp')"
    >
      <v-row
        class="fill-height"
        align="center"
        justify="center"
      >
        <div class="display-3">
          grape
        </div>
      </v-row>
    </v-carousel-item>
    <v-carousel-item
      :src="require('../assets/main-pic.webp')"
    >
      <v-row
        class="fill-height"
        align="center"
        justify="center"
      >
        <div class="display-3">
          flower
        </div>
      </v-row>
    </v-carousel-item>
    <v-carousel-item
      :src="require('../assets/main-pic.webp')"
    >
      <v-row
        class="fill-height"
        align="center"
        justify="center"
      >
        <div class="display-3">
          baba
        </div>
      </v-row>
    </v-carousel-item>
  </v-carousel>
</template>

<script>
export default {
  data() {
    return {

    }
  }
}
</script>
