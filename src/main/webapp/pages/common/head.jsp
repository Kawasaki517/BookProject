<%--
  Created by IntelliJ IDEA.
  User: 26256
  Date: 2021/12/2
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%
    String baseUrl=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
    <base href="<%=baseUrl%>">
    <script type="text/javascript"  src="static/script/jquery-1.7.2.js"></script>
    <link type="text/css" rel="stylesheet" href="static/css/style.css" />
