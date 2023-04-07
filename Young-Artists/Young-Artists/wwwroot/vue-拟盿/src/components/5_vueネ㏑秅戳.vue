<template>
  <h4>msg:{{ msg }}</h4>
  <button @click="update">更新数据</button>
</template>

<script >
import {  defineComponent, ref, onBeforeMount, onMounted, onBeforeUpdate, onUpdated, onBeforeUnmount, onUnmounted  } from 'vue';
export default defineComponent({
  name: 'App',
  //  setup是组合API中第一个要使用的函数
  setup() {
    console.log('3.0中的setup')
    // 响应式的数据
    const msg = ref('abc')
    // 按钮点击事件的回调
    const update = () => {
      msg.value += '==='
    }
    onBeforeMount(() => {
      console.log('3.0中的onBeforeMount')
    })
    onMounted(() => {
      console.log('3.0中的onMounted')
    })
    onBeforeUpdate(() => {
      console.log('3.0中的onBeforeUpdate')
    })
    onUpdated(() => {
      console.log('3.0中的onUpdated')
    })
    onBeforeUnmount(() => {
      console.log('3.0中的onBeforeUnmount')
    })
    onUnmounted(() => {
      console.log('3.0中的onUnmounted')
    })
    return {
      msg,
      update
    }
  }
})


</script>

<style scoped>

</style>
