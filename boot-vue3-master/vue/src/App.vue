<script setup>
import { RouterView } from 'vue-router'
import router from "@/router";
</script>

<template>
  <RouterView :key="router.currentRoute.value.fullPath + Math.random()" />
</template>

