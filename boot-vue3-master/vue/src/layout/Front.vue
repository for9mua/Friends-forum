<script setup>
import { RouterView } from 'vue-router'
import router from "@/router";
import {useUserStore} from "@/stores/user";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {nextTick, ref} from "vue";
const userStore = useUserStore()
let user = userStore.getUser
const activePath = router.currentRoute.value.path
const name = ref('')  // 在页面加载的时候获取name参数
name.value = router.currentRoute.value.query.name || ''
const childRef = ref()

const logout = () => {
  request.get('/logout/' + user.uid).then(res => {
    if (res.code === '200') {
      userStore.logout()
    } else {
      ElMessage.error(res.msg)
    }
  })
}
const menus = userStore.getMenus

const getAvatarHandler = (avatar) => {
  user.avatar = avatar
}

const search = () => {
  router.replace('/front/dynamicSearch?t=' + new Date().getTime() + '&name=' + name.value)
}

const unread = ref([])
const getUnRead = () => {
  request.get('/messages/unread').then(res => {
    unread.value = res.data
  })
}
getUnRead()

// 定时任务 不断拉去未读消息
// setInterval(() => {
//   getUnRead()
// }, 5000)

const clickRead = () => {
  router.push('/front/messages?t=' + new Date().getTime())
}
</script>

<template>
  <div>
    <!--    头部-->
    <div style="display: flex; height: 60px; line-height: 60px; border-bottom: 1px solid #eee">
      <div style="width: 280px; display: flex; padding-left: 30px">
        <div style="width: 50px">
          <img src="../assets/征婚交友.png" alt="" style="width: 40px; position: relative; top: 10px; right: 0">
        </div>
        <div style="flex: 1; font-size: 20px; color: orangered; font-weight: bold">校园交友平台</div>
      </div>
      <div style="flex: 1; display: flex">
        <el-menu :default-active="activePath" mode="horizontal" router style="border: none; height: 100%; width: 50%">
          <el-menu-item index="/front/home">首页</el-menu-item>
          <el-menu-item index="/front/im">聊天室</el-menu-item>
          <el-menu-item index="/front/goods">积分商城</el-menu-item>
          <el-menu-item index="/front/orders">积分订单</el-menu-item>
        </el-menu>
        <div style="width: 50%">
          <el-input style="width: 300px" placeholder="搜索内容" v-model="name" clearable size="large"></el-input>
          <el-button style="margin-left: 5px" @click="search" size="large">搜索</el-button>
        </div>
      </div>
      <div style="width: 300px; text-align: right; padding-right: 10px">
        <div v-if="!user.id" style="text-align: right; padding-right: 30px">
          <el-button @click="router.push('/login')">登录</el-button>
          <el-button @click="router.push('/register')">注册</el-button>
        </div>
        <div v-else>
          <el-badge class="badge" :value="unread.length" :max="10" style="cursor: pointer" @click="clickRead">
            <el-icon style="color: #666" size="25"><Bell /></el-icon>
          </el-badge>
          <span style="margin-right: 5px; color: steelblue">欢迎您，{{ user.name }}</span>
          <el-dropdown>
            <el-avatar :size="40" :src="user.avatar" style="margin-top: 10px" />
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item><div @click="router.push('/front/dynamic')">我的动态</div></el-dropdown-item>
                <el-dropdown-item><div @click="router.push('/front/collect')">我的收藏</div></el-dropdown-item>
                <el-dropdown-item><div @click="router.push('/front/address')">我的收货地址</div></el-dropdown-item>
                <el-dropdown-item><div @click="router.push('/front/person')">个人信息</div></el-dropdown-item>
                <el-dropdown-item><div @click="router.push('/front/password')">修改密码</div></el-dropdown-item>
                <el-dropdown-item><div @click="logout">退出登录</div></el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </div>
      </div>
    </div>

    <div style="width: 70%; margin: 10px auto;">
      <router-view v-slot="{ Component }">
        <component @getAvatar="getAvatarHandler" @getUnread="getUnRead" ref="childRef" :is="Component" />
      </router-view>
    </div>

  </div>
</template>

<style scoped>
.badge {
  margin-top: 10px;
  margin-right: 40px;
}
:deep(.el-badge__content.is-fixed) {
  top: 10px !important;
}
</style>
