<template>
  <div class="NewsShow">
    <van-cell>
      <!-- 插槽-->
      <template #title>
        <div class="title-box">
          <span>{{ this.title }}</span>
          <img :src="this.imageList[0].imagePath" alt="" class="thumb" v-if="this.imageList.length===1">
        </div>
        <div class="thumb-box" v-if="this.imageList.length === 3">
          <img :src="item.imagePath" alt="" class="thumb" v-for="(item,i) in this.imageList" :key="i">
        </div>
      </template>
      <template #label>
                <div class="label-box">
                  <span>标签：{{ this.keywords }}&nbsp;&nbsp;&nbsp;&nbsp;时间：{{ this.date }}</span>
                  <van-icon name="cross"/>
                </div>
      </template>
    </van-cell>
  </div>
</template>

<script>
export default {
  name: "myNewsShow",
  props: {
    title: {
      type: String,
      default: ''
    },
    keywords: {
      type: String,
      default: ''
    },
    date: {
      type: String,
      default: ''
    },
    imageList: []
  }
}
</script>

<style scoped>
.van-cell {
  --van-cell-background: #f6f6f7;
}

.title-box {
  display: flex;
  justify-content: space-between;
  /*align-items: center;*/
}

.label-box {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.thumb-box {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.thumb {
  width: 113px;
  height: 70px;
  object-fit: cover;
}
</style>