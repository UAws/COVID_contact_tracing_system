<template>
  <v-container fluid>
    <Header />
    <v-row>
      <v-col
        cols="12"
        xl="8"
        lg="8"
        class="d-none d-sm-none d-md-none d-lg-flex"
      >
        <v-img
          class="mx-auto white--text align-end"
          src="https://cdn.jsdelivr.net/gh/UAws/COVID_contact_tracing_system/frontend/src/assets/login.png"
          height="90vh"
          style="margin-top: 5vh"
        />
      </v-col>

      <v-col cols="0" xl="4" lg="4" md="4" class="login">
        <SignupComponent />

      </v-col>
    </v-row>

  </v-container>
</template>

<script>
import Header from '@/components/Header'
import SignupComponent from '@/components/Auth/SignupComponent'
export default {
  name: 'Signup',
  components: { SignupComponent, Header }
}
</script>

<style scoped>
.login {
  padding-top: 15vh;
}
</style>
