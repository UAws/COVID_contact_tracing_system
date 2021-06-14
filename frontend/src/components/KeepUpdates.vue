<template>
  <unified-margin-padding-slot>
    <v-row sm="4" lg="4">
      <v-col
        v-for="(slide) in slides"
        :key="slide"
      >
        <v-card
          :href="slide.link"
        >
          <v-img
            class="mx-auto white--text align-end"
            :src="slide.src"
            height="300px"
          >
            <v-card
              class="mx-auto"
              height="50%"
            >
              <v-card-title
                class="text--primary"
              >
                {{ slide.title }}
              </v-card-title>
              <v-card-subtitle
                class="text--secondary"
              >
                {{ slide.subtitle }}
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
  components: { UnifiedMarginPaddingSlot },
  data() {
    return {
      slides: [
        {
          src: 'https://cdn.jsdelivr.net/gh/UAws/COVID_contact_tracing_system/frontend/src/assets/nurse.jpeg',
          link: 'https://www.health.gov.au/ministers/the-hon-greg-hunt-mp/media/first-covid-19-vaccine-pfizer-training-program',
          title: 'Pfizer COVID-19 vaccine training program now available',
          subtitle: 'Training modulus for the COVID-19 vaccination workforce is now available.'
        },
        {
          src: 'https://cdn.jsdelivr.net/gh/UAws/COVID_contact_tracing_system/frontend/src/assets/vaccine.jpeg',
          link: 'https://www.pm.gov.au/media/greater-access-additional-10-million-pfizer-biontech-vaccines',
          title: 'Additional 10 million Pfuzer-BioNTech COVID-19 vaccines',
          subtitle: 'Vaccination program on track to start in late February for people in the first priorty group.'
        },
        {
          src: 'https://cdn.jsdelivr.net/gh/UAws/COVID_contact_tracing_system/frontend/src/assets/doctor.jpeg',
          link: 'https://www.health.gov.au/resources/publications/covid-19-vaccination-community-pharmacy-covid-19-vaccine-rollout-from-phase-2a',
          title: 'Call for EOIs from community pharmacies',
          subtitle: 'Approve s90 community pharmacies are invited to express their interest in delivering COVID-19 vaccines.'
        }
      ]
    }
  }
}
</script>
<style scoped>
</style>
