# springboot处理接收axios请求参数解析

在项目中遇到get请求正常，post请求后台接收不到参数，

查原因才知道axios会把post请求中的参数，会转换包装成一个json来传递

通过查看axios网络请求的header可以看出Content-Type是 application/json;charset=UTF-8

而服务器接收的Content-Type是application/x-www-form-urlencoded

## 解决办法：

#### 方法1

后端处理，处理josn数据，引入fastjson，在Controller接收数据这里 @ResquestBody注解一下

```java
@RequestMapping("/login")
public User login(@RequestBody JSONObject jsonObject) {
    User userData = userService.findByUP(jsonObject.getString("username"), jsonObject.getString("password"));
    if (userData != null) {
        System.out.println(userData);
    }
    return userData;
}
```



#### 方法2

前端处理，修改axios中的post请求，重新封装请求参数



#### 方法3

前端处理，引入qs库