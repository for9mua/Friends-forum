<script setup>
import {reactive, ref} from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {useUserStore} from "@/stores/user";

const userStore = useUserStore()
const user = userStore.getUser

const state = reactive({
  form: {}
})
state.form.uid = user.uid
const save = () => {
  if (state.form.newPassword !== state.form.confirmPassword) {
    ElMessage.warning('两次输入的新密码不一致')
    return
  }
  if (state.form.newPassword === state.form.password) {
    ElMessage.warning('新旧密码不能一致')
    return
  }
  request.post("/password/change", state.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('修改密码成功')
      userStore.logout()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const rules = reactive({
  password: [
    { required: true, message: '请输入原密码', trigger: 'blur' },
  ],
  newPassword: [
    { required: true, message: '请输入新密码', trigger: 'blur' },
  ],
  confirmPassword: [
    { required: true, message: '请确认新密码', trigger: 'blur' },
  ],
})
const ruleFormRef = ref()
</script>

<template>
  <div>
    <el-card style="width: 40%; margin: 10px auto">
      <el-form style="width: 80%; margin: 0 auto" label-width="110px" :model="state.form" :rules="rules" ref="ruleFormRef">
        <el-form-item label="请输入原密码" prop="password">
          <el-input show-password v-model="state.form.password"></el-input>
        </el-form-item>
        <el-form-item label="请输入新密码" prop="newPassword">
          <el-input show-password v-model="state.form.newPassword"></el-input>
        </el-form-item>
        <el-form-item label="请确认新密码" prop="confirmPassword">
          <el-input show-password v-model="state.form.confirmPassword"></el-input>
        </el-form-item>
      </el-form>
      <div style="text-align: center; width: 100%">
        <el-button type="primary" @click="save">保存</el-button>
      </div>
    </el-card>
  </div>
</template>



