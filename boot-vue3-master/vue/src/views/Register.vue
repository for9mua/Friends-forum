<script setup>
import { reactive, ref} from "vue"
import { User, Lock, Message } from '@element-plus/icons-vue'
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import router from "@/router";

  const loginData = reactive({})
  const rules = reactive({
    username: [
      { required: true, message: '请输入账号', trigger: 'blur' },
    ],
    email: [
      { required: true, message: '请输入邮箱', trigger: 'blur' },
    ],
    password: [
      { required: true, message: '请输入密码', trigger: 'blur' },
      { min: 3, max: 20, message: '密码长度在3-20位之间', trigger: 'blur' },
    ],
    confirmPassword: [
      { required: true, message: '请确认密码', trigger: 'blur' },
      { min: 3, max: 20, message: '密码长度在3-20位之间', trigger: 'blur' },
    ],
  })
  const ruleFormRef = ref()
  const login = () => {
    ruleFormRef.value.validate(valid => {
      if (valid) {
        if (loginData.password !== loginData.confirmPassword) {
          ElMessage.warning('两次密码不一致')
        }
        // 发送表单数据给后台
        request.post('/register', loginData).then(res => {
          if (res.code === '200') {
            ElMessage.success('注册成功')
            router.push('/login')
          } else {
            ElMessage.error(res.msg)
          }
        })
      }
    })
  }

</script>

<template>
  <div style="height: 100vh; overflow: hidden; background-color: aliceblue">
    <div style="width: 100%; background-color: rgba(65, 105, 225,.1);padding: 15px 30px; color: dodgerblue; font-size: 20px; position: absolute">校园交友平台</div>
    <div style="display: flex; width: 50%; margin: 120px auto; background-color: white;
      box-shadow: 0 0 10px -2px rgba(65, 105, 225,.5); overflow: hidden; border-radius: 10px">
      <div style="padding:30px">
        <img src="../assets/bg1.png" alt="" style="width: 100%; margin-top: 100px">
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
            <div style="text-align: center; color: dodgerblue; font-size: 30px; font-weight: bold; margin-bottom: 30px">注 册</div>
            <el-form-item prop="username">
              <el-input v-model="loginData.username" placeholder="请输入账号"  :prefix-icon="User" />
            </el-form-item>
            <el-form-item prop="email">
              <el-input v-model="loginData.email" placeholder="请输入邮箱"  :prefix-icon="Message" />
            </el-form-item>
            <el-form-item prop="password">
              <el-input v-model="loginData.password" show-password placeholder="请输入密码" :prefix-icon="Lock" />
            </el-form-item>
            <el-form-item prop="confirmPassword">
              <el-input v-model="loginData.confirmPassword" show-password placeholder="请确认密码" :prefix-icon="Lock" />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" style="width: 100%" @click="login">注 册</el-button>
            </el-form-item>
            <div style="text-align: right"><a style="text-decoration: none; color: dodgerblue" href="/login">已有账号？去登录</a></div>
          </el-form>
        </div>
      </div>
    </div>
  </div>
</template>
