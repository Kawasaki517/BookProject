<%--
  Created by IntelliJ IDEA.
  User: 26256
  Date: 2021/12/2
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<div>
    <span>欢迎<span class="um_span">${sessionScope.user.username}</span>光临尚硅谷书城</span>
    <a href="order?action=query">我的订单</a>
    <a href="client/clientServlet?action=destroy">注销</a>&nbsp;&nbsp;
    <a href="index.jsp">返回</a>
</div>
