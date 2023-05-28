<script setup>
import {reactive, ref} from "vue";
import router from "@/router"
import request from "@/utils/request";
  const getUrl = (name) => {
    return new URL(`../../assets/${name}`, import.meta.url).href
  }
  const imgs = ref([
    getUrl('3331.webp'),
    getUrl('11.webp'),
  ])

  const name = ref('')
  const state = reactive({
    hots: [],
    dynamics: [],
    news: []
  })

const pageNum = ref(1)
const pageSize = ref(5)
const total = ref(0)
const load = () => {
  request.get('/dynamic/page', {
    params: {
      name: name.value,
      pageNum: pageNum.value,
      pageSize: pageSize.value
    }
  }).then(res => {
    state.dynamics = res.data.records
    total.value = res.data.total
  })

  request.get('/dynamic/hot').then(res => {
    state.hots = res.data
  })
  request.get('/news').then(res => {
    state.news = res.data
  })
}
load()  // 调用 load方法拿到后台数据

const refreshNews = () => {
    // 刷新新闻
  request.get('/news').then(res => {
    state.news = res.data
  })
}
</script>

<template>
  <div>
    <div style="display: flex">
      <div style="width: 70%">
        <el-carousel :interval="5000" arrow="always" height="400px">
          <el-carousel-item v-for="item in imgs" :key="item" >
            <img :src="item" alt="" style="width: 100%; height: 100%">
          </el-carousel-item>
        </el-carousel>
      </div>
      <div style="width: 30%;  margin-left: 10px">
        <el-card style="max-height: 400px;">
          <div style="padding-bottom: 10px; border-bottom: 1px solid #ccc; font-size: 20px; font-weight: bold; color: orangered">热门动态</div>
          <div v-for="(item, index) in state.hots" :key="item.id" style="margin: 10px 0; display: flex; cursor: pointer"  @click="router.push('/front/detail?id=' + item.id)">
            <div class="overflowShow" style="flex: 1;"><span style="color: goldenrod">{{ index + 1 }}</span><span style="margin-left: 10px">{{ item.name }}</span></div>
            <div style="width: 60px; display: flex; align-items: center"><img src="@/assets/hot.svg" alt="" style="width: 20px;"><span style="color: red"> {{ item.hot }}</span></div>
          </div>

        </el-card>
      </div>
    </div>

    <div style="display: flex; margin: 10px 0;">
      <div style="width: 70%; color: #666">
        <el-card>
          <div v-for="item in state.dynamics" :key="item.id" style="border-bottom: 1px solid #ddd; padding: 20px; cursor: pointer"
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

        <el-card style="margin: 10px 0; background-color: white">
          <el-pagination
              @current-change="load"
              @size-change="load"
              v-model:current-page="pageNum"
              v-model:page-size="pageSize"
              background
              layout="total, prev, pager, next"
              :total="total"
          />
        </el-card>
      </div>

      <div style="width: 30%; margin-left: 10px">
        <el-card>
          <div style="padding-bottom: 10px; border-bottom: 1px solid #ccc; ">
            <span style="font-size: 20px; font-weight: bold; color: orange">校园资讯</span>
            <span style="float: right; top: 5px; font-size: 14px; color: #888" class="refresh" @click="refreshNews"><el-icon style="top: 2px"><Refresh /></el-icon> 换一换</span>
          </div>
          <div v-for="(item, index) in state.news" :key="item.id" style="margin: 10px 0">
            <div style="cursor: pointer" class="overflowShow" @click="router.push('/front/news?id=' + item.id)"><span style="margin-left: 10px">{{ item.name }}</span></div>
          </div>
        </el-card>
      </div>
    </div>


    
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