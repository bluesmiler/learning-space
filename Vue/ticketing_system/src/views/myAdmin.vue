<template>
  <div class="admin-container">
    <van-form>
      <van-cell-group inset>
        <van-field
            v-model="username"
            name="用户名"
            label="管理员名"
            placeholder="用户名"
            :rules="[{ required: true, message: '请填写用户名' }]"
        />
        <van-field
            v-model="password"
            type="password"
            name="密码"
            label="密码"
            placeholder="密码"
            :rules="[{ required: true, message: '请填写密码' }]"
        />
      </van-cell-group>
      <div style="margin: 16px;">
        <van-button round block type="primary" @click="login">
          登录
        </van-button>
      </div>
    </van-form>
  </div>
</template>

<script>
export default {
  name: "myAdmin"
}
</script>

<style scoped lang="less">
.admin-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  top: 200px;

  .van-field {
    margin: 16px;
  }
}
</style>