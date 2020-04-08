<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/tagJsp.jsp" %>
<html>
<head>
<title>面包登陆</title>
    <style type="text/css">
        .login_div{
            width: 300px;
            height: 200px;
            background-color: darksalmon;
            margin: auto;
        }

    </style>
</head>
<%--<link href="${cPath}/css/breadCss.css" rel="stylesheet" type="text/css">--%>
<script src="js/jquery-3.2.1.js"></script>
<body>

<div class="login_div">
    <h3>面包登陆!</h3>
    <form class="login_form">
        用户名：<input type="text" id="login_name" name="login_name" placeholder="输入用户名"/><br/>
        密 码：<input type="password"  id="login_password" name="login_password" placeholder="密码"/><br/>
        <p id="info"></p>
        <input type="button" value="登录" id="loginButton"/>
        <a href="${cPath}/BreadController/signIn.do">注册</a>
    </form>
</div>
</body>
<script>
    $("#loginButton").click(function () {
        var login_name =$("#login_name").val();
        var login_password=$("#login_password").val();

        if( login_name=='' && login_password==''){
            $("#info").text("提示:账号和密码不能为空");
        }
        else if ( login_name ==''){
            $("#info").text("提示:账号不能为空");
        }
        else if( login_password ==''){
            $("#info").text("提示:密码不能为空");
        }

        else {
            $.ajax({
                type: "POST",
                url: "${cPath}/BreadController/loginCheck.do",
                data: {
                    login_name:login_name ,
                    login_password: login_password
                },
                dataType: "number",
                complete:function(ret) {
                    var flag = ret.responseText;
                    if(flag==0) {
                        $("#info").text("提示:账号或密码错误！");
                        alert("提示:账号或密码错误！")
                    } else if(flag==1) {
                        alert("提示:登陆成功，跳转中...");
                        $("#info").text("提示:登陆成功，跳转中...");
                        window.location.href="${cPath}/BreadController/login.do";
                    }
                },
            });
        }
    })
</script>
</html>
