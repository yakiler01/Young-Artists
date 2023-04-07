<template>
  <div id="app"> <!--HTML DOM template-->
        <h1>{{messages.message}}</h1>
        <p>{{messages.message}}</p>
        <input type="text" v-model="messages.message">
    </div>
</template>

<script >
import {  defineComponent ,ref ,reactive} from 'vue';
//基礎類型使用ref渲染，對象陣列使用reactive
//ref要調用值須.value，建議都把值封裝在對象裡
export default defineComponent({
  name: 'App',
  //  setup是组合API中第一个要使用的函数
  setup() {
    //const message = ref('Hello Vue!');
    const messages = reactive({
      message : 'Hello Vue!',
    })
    return {
      messages
    }
  }
})


</script>

<style scoped>

</style>
