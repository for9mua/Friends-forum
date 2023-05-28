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

const valueHtml = ref('')  // 富文本内容

state.userOptions = []
request.get('/user').then(res => state.userOptions = res.data)


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
  request.post('/address/del/batch', idArr).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const load = () => {
  request.get('/address/page', {
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
  name: [
    { required: true, message: '请输入名称', trigger: 'blur' },
  ]
})
const ruleFormRef = ref()

// 新增
const handleAdd = () => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = {}
    valueHtml.value = ''  // 富文本
  })
}

// 保存
const save = () => {
  ruleFormRef.value.validate(valid => {   // valid就是校验的结果
    if (valid) {
      state.form.content = valueHtml.value  // 富文本保存内容
      request.request({
        url: '/address',
        method: state.form.id ? 'put' : 'post',
        data: state.form
      }).then(res => {
        if (res.code === '200') {
          ElMessage.success('保存成功')
          dialogFormVisible.value = false
          load()  // 刷新表格数据
        } else {
          ElMessage.error(res.msg)
        }
      })
    }
  })
}

// 编辑
const handleEdit = (raw) => {
  dialogFormVisible.value = true
  nextTick(() => {
    ruleFormRef.value.resetFields()
    state.form = JSON.parse(JSON.stringify(raw))
    valueHtml.value = raw.content  // 富文本
  })
}

// 删除
const del = (id) => {
  request.delete('/address/' + id).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      load()  // 刷新表格数据
    } else {
      ElMessage.error(res.msg)
    }
  })
}

// 导出接口
const exportData = () => {
  window.open(`http://${config.serverUrl}/address/export`)
}


const handleImportSuccess = () => {
  // 刷新表格
  load()
  ElMessage.success("导入成功")
}

const handleFileUploadSuccess = (res) => {
  state.form.file = res.data
  ElMessage.success('上传成功')
}
const handleImgUploadSuccess = (res) => {
  state.form.img = res.data
  ElMessage.success('上传成功')
}
</script>

<template>
  <div>
    <div>
      <el-input v-model="name" placeholder="请输入名称" class="w300" />
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
      <el-button type="success" @click="handleAdd">
        <el-icon style="vertical-align: middle">
          <Plus />
        </el-icon>  <span style="vertical-align: middle"> 新增 </span>
      </el-button>
    </div>

    <div style="margin: 10px 0">
      <el-table :data="state.tableData" stripe border  @selection-change="handleSelectionChange">
      <el-table-column prop="id" label="编号"></el-table-column>
      <el-table-column prop="address" label="地址"></el-table-column>
      <el-table-column prop="userName" label="收件人名称"></el-table-column>
      <el-table-column label="收件人"><template #default="scope"><span v-if="scope.row.userId">{{ state.userOptions.find(v => v.id === scope.row.userId) ? state.userOptions.find(v => v.id === scope.row.userId).name : '' }}</span></template></el-table-column>
      <el-table-column prop="phone" label="电话"></el-table-column>

        <el-table-column label="操作" width="180">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)">编辑</el-button>
            <el-popconfirm title="您确定删除吗？" @confirm="del(scope.row.id)">
              <template #reference>
                <el-button type="danger">删除</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <div style="margin: 10px 0">
      <el-pagination
          @current-change="load"
          @size-change="load"
          v-model:current-page="pageNum"
          v-model:page-size="pageSize"
          background
          :page-sizes="[2, 5, 10, 20]"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
      />
    </div>

    <el-dialog v-model="dialogFormVisible" title="收货地址信息" width="40%">
      <el-form ref="ruleFormRef" :rules="rules" :model="state.form" label-width="100px" style="padding: 0 20px" status-icon>
        <el-form-item prop="address" label="地址">
          <el-input v-model="state.form.address" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="userName" label="收件人名称">
          <el-input v-model="state.form.userName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="phone" label="电话">
          <el-input v-model="state.form.phone" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button type="primary" @click="save">
          保存
        </el-button>
      </span>
      </template>
    </el-dialog>


  </div>
</template>