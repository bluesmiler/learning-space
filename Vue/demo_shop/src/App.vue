<template>
  <div class="app_container">
    <Header></Header>
    <Goods></Goods>
  </div>
</template>

<script>
import axios from 'axios'
import Header from "@/components/Header";
import 'bootstrap/dist/css/bootstrap.min.css'
import Goods from "@/components/Goods";


export default {
  name:'App',
  data(){
    return{
      list: []
    }
  },
  created() {
    this.showCart()
  },
  methods:{
    async showCart() {
      const {data:res} = await axios.get('https://www.escook.cn/api/cart');
      // console.log(res)
      if(res.status === 200){
        this.list = res.list
      }
    }
  },
  components: {
    Goods,
    Header

  }
}
</script>

<style>
  .app_container{

  }
</style>
