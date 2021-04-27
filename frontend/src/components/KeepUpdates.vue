<template>
  <unified-margin-padding-slot>

    <v-row>
      <v-col cols="12" sm="4" lg="4">
        <v-card
          href="https://www.health.gov.au/ministers/the-hon-greg-hunt-mp/media/first-covid-19-vaccine-pfizer-training-program"
        >
          <v-img
            class="mx-auto white--text align-end"
            src="../assets/nurse.jpeg"
            height="300px"
          >
            <v-card
              class="mx-auto"
              height="50%"
            >
              <v-card-title>
                Pfizer COVID-19 vaccine training program now available
              </v-card-title>
              <v-card-subtitle class="text--primary">
                Training modulus for the COVID-19 vaccination workforce is now available.
              </v-card-subtitle>
              <v-btn
                class="ma-2"
                color="rgb(15,61,137)"
                dark
              >Go
              </v-btn>
            </v-card>
          </v-img>
        </v-card>
      </v-col>
      <v-col cols="12" sm="4" lg="4">
        <v-card
          href="https://www.pm.gov.au/media/greater-access-additional-10-million-pfizer-biontech-vaccines"
        >
          <v-img
            class="mx-auto white--text align-end"
            src="../assets/vaccine.jpeg"
            height="300px"
          >
            <v-card
              class="mx-auto"
              height="50%"
            >
              <v-card-title>
                Additional 10 million Pfuzer-BioNTech COVID019 vaccines
              </v-card-title>
              <v-card-subtitle class="text--primary">
                Vaccination program on track to start in late February for people in the first priorty group.
              </v-card-subtitle>
              <v-btn
                class="ma-2"
                color="rgb(15,61,137)"
                dark
              >Go
              </v-btn>
            </v-card>
          </v-img>
        </v-card>
      </v-col>
      <v-col cols="12" sm="4" lg="4">
        <v-card
          href="https://www.health.gov.au/resources/publications/covid-19-vaccination-community-pharmacy-covid-19-vaccine-rollout-from-phase-2a"
        >
          <v-img
            class="mx-auto white--text align-end"
            src="../assets/doctor.jpeg"
            height="300px"
          >
            <v-card
              class="mx-auto"
              height="50%"
            >
              <v-card-title>
                Call for EOIs from community pharmacies
              </v-card-title>
              <v-card-subtitle class="text--primary">
                Approve s90 community pharmacies are invited to express their interest in delivering COVID-19 vaccines.
              </v-card-subtitle>
              <v-btn
                class="ma-2"
                color="rgb(15,61,137)"
                dark
              >Go
              </v-btn>
            </v-card>
          </v-img>
        </v-card>
      </v-col>
    </v-row>
  </unified-margin-padding-slot>

</template>
<script>

import UnifiedMarginPaddingSlot from '@/components/slots/unified_margin_padding_slot'
export default {
  name: 'KeepUpdates',
  components: { UnifiedMarginPaddingSlot }
}
</script>
<style scoped>

</style>

