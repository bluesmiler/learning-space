<template>
  <div class="global">
    <myHeader></myHeader>
    <myHello></myHello>
    <mySearch></mySearch>
    <myShow></myShow>
  </div>
</template>

<script>
import myHeader from "@/components/myHeader";
import myHello from "@/components/myHello";
import mySearch from "@/components/mySearch";
import myShow from "@/components/myShow";

export default {
  name: 'App',

  components: {
    myHeader, myHello, mySearch,myShow
  }
}
</script>

<style>
body {
  margin: 0;
  padding: 0;
}
</style>
