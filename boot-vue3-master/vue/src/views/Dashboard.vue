<script setup>
import * as echarts from 'echarts'
import {onMounted, reactive} from "vue";
import request from "@/utils/request";

const state = reactive({
  bizNums: {}
})

onMounted(() => {
  let option = {
    title: {
      text: "用户动态发布数量趋势图",
    },
    legend: {
      top: '5%',
      left: 'center'
    },
    xAxis: {
      type: 'category',
      data: []
    },
    yAxis: {
      type: 'value'
    },
    grid: {
      top: '20%',
      height: '60%'
    },
    series: [
      {
        data: [],
        type: 'bar',
        smooth: true
      },
      {
        data: [],
        type: 'line',
        smooth: true
      }
    ]
  }
  let pieOption = {
    title: {
      text: "用户动态数量按标签统计图",
    },
    tooltip: {
      trigger: 'item'
    },
    legend: {
      top: '10%',
      left: 'center'
    },
    series: [
      {
        type: 'pie',
        radius: ['40%', '60%'],
        center: ['50%', '55%'],
        avoidLabelOverlap: false,
        label: {
          show: true,
        },
        data: []
      }
    ]
  }
  let myChart = echarts.init(document.getElementById("main"))
  let pieChart = echarts.init(document.getElementById("pie"))

  request.get('/bizNums').then(res => {
    state.bizNums = res.data
  })

  request.get('/echarts/dynamicCount').then(res => {
    option.xAxis.data = res.data.map(v => v.name)
    option.series[0].data = res.data.map(v => v.value)
    option.series[1].data = res.data.map(v => v.value)
    // 绘制图表
    myChart.setOption(option)
  })
  request.get('/echarts/dynamicTag').then(res => {
    pieOption.series[0].data = res.data
    pieChart.setOption(pieOption)
  })
})
</script>

<template>
  <div>
    <div>
      <el-row :gutter="10">
        <el-col :span="6">
          <el-card style="height: 100px;">
            <div style="color: #888">用户数量</div>
            <div style="font-size: 24px; font-weight: bold; text-align: center">{{ state.bizNums.user }}</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card style="height: 100px;">
            <div style="color: #888">商品数量</div>
            <div style="font-size: 24px; font-weight: bold; text-align: center">{{ state.bizNums.goods }}</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card style="height: 100px;">
            <div style="color: #888">订单数量</div>
            <div style="font-size: 24px; font-weight: bold; text-align: center">{{ state.bizNums.orders }}</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card style="height: 100px;">
            <div style="color: #888">动态数量</div>
            <div style="font-size: 24px; font-weight: bold; text-align: center">{{ state.bizNums.dynamic }}</div>
          </el-card>
        </el-col>
      </el-row>
    </div>

    <div style="margin: 20px 0">
      <el-row :gutter="10">
        <el-col :span="12">
          <div style="width:100%; height: 500px" id="main"></div>
        </el-col>

        <el-col :span="12">
          <div style="width:100%; height: 500px" id="pie"></div>
        </el-col>
      </el-row>
    </div>


  </div>
</template>
