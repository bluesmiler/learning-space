<%--
  Created by IntelliJ IDEA.
  User: tzj
  Date: 2017/10/30
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <base href="<%=request.getContextPath()%>/">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>商户注册</title>
        <!--[if lt IE 9]>
        <script src="tian/js/html5shiv.js"></script>
        <![endif]-->
        <link href="tian/css/normalize.css" rel="stylesheet"/>
        <link href="tian/css/jquery-ui.css" rel="stylesheet"/>
        <link href="tian/css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>
        <style type="text/css">
            body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:url(tian/images/pattern.png);overflow-y:scroll;padding:60px 0 0 0;}
            #my-form{width:755px;margin:0 auto;border:1px solid #ccc;padding:3em;border-radius:3px;box-shadow:0 0 2px rgba(0,0,0,.2);}
            #comments{width:350px;height:100px;}
        </style>
</head>
<body>
<div class="row">
    <div class="eightcol last">
        <form id="my-form" enctype="multipart/form-data" method="post" action="bus/save">
            <section name="商户注册">
                <div><label>手机号:</label><input id="username" name="userName" type="text"/></div>
                <div><label>密码:</label><input id="pass" name="passWord" type="password"/></div>
                <div><label>店铺名称:</label><input id="email" name="name" type="text"/></div>
                <div><label>上传店铺照片:</label><input id="file" name="file" multiple type="file"/></div>
            </section>
            <div>
                <button type="submit">提交</button>
                <button id="reset" type="button">重置</button>
            </div>
        </form>
    </div>
</div>
<div style="text-align:center;">
    <p>来源：<a href="http://www.mycodes.net/" title="源码之家" target="_blank">源码之家</a></p>
</div>
</body>
</html>
<script type="text/javascript" src="tian/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="tian/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="tian/js/jquery.idealforms.js"></script>
<script type="text/javascript">
    var options = {
        onFail: function(){
            alert( $myform.getInvalid().length +' invalid fields.' )
        },
        inputs: {
            'password': {
                filters: 'required pass',
            },
            'username': {
                filters: 'required username',
                data: {
                    //ajax: { url:'validate.php' }
                }
            },
            'file': {
                filters: 'extension',
                data: { extension: ['jpg'] }
            },
            'comments': {
                filters: 'min max',
                data: { min: 50, max: 200 }
            },
            'states': {
                filters: 'exclude',
                data: { exclude: ['default'] },
                errors : {
                    exclude: '选择国籍.'
                }
            },
            'langs[]': {
                filters: 'min max',
                data: { min: 2, max: 3 },
                errors: {
                    min: 'Check at least <strong>2</strong> options.',
                    max: 'No more than <strong>3</strong> options allowed.'
                }
            }
        }

    };
    var $myform = $('#my-form').idealforms(options).data('idealforms');

    $('#reset').click(function(){
        $myform.reset().fresh().focusFirst()
    });
    $myform.focusFirst();
</script>

