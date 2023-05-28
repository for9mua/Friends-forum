<script setup>
import {onMounted, reactive, ref} from "vue";
import request from "@/utils/request";
import '@wangeditor/editor/dist/css/style.css' // 引入 css
import router from "@/router";


const pageNum = ref(1)
const pageSize = ref(5)
const total = ref(0)


const state = reactive({
  tableData: [],
})
const dynamicSearch = () => {
  const name = router.currentRoute.value.query.name || ''
  request.get('/dynamic/page', {
    params: {
      name: name,
      pageNum: pageNum.value,
      pageSize: pageSize.value
    }
  }).then(res => {
    state.tableData = res.data.records
    total.value = res.data.total
  })
}

// 页面加载的时候
onMounted(() => {
  dynamicSearch()
})

</script>

<template>
  <div>
    
    <el-card  v-if="state.tableData && state.tableData.length">
      <div v-for="item in state.tableData" :key="item.id" style="border-bottom: 1px solid #ddd; padding: 20px; cursor: pointer"
           @click="router.push('/front/detail?id=' + item.id)">

        <div style="display: flex">
          <div style="width: 50%; display: flex">
            <img v-if="item.user" :src="item.user.avatar" alt="" style="width: 40px; height: 40px; border-radius: 50%">
            <div style="flex: 1; line-height: 40px; margin-left: 10px; " v-if="item.user" >
              <span style="font-weight: bold; font-size: 16px">{{ item.user.name }}</span>
              <span style="margin-left: 10px; font-size: 12px; color: #888">{{ item.time }}</span>
            </div>
          </div>
          <div style="flex: 1;">

          </div>
        </div>

        <div style="margin: 10px 0">
          <div style="color: #000; font-size: 18px; font-weight: bold">{{ item.name }}</div>
        </div>

        <div style="margin: 10px 0">
          <div style="color: #666; font-size: 14px">{{ item.descr }}</div>
        </div>

        <div style="margin: 10px 0">
          <div><img :src="item.img " alt="" style="width: 40%; border-radius: 10px"></div>
        </div>

        <div style="display: flex">
          <div style="width: 50%">
            <el-tag style="margin-right: 10px" v-for="tag in item.tags" :key="tag"># {{ tag }} </el-tag>
          </div>
          <div style="width: 50%; text-align: right; font-size: 16px; color: #888">
                  <span>
                  <el-icon :size="20" style="top: 4px"><View /></el-icon>
                  <span style="margin-left: 3px">{{ item.view }}</span>
                </span>
            <span style="margin-left: 10px">
                  <el-icon :size="20" style="top: 4px"><Star /></el-icon>
                  <span style="margin-left: 3px">{{ item.collectCount }}</span>
                </span>
            <span style="margin-left: 10px">
                  <el-icon :size="20" style="top: 4px"><ChatLineSquare /></el-icon>
                  <span style="margin-left: 3px">{{ item.commentCount }}</span>
                </span>

            <span style="margin-left: 10px">
                  <el-icon :size="20" style="top: 4px"><img style="width: 20px" src="@/assets/点赞.svg" alt=""></el-icon>
                  <span style="margin-left: 3px">{{ item.praiseCount }}</span>
                </span>
          </div>
        </div>

      </div>
    </el-card>
    <el-card style="text-align: center; padding: 100px 0" v-else>
      <img src="@/assets/无数据.png" alt="" style="width: 100px">
      <div style="color: #999">无数据</div>
    </el-card>

    <el-card style="margin: 10px 0; background-color: white" v-if="state.tableData && state.tableData.length">
      <el-pagination
          @current-change="dynamicSearch"
          @size-change="dynamicSearch"
          v-model:current-page="pageNum"
          v-model:page-size="pageSize"
          background
          layout="total, prev, pager, next"
          :total="total"
      />
    </el-card>

  </div>
</template>

<style scoped>
.refresh:hover {
  cursor: pointer;
}
:deep(.el-card__body) {
  padding: 10px !important;
}
</style>