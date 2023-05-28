<script setup>
import '@wangeditor/editor/dist/css/style.css' // 引入 css
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
import {onBeforeUnmount, onMounted, ref, shallowRef} from "vue";
import config from "../../config";


// 内容 HTML
const valueHtml = ref('<p>hello</p>')

// 模拟 ajax 异步获取内容
onMounted(() => {
  setTimeout(() => {
    valueHtml.value = '设置内容'
  }, 1000)
})
// 编辑器实例，必须用 shallowRef
const editorRef = shallowRef()
const toolbarConfig = {}
const editorConfig = {
  placeholder: '请输入内容...',
}
editorConfig.MENU_CONF['uploadImage'] = {
  server: `http://${config.serverUrl}/file/uploadImg`
}
const handleCreated = (editor) => {
  editorRef.value = editor // 记录 editor 实例，重要！
}
// 组件销毁时，也及时销毁编辑器
onBeforeUnmount(() => {
  const editor = editorRef.value
  if (editor == null) return
  editor.destroy()
})
</script>

<template>
  <div>
    <div style="border: 1px solid #ccc">
      <Toolbar
          style="border-bottom: 1px solid #ccc"
          :editor="editorRef"
          :defaultConfig="toolbarConfig"
          :mode="'simple'"
      />
      <Editor
          style="height: 500px; overflow-y: hidden;"
          v-model="valueHtml"
          :defaultConfig="editorConfig"
          :mode="'simple'"
          @onCreated="handleCreated"
      />
    </div>
  </div>
</template>