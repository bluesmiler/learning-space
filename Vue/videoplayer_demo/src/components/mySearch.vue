<template>
  <div class="searchInput">
    <input type="search" :placeholder="defaultMassage">
  </div>
</template>

<script>
export default {
  name: "mySearch",
  data() {
    return {
      defaultMassage: '搜索你所想要的一切'
    }
  },
}
</script>

<style scoped lang="less">
.searchInput {
  display: flex;
  justify-content: center;
  align-items: center;

  input {
    //display: inline-flex;
    flex-direction: column;
    outline-style: none;
    border: 0;
    box-shadow: #dedede 0 0 20px;
    border-radius: 1em;
    width: 55vw;
    min-width: 330px;
    height: 7vh;
    position: relative;
    top: -3.5vh;
    padding: 0 1.2em;
    font-size: 1rem;
    letter-spacing: 0.05em;

  }
}
</style>