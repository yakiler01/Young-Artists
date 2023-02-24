<template>
  <div id="app"> <!--HTML DOM template-->
        <input v-model.lazy="num">
        <p>{{numSquare}}</p>
    </div>
</template>

<script >
import {  defineComponent, ref ,computed ,watch,watchEffect} from 'vue';
export default defineComponent({
  name: 'App',
  //  setup是组合API中第一个要使用的函数
  setup() {
    const num = ref(0)
    const numSquare = computed(()=>{
        return Math.pow(num.value, 2)
    })
    //同時多屬性時第一個參數放陣列
    /* watch(num,(newValue, oldValue) => {
      console.log(`num: ${oldValue} ---> ${newValue}`);
    },
    { immediate: true, deep: false });

    watch(numSquare,(newValue, oldValue) => {
      console.log(`numSquare: ${oldValue} ---> ${newValue}`);
    }); */
    //VUE3新的監視 只要有用到值就會自動監視哪個值
    watchEffect(() => {
      console.log(`num: ${num.value}`);
    });

    watchEffect(() => {
      console.log(`numSquare: ${numSquare.value}`);
    });
    return {
      num,
      numSquare
    }
  }
})


</script>

<style scoped>

</style>
