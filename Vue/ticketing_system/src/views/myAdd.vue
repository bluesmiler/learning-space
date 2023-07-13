<template>
  <div class="add-container">
    <div style="position: relative;left: 140px;bottom: 80px;font-size: 22px">添加比赛</div>
    <van-field name="switch" label="比赛状态">
      <template #input>
        <van-switch v-model="checked" />
      </template>
    </van-field>

    <van-field name="checkbox" label="是否开始售票">
      <template #input>
        <van-checkbox v-model="checked" shape="square" />
      </template>
    </van-field>
    <van-field name="checkboxGroup" label="复选框组">
      <template #input>
        <van-checkbox-group v-model="groupChecked" direction="horizontal">
          <van-checkbox name="1" shape="square">复选框 1</van-checkbox>
          <van-checkbox name="2" shape="square">复选框 2</van-checkbox>
        </van-checkbox-group>
      </template>
    </van-field>
    <van-field name="stepper" label="票数">
      <template #input>
        <van-stepper v-model="value" />
      </template>
    </van-field>
    <van-popup v-model:show="showPicker" position="bottom">
      <van-picker
          :columns="columns"
          @confirm="onConfirm"
          @cancel="showPicker = false"
      />
    </van-popup>
    <van-field
        v-model="result"
        is-link
        readonly
        name="datePicker"
        label="时间选择"
        placeholder="点击选择开始时间"
        @click="showPicker = true"
    />
    <van-popup v-model:show="showPicker" position="bottom">
      <van-date-picker @confirm="onConfirm" @cancel="showPicker = false" />
    </van-popup>
    <van-field
        v-model="result"
        is-link
        readonly
        name="area"
        label="场地选择"
        placeholder="点击选择场地"
        @click="showArea = true"
    />
    <van-popup v-model:show="showArea" position="bottom">
      <van-area
          :area-list="areaList"
          @confirm="onConfirm"
          @cancel="showArea = false"
      />
    </van-popup>
    <van-field
        v-model="value"
        is-link
        readonly
        name="calendar"
        label="时间"
        placeholder="点击选择结束时间"
        @click="showCalendar = true"
    />
    <van-calendar v-model:show="showCalendar" @confirm="onConfirm" />

  </div>
</template>

<script>
export default {
  name: "myAdd"
}
</script>

<style scoped>
.add-container{
  margin: 360px 16px;
  position: absolute;
}
</style>