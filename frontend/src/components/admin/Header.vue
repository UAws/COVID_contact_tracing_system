<template>
  <unified-margin-padding-slot>
    <v-row>
      <v-col cols="9">
        <v-text-field
          v-model="name"
          label="Search"
          outlined
          required
        />
      </v-col>

      <v-col cols="3">
        <div>
          <v-btn
            color="success"
            class="v-size--x-large "
            style="margin-left: 2px"
            large
          >
            Search
          </v-btn>
          <v-icon>mdi-information</v-icon>
          <v-icon>mdi-code-not-equal</v-icon>
        </div>

      </v-col>
    </v-row>
  </unified-margin-padding-slot>
</template>

<script>

import UnifiedMarginPaddingSlot from '@/components/slots/unified_margin_padding_slot'

export default {
  name: 'Header',
  components: { UnifiedMarginPaddingSlot },
  data() {
    return {
      name: '',
      nameRules: []
    }
  }
}
</script>

<style scoped>

</style>
