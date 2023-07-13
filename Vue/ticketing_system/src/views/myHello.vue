<template>
  <div class="hello-container">
    <div class="to-top"></div>
    <img src="https://fastly.jsdelivr.net/npm/@vant/assets/logo.png" alt="">
    <div class="to-context">
      <h3>BLUES体育欢迎你</h3>
      <van-button type="primary" class="to-button" replace to="/home">开始冒险</van-button>
<!--      <van-button type="primary" class="to-button" replace to="/admin">我是管理员</van-button>-->
      <p>本网站基于vue + vant, 数据支持基于spring + mybatis</p>
      <br>
      <p>——————————————— 艾颖</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "myHello"
}
</script>

<style scoped lang="less">
 .hello-container{
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
   .to-top{
     height: 100px;
   }
   img{
     width: 260px;
   }
   .to-button{
     margin: 16px;
   }
   .to-context{
     display: flex;
     justify-content: center;
     align-items: center;
     flex-direction: column;
     margin: 16px;
   }
 }
</style>