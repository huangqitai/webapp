<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
    String webRoot = "http://" + request.getServerName() + ":" + request.getServerPort();
    request.setAttribute("webRoot",webRoot);//此处的webRoot=http://locathost:8080
%>
<%
    String cPath = request.getContextPath();
    request.setAttribute("cPath",cPath);
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
