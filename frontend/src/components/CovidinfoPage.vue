<template>
  <unified-margin-padding-slot>

    <v-row>
      <v-col cols="12" sm="8" lg="8">
        <v-card
          class="mx-auto"
        >
          <v-img
            flex
            class="mx-auto"
            :aspect-ratio="16/9"
            src="../assets/clinic.jpeg"
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
            <h3>Getting tested for coronavirus</h3>
          </v-card-title>
          <v-spacer />
          <v-card-subtitle class="text--primary">
            If you need to get tested for COVID-19, you have a few different options. Depending on where you live, you may be able to visit a:
            <div>- Pop up testing centre</div>
            <div>- GPs office</div>
            <div>- Respiratory clinic</div>
            <div>- Drive through testing site</div>
            <v-container fluid>
              <a href="https://widget.nhsd.healthdirect.org.au/v1/widget/search?widgetId=2bd9a3ab-54e6-4ddf-a9df-44fef0c2e81b&types=%5Bservices_types%5D%3Aall+services&filters=%5Bprograms%5D%3Acovid+19&delivery=PHYSICAL">Find the testing clinic closest to you </a>
            </v-container>
          </v-card-subtitle>
        </v-card>
      </v-col>
    </v-row>
  </unified-margin-padding-slot>

</template>
<script>

import UnifiedMarginPaddingSlot from '@/components/slots/unified_margin_padding_slot'
export default {
  name: 'CovidinfoPage',
  components: { UnifiedMarginPaddingSlot }
}
</script>
<style scoped>

</style>

