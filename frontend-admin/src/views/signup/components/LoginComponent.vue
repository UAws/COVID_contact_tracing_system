<template>

  <unified-margin-padding-slot>
    <h1 :style="{ paddingBottom : loginPadding }">
      Login
    </h1>

    <h1 v-if="add_check_in_code !== ''" style="padding-bottom: 3vh">
      Check In Code : {{ add_check_in_code }}
    </h1>

    <v-form
      ref="form"
      v-model="valid"
      lazy-validation
    >
      <v-text-field
        v-model="name"
        :counter="30"
        :rules="nameRules"
        label="Email / Username"
        outlined
        required
      />

      <v-text-field
        v-model="password"
        :rules="emailRules"
        label="Password"
        outlined
        required
        type="password"
      />

      <v-checkbox
        v-model="checkbox"
        label="Remember Me"
        required
      />

      <v-row>
        <v-btn
          :disabled="!valid"
          color="success"
          class="mr-4 btn"
          large
          @click="validate"
        >
          Login
        </v-btn>
      </v-row>

      <v-row>
        <v-btn
          color="error"
          class="mr-4 btn"
          large
          @click="reset"
        >
          Cancel
        </v-btn>
      </v-row>

      <v-row>
        <GoogleLogin style="width: 100%" :params="params" :on-success="onSuccess" :on-failure="onFailure">
          <v-btn
            color="primary"
            class="mr-4 btn"
            style="padding-top: 0"
            large
          >
            <v-icon mdi-google />Google Login
          </v-btn>
        </GoogleLogin>

      </v-row>

    <!--    <v-btn-->
    <!--      color="warning"-->
    <!--      @click="resetValidation"-->
    <!--    >-->
    <!--      Reset Validation-->
    <!--    </v-btn>-->
    </v-form>
  </unified-margin-padding-slot>
</template>

<script>
import UnifiedMarginPaddingSlot from './unified_margin_padding_slot'
import GoogleLogin from 'vue-google-login'
export default {
  name: 'LoginComponent',
  components: { UnifiedMarginPaddingSlot, GoogleLogin },
  data: () => ({
    // element-admin
    capsTooltip: false,
    loading: false,
    showDialog: false,
    redirect: undefined,
    otherQuery: {},
    // google Login :
    // client_id is the only required property but you can add several more params, full list down bellow on the Auth api section
    params: {
      client_id: '348864034076-5n1iv6j7heae4oepbf8ecpmld22g6580.apps.googleusercontent.com'
    },
    // only needed if you want to render the button with the google ui
    renderParams: {
      longtitle: true
    },

    // validation :
    valid: false,
    name: 'admin',
    nameRules: [
      v => !!v || 'Name is required',
      v => (v && v.length >= 4) || 'Name must be less than 4 characters'
    ],
    password: '123456',
    emailRules: [
      v => !!v || 'Password is required'
      // v => /.+@.+\..+/.test(v) || 'E-mail must be valid'
    ],
    select: null,
    checkbox: false,
    current_code: ''
  }),
  computed: {
    add_check_in_code() {
      return this.$store.getters.getCheckInCode
    },
    loginPadding() {
      if (this.$store.getters.getCheckInCode !== '') {
        return '2vh'
      } else {
        return '4vh'
      }
    }, loginForm() {
      return {
        username: this.name,
        password: this.password
      }
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        const query = route.query
        if (query) {
          this.redirect = query.redirect
          this.otherQuery = this.getOtherQuery(query)
        }
      },
      immediate: true
    }
  },
  mounted() {
    // if (this.name === '') {
    //   this.$refs.name.focus()
    // } else if (this.password === '') {
    //   this.$refs.password.focus()
    // }
  },
  methods: {
    validate() {
      this.$refs.form.validate()
      if (this.valid) {
        // this.$router.push('/admin/dashboard?checkInCode=' + this.$store.getters.getCheckInCode)
        this.loading = true
        this.$store.dispatch('user/login', this.loginForm)
          .then(() => {
            this.$router.push({ path: this.redirect || '/', query: this.otherQuery })
            this.loading = false
          })
          .catch(() => {
            this.loading = false
          })
      } else {
        console.log('error submit!!')
        return false
      }
    },
    reset() {
      this.$refs.form.reset()
    },
    resetValidation() {
      this.$refs.form.resetValidation()
    },
    onSuccess(googleUser) {
      console.log(googleUser)

      // This only gets the user information: id, name, imageUrl and email
      console.log(googleUser.getBasicProfile())
    },
    onFailure() {
      console.log('login failed')
    },
    getOtherQuery(query) {
      return Object.keys(query).reduce((acc, cur) => {
        if (cur !== 'redirect') {
          acc[cur] = query[cur]
        }
        return acc
      }, {})
    }
  }
}
</script>

<style scoped>
.btn {
  width: 100%;
  margin-top: 3vh;
  padding: 5px;
}

</style>
