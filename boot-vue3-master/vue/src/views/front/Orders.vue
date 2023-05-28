<script setup>
import { nextTick, reactive, ref } from "vue";
import request from "@/utils/request";
import {ElMessage} from "element-plus";
import {useUserStore} from "@/stores/user";


const name = ref('')
const pageNum = ref(1)
const pageSize = ref(5)
const total = ref(0)

const userStore = useUserStore()
const token = userStore.getBearerToken
const auths =  userStore.getAuths

const state = reactive({
  tableData: [],
  form: {}
})

state.goodsOptions = []
request.get('/goods').then(res => state.goodsOptions = res.data)

const load = () => {
  request.get('/orders/page', {
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



// 删除
const del = (id) => {
  request.delete('/orders/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}
</script>

<template>
  <div>
    <div>
      <el-input v-model="name" placeholder="请输入订单编号" class="w300" />
      <el-button type="primary" class="ml5" @click="load">
        <el-icon style="vertical-align: middle">
          <Search />
        </el-icon>  <span style="vertical-align: middle"> 搜索 </span>
      </el-button>
      <el-button type="warning" class="ml5" @click="reset">
        <el-icon style="vertical-align: middle">
          <RefreshLeft />
        </el-icon>  <span style="vertical-align: middle"> 重置 </span>
      </el-button>

    </div>


    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe >
      <el-table-column prop="id" label="编号"></el-table-column>
      <el-table-column prop="code" label="订单编号" width="160"></el-table-column>
      <el-table-column label="商品"><template #default="scope"><span v-if="scope.row.goodsId">{{ state.goodsOptions.find(v => v.id === scope.row.goodsId) ? state.goodsOptions.find(v => v.id === scope.row.goodsId).name : '' }}</span></template></el-table-column>
      <el-table-column prop="num" label="数量"></el-table-column>
      <el-table-column prop="time" label="换购时间" width="180"></el-table-column>
      <el-table-column prop="score" label="积分"></el-table-column>
        <el-table-column prop="address" label="地址信息" show-overflow-tooltip></el-table-column>
        <el-table-column label="操作" width="100s">
          <template #default="scope">
            <el-popconfirm title="您确定删除吗？" @confirm="del(scope.row.id)">
              <template #reference>
                <el-button type="danger">删除</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <div style="margin: 20px 0">
      <el-pagination
          @current-change="load"
          @size-change="load"
          v-model:current-page="pageNum"
          v-model:page-size="pageSize"
          background
          :page-sizes="[2, 5, 10, 20]"
          layout="total, prev, pager, next"
          :total="total"
      />
    </div>


  </div>
</template>