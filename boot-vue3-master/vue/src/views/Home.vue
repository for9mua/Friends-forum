<script setup>
import {reactive} from "vue";
import request from "@/utils/request";

const state = reactive({
  notice: []
})

const load = () => {
  request.get("/notice").then(res => {
    state.notice = res.data
  })
}
load()
</script>

<template>
  <div>
    <el-row :gutter="10">
      <el-col :span="12">
        <el-card shadow="hover">
          <template #header>
            <div>
              <span>青戈后台管理系统</span>
            </div>
          </template>
          <div>
            <div style="margin: 10px 0">
              基于目前毕业生到处找各种开源框架但是依然很难找到自己满意的、简单的、实用的、好上手的框架的困境，
              我在2023年年初推出了这款自带权限框架的后台管理系统框架，目的是希望大家拿到这个框架后能快速完成自己的毕设开发，
              做一些非常实用的前后端分离的项目，也是为了打破目前高校普遍SSM、JSP等传统教学模式的尴尬境地，带大家上手最新的企业主流的技术框架。
            </div>

            <div  style="margin: 10px 0">
              这款框架配备了完整的视频讲解和操作笔记，如果大家需要的话可以加入我的知识星球
              <a href="https://t.zsxq.com/09I8WRjwt">青戈技术小栈</a> 来跟我一起学习。
              加入星球后可以学习这款框架遇到的任何问题，都可以在专属微信群里一起讨论，帮你解除困惑。
            </div>
            <div style="font-weight: bold">当前最新版本:  <b style="color: dodgerblue">v2.0</b></div>
          </div>
        </el-card>
      </el-col>

      <el-col :span="12">
        <el-card shadow="hover">
          <template #header>
            <div>
              <span>技术栈</span>
            </div>
          </template>
          <div style="display: flex">
            <div style="flex: 1; padding: 0 20px; line-height: 30px">
              <h3 style="font-weight: bold">后端</h3>
              <div>SpringBoot2</div>
              <div>Mybatis-Plus</div>
              <div>Sa-Token</div>
              <div>JWT</div>
              <div>Mysql</div>
              <div>...</div>
            </div>
            <div style="flex: 1; padding: 0 20px;  line-height: 30px">
              <h3 style="font-weight: bold">前端</h3>
              <div>Vue3</div>
              <div>Pinia</div>
              <div>Element-Plus</div>
              <div>Axios</div>
              <div>WangEditor</div>
              <div>...</div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-divider />

    <div>
      <el-card style="width: 50%;  margin: 10px 0">
        <template #header>
          <div>
            <span>公告列表</span>
          </div>
        </template>
        <el-collapse accordion>
          <el-collapse-item v-for="(item,index) in state.notice" :key="item.id" :name="'' + index">
            <template #title>
              <span style="font-size: 20px;">{{ item.name }}</span>
              <span style="margin-left: 10px">{{ item.createTime }}</span>
            </template>
            <div v-html="item.content"></div>
          </el-collapse-item>
        </el-collapse>
      </el-card>
    </div>
  </div>
</template>