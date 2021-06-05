<template>
  <v-row>
    <v-col cols="12">
      <v-sheet
        :class="[computedMargin]"
        rounded
      >
        <div
          :class="[computedPadding]"
          style="max-width: 100%;"
        >
          <div id="container">
            <slot />
          </div>
        </div>
      </v-sheet>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: 'UnifiedMarginPaddingSlot',
  data() {
    // padding and margin
    // https://vuetifyjs.com/en/styles/spacing/#how-it-works
    const spacers = Array.from({ length: 17 }, (val, i) => `${i}`)
    const nspacers = Array.from({ length: 16 }, (val, i) => `n${i + 1}`)
    const defaults = ['auto', ...spacers]

    return {
      directions: ['t', 'b', 'l', 'r', 's', 'e', 'x', 'y', 'a'],
      marginDirection: 'a',
      marginSize: '2',
      marginSizes: [...defaults, ...nspacers],
      paddingDirection: 'a',
      paddingSize: '6',
      paddingSizes: defaults
    }
  },
  computed: {
    computedPadding() {
      return `p${this.paddingDirection}-${this.paddingSize}`
    },
    computedMargin() {
      return `m${this.marginDirection}-${this.marginSize}`
    }
  }
}
</script>

<style scoped>

</style>
