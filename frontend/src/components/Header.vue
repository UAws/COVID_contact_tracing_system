<template>
  <v-app-bar
    app
    color="rgb(16, 37, 53)"
  >
  <v-col
      cols="12"
      sm="4"
    >
    <v-hover
        v-slot="{ hover }"
        disabled
      >
        <v-card
          :elevation="hover ? 12 : 2"
          class="mx-auto"
          height="280"
          max-width="160"
          color="rgb(16, 37, 53)"
        >
        <v-img
        class="mx-2"
        src="../assets/logo_uni.png"
        height="400px"
        contain
        >
        <div class="d-flex align-center">
      </div>
        </v-img>
        </v-card>
      </v-hover>
  </v-col>
  <v-tabs
    fixed-tabs
    background-color="rgb(16, 37, 53)"
    dark
  >
    <v-tab>
      HOME
    </v-tab>
    <v-tab>
      MAP
    </v-tab>
    <v-tab>
      HOTSPOT
    </v-tab>
    <v-tab>
      CONTACT
    </v-tab>
  </v-tabs>
    <v-spacer></v-spacer>
    <div class="mx-5">
    <v-btn color="white">
      <span class="black--text">Log in</span>
    </v-btn>
    </div>
    <v-btn color="#0288D1">
      Sign up
    </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  name: 'Header'
}
</script>

<style scoped>

</style>
