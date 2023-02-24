<template>
  <p>=================================================================</p>
  <button @click="changeString">改變字串(methods)</button>
  <button @click="changeNumber">改變數字(methods)</button>
  <button @click="changeMix">讓mix得到兩個變數(methods)</button>
  <p>number_variable : {{ number_variable }}</p>
  <p>string_variable : {{ string_variable }}</p>
  <p>mix (我是data中的mix，我是透過方法改變值) : {{ mix }}</p>
  <p>computed (我是計算物件而非data，值發生改變時，我會即時反應return值) : {{ getString_getNumber }}</p>
  <p>=================================================================</p>
  <button @click="change俊安的age">讓他變200歲</button>
  <p>俊安的age : {{ 俊安.age }}</p>
  <p>=================================================================</p>
  <button @click="添加淑真的動畫清單">讓淑真看不完</button>
  <button @click="減少淑真的動畫清單">不讓淑真看了</button>

  <p>淑真的動畫清單 : </p>
  <p v-for="(anime, index) in 淑真的動畫清單">{{ index + 1 }}. {{ anime }}</p>
  <p>=================================================================</p>

  <son :人="俊安"></son>
  <fetcth></fetcth>
  <card></card>
</template>

<script setup> // script中加入 setup

//  vue文件現在是打包工具幫忙包起來了，所以要用import 來引入

import { ref, computed, watch, reactive } from 'vue'

//  若要引入子組件也是 import 自定義變數名 from ./路徑/子組件.vue
import son from './components/son.vue'
import fetcth from './components/fetch.vue'
import card from './components/card.vue'

//  最下面要寫 令人眼前為之一暗 的 父子組件 概念 

const number_variable = ref(0);
const changeNumber = () => {
  number_variable.value += 1
};

const string_variable = ref("我是字串")
const changeString = () => {
  string_variable.value += "字串"
};

const mix = ref("我還沒出現")
const changeMix = () => {
  mix.value = number_variable.value + string_variable.value
};

const 俊安 = reactive({
  age: 100,
  height: 200,
  weight: 80,
})
const change俊安的age = () => { 俊安.age = 200 }

const 淑真的動畫清單 = reactive(["工作細胞", "工作細胞BLACK"])
const 添加淑真的動畫清單 = () => { 淑真的動畫清單.push("工作細胞2023") }
const 減少淑真的動畫清單 = () => { 淑真的動畫清單.pop(淑真的動畫清單[淑真的動畫清單.length - 1]) }

const getString_getNumber = computed(() => {
  return number_variable.value + string_variable.value
})


watch([mix], (newValue, oldValue) => {
  console.log(`${oldValue}--------->${newValue}`);
})

//  因為上面都跟3.0的檔案寫得差不多，差在不用return
//  所以來講點新東西

//  1. defineProps() 定義屬性函數

//  Props = Properties 意思是 屬性
//  定義 : 這個函數是在「子組件」定義「屬性」，用來接收「爸爸組件」傳遞的數據
//  例如 : 在「son.vue」這個「子組件」宣告 const props = defineProps(["人"])　　
//  注意 : 「son.vue」在src/components資料夾裡面

//  接下在就能在子組件裡面運用 「props.人 」了，相當於獲得一個新物件
//  我也可以在「子組件」宣告一個const來寫一個方法，方法裡面也同樣可以改變「人」的age

//  例如 : 在「子組件」宣告 const change人的age = () => { props.人.age = 300 }

//  但是這個「人」是誰? 他資料哪裡來? 再讀一次定義
//  「爸爸組件的數據」要從爸爸拿，此時回到爸爸組件
//  去最上面的<template>標籤裡面 寫上 <son :人="俊安"></son>

//  「:人」 冒號後面接的是「標籤」裡面的「屬性」，也就是所謂的v-bind用法
//  如果不知道為什麼是「屬性」，去看定義
//  所以「:人="俊安"」等號後面就是「爸爸組件的數據」
//  此時想像一下，「子組件」寫的方法(函數)，實際上會長什麼樣子

//  const change人的age = () => { props.人.age = 300 }
//  const change人的age = () => { 俊安.age = 300 }



//  2. defineEmits() 函數

//  Emits = Event Emitters 意思是 事件發射器
//  定義 : 這個函數是「子組件」要觸發「爸爸組件」的方法(函數)

</script>