<template>
  <div class="show">
    <ul>
      <li v-for="(picture,index) in pictureList" :key="index">
        <img :src="picture" alt="">
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "myShow",
  data() {
    return {
      pictureList: []
    }
  },
  beforeMount() {
    this.getPictures()
  },
  methods: {
    async getPictures() {
      axios({
        method: 'get',
        url: "http://localhost:8088/selectAll"
      }).then(res => {
        for (let i = 0; i < 20; i++) {
          this.pictureList.push(res.data[i].path)
        }
      }).catch(error => {
        console.log(error)
      })
    }
  }
}
</script>

<style scoped lang="less">
.show {
  display: flex;
  justify-content: space-between;
  align-items: center;

  ul {
    list-style: none;

    li {
      display: inline-block;
      margin: 2vh 10px;

      img {
        width: 14vw;
        min-width: 155px;
        height: 36vh;
        min-height: 240px;
        max-height: 280px;
        border-radius: 0.5rem;
      }
    }
  }
}
</style>