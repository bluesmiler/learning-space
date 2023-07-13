import axios from "axios";

const request = axios.create({
    baseURL: 'http://localhost:8089',
})

export default request