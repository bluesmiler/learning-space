<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<base href="<%=request.getContextPath()%>/"/>
<head>
	<script type="text/javascript" src="umeditor/third-party/jquery.min.js"></script>
	<script type="text/javascript" src="umeditor/third-party/template.min.js"></script>

	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<script src="js/jquery.min.js"></script>
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Games Center Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script src="js/modernizr.custom.js"></script>
	<link rel="stylesheet" type="text/css" href="css/component.css" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>即时聊天</title>
	<!-- Set render engine for 360 browser -->
	<meta name="renderer" content="webkit">
	<!-- No Baidu Siteapp-->
	<meta http-equiv="Cache-Control" content="no-siteapp" />

	<link rel="stylesheet" href="assets/css/amazeui.min.css">
	<link rel="stylesheet" href="assets/css/app.css">
	<!-- umeditor css -->
	<link href="umeditor/themes/default/css/umeditor.css" rel="stylesheet">
	<style>
		body{


		}
		.title {
			text-align: center;
		}
		.chat-content-container {
			height: 29rem;
			overflow-y: scroll;
			border: 1px solid silver;
		}
	</style>
</head>
<body>
<!-- title start -->
<div class="title">
	<div class="am-g am-g-fixed">
		<div class="am-u-sm-12">
			<h1 class="am-text-primary">mad dog Chat</h1>
		</div>
	</div>
</div>
<!-- title end -->
<!-- chat content start -->
<div class="chat-content">
	<div class="am-g am-g-fixed chat-content-container">
		<div class="am-u-sm-12">
			<ul id="message-list" class="am-comments-list am-comments-list-flip"></ul>
		</div>
	</div>
</div>
<!-- chat content start -->
<!-- message input start -->
<div class="message-input am-margin-top">
	<div class="am-g am-g-fixed">
		<div class="am-u-sm-12">
			<form class="am-form">
				<div class="am-form-group">
					<script type="text/plain" id="myEditor" style="width: 100%;height: 8rem;"></script></div>
                    </form>
                    </div>
                    </div>
                    <div class="am-g am-g-fixed am-margin-top">
                        <div class="am-u-sm-6">
                        <div id="message-input-nickname" class="am-input-group am-input-group-primary">
                        <input id="nickname" type="hidden" value="${user.nickname}" class="am-form-field" />
                        </div>
                        </div>
                        <div class="am-u-sm-6">
                        <button id="send" type="button" class="am-btn am-btn-primary">
                        <i class="am-icon-send"></i> Send
                        </button>
                        </div>
                        </div>
                        </div>
                        <!-- message input end -->
                        <!--[if (gte IE 9)|!(IE)]><!-->
                    <script src="assets/js/jquery.min.js"></script>
					<!--<![endif]-->
					<!--[if lte IE 8 ]>
					<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
					<![endif]-->
					<!-- umeditor js -->
					<!-- umeditor js -->
					<script charset="utf-8" src="umeditor/umeditor.config.js"></script>
					<script charset="utf-8" src="umeditor/umeditor.min.js"></script>
					<script src="umeditor/lang/zh-cn/zh-cn.js"></script>
					<script>
                        $(function() {
                            // 初始化消息输入框
                            var um = UM.getEditor('myEditor');
                            // 使昵称框获取焦点
                            $('#nickname')[0].focus();
                            var um = UM.getEditor('myEditor');
                            $('#nickname')[0].focus();
                            // 新建WebSocket对象，最后的/websocket对应服务器端的@ServerEndpoint("/websocket")
                            var socket = new WebSocket('ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/websocket');
                            // 处理服务器端发送的数据
                            socket.onmessage = function(event) {
                                addMessage(event.data);

                            };
                            // 点击Send按钮时的操作
                            $('#send').on('click', function() {
                                var nickname = $('#nickname').val();
                                if (!um.hasContents()) {    // 判断消息输入框是否为空
                                    // 消息输入框获取焦点
                                    um.focus();
                                    // 添加抖动效果
                                    $('.edui-container').addClass('am-animation-shake');
                                    setTimeout("$('.edui-container').removeClass('am-animation-shake')", 1000);
                                } else if (nickname == '') {    // 判断昵称框是否为空
                                    //昵称框获取焦点
                                    $('#nickname')[0].focus();
                                    // 添加抖动效果
                                    $('#message-input-nickname').addClass('am-animation-shake');
                                    setTimeout("$('#message-input-nickname').removeClass('am-animation-shake')", 1000);
                                } else {
                                    // 发送消息
                                    socket.send(JSON.stringify({
                                        content : um.getContent(),
                                        nickname : nickname
                                    }));
                                    // 清空消息输入框
                                    um.setContent('');
                                    // 消息输入框获取焦点
                                    um.focus();
                                }

                            });

                            // 把消息添加到聊天内容中
                        });
					</script>
					<script type="text/javascript">
                        function addMessage(message) {
                            $.post("qq/jl",{
                                qqhis:message
                            },function(data,status){

                            })

                            message = JSON.parse(message);

                            var messageItem = '<li class="am-comment '
                                + (message.isSelf ? 'am-comment-flip' : 'am-comment')
                                + '">'
                                + '<a href="javascript:void(0)" ><img src="assets/images/'
                                + (message.isSelf ? 'self.png' : 'others.jpg')
                                + '" alt="" class="am-comment-avatar" width="48" height="48"/></a>'
                                + '<div class="am-comment-main"><header class="am-comment-hd"><div class="am-comment-meta">'
                                + '<a href="javascript:void(0)" class="am-comment-author">'
                                + message.nickname + '</a> <time>' + message.date
                                + '</time></div></header>'
                                + '<div class="am-comment-bd">' + message.content
                                + '</div></div></li>';
                            $(messageItem).appendTo('#message-list');
                            // 把滚动条滚动到底部
                            $(".chat-content-container").scrollTop($(".chat-content-container")[0].scrollHeight);
                        }
					</script>

</body>
</html>

