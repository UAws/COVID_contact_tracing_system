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
          <div
            v-for="x in n"
            id="content_div"
            :key="x"
            style="padding-bottom: 20px"
          >
            <v-card
              class="mx-auto"
              max-width="100%"
            >
              <v-img
                class="white--text align-end"
                height="200px"
                src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
              >
                <v-card-title>Top {{ x }} Australian beaches</v-card-title>
              </v-img>

              <v-card-subtitle class="pb-0">
                Number 10
              </v-card-subtitle>

              <v-card-text class="text--primary">
                <div>Whitehaven Beach</div>

                <div>Whitsunday Island, Whitsunday Islands</div>
              </v-card-text>

              <v-card-actions>
                <v-btn
                  color="orange"
                  text
                >
                  Share
                </v-btn>

                <v-btn
                  color="orange"
                  text
                >
                  Explore
                </v-btn>
              </v-card-actions>
            </v-card>
          </div>
        </div>

      </v-sheet>

    </v-col>
  </v-row>

</template>

<script>

export default {
  name: 'HotSpotList',
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
      paddingSizes: defaults,
      n: 5
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
