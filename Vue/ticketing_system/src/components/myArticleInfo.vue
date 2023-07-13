<template>
  <div class="article-info-container">
    <van-cell>
      <!-- 插槽-->
      <template #title>
        <div class="title-box">
          <span>{{ this.title }}</span>
          <img :src="cover.images[0]" alt="" class="thumb" v-if="cover.type===1">
        </div>
        <div class="thumb-box" v-if="cover.type === 3">
          <img :src="item" alt="" class="thumb" v-for="(item,i) in cover.images" :key="i">
        </div>
      </template>
      <template #label>
        <div class="label-box">
          <span>作者:{{ this.author }}&nbsp;&nbsp; {{ this.cmtCount }}评论&nbsp;&nbsp;发布日期 {{ this.pubDate }}</span>
          <van-icon name="cross"/>
        </div>
      </template>
    </van-cell>
  </div>
</template>

<script>
export default {
  name: "myArticleInfo",
  // 自定义属性
  props: {
    title: {
      type: String,
      default: ''
    },
    author: {
      type: String,
      default: ''
    },
    cmtCount: {
      type: [Number, String],
      default: 0
    },
    pubDate: {
      type: String,
      default: ''
    },
    cover: {
      type: Object,
      default: function () {
        return {cover: 0}
      }
    }
  }
}
</script>

<style scoped>
.van-cell {
  --van-cell-background: #f7f8fa;
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