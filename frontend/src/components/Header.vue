<template>
  <v-app-bar
    app
    color="rgb(16, 37, 53)"
    dark
  >
    <div class="d-flex align-center">
      <v-img
        alt="Vuetify Name"
        class="shrink mt-1 hidden-sm-and-down"
        contain
        min-width="100"
        src="../assets/logo_uni.png"
        width="100"
      />
    </div>

    <v-spacer></v-spacer>

    <v-btn
      href="https://github.com/vuetifyjs/vuetify/releases/latest"
      target="_blank"
      text
    >
      <!-- <span class="mr-2">Latest Release</span> -->
      <div id="example-3">
      </div>
      <v-icon>mdi-open-in-new</v-icon>
    </v-btn>

    <div class="mx-5">
    <v-btn color="white">
      <span class="black--text">Log in</span>
    </v-btn>
    </div>
    <!-- <v-spacer></v-spacer> -->
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
