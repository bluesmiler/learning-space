
const routes = [
    {
        path: '/',
        redirect: '/welcome'
    },
    {
        path: '/welcome',
        component: () => import("../views/myHello")
    },
    {
        path: '/book',
        component: () => import("../views/myBook")
    },
    {
        path: '/sale',
        component: () => import("../views/mySale")
    },
    {
        path: '/home',
        component: () => import("../views/myNews")
    },
    {
        path: '/user',
        component: () => import("../views/myUser")
    },
    {
        path: '/register',
        component: () => import("../views/myRegister")
    },
    {
        path: '/login',
        component: () => import("../views/myLogin")
    },
    {
        path: '/admin',
        component: () => import("../views/myAdmin")
    },
    {
        path: '/add',
        component: () => import("../views/myAdd")
    }
]

export default routes