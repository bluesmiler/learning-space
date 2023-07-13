import {createApp} from 'vue'
import App from './App.vue'
import Count from '@/components/myCount.vue'

const app = createApp(App);

app.component('MyCount',Count)

app.mount('#app')



