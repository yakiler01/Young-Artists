<template>
  <div id="app"> <!--HTML DOM template-->
        <select v-model="selectedYear">
            <option v-for="year in years" :key="year">{{year}}</option>
            <!-- <option v-for="year in years" :value="year">{{year}}</option> -->
        </select>
        <select v-model="selectedMonth">
            <!-- <option v-for="month in months">{{month}}</option> -->
            <option v-for="month in 12" :key="month">{{month}}</option>
        </select>
        <select v-model="selectedDate">
            <option v-for="day in 31" :key="day">{{day}}</option>
        </select>

        <p>今天是西元 {{selectedYear}} 年 {{selectedMonth}} 月 {{selectedDate}} 日</p>
    </div>
</template>

<script >
//vue3裡將計算屬性生命週期全改成方法,需引用寫在setup裡
import {  defineComponent,ref,reactive,computed } from 'vue';
export default defineComponent({
  name: 'App',
  //  所有的屬性，方法都寫在setup裡面，然後再返回
  setup() {
    //基礎類型使用ref渲染，對象陣列使用reactive
    //ref要調用值須.value，建議都把值封裝在對象裡
    const years= reactive([2019,2020,2021,2022,2023,2024,2025,2026])
    const selectedYear = computed(()=>{{
                    return new Date().getFullYear();
                }})
    const selectedMonth = computed(()=>{{
                    return new Date().getMonth() + 1
                }})
    const selectedDate = computed(()=>{{
                    return new Date().getDate()
                }})
    return {
      years,
      selectedYear,
      selectedMonth,
      selectedDate,
    };
  }
})
</script>
<style>

</style>