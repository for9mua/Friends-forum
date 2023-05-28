<script setup>
import router from "@/router";
import request from "@/utils/request";
import {onMounted, reactive, ref} from "vue";
import {useUserStore} from "@/stores/user";
const userStore = useUserStore()
const user = userStore.getUser

const id = router.currentRoute.value.query.id // 参数id
const state = reactive({
  news: {},
})

const load = () => {
  request.get('/news/' + id).then(res => {
    state.news = res.data
  })

}
onMounted(() => {
  load()
})
</script>

<template>
  <div>

    <el-card v-if="state.news">   <!--  state.dynamic === null  -->
      <div style="padding-bottom: 15px ;border-bottom: 1px solid #ddd; margin-bottom: 20px">
        <span style="font-weight: bold; font-size: 24px">{{ state.news.name }}</span>
        <el-icon style="top: 3px; margin-left: 10px"><Clock /></el-icon>
        <span style="margin-left: 5px">{{ state.news.time }}</span>

        <el-icon style="top: 3px; margin-left: 10px"><View /></el-icon>
        <span style="margin-left: 5px">{{ state.news.view }}</span>

      </div>

      <div class="editor-content-view" v-html="state.news.content"></div>
    </el-card>
  </div>
</template>