<template>
  <my-header></my-header>
  <div class="sale-container">
    <van-card
        desc="东华理工大学大一新生篮球选拔赛"
        title="东华新人杯"
        thumb="https://ts1.cn.mm.bing.net/th/id/R-C.280912b15901408ca64b127757690394?rik=HuY2P6S9J1vjKA&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fphotoblog%2f1006%2f23%2fc18%2f4307800_4307800_1277296654437_mthumb.jpg&ehk=oJqoLb8TSTW33woPCQeGSAstC%2bZYsUIe2lT2FzIFEiU%3d&risl=&pid=ImgRaw&r=0"
        @click="toBook"
        price="12.5"
    />
    <span style="position: relative;left: 300px">剩余{{ number }}</span>
  </div>
</template>

<script>
import MyHeader from "@/components/myHeader";
import {showDialog, showSuccessToast} from "vant";
import {getLoginAPI} from "@/apis/loginAPI";

export default {
  name: "mySale",
  components: {MyHeader},
  data() {
    return {
      number: 56
    }
  },
  created() {
    getLoginAPI().then(res => {
      if (res.data.code === 500) {
        showDialog({
          message: '请登陆后操作',
        }).then(() => {
          // on close
          location.replace('/login')
        });
      }
    })

  },
  methods: {
    toBook() {
      this.number--;
      showSuccessToast('购票成功');
    }
  }
}
</script>

<style scoped>
.sale-container {
  margin-top: 46px;
}
</style>