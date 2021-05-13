<template>
  <unified-margin-padding-slot>

    <v-card>
      <v-card-title>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Search"
          single-line
          hide-details
        />
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="desserts"
        :search="search"
      />
    </v-card>
  </unified-margin-padding-slot>
</template>

<script>
import UnifiedMarginPaddingSlot from '@/components/slots/unified_margin_padding_slot'
const Mock = require('mockjs')

export default {
  name: 'DashboardTable',
  components: { UnifiedMarginPaddingSlot },
  data() {
    return {
      search: '',
      headers: [
        {
          text: 'UserName',
          align: 'start',
          filterable: false,
          value: 'name'
        },
        { text: 'CheckIn Venue', value: 'CheckInVenues' },
        { text: 'Address', value: 'Address' },
        { text: 'CheckIn Time', value: 'CheckInTime' },
        { text: 'CheckIn ID', value: 'CheckInID' },
        { text: 'In Hotspot ?', value: 'is_hot_sport' }
      ],
      desserts: [
      ]
    }
  },
  computed: {
  },
  mounted() {
    let id = 1
    for (let i = 0; i < 20; i++) {
      const data = Mock.mock({

        // name: 'KitKat',
        // CheckInVenues: 518,
        // Address: 26.0,
        // CheckInTime: 65,
        // CheckInID: 7,
        // is_hot_sport: '6%'
        // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
        'list|1': [{
          // 属性 id 是一个自增数，起始值为 1，每次增 1
          'name': Mock.Random.name(),
          'CheckInVenues': Mock.Random.domain(),
          'Address': '@word(5)',
          'CheckInTime': Mock.Random.date('dd-MM-yyyy'),
          'CheckInID': id,
          'is_hot_sport|1-2': true
        }]
      })
      id++

      this.desserts.push(data.list)
    }
  }
}
</script>

<style scoped>

</style>
