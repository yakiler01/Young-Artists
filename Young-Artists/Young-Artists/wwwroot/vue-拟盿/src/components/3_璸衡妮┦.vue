<template>
  <div id="app"> <!--HTML DOM template-->
        <h3>{{now}}</h3>
        <p>
            身高: <input v-model="height">
        </p>
        <p>
            體重: <input v-model="weight">
        </p>
        <p>
            BMI: <span>{{calculate}}</span>
        </p>
    </div>
</template>

<script >
//vue3裡將計算屬性生命週期全改成方法,需引用寫在setup裡
import {  defineComponent,ref,computed } from 'vue';
export default defineComponent({
  name: 'App',
  //  所有的屬性，方法都寫在setup裡面，然後再返回
  setup() {
    //基礎類型使用ref渲染，對象陣列使用reactive
    //ref要調用值須.value，建議都把值封裝在對象裡
    //setup裡面不能只用this方法一律用Lambda
    const height= ref(0)
    const weight= ref(0)
    const calculate = computed(() => {
      if (height.value > 0 && weight.value > 0) {
        const BMI = weight.value / Math.pow(height.value / 100, 2);
        return BMI.toFixed(2);
      } else {
        return 0;
      }
    });

    const now = computed(() => new Date());

    return {
      height,
      weight,
      calculate,
      now,
    };
  }
})
</script>
