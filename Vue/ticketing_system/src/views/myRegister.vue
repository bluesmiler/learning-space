<template>
  <div class="register-container">
    <van-form>
      <van-cell-group inset>
        <van-field
            v-model="nickname"
            name="昵称"
            label="昵称"
            placeholder="昵称"
            :rules="[{ required: true, message: '昵称' }]"
        />
        <van-field
            v-model="username"
            name="用户名"
            label="用户名"
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
        <van-button round block type="primary" @click="register">
          提交
        </van-button>
      </div>
    </van-form>
  </div>
</template>

<script>

import request from '../utils/request'

export default {
  name: "myRegister",
  data() {
    return {
      username: '',
      password: '',
      nickname: ''
    }
  },
  methods: {
    register() {
      request({
        method: 'post',
        url: '/register',
        data: {
          username: this.username,
          password: this.password,
          nickname: this.nickname
        }
      })
      location.replace('/login')
    },
  }
}
</script>

<style scoped lang="less">
.register-container{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  top: 200px;
  .van-field{
    margin: 16px;
  }
  h3{
    color: #008cff;
  }
}
</style>