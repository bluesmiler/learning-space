# Token的详细说明，看这一篇就够了



##### 1.基于Token 的身份验证方法

使用基于 Token 的身份验证方法，在服务端不需要存储用户的登录记录。大概的流程是这样的：



```undefined
客户端使用用户名跟密码请求登录；
服务端收到请求，去验证用户名与密码；
验证成功后，服务端会签发一个 Token，再把这个 Token 发送给客户端；
客户端收到 Token 以后可以把它存储起来，比如放在 Cookie 里或者 Local Storage 里；
客户端每次向服务端请求资源的时候需要带着服务端签发的 Token；
服务端收到请求，然后去验证客户端请求里面带着的 Token，如果验证成功，就向客户端返回请求的数据。
```

##### 2.JWT

实施 Token 验证的方法挺多的，还有一些标准方法，比如 JWT，读作：jot ，表示：JSON Web Tokens 。JWT 标准的 Token 有三个部分：



```css
1.header(头部)，头部信息主要包括（参数的类型--JWT,签名的算法--HS256）
2.poyload(负荷)，负荷基本就是自己想要存放的信息(因为信息会暴露，不应该在载荷里面加入任何敏感的数据)
3.sign(签名)，签名的作用就是为了防止恶意篡改数据，下边会详细说明
```

中间用点分隔开，并且都会使用 Base64 编码，所以真正的 Token 看起来像这样：



```css
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJuaW5naGFvLm5ldCIsImV4cCI6IjE0Mzg5NTU0NDUiLCJuYW1lIjoid2FuZ2hhbyIsImFkbWluIjp0cnVlfQ.SwyHTEx_RQppr97g4J5lKXtabJecpejuef8AqKYMAJc
```

###### 2.1 Header

Header 部分主要是两部分内容，一个是 Token 的类型，另一个是使用的算法，比如下面类型就是 JWT，使用的算法是 HS256。



```json
{
    "typ" : "JWT",
    "alg" : "HS256"
}
```

上面的内容要用 Base64 的形式编码一下，所以就变成这样：



```undefined
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9
```

###### 2.2 Payload

Payload 里面是 Token 的具体内容，这些内容里面有一些是标准字段，你也可以添加其它需要的内容。下面是标准字段：



```cpp
iss：Issuer，发行者
sub：Subject，主题
aud：Audience，观众
exp：Expiration time，过期时间
nbf：Not before
iat：Issued at，发行时间
jti：JWT ID
```

比如下面这个 Payload，用到了 iss 发行人，exp 过期时间，另外还有两个自定义的字段，一个是 name ，还有一个是 admin 。



```json
{
    "iss" : "csdn.net",
    "exp" : "201511205211314",
    "name" : "维C果糖",
    "admin" : true
}
```

使用 Base64 编码以后就变成了这个样子：



```undefined
eyJpc3MiOiJuaW5naGFvLm5ldCIsImV4cCI6IjE0Mzg5NTU0NDUiLCJuYW1lIjoid2FuZ2hhbyIsImFkbWluIjp0cnVlfQ
```

###### 2.3 Signature

JWT 的最后一部分是 Signature ，这部分内容有三个部分，先是用 Base64 编码的 header 和 payload ，再用加密算法加密一下，加密的时候要放进去一个 Secret ，这个相当于是一个密码，这个密码秘密地存储在服务端。



```csharp
header
payload
secret
var encodedString = base64UrlEncode(header) + "." + base64UrlEncode(payload); 
HMACSHA256(encodedString, 'secret');
```

处理完成以后看起来像这样：



```undefined
SwyHTEx_RQppr97g4J5lKXtabJecpejuef8AqKYMAJc
```

最后这个在服务端生成并且要发送给客户端的 Token 看起来像这样：



```css
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJuaW5naGFvLm5ldCIsImV4cCI6IjE0Mzg5NTU0NDUiLCJuYW1lIjoid2FuZ2hhbyIsImFkbWluIjp0cnVlfQ.SwyHTEx_RQppr97g4J5lKXtabJecpejuef8AqKYMAJc
```

客户端收到这个 Token 以后把它存储下来，下回向服务端发送请求的时候就带着这个 Token 。服务端收到这个 Token ，然后进行验证，通过以后就会返回给客户端想要的资源。

##### 3.Web安全

Token，我们称之为“令牌”，其最大的特点就是随机性，不可预测。一般黑客或软件无法猜测出来。那么，Token 有什么作用？又是什么原理呢？

Token 一般用在两个地方:



```go
`防止表单重复提交；
Anti CSRF 攻击（跨站点请求伪造）。`
```

两者在原理上都是通过 session token 来实现的。当客户端请求页面时，服务器会生成一个随机数 Token，并且将 Token 放置到 session 当中，然后将 Token 发给客户端（一般通过构造 hidden 表单）。下次客户端提交请求时，Token 会随着表单一起提交到服务器端。

