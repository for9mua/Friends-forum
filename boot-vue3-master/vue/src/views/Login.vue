<script setup>
import {onMounted, reactive, ref} from "vue"
import {User, Lock} from '@element-plus/icons-vue'
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {useUserStore} from "@/stores/user";
import router, {setRoutes} from "@/router";
import SIdentify from '../components/Sidentify.vue';

// 图形验证码
let identifyCodes = "1234567890"
let identifyCode = ref('')
const failCount = ref(0)
const randomNum = (min, max) => {
  return Math.floor(Math.random() * (max - min) + min)
}
const makeCode = (o, l) => {
  for (let i = 0; i < l; i++) {
    identifyCode.value += o[randomNum(0, o.length)];
  }
}
const refreshCode = () => {
  identifyCode.value = "";
  makeCode(identifyCodes, 4);
}
// 生成验证码
onMounted(() => {
  identifyCode.value = "";
  makeCode(identifyCodes, 4);
})

const loginData = reactive({})
const rules = reactive({
  username: [
    {required: true, message: '请输入账号', trigger: 'blur'},
  ],
  password: [
    {required: true, message: '请输入密码', trigger: 'blur'},
    {min: 3, max: 20, message: '密码长度在3-20位之间', trigger: 'blur'},
  ],
})
const ruleFormRef = ref()
const login = () => {
  ruleFormRef.value.validate(valid => {
    if (valid) {
      // 失败3次触发验证码
      if (failCount.value >= 3 && loginData.code !== identifyCode.value) {
        ElMessage.warning('验证码错误')
        return
      }
      // 发送表单数据给后台
      request.post('/login', loginData).then(res => {
        if (res.code === '200') {
          if (res.data.user.role === 'ADMIN') {
            router.push('/') // 后台的首页
          } else {
            router.push('/front') // 前台的首页
          }
          ElMessage.success('登录成功')
          const userStore = useUserStore()
          userStore.setManagerInfo(res.data)
        } else {
          ElMessage.error(res.msg)
          failCount.value ++  // 失败次数加1
        }
      })
    }
  })
}

</script>

<template>
  <div style="height: 100vh; overflow: hidden; background-color: aliceblue">
    <div style="width: 100%; background-color: rgba(65, 105, 225,.1);padding: 15px 30px; color: dodgerblue; font-size: 20px; position: absolute">校园交友平台</div>
    <div style="display: flex; width: 50%; margin: 150px auto; background-color: white;
      box-shadow: 0 0 10px -2px rgba(30, 144, 255,.5); overflow: hidden; border-radius: 10px">
      <div style="padding:30px">
        <img src="../assets/bg2.png" alt="" style="width: 100%; margin-top: 50px">
      </div>
      <div>
        <div style="width: 400px; background-color: white; padding: 30px 40px;">
          <el-form
              ref="ruleFormRef"
              :model="loginData"
              :rules="rules"
              size="large"
              status-icon
          >
            <div style="text-align: center; color: dodgerblue; font-size: 30px; font-weight: bold; margin-bottom: 30px">
              登 录
            </div>
            <el-form-item prop="username">
              <el-input v-model="loginData.username" placeholder="请输入账号" :prefix-icon="User"/>
            </el-form-item>
            <el-form-item prop="password">
              <el-input v-model="loginData.password" show-password placeholder="请输入密码" :prefix-icon="Lock"/>
            </el-form-item>
            <div style="display: flex; margin: 15px 0" v-if="failCount >= 3">
              <div style="flex: 1">
                <el-input v-model="loginData.code" placeholder="验证码"></el-input>
              </div>
              <div>
                <div @click="refreshCode" style="margin-left: 5px">
                  <SIdentify :identifyCode="identifyCode" />
                </div>
              </div>
            </div>
            <el-form-item>
              <el-button type="primary" style="width: 100%" @click="login">登 录</el-button>
            </el-form-item>
          </el-form>
          <div style="text-align: right"><a style="text-decoration: none; color: dodgerblue"
                                            href="/register">还没有账号？去注册</a></div>
        </div>
      </div>
    </div>

  </div>
</template>
