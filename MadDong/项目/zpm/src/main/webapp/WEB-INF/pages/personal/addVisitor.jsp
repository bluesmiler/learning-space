
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>访客信息填写</title>
    <base href="<%=request.getContextPath()%>/"/>
</head>
<body>


        访客姓名；<input type="text" id="visitorName"/>
        访客性别：
                <select id="select">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                <input type="button" value="提交" id="btn"/>



        <%--<input type="radio" value="男" name="visitorSex" checked="checked" />男--%>
        <%--<input type="radio" value="女" name="visitorSex"/>女--%>



    <div> <img id="img" /></div>

</body>
</html>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#btn").click(function () {
            $.post("visitor/visitorAdd",{
                "visitorName":$("#visitorName").val(),
                "visitorSex":$('#select').val()
            },function (data) {
                $('#img').attr("src","show/"+data.toString())
            })
        })
    })
    
</script>
