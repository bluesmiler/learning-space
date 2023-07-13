import {createRouter, createWebHistory} from 'vue-router'
import routes from './routes'

const router = createRouter({
    history: createWebHistory(),
    routes
})

router.beforeEach(function (to, from, next){
    if (to.path === '/1'){
        const token = sessionStorage.getItem('token')
        if (token){
            next()
        }else {
            next('/login')
        }
    }else {
        next()
    }
})
export default router
