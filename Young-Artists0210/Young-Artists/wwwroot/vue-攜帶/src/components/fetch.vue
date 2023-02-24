<template>
    <button @click="fetchGetData">拿資料</button>
    <div id="tablebox" v-if="ok">
        <el-table :data="dataList">
            <el-table-column prop="eventName" label="活動名稱"></el-table-column>
            <el-table-column prop="eventSellStartTimestamp" label="活動販售開始時間"></el-table-column>
            <el-table-column prop="eventSellEndTimestamp" label="活動販售結束時間"></el-table-column>
            <el-table-column prop="eventStartTimestamp" label="活動開始時間"></el-table-column>
            <el-table-column prop="eventEndTimestamp" label="活動結束時間"></el-table-column>
            <el-table-column prop="eventImage" label="活動圖片">
                <template #default="{ row }">
                    <img :src="require(`../../../Images/${row.eventImage}`)">
                </template>
            </el-table-column>

        </el-table>
    </div>
</template>


<style>
img {
    width: 100px;
    height: 100px;
}
</style>
<script setup>


import { ref, reactive, computed, mounted } from 'vue'
import axios from 'axios';

const dataList = reactive([])
const imgList = reactive([])
const img = ref(`../../../Images/`)
const url = ref("https://localhost:44393/api/Events")
const ok = ref(false);

const returnData = computed(() => {
    return dataList
})

const fetchGetData = () => {
    fetch(`${url.value}`, {
        method: "GET",
    }).then(result => {
        if (result.ok) {
            return result.json();
        } else {
            console.log("沒拿到")
        }
    })
        .then(data => {
            dataList.splice(0, dataList.length, ...data);
            console.log(dataList);

            for (let i = 0; i < dataList.length; i++) {
                imgList.push(`${img.value}${dataList[i].eventImage}')`)
            }
            console.log(imgList);
            ok.value = !ok.value

        }).catch(error => {
            alert(error)
        });
}




</script>