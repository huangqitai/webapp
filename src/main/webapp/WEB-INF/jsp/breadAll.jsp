<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="tagJsp.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table table-hover">
    <thead>
    <tr>
        <th>账户编号</th>
        <th>账户名称</th>
        <th>账户密码</th>
        <th>选项</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${breads}" var="bread">
        <tr>
            <td><c:out value="${bread.id}"></c:out></td>
            <td><c:out value="${bread.loginName}"></c:out></td>
            <td><c:out value="${bread.loginPassword}"></c:out></td>
            <td><a href="${cPath}/BreadController/editBread.do?breadNumber=${bread.id}">
                <button type="button" class="btn btn-info btn-xs"> 编辑</button>
            </a>
            <a href="${cPath}/BreadController/delBread.do?breadNumber=${bread.id}">
                <button type="button" class="btn btn-danger btn-xs">删除</button>
            </a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
