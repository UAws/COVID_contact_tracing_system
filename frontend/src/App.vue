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
      background: '#0f3d89'
    }
    //
  })
}
</script>
