<template>

  <unified-margin-padding-slot>

    <h1 style="padding-bottom: 5vh">
      Signup
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
        label="Username"
        outlined
        required
      />

      <v-text-field
        v-model="email"
        :counter="30"
        :rules="emailRules"
        label="Email"
        outlined
        required
      />

      <v-text-field
        v-model="password"
        :rules="passwordRules"
        label="Password"
        outlined
        required
        type="password"
      />

      <v-text-field
        v-model="rePassword"
        :rules="repasswordRules"
        label="Confirm Password"
        outlined
        required
        type="password"
      />

      <v-select
        v-model="select"
        :items="userLevels"
        :rules="[v => !!v || 'User Level is required']"
        label="User Level"
        required
        outlined
      />

      <v-checkbox
        v-if="select !== userLevels[0] && select !== null"
        v-model="checkbox"
        label="I Understand Further Approval needed"
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
          SIGN UP
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

      <v-row />

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
import UnifiedMarginPaddingSlot from '@/components/slots/unified_margin_padding_slot'
export default {
  name: 'SignupComponent',
  components: { UnifiedMarginPaddingSlot },
  data() {
    return {
      // validation :
      valid: true,
      name: '',
      email: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => (v && v.length >= 4) || 'Name must be less than 4 characters'
      ],
      password: '',
      rePassword: '',
      passwordRules: [
        v => !!v || 'Password is required'
      ],
      emailRules: [
        v => !!v || ' is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid'
      ],
      repasswordRules: [
        (value) => !!value || 'type confirm password',
        (value) =>
          this.password === value || 'The password confirmation does not match.'
      ],
      select: null,
      userLevels: [
        'Regular User',
        'Venue Manager',
        'Health Official',
        'Administrators'
      ],
      checkbox: false
    }
  },

  methods: {
    validate() {
      this.$refs.form.validate()
    },
    reset() {
      this.$refs.form.reset()
    },
    resetValidation() {
      this.$refs.form.resetValidation()
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
