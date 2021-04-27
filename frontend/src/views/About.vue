<template>
  <v-container fluid>
    <Header />
    <v-img
      src="../assets/About.png"
      max-height="400px"
      contain
    />
    <v-row style="padding-top: 2vh">
      <v-col cols="12" sm="8" lg="8">
        <v-card
          class="mx-auto"
          min-width="300px"
        >
          <v-img
            class="mx-auto"
            :aspect-ratio="16/9"
            src="../assets/About1.jpg"
            height="300px"
          />
        </v-card>
      </v-col>
      <v-col cols="12" sm="4" lg="4">
        <v-card
          class="mx-auto"
          height="300px"
        >
          <v-card-title>
            <h3>Business resources</h3>
          </v-card-title>
          <v-spacer />
          <v-card-subtitle class="text--primary">
            <p>We all need to continue to work together to make sure our workplaces are safe. Businesses have an important role to play in encouraging the take-up of vaccines and making it easy for workers to get vaccinated.</p>
            <p>For more information see Safe Work Australia, Fair Work Ombudsman and Office of the Australian Information Commissioner resources below.</p>
          </v-card-subtitle>
        </v-card>
      </v-col>
    </v-row>
    <v-row style="padding-top: 2vh">
      <v-col cols="12" sm="4" lg="4">
        <v-card
          class="mx-auto"
          height="550px"
        >
          <v-card-title>
            <h3>Safe Work Australia and Fair Work Ombudsman resources</h3>
          </v-card-title>
          <v-spacer />
          <v-card-subtitle class="text--primary">
            <p>Safe Work Australia has information and resources for employers, small businesses and workers on the COVID-19 vaccines and how to manage risks from COVID-19 in the workplace.</p>
            <v-container fluid>
              <a href="https://www.safeworkaustralia.gov.au/covid-19-information-workplaces">For more COVID-19 work health and safety information, please visit the Safe Work Australia website</a>
            </v-container>
            <p>The Fair Work Ombudsman (FWO) provides information on the workplace laws, obligations and entitlements for employers and employees affected by coronavirus (COVID-19). With the recent approval of the first COVID-19 vaccine by the Therapeutic Goods Administration, the FWO has updated, and will continue to expand, information on this subject</p>
            <v-container fluid>
              <a href="https://coronavirus.fairwork.gov.au/coronavirus-and-australian-workplace-laws/health-and-safety-in-the-workplace-during-coronavirus/covid-19-vaccinations-and-the-workplace">Find out more at the Fair Work Ombudsman website</a>
            </v-container>
          </v-card-subtitle>
        </v-card>
      </v-col>
      <v-col cols="12" sm="8" lg="8">
        <v-card
          class="mx-auto"
        >
          <v-img
            class="mx-auto"
            :aspect-ratio="16/9"
            src="../assets/About3.jpg"
            height="550px"
          />
        </v-card>
      </v-col>
    </v-row>
    <Footer />
  </v-container>
</template>

<script>

import Header from '@/components/Header.vue'
import Footer from '@/components/Footer'

export default {
  name: 'About',
  components: {
    Header,
    Footer
  }
}
</script>
<style scoped>

</style>
