<template>
  <div class="home-container">
    <my-header></my-header>
    <van-pull-refresh v-model="refreshing" @refresh="onRefresh">
      <van-list
          v-model:loading="loading"
          :finished="finished"
          :finished-text="finishedMassage"
          @load="onLoad"
      >
        <my-news-show
            v-for="item in articleList"
            :key="item.newsId"
            :title="item.newsTitle"
            :imageList="item.imageList"
            :keywords="item.newsKeywords"
            :date="item.newsDate"
        >
        </my-news-show>
      </van-list>
    </van-pull-refresh>
  </div>
</template>

<script>
import myHeader from "@/components/myHeader";
import {getNewsListAPI} from "@/apis/newsAPI";
import MyNewsShow from "@/components/myNewsShow";


export default {
  name: "myHome",
  components: {MyNewsShow, myHeader},
  data() {
    return {
      //页码值
      page: 1,
      //每页显示多少数据
      limit: 10,
      //文章的数组
      articleList: [],
      //是否处于上划加载状态
      loading: true,
      //是否处于下划刷新状态
      refreshing: false,
      //是否加载完
      finished: false,
      //提示信息
      finishedMassage: '我也是有底线的',
    }
  },
  created() {
    this.iniNesList()
  },
  methods: {
    async iniNesList(isRefresh) {
      const {data: res} = await getNewsListAPI(this.page, this.limit)
      const data = res.data

      if (isRefresh) {

        this.articleList = [...data, ...this.articleList]
        this.refreshing = false
      } else {

        this.articleList = [...this.articleList, ...data]
        this.loading = false
      }

      //是否加载完成
      if (data.length === 0) {
        this.finished = true
      }
    },
    onLoad() {
      this.page++

      this.iniNesList()
    },
    onRefresh() {
      this.page++

      // 重新加载数据
      this.iniNesList(true)
    }
  }
}
</script>

<style scoped lang="less">
.home-container {
  margin-top: 46px;
  margin-bottom: 50px;
}
</style>