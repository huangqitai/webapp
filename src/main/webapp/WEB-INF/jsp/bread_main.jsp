<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="tagJsp.jsp"%>
<html>
<head>
    <title>面包的主页</title>
    <style type="text/css">
        #mainDiv{
        width: 400px;
        height: 300px;
        background-color: darksalmon;
        margin: auto;
        }
    </style>
</head>
<script src="${cPath}/js/jquery-3.2.1.js"></script>
<body>
<div id="mainDiv">
    <h1>面包主页</h1>
    <a id="showBread" href="#" onclick="showBread()">查看用户信息</a><br/>
    用户名：<p id="bread_name"></p>
    用户密码：<p id="bread_pw"></p>
    <br/>
    <br/>
    <a href="${cPath}/BreadController/dispatcher.do">测试拦截器</a>
    <a href="${cPath}/BreadController/getBreadAll.do">用户列表</a>
</div>
</body>
<script>
    function showBread(){
        console.log("点击了a标签");
        $.ajax({
            type:"POST",
            url:"${cPath}/BreadController/getBread.do",
            data:"{}",
            dataType:"JSON",
            complete:function (result) {
                var bread = JSON.parse(result.responseText);
                $("#bread_name").text(bread[0].loginName);
                $("#bread_pw").text(bread[0].loginPassword);
            }
        });
    }
</script>
</html>
