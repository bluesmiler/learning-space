import request from "@/utils/request";

export const getNewsListAPI = function (page,limit) {
    return request('/news', {
        params: {
            page: page,
            limit: limit
        }
    })
}