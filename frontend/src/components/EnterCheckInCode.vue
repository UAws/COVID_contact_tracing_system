<template>
  <v-row>
    <v-col cols="12">
      <v-sheet
        :class="[computedMargin]"
        rounded
        style="height: 300px"
      >
        <div
          :class="[computedPadding]"
          style="max-width: 100%;"
        >
          <div id="content_div">
            <v-row>
              <v-col cols="3" xs="3" md="3" lg="12" xl="12" />
              <v-col cols="3" xs="3" md="3" lg="12" xl="12" />
              <v-col cols="3" xs="3" md="3" lg="12" xl="12" />
              <v-col cols="3" xs="3" md="3" lg="12" xl="12" />
            </v-row>
            <v-row class="align-self-center text-center">
              <v-col cols="12" sm="12" md="12" xl="2" lg="2"><v-spacer /></v-col>
              <v-col cols="12" sm="12" md="12" xl="7" lg="7">
                <v-text-field
                  v-model="enter_code_text"
                  label="Enter check-in code"
                  outlined
                  clearable
                  :rules="code_rules"
                  class="align-self-center text-center"
                />
              </v-col>
              <v-col
                cols="12"
                sm="12"
                md="12"
                xl="3"
                lg="3"
              >
                <v-btn
                  depressed
                  color="primary"
                  class="v-size--x-large"
                  @click="submit"
                >
                  Submit
                </v-btn>
              </v-col>
            </v-row>

          </div>
        </div>
      </v-sheet>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: 'EnterCheckInCode',
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
      enter_code_text: '',
      code_rules: [
        v => !!v || 'code is required'
      ]
    }
  },
  computed: {
    computedPadding() {
      return `p${this.paddingDirection}-${this.paddingSize}`
    },
    computedMargin() {
      return `m${this.marginDirection}-${this.marginSize}`
    }
  },
  methods: {
    submit: function() {
      if (this.enter_code_text !== '') {
        this.$store.commit('setCheckInCode', this.enter_code_text)
        this.$router.push('/admin/#/login?checkInCode=' + this.enter_code_text)
      }
    }
  }
}
</script>

<style scoped>

</style>
