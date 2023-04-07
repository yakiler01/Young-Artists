<template>
    <button @click="fetchGetData">做卡片</button>

        <div id="cardbox" v-if="ok">
            <h1>活動清單</h1>
            <hr>
            <el-row type="flex">
                <el-col v-for="cardData in dataList" :key="cardData.id" :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
                    <el-card>
                        <img :src="require(`${cardData.eventImage}`)" class="card-img" alt="">
                        <div class="card-content">
                            <h3 class="card-title">{{ cardData.eventName }}</h3>
                            <div class="card-time">
                                <p><i class="el-icon-time"></i>活動開始時間 : {{ cardData.eventStartTimestamp }}</p>
                                <p><i class="el-icon-time"></i>活動結束時間 : {{ cardData.eventEndTimestamp }}</p>
                                <p><i class="el-icon-time"></i>活動販售開始時間 : {{ cardData.eventSellStartTimestamp }}</p>
                                <p><i class="el-icon-time"></i>活動販售結束時間 : {{ cardData.eventSellEndTimestamp }}</p>
                            </div>
                        </div>
                    </el-card>
                </el-col>
            </el-row>
        </div>

</template>
  
<script setup>
import { ref, reactive, computed } from 'vue'
import axios from 'axios';
import { ElRow, ElCol, ElCard } from 'element-plus';

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
            ok.value = !ok.value

        }).catch(error => {
            alert(error)
        });
}


</script>
  
<style>
#cardbox {
    width: 75%;
    margin: 0 auto;
}

.card-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.card-content {
    padding: 10px;
    text-align: center;
}

.card-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
}

.card-time {
    font-size: 14px;
    color: #999;
}</style>