<template>
    <button @click="change人的age">讓俊安300歲</button>
    <div>俊安幾歲? : {{ props.人.age }}</div>
</template>

<style scoped>
div {
    width: 200px;
    height: 30px;
    background-color: pink;
}

</style>
<script setup>
import {ref,reactive,computed} from 'vue'

const props = defineProps(["人"])
const change人的age = () => { props.人.age = 300 }

</script>

