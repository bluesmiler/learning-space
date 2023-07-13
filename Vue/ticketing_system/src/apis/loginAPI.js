import request from "@/utils/request";

export const getLoginAPI = function () {
    return request({
        methods: 'get',
        url: '/isLogin',
        headers: {
            'user': sessionStorage.getItem('user')
        }
    })
}