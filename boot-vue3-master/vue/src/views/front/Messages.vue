<script setup>
import {defineEmits, reactive, ref} from "vue";
import {ElMessage} from "element-plus";
import request from "@/utils/request";
import {useUserStore} from "@/stores/user";
const name = ref('')
const pageNum = ref(1)
const pageSize = ref(5)
const total = ref(0)

const userStore = useUserStore()
const token = userStore.getBearerToken
const auths =  userStore.getAuths

const state = reactive({
  tableData: []
})
const multipleSelection = ref([])

// 批量删除
const handleSelectionChange = (val) => {
  multipleSelection.value = val
}

const confirmDelBatch = () => {
  if (!multipleSelection.value || !multipleSelection.value.length) {
    ElMessage.warning("请选择数据")
    return
  }
  const idArr = multipleSelection.value.map(v => v.id)
  request.post('/messages/del/batch', idArr).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}
let $myEmit = defineEmits(['getUnread'])
const load = () => {
  request.get('/messages/page', {
    params: {
      name: name.value,
      pageNum: pageNum.value,
      pageSize: pageSize.value
    }
  }).then(res => {
    state.tableData = res.data.records
    total.value = res.data.total
    $myEmit('getUnread')  // 发送从新获取未读消息 并更新数字的指令
  })
}
load()  // 调用 load方法拿到后台数据

request.put('/messages/read')  // 发起请求


</script>

<template>
  <el-card>
    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe :show-header="false">

        <el-table-column label="内容">
          <template #default="scope">
            <div v-html="scope.row.content"></div>
          </template>
        </el-table-column>
        <el-table-column prop="time" label="通知时间"></el-table-column>
      </el-table>
    </div>

    <div style="margin: 20px 0">
      <el-pagination
          @current-change="load"
          @size-change="load"
          v-model:current-page="pageNum"
          v-model:page-size="pageSize"
          background
          :page-sizes="[5, 10, 20]"
          layout="total, prev, pager, next"
          :total="total"
      />
    </div>
  </el-card>
</template>