<script setup>
  import router from "@/router";
  import request from "@/utils/request";
  import {onMounted, reactive, ref} from "vue";
  import {ElMessage} from "element-plus";
  import {useUserStore} from "@/stores/user";
  const userStore = useUserStore()
  const user = userStore.getUser

  const id = router.currentRoute.value.query.id // 参数id
  const state = reactive({
    dynamic: {},
    form: {},
    comments: [],
    parent: {}
  })
  const load = () => {
    request.get('/dynamic/' + id).then(res => {
      state.dynamic = res.data
    })

    request.get('/comments/tree?dynamicId=' + id).then(res => {
      state.comments = res.data
    })
  }
  onMounted(() => {
    load()
  })

  const dialogFormVisible = ref(false)
  const handleComment = (row) => {
    dialogFormVisible.value = true
    state.form = {}
    if (row && row.id) {  // row是父节点的数据，如果存在，则为评论
      state.parent = row
    }
  }

  // 发送评论数据给后台
  const save = () => {
    if (state.parent.id) {  // 回复的时候触发
      state.form.pid = state.parent.id
      state.form.puserId = state.parent.user.id  // 传父级评论的用户id
    }
    state.form.dynamicId = state.dynamic.id  // 当前模块的id
    // 发送数据
    request.post('/comments', state.form).then(res => {
      if (res.code === '200') {
        ElMessage.success("评论成功")
        dialogFormVisible.value = false
        load()
        state.parent = {}
      } else {
        ElMessage.error(res.msg)
      }
    })
  }

  const del = (id) => {
    request.delete('/comments/' + id).then(res => {
      if (res.code === '200') {
        ElMessage.success("删除成功")
        load()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }

  const praise = () => {
    request.post('/praise', { fid: id, type: 'dynamic' }).then(res => {
      load()
    })
  }
  const collect = () => {
    request.post('/collect', { dynamicId: id }).then(res => {
      load()
    })
  }

</script>

<template>
  <div>

    <el-card v-if="state.dynamic">   <!--  state.dynamic === null  -->
      <div style="padding-bottom: 15px ;border-bottom: 1px solid #ddd; margin-bottom: 20px">
        <span style="font-weight: bold; font-size: 24px">{{ state.dynamic.name }}</span>
        <el-icon style="top: 3px; margin-left: 10px"><Clock /></el-icon>
        <span style="margin-left: 5px">{{ state.dynamic.time }}</span>

        <el-icon style="top: 3px; margin-left: 10px"><View /></el-icon>
        <span style="margin-left: 5px">{{ state.dynamic.view }}</span>

        <el-icon style="top: 3px; margin-left: 10px"><User /></el-icon>
        <span style="margin-left: 5px; font-size: 14px" v-if="state.dynamic.user">{{ state.dynamic.user.name }}</span>
      </div>

      <div class="editor-content-view" v-html="state.dynamic.content"></div>
    </el-card>

    <el-card style="margin: 10px 0">
      <div style="display: flex; align-items: center">
        <el-input style="flex: 1" placeholder="请您文明发言" @click="handleComment"></el-input>
        <div style="width: 150px; text-align: right;">
          <span class="icon" v-if="state.dynamic.hasPraise" @click="praise">
            <el-icon style="top: 5px; margin-left: 10px"><img src="../../assets/点赞-active.png" alt="" style="width: 20px;"></el-icon>
            <span style="margin-left: 5px; color: red">{{ state.dynamic.praiseCount }}</span>
          </span>
          <span class="icon" v-else @click="praise">
            <el-icon style="top: 5px; margin-left: 10px"><img src="../../assets/点赞.svg" alt="" style="width: 20px;"></el-icon>
            <span style="margin-left: 5px; color: #888">{{ state.dynamic.praiseCount }}</span>
          </span>

          <span class="icon" v-if="state.dynamic.hasCollect" @click="collect">
            <el-icon size="20" style="top: 5px; margin-left: 10px; color: red"><CollectionTag /></el-icon>
            <span style="margin-left: 5px; color: red">{{ state.dynamic.collectCount }}</span>
          </span>
          <span class="icon" v-else @click="collect">
            <el-icon size="20" style="top: 5px; margin-left: 10px;"><CollectionTag /></el-icon>
            <span style="margin-left: 5px;">{{ state.dynamic.collectCount }}</span>
          </span>
        </div>
      </div>
    </el-card>

    <el-card style="margin: 10px 0">
      <div style="padding-bottom: 10px; border-bottom: 1px solid #ddd">评论列表</div>

      <div v-if="state.comments && state.comments.length">
        <div v-for="item in state.comments" :key="item.id" style="padding: 10px 20px;">
          <div style="display: flex; align-items: center">
            <img v-if="item.user" style="width: 40px; height: 40px; border-radius: 50%"  :src="item.user.avatar" alt="">
            <span v-if="item.user" style="margin-left: 10px; font-weight: bold">{{ item.user.name }}</span>
          </div>

          <div style="line-height: 30px; padding-left: 50px; color: #666; margin: 5px 0">{{ item.content }}</div>

          <div style="padding-left: 50px; font-size: 12px; color: #999; display: flex">
            <div style="flex: 1">
              <el-icon style="top: 2px"><Clock /></el-icon> <span>{{item.time }}</span>
              <el-icon style="top: 2px; margin-left: 10px"><Location /></el-icon> <span>{{item.location }}</span>
            </div>

            <div style="flex: 1; text-align: right">
              <el-button type="danger" link style="color: red;" v-if="item.userId === user.id"  @click="del(item.id)">删除</el-button>
              <el-button type="primary" link @click="handleComment(item)">回复</el-button>
            </div>
          </div>

          <div style="margin-top: 20px; margin-left: 50px; border-bottom: 1px solid #ddd;">
            <!-- 回复的子节点 -->
            <div v-for="subItem in item.children" :key="subItem.id" style="padding: 10px 0">
              <div style="display: flex; align-items: center">
                <img v-if="subItem.user" style="width: 40px; height: 40px; border-radius: 50%"  :src="subItem.user.avatar" alt="">
                <span v-if="subItem.user" style="margin-left: 10px; font-weight: bold">{{ subItem.user.name }}</span>
              </div>

              <div style="line-height: 30px; padding-left: 50px; color: #666; margin: 5px 0">
              <span style="color: #999">回复<span style="color: orange" v-if="subItem.puser">@{{ subItem.puser.name }}</span></span>
              <span style="margin-left: 10px">{{ subItem.content }}</span>
              </div>

              <div style="padding-left: 50px; font-size: 12px; color: #999; display: flex">
                <div style="flex: 1">
                  <el-icon style="top: 2px"><Clock /></el-icon> <span>{{subItem.time }}</span>
                  <el-icon style="top: 2px; margin-left: 10px"><Location /></el-icon> <span>{{subItem.location }}</span>
                </div>

                <div style="flex: 1; text-align: right">
                  <el-button type="danger" link style="color: red;" @click="del(subItem.id)" v-if="subItem.userId === user.id">删除</el-button>
                  <el-button type="primary" link @click="handleComment(item)">回复</el-button>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>

      <div v-else style="margin: 10px 0; color: #999">
        当前动态还没有评论
      </div>
    </el-card>

    <el-dialog v-model="dialogFormVisible" title="评论" width="30%">
      <el-form :model="state.form" label-width="80px" style="padding: 0 20px" status-icon>
        <el-form-item label="内容">
          <el-input type="textarea" v-model="state.form.content" autocomplete="off"></el-input>
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

<style>
.icon:hover {
  cursor: pointer;
}
</style>