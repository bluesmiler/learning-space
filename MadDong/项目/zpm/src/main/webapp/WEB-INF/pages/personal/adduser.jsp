<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=request.getContextPath()%>/hui/"/>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="Bookmark" href="/favicon.ico" >
	<link rel="Shortcut Icon" href="/favicon.ico" />
	<!--[if lt IE 9]>
	<script type="text/javascript" src="lib/html5shiv.js"></script>
	<script type="text/javascript" src="lib/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>添加用户</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理<span class="c-gray en">&gt;</span> 用户信息修改 <a class="btn btn-success radius r" id="fresh" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

<article class="page-container">
	<form action="../user/updatePwd" method="post" class="form form-horizontal" >
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="hidden" value="${user.userId}" name="userId"/>
				<input type="text" style="width: 300px" class="input-text" value="${user.truename}" placeholder="" id="username" name="truename">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>昵称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" style="width: 300px" class="input-text" value="${user.nickname}" placeholder="" id="nickname" name="nickname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select class="select"  style="width: 300px" name="role.roleId" id="">
					<c:forEach items="${roleList}" var="role">
						<option value="${role.roleId}" ${role.roleId == user.role.roleId ? 'selected' : '' }>${role.roleName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<c:choose>
					<c:when test="${user.sex == '男' }">
						<div class="radio-box">
							<input name="sex" type="radio" id="sex-1" checked="checked" value="男">
							<label for="sex-1">男</label>
						</div>
						<div class="radio-box">
							<input name="sex" type="radio"  value="女">
							<label for="sex-1">女</label>
						</div>
					</c:when>
					<c:otherwise>
						<div class="radio-box">
							<input name="sex" type="radio"   value="男">
							<label for="sex-1">男</label>
						</div>
						<div class="radio-box">
							<input name="sex" type="radio" checked="checked"  value="女">
							<label for="sex-1">女</label>
						</div>
					</c:otherwise>

				</c:choose>

			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" style="width: 300px" class="input-text" value="${user.phone}" placeholder="" id="phone" name="phone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" style="width: 300px" value="${user.email}" class="input-text" placeholder="@" name="email" id="email">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">所在小区：</label>
			<div class="formControls col-xs-8 col-sm-9">

				<select class="select"  style="width: 300px" name="comm.comm_id" id="commId">

					<c:forEach items="${commVoList}" var="commVo">
						<option value="${commVo.commId}" ${commVo.commId == user.commId ? 'selected' : '' }>${commVo.commName}</option>
					</c:forEach>
				</select>

			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">所在单元：</label>
			<div class="formControls col-xs-8 col-sm-9">

				<select class="select"  style="width: 300px" name="user.unitId" id="unitId">

					<c:forEach items="${commVoList}" var="commVo" >
						<c:if test="${commVo.commId==user.commId}">
							<c:forEach items="${commVo.units}" var="unit">
								<option value="${unit.unitId}" ${unit.unitId == user.unitId ? 'selected' : '' }>${unit.unitName}</option>
							</c:forEach>
						</c:if>
					</c:forEach>

				</select>

			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">所在房间：</label>
			<div class="formControls col-xs-8 col-sm-9">

				<select class="select"  style="width: 300px" name="user.home.home_id" id="homeId">
					<c:forEach items="${commVoList}" var="commVo" >
						<c:if test="${commVo.commId==user.commId}">
							<c:forEach items="${commVo.units}" var="unit">
								<c:if test="${unit.unitId==user.unitId}">
									<c:forEach items="${unit.homes}" var="home">
										<option value="${home.home_id}" ${home.home_id == user.home.home_id ? 'selected' : '' }>${home.home_id}</option>
									</c:forEach>
								</c:if>
							</c:forEach>
						</c:if>
					</c:forEach>
				</select>

			</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">

$(function(){

    $('#commId').change(
        function () {
			var commId = $('#commId').val();

			$.post("../user/findByCommId",{
			    commId:commId
			},function (data) {
			    alert(data);

//			    $('#commId').options.length=0
//			    $.each(data.comments, function (index,unit) {
//                    $('#commId').options.add(new Option(unit.unitName,unit.unitId))
//                })
            })
        }
	)
	$('#unitId').change(function () {
		var unitId = $$('#unitId').val()
		$.post("../home/findByCommId",{
		    unitId:unitId
		},function (data) {
		    alert(data);
//            $('#unitId').options.length=0
//            $.each(data.comments, function (index,home) {
//                $('#unitId').options.add(new Option(home.home_name,home.home_id))
//            })
        })
    })






















	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-member-add").validate({
        rules:{
            username:{
                required:true,
                minlength:2,
                maxlength:16
            },
            password:{
                required:true,
                minlength:6,
                maxlength:16
            },
            sex:{
                required:true,
            },
            phone:{
                required:true,
                isPhone:true,
            },
            email:{
                required:true,
                email:true,
            },
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            $(form).ajaxSubmit();
            var index = parent.layer.getFrameIndex(window.name);
        }
    });


});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>