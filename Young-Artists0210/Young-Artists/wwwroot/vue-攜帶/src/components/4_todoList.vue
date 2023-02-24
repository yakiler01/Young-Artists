<template>
  <div id="app"> <!--HTML DOM template-->
        <!-- 使用 v-on 的修飾符: .enter -->
        Your task: <input v-model="newTask" @keyup.enter="addTask">

        <ol>
            <!-- <li v-for="task in tasks">{{task}}</li> -->

            <!-- 加上刪除功能 -->
            <!-- :key="index"沒寫會報錯 指定數據中的唯一值,通常ID 
                  用index在新增資料時，使用破壞順序的方法會有問題-->
            <li v-for="(task,index) in tasks" :key="index" @click="removeTask(index)">{{task}}</li>
        </ol>
    </div>
</template>

<script >
//vue3裡將計算屬性生命週期全改成方法,需引用寫在setup裡
import {  defineComponent,ref,reactive } from 'vue';
export default defineComponent({
  name: 'App',
  //  所有的屬性，方法都寫在setup裡面，然後再返回
  setup() {
    //基礎類型使用ref渲染，對象陣列使用reactive
    //ref要調用值須.value，建議都把值封裝在對象裡
    const tasks= reactive([])
    const newTask= ref("")
    function addTask(){
                    tasks.push(newTask.value)
                    newTask.value = ''
                    }
    function removeTask(index){
                    tasks.splice(index,1)
                }
    return {
      tasks,
      newTask,
      addTask,
      removeTask,
    };
  }
})
</script>
<style>
ol li{
            font: 18px Tahoma;
            background-color: #abc;
            margin: 5px;
            padding: 5px;
        }
        ol li:hover{
            cursor: pointer;
            background-color: #cba;
      }
</style>