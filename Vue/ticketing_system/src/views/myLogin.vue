<template>
  <div class="login-container">
    <h3>请登录后操作</h3>
    <van-form>
      <van-cell-group inset>
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
      <div style="margin: 16px">
        <van-button round block type="primary">
          <router-link to="/register" style="color: #e7f3f3">没有账号？点我注册</router-link>
        </van-button>

      </div>
      <div style="margin: 16px;">
        <van-button round block type="primary" @click="login">
          提交
        </van-button>
      </div>
    </van-form>
  </div>
</template>

<script>

import request from '../utils/request'
import {showDialog} from "vant";
// import router from "@/routes";

export default {
  name: "myLogin",
  data() {
    return {
      username: '',
      password: ''
    }
  },
  methods: {
    login() {
      request({
        method: 'get',
        url: '/login',
        params: {
          username: this.username,
          password: this.password
        }
      }).then(res => {
        if (res.data.data !== null) {
          sessionStorage.setItem('user', res.data.data)
          location.replace('/sale')
        }else {
          showDialog({
            message: res.data.massage
          })
        }
      })
    },
  }
}
</script>

<style scoped lang="less">
.login-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  top: 200px;

  .van-field {
    margin: 16px;
  }

  h3 {
    color: #008cff;
  }
}
</style>