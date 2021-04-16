<template>
  <div>
    <Header></Header>

    <v-main>
      <div class="about">
        <h1>This is an about page</h1>
      </div>
    </v-main>
  </div>

</template>

<script>

import Header from '@/components/Header.vue'

export default {
  name: 'about',
  components: {
    Header
  }
}

</script>
