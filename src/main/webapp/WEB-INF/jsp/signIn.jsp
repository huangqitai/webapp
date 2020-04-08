<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="tagJsp.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <style type="text/css">
        /*.userForm{
            margin-left: 40%;
            margin-top: 20%;
        }*/
        table{
            margin-left: auto;
            margin-right: auto;
            height: 120px;
            width: 300px;
            background-color: bisque;
            margin-top: 10%;
        }

    </style>
</head>
<script src="${cPath}/js/jquery-3.2.1.js"></script>
<body>
<form class="userForm">
    <table class="userTable">
        <tr>
            <td>用户名：</td>
            <td><input id="username" type="text" name="username" placeholder="请输入用户名"/></td>

        </tr>
        <tr>
            <td>密码：</td>
            <td><input id="pw" type="password" name="PW" placeholder="请输入密码"/></td>
        </tr>

        <tr>
            <td></td>
            <td><input id="signIn" type="button" value="注册"/></td>
        </tr>

    </table>
</form>
</body>
<script>
    $("#signIn").click(function () {
        console.log("点击注册");
        var username = $("#username").val();
        var PW = $("#pw").val();
        $.ajax({
            type:"POST",
            url:"${cPath}/BreadController/signInDo.do",
            data: {
                login_name:username,
                login_password: PW
            },
            dataType:"JSON",
            success: function(data) {
                if(data.signCode == 0) {
                   alert("注册失败，请重试");
                } else if(data.signCode == 1) {

                    alert("注册成功，去登录")
                    window.location.href="${cPath}/index.jsp";
                }
            },
        });
    })
</script>
</html>