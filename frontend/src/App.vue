<template>
  <v-app :style="m_background">
    <router-view />
  </v-app>
</template>

<script>
// import HelloWorld from './components/HelloWorld'

export default {
  name: 'App',

  // components: {
  //   HelloWorld
  // },

  data: () => ({
    m_background: {
      background: 'rgb(0, 38, 77)'
    }
    //
  })
}
</script>
