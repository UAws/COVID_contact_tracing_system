<template>
  <div :class="className" :style="{height:height,width:width}" />
</template>

<script>
import echarts from 'echarts'
require('echarts/theme/macarons') // echarts theme
import resize from './mixins/resize'

const animationDuration = 6000

export default {
  mixins: [resize],
  props: {
    className: {
      type: String,
      default: 'chart'
    },
    width: {
      type: String,
      default: '100%'
    },
    height: {
      type: String,
      default: '300px'
    }
  },
  data() {
    return {
      chart: null
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart()
    })
  },
  beforeDestroy() {
    if (!this.chart) {
      return
    }
    this.chart.dispose()
    this.chart = null
  },
  methods: {
    initChart() {
      this.chart = echarts.init(this.$el, 'macarons')

      this.chart.setOption({
        tooltip: {
          trigger: 'axis',
          axisPointer: { // 坐标轴指示器，坐标轴触发有效
            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        grid: {
          top: 10,
          left: '2%',
          right: '2%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: [{
          type: 'category',
          data: ['SEP', 'OCT', 'NOV', 'DEC', 'JAN', 'FEB', 'MAR'],
          axisTick: {
            alignWithLabel: true
          }
        }],
        yAxis: [{
          type: 'value',
          axisTick: {
            show: false
          }
        }],
        series: [{
          name: 'Victoria',
          type: 'bar',
          stack: 'vistors',
          barWidth: '60%',
          data: [79, 52, 67, 40, 33, 20, 11],
          animationDuration
        }, {
          name: 'NSW',
          type: 'bar',
          stack: 'vistors',
          barWidth: '60%',
          data: [80, 66, 77, 54, 40, 33, 19],
          animationDuration
        }, {
          name: 'SA',
          type: 'bar',
          stack: 'vistors',
          barWidth: '60%',
          data: [30, 33, 28, 26, 20, 18, 7],
          animationDuration
        }]
      })
    }
  }
}
</script>