然后，如果应用于“Anti CSRF攻击”，则服务器端会对 Token 值进行验证，判断是否和session中的Token值相等，若相等，则可以证明请求有效，不是伪造的。不过，如果应用于“防止表单重复提交”，服务器端第一次验证相同过后，会将 session 中的 Token 值更新下，若用户重复提交，第二次的验证判断将失败，因为用户提交的表单中的 Token 没变，但服务器端 session 中 Token 已经改变了。

上面的 session 应用相对安全，但也叫繁琐，同时当多页面多请求时，必须采用多 Token 同时生成的方法，这样占用更多资源，执行效率会降低。因此，也可用 cookie 存储验证信息的方法来代替 session Token。比如，应对“重复提交”时，当第一次提交后便把已经提交的信息写到 cookie 中，当第二次提交时，由于 cookie 已经有提交记录，因此第二次提交会失败。不过，cookie 存储有个致命弱点，如果 cookie 被劫持（XSS 攻击很容易得到用户 cookie），那么又一次 game over，黑客将直接实现 CSRF 攻击。所以，安全和高效相对的，具体问题具体分析吧！

此外，要避免“加 token 但不进行校验”的情况，在 session 中增加了 token，但服务端没有对 token 进行验证，这样根本起不到防范的作用。还需注意的是，对数据库有改动的增、删、改操作，需要加 token 验证，对于查询操作，一定不要加 token，防止攻击者通过查询操作获取 token 进行 CSRF攻击。但并不是这样攻击者就无法获得 token，只是增大攻击成本而已。

##### 4.结合后端开发再次理解token生成过程

在Java的实现中可以有两种方式，一种是不借助第三方jar，自己生成token，另一种的借助第三方jar，传入自己需要的负荷信息，生成token。接下来就根据这两个逐个说明。Token的组成就是header.poyload.sign。

###### 4.1自己生成token：

`header`和`poyload`的组成都是json字符串，所以先创建头部的json，然后用`base64`编码`(org.apache.axis.encoding.Base64)，`这里选择的`base64`要对应着编码和解码（`Base64`是一种编码，也就是说，它是可以被翻译回原来的样子来的。它并不是一种加密过程）。然后再创建负荷的json，然后也同样用`base64`编码，这样就生成了两个字符串，然后用.拼接到一起就形成了现在的形式：



```css
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcm9tX3VzZXIiOiJCIiwidGFyZ2V0X3VzZXIiOiJBIn0。
```

在这里只是给大家一个演示，
实际中根据每个人的负荷参数的不同，编码后所生成的字符串也不同。因为没有借助第三方的jar，
所有接下来要对上边拼接成的字符串进行hs256的算法加密生成sign签名，这里需要自己手动去写一个类，然后提供一
个静态方法供外界的调用。
类的实现代码如下：



```swift
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;
public class HS256 {
public static String returnSign(String message) {
    String hash = "";
    //别人篡改数据，但是签名的密匙是在服务器存储，密匙不同，生成的sign也不同。
    //所以根据sign的不同就可以知道是否篡改了数据。
    String secret = "mystar";//密匙
    try {
        Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secret_key = new SecretKeySpec(secret.getBytes(),"HmacSHA256");
        sha256_HMAC.init(secret_key);
        hash = Base64.encodeBase64String(sha256_HMAC.doFinal(message.getBytes()));
        System.out.println(message+"#####"+hash);
    } catch (Exception e) {
        System.out.println("Error");
    }
        return hash;
    }
}
```

这样token的三部分就生成了，然后当做参数传到前台，用`cookie`或者`localstore(推荐)`存储就可以在同一客户端调用了。
当从客户端带过来token参数的时候，直接对头部和负荷再次调用加密算法，看生成的新的签名和之前的签名是否一致，判断数据是否被篡改。

###### 4.2借用第三方的jar(jjwt-0.7.0.jar)生成token：

在这里自己已经通过代码测试，直接先看代码：



