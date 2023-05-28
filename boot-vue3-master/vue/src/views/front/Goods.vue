<script setup>
import { nextTick, reactive, ref } from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {useUserStore} from "@/stores/user";


const name = ref('')
const pageNum = ref(1)
const pageSize = ref(8)
const total = ref(0)

const userStore = useUserStore()
const token = userStore.getBearerToken
const auths =  userStore.getAuths

const state = reactive({
  tableData: [],
  form: {},
  goods: {},
  address: []
})


const load = () => {
  request.get('/goods/page', {
    params: {
      name: name.value,
      pageNum: pageNum.value,
      pageSize: pageSize.value
    }
  }).then(res => {
    state.tableData = res.data.records
    total.value = res.data.total
  })
}
load()  // 调用 load方法拿到后台数据

const reset = () => {
  name.value = ''
  load()
}

const dialogFormVisible = ref(false)

const rules = reactive({
  address: [
    { required: true, message: '请选择收货地址', trigger: 'blur' },
  ]
})
const ruleFormRef = ref()

// 新增
const charge = (row) => {
  dialogFormVisible.value = true
  state.form = {goodsId: row.id, num: 1}
  state.goods = Object.assign({}, row)

  // 获取用户的收货地址
  request.get('/address/user').then(res => {
    state.address = res.data
  })
}

// 保存
const save = () => {
  ruleFormRef.value.validate(valid => {   // valid就是校验的结果
    if (valid) {
      request.request({
        url: '/orders',
        method: state.form.id ? 'put' : 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('换购成功')
          dialogFormVisible.value = false
          load()  // 刷新表格数据
        } else {
          ElMessage.error(res.msg)
        }
      })
    }
  })
}



</script>

<template>
  <div>

    <div>
      <el-row :gutter="10">
        <el-col :span="6" v-for="item in state.tableData" :key="item.id">
          <el-card style="color: #666">
            <div><img :src="item.img" alt="" style="width: 100%; height: 200px"></div>
            <div><span style="font-weight: bold">{{ item.name}}</span></div>
            <div style="margin: 5px 0; display: flex; font-size: 13px">
              <div style="flex: 1">原价：<span style="color: red">￥{{ item.price }}/ {{ item.unit }}</span></div>
              <div style="flex: 1; padding-left: 10px">所需积分：<span style="color: orange">{{ item.score }}</span></div>
            </div>
            <div style="font-size: 13px">库存：<span style="color: #999">{{ item.num }}</span></div>
            <div style="margin: 5px 0; text-align: right">
              <el-button type="primary" size="small" @click="charge(item)" :disabled="item.num <= 0">立即换购</el-button>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </div>

    <div style="margin: 20px 0">
      <el-pagination
          @current-change="load"
          @size-change="load"
          v-model:current-page="pageNum"
          v-model:page-size="pageSize"
          background
          :page-sizes="[4, 8, 12, 16]"
          layout="total, prev, pager, next"
          :total="total"
      />
    </div>

    <el-dialog v-model="dialogFormVisible" title="积分商品信息" width="40%">
      <div style="margin-bottom: 10px">
        您正在换购商品 <span style="color: dodgerblue">{{ state.goods.name }}</span>， 所需积分 <span style="color: red">{{ state.goods.score }}</span>
      </div>
      <el-form ref="ruleFormRef" :rules="rules" :model="state.form" label-width="80px" style="padding: 0 20px" status-icon>
        <el-form-item prop="address" label="收货地址">
          <el-radio-group v-model="state.form.address">
            <el-radio :label="item.userName + ', ' + item.phone + ', ' + item.address + ' ' " v-for="item in state.address" :key="item.id"></el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button type="primary" @click="save">
          确定
        </el-button>
      </span>
      </template>
    </el-dialog>


  </div>
</template>