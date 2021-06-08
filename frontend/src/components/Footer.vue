<template>
  <v-footer
    color="rgb(16,37,53)"
    padless
    class="mx-auto"
  >
    <v-container class="text-left" fluid style="padding: 0">
      <p>
        " "
        " "
      </p>
      <v-row
        justify="center"
        no-gutters
        class="rgb(16,37,53) py-4 white--text"
      >
        <v-col sm="6">
          <h4 class="text-uppercase mb-4 font-weight-bold">Contact Us</h4>
          <p>email: tracing@gmail.com</p>
          <p>call us: 800-000-0000</p>
          <div class="x-pad">
            <share-it :targets="['twitter', 'facebook']" />
          </div>
        </v-col>
        <v-col sm="4">
          <h4 class="text-uppercase mb-4 font-weight-bold">Where to go for help</h4>
          <p>Emergencies: 000</p>
          <p>Poisons Information Centre: 13 11 26</p>
          <p>Coronavirus Health Information Line: 1800 020 080</p>
        </v-col>
      </v-row>
    </v-container>
    <div
      class="rgb(16,37,53) py-4 text-center white--text"
    >
      <v-card-text class="white--text pt-0">
        Our company provides a kind of platform about COVID-19 public registry that uses smartphone location data to send real-time notifications and alerts of infections in your vicinity. Join us and combine with extensive data analysis which help organizations make better informed decisions, several new avenues are opened for containing and treating the virus.
      </v-card-text>
      <div class="footer-copyright text-center py-3">
        <v-container fluid>
          &copy; 2020 Copyright: <a href="https://www.ipaustralia.gov.au/sites/default/files/ipa-privacy-policy.pdf">IP Australia Privacy Policy </a>
        </v-container>
      </div>
    </div>
  </v-footer>
</template>
<script>

export default {
  name: 'Footer'
}
</script>
<style scoped>

</style>