![img](https://upload-images.jianshu.io/upload_images/20091178-345c7210916e5aba.png?imageMogr2/auto-orient/strip|imageView2/2/w/885/format/webp)

java后端生成token代码

调用这个方法会自动对header和poyload进行base64的编码，你看过源码就知道它用的是哪一种，用的是自己jar包自带的(io.jsonwebtoken.impl.Base64Codec)，跟自己生成token时，用的base64的jar不一样，自己在此列出来：



```tsx
public static void main(String[] args) {
        // String token = createJWT("11","22","222",11);
        // System.out.println(token);
        JSONObject json_header = new JSONObject();
        json_header.put("typ", "JWT");//类型
        json_header.put("alg", "HS256");//加密算法
        // String header =
        // org.apache.axis.encoding.Base64.encode(json_header.toString().getBytes());
        String header = Base64Codec.BASE64URL.encode(json_header.toString()
                .getBytes());
        String aa = Base64Codec.BASE64URL.decodeToString(header);
        System.out.println(header + "--" + aa);
    }
```

接着上边createJWT()方法说，只要把自己定义的负荷json串当做参数传入就行，并且签名也会对应的生成，返回一个完整的token。在测试的过程中，发现即使自己不定义token的头部，也会自动生成header，只是里边没有typ这样的参数定义，只有HS256，这里源码里边，默认了alg的value。在这里我想说明的是，`假如外界会篡改参数，他肯定也知道构成，会把负荷里边的参数取出来，也许会修改，然后编码放回去，但是头部的信息对他来说用处不大，所以自己在这个方法里边，默认把头部加上，负荷的值还是自己在调用的时候传入进来。`这样执行完，把生成的token就当做参数传到前台，存储在cookie里边。
然后再说一下，前台带过来token参数时候，怎么处理，看代码：

![img](https://upload-images.jianshu.io/upload_images/20091178-e3c519639cb7a633.png?imageMogr2/auto-orient/strip|imageView2/2/w/1123/format/webp)

token对比代码

这个过程的原理跟自己生成token判断原理一样，都是从新生成sign，只是一个是调用自己的方法，另外一个是调用第三方的方法，自己看了源码（`public abstract JwtBuilder signWith(SignatureAlgorithm paramSignatureAlgorithm, String paramString);`），没能单独把第三方生成sign的方法提出来，只是一个接口，但是跟上边的加密算法实现原理应该是基本一致的。



至此，token签名这一块的问题大致就先说到这了，然后再来说一下token过期时间问题。这个相对来说不是太复杂，可以在负荷里边多带一个参数，把过期时间放进去，其实里边有一个exp标签名就是存储过期时间字段的，但是自己在测试过程中，发现每次读出来的都是最原始的时间，自己当时也再花时间去看，因为我觉得自己带参数其实一个道理。存储的是时间戳。

###### 存储：



```cpp
long nowMillis = System.currentTimeMillis();
long expMillis = nowMillis + 1000*2;//设置token二秒过期
```

###### 获取：



```jsx
Date aa = new Date(Long.parseLong(claims.get("aa").toString()));
```

方式就是这样了，我大概列了出来。到时可以存储一个生成token时间和token过期时间，然后服务器接收到的时候，可以根据当前的时间去判断。当前时间大于token生成时间并且小于token过期时间的情况下，继续走你接下来的业务操作。

##### 5.token被劫持了，怎样解决这个安全问题



```swift
a、在存储的时候把 token 进行对称加密存储，用时解开。
b、将请求 URL、时间戳、token 三者进行合并加盐签名，服务端校验有效性。
c、HTTPS 对 URL 进行判断。
```

HTTP 协议是无状态的，在web中使用cookie+session的技术来保持用户登陆的状态
移动端使用token来保持用户登陆状态由于token在网络中传输，很容易被中间人获取，进而模拟用户进行其他相关操作

##### 解决办法：

###### 服务器端

响应头增加随机字符串 CSRF_TOKEN=xxxxxxxxxxx（每次请求都不同）

###### 客户端

客户端和服务端 保留密钥 secret = yyyyyyyyy
客户端获取响应头CSRF_TOKEN下次请求必须携带
客户端 （secret+提交内容） 进行签名
当用户提交信息到服务器端，首先验证签名数据是否被篡改，随后通过token+随机字符串比对，正确的话执行操作，刷新随机字符串，即使token被中间人获取到了，没有随机字符串依旧执行不了任何操作，再糟糕点中间人通过拦截响应头获取到了随机字符串，但是密钥还没泄露，没有办法进行签名依旧执行不了操作

###### 缺点：

以上解决办法只适用于APP端，浏览器端不适用，因为没地方保存密钥

###### 总结：

所以能上 HTTPS 就用 HTTPS 吧！

### 名称解释：

> [1] XSS 攻击：跨站脚本攻击(Cross Site Scripting)，恶意攻击者往 Web 页面里插入恶意 Script 代码，当用户浏览该页之时，嵌入其中 Web 里面的 Script 代码会被执行，从而达到恶意攻击用户的目的。

> [2] CSRF 攻击：CSRF（Cross-site request forgery）跨站请求伪造，也被称为“One Click Attack”或者 Session Riding，通常缩写为 CSRF 或者 XSRF，是一种对网站的恶意利用。尽管听起来像跨站脚本（XSS），但它与 XSS 非常不同，XSS 利用站点内的信任用户，而 CSRF 则通过伪装来自受信任用户的请求来利用受信任的网站。与 XSS 攻击相比，CSRF 攻击往往不大流行（因此对其进行防范的资源也相当稀少）和难以防范，所以被认为比 XSS 更具危险性。