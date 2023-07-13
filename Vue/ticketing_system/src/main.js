import { createApp } from 'vue'
import App from './App.vue'
import routes from './routes'
import vant from 'vant';
import 'vant/lib/index.css';

const app = createApp(App)

app.use(routes)
app.use(vant)
app.mount("#app")
