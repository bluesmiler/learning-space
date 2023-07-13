<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的购物车</title>
    <base href="<%=request.getContextPath()%>/">
    <link href="tian/css/wedding-2.css" rel="stylesheet"/>
    <link href="tian/css/wedding-3.css" rel="stylesheet"/>
</head>
<body>
<div id="page_Auser">
    <div class="layout_center layout_clear">
        <div id="us_fr" class="layout_fl">
            <div class="us_ChildPage us_adjust_padding2 us2_PageUint2">
                <h4 class="us_ChildHead">我的购物车</h4>
                <div class="us_buycar">
                    <li style="text-align:center;display:none">购物车空空的</li>
                    <ul class="us_buycar_wrap"  style="" id="cart">
                        <c:forEach items="${shoppingList}" var="shopping">
                            <li>
                                <div class="layout_clear">
                                    <div class="us_buycar_check layout_fl">
                                        <input type="checkbox" value="${shopping.id }" name="single" id="BuyCarCheck">
                                    </div>
                                    <div class="us_unit_table layout_fl">
                                        <div class="us_order_line"><span>${shopping.time}</span><span>订单号:</span><span>${shopping.orderName }</span></div>
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td><span class="cos_span">商品图片</span></td>
                                                <td><span class="cos_span">商品名称</span></td>
                                                <td><span class="cos_span">单价</span></td>
                                                <td><span class="cos_span">数量</span></td>
                                                <td><span class="cos_span">总金额</span></td>
                                                <td><span class="cos_span">操作</span></td>
                                            </tr>
                                            <tr>
                                                <td><div class="img"><img src="good/show/${shopping.image}" style="width:100px;"></div></td>
                                                <td><span class="cos_span">${shopping.name}</span></td>
                                                <td><span class="cos_span" style="display:block"><ins></ins></span><span class="cos_span">${shopping.price}</span></td>
                                                <td>
                                                        <span class="cos_span">
                                                            <span class="amont_line">
                                                                <span class="amont_line_btn amont_line_reduce" id="cut">-</span>
                                                                <span class="amont_line_text" id="count">${shopping.count}</span>
                                                                <span class="amont_line_btn amont_line_push" id="add">+</span>
                                                            </span>
                                                        </span>
                                                </td>
                                                <td><span class="cos_span"><em class="keyword-pink shopPrice" >${shopping.count*shopping.price}</em></span></td>
                                                <td><span class="cos_span"><a href="cart/delete?id=${shopping.id}">删除</a></span></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="us_bottom_bar layout_clear">
                    <div class="us_buycar_check layout_fl"><input type="checkbox" id="BuyCarCheckAll" style="margin-top: 25px;" onclick="CheckAll()"></div>
                    <div class="us_buycar_state layout_fl">
                        <span class="cos_span"><a onclick="CheckAllA()">全选</a></span>
                        <span class="cos_span"><a onclick="deleteShopCart()">清空购物车</a></span>
                    </div>
                    <div class="us_buycar_buy layout_fr">
                        <span class="cos_span">已选择<span id="selectCount">0</span>件商品</span>
                        <span class="cos_span">总价：<em class="keyword-pink" id="allPrice"></em></span>
                        <a class="us_button" onclick="payTheSelect()">去结算</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="tian/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
    $("#login_register").hide();
    $("#login_register").hover(function(){
        $("#login_register").show();
    },function(){
        $("#login_register").hide();
    });
    $("#member_center").mouseover(function (){
        $("#login_register").show();
    });
    var cutList = document.all["cut"];
    if (cutList.length==undefined) {
        $("#cut").click(function() {
            if (Number($(this).next("span").text())>1) {
                var cutcounts=Number($(this).next("span").text())-1;
                $(this).next("span").text(cutcounts);
                var cutallPrice = Number($(this).parent().parent().parent().prev("td").text())*cutcounts+".00";
                $(this).parent().parent().parent().next("td").find("em").text(cutallPrice);
                $.post("ShoppingCartServlet",
                    {
                        shoppingcart_name:$(this).parent().parent().parent().prev("td").prev("td").prev("td").find("div").find("span").text(),
                        shoppingcart_type:$(this).parent().parent().parent().prev("td").prev("td").find("span:first").attr('id'),
                        shoppingcart_place:$(this).parent().parent().parent().prev("td").prev("td").find("span:last").attr('id'),
                        shoppingcart_count:cutcounts
                    },
                    function(data,status){

                    });
            } else {
                alert("不能再减少了");
            }
        });
    }else {
        for (var i = 0; i < cutList.length; i++){
            var cuts = cutList[i];
            $(cuts).click(function() {
                if (Number($(this).next("span").text())>1) {
                    var cutcounts=Number($(this).next("span").text())-1;
                    $(this).next("span").text(cutcounts);
                    var cutallPrice = Number($(this).parent().parent().parent().prev("td").text())*cutcounts+".00";
                    $(this).parent().parent().parent().next("td").find("em").text(cutallPrice);
                    $.post("ShoppingCartServlet",
                        {

                            shoppingcart_name:$(this).parent().parent().parent().prev("td").prev("td").prev("td").find("div").find("span").text(),
                            shoppingcart_type:$(this).parent().parent().parent().prev("td").prev("td").find("span:first").attr('id'),
                            shoppingcart_place:$(this).parent().parent().parent().prev("td").prev("td").find("span:last").attr('id'),
                            shoppingcart_count:cutcounts
                        },
                        function(data,status){

                        });
                } else {
                    alert("不能再减少了");
                }
            });
        }
    }
    var addList = document.all["add"];
    if (addList.length==undefined) {
        $("#add").click(function() {
            var addcounts=Number($(this).prev("span").text())+1;
            $(this).prev("span").text(addcounts);
            var addallPrice = Number($(this).parent().parent().parent().prev("td").text())*addcounts+".00";
            $(this).parent().parent().parent().next("td").find("em").text(addallPrice);
            $.post("ShoppingCartServlet",
                {
                    shoppingcart_name:$(this).parent().parent().parent().prev("td").prev("td").prev("td").find("div").find("span").text(),
                    shoppingcart_type:$(this).parent().parent().parent().prev("td").prev("td").find("span:first").attr('id'),
                    shoppingcart_place:$(this).parent().parent().parent().prev("td").prev("td").find("span:last").attr('id'),
                    shoppingcart_count:addcounts
                },
                function(data,status){

                });
        });
    } else {
        for (var i = 0; i < addList.length; i++) {
            var adds = addList[i];
            $(adds).click(function() {
                var addcounts=Number($(this).prev("span").text())+1;
                $(this).prev("span").text(addcounts);
                var addallPrice = Number($(this).parent().parent().parent().prev("td").text())*addcounts+".00";
                $(this).parent().parent().parent().next("td").find("em").text(addallPrice);
                $.post("ShoppingCartServlet",
                    {
                        shoppingcart_name:$(this).parent().parent().parent().prev("td").prev("td").prev("td").find("div").find("span").text(),
                        shoppingcart_type:$(this).parent().parent().parent().prev("td").prev("td").find("span:first").attr('id'),
                        shoppingcart_place:$(this).parent().parent().parent().prev("td").prev("td").find("span:last").attr('id'),
                        shoppingcart_count:addcounts
                    },
                    function(data,status){

                    });
            });
        }
    }
    var sum =0;
    var count =0;
    var BuyCarCheck = document.all['BuyCarCheck'];
    var BuyCarCheckAll = document.all['BuyCarCheckAll'];
    var priceSum=0;
    if (BuyCarCheck.length==undefined) {
        priceSum = priceSum+Number($(".shopPrice").text());
    } else {
        for(var i=0;i<=BuyCarCheck.length;i++){
            priceSum = priceSum+Number($(".shopPrice:eq("+i+")").text());
        }
    }
    function CheckAll() {
        if(BuyCarCheckAll.checked){
            if(BuyCarCheck.length){
                for(var i=0;i<BuyCarCheck.length;i++){
                    BuyCarCheck[i].checked = true;
                }
            }else{
                BuyCarCheck.checked = true;
            }
            $("#selectCount").text(BuyCarCheck.length);
            $("#allPrice").text(priceSum+".00");
        }else{
            if(BuyCarCheck.length){
                for(var i=0;i<BuyCarCheck.length;i++){
                    BuyCarCheck[i].checked = false;
                }
            }else{
                BuyCarCheck.checked = false;
            }
            $("#selectCount").text(0);
            $("#allPrice").text("0.00");
        }
    }
    function CheckAllA() {
        $("#selectCount").text(BuyCarCheck.length);
        $("#allPrice").text(priceSum+".00");
        if(BuyCarCheck.length){
            for(var i=0;i<BuyCarCheck.length;i++){
                BuyCarCheck[i].checked = true;
                BuyCarCheckAll.checked=true;
            }
        }else{
            BuyCarCheck.checked = true;
            BuyCarCheckAll.checked=true;
        }
    }
    //<!--批量删除购物车-->
    function deleteShopCart(){
        //获取所有复选框
        var allShop=document.getElementsByName("single");
        var ids="";
        for(var i=0;i<allShop.length;i++){
            if(allShop[i].checked){
                ids += allShop[i].value+",";
            }
        }
        alert(ids);
        if(ids.length==0){
            alert("删除的购物车记录不能为空，请重新选择");
            return false;
        }
        $.post("cart/deleteBatch",{
            newId:ids
        },function (data) {
            if(data="success"){
                location.reload();
            }
        });
    }
    if (BuyCarCheck.length==undefined) {
        $("#BuyCarCheck").click(function() {
            if ($(this).prop("checked")==true) {
                var price = Number($(this).parent().next("div").find("table").find("tbody").find("tr:nth-child(2)").find("td:nth-child(5)").find("span").text());
                count=Number($("#selectCount").text())+1;
                sum = Number($("#allPrice").text())+price;
            } else {
                BuyCarCheckAll.checked=false;
                var price = Number($(this).parent().next("div").find("table").find("tbody").find("tr:nth-child(2)").find("td:nth-child(5)").find("span").text());
                count=Number($("#selectCount").text())-1;
                sum = Number($("#allPrice").text())-price;
            }
            $("#selectCount").text(count);
            $("#allPrice").text(sum+".00");
        });
    } else {
        for(var i=0;i<BuyCarCheck.length;i++){
            var buyCheck = BuyCarCheck[i];
            $(buyCheck).click(function() {
                if ($(this).prop("checked")==true) {
                    var price = Number($(this).parent().next("div").find("table").find("tbody").find("tr:nth-child(2)").find("td:nth-child(5)").find("span").text());
                    count=Number($("#selectCount").text())+1;
                    sum = Number($("#allPrice").text())+price;
                } else {
                    BuyCarCheckAll.checked=false;
                    var price = Number($(this).parent().next("div").find("table").find("tbody").find("tr:nth-child(2)").find("td:nth-child(5)").find("span").text());
                    count=Number($("#selectCount").text())-1;
                    sum = Number($("#allPrice").text())-price;
                }
                $("#selectCount").text(count);
                $("#allPrice").text(sum+".00");
            });
        }
    }
    //<!--批量选择购物车商品去结算界面-->
    function payTheSelect(){
        //获取所有复选框
        var allShop=document.getElementsByName("single");
        var ids="";
        for(var i=0;i<allShop.length;i++){
            if(allShop[i].checked){
                ids += allShop[i].value+",";
            }
        }
        if(ids.length==0){
            alert("付款的购物车商品不能为空，请重新选择");
            return false;
        }
        if(confirm("确认要去结算这些商品吗？")){
            window.location.href="ShoppingCartServlet?method=doPayment&ids="+ids;
        }
    }
</script>
</body>
</html>