<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>title</title>
	<%@include file="/pages/common/head.jsp"%>
	<style type="text/css">
		h1 {
			text-align: center;
			margin-top: 200px;
		}

		h1 a {
			color:red;
		}
		input {
			text-align: center;
		}
	</style>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
			<span class="wel_word">我的订单</span>
		<%@include file="/pages/common/menu.jsp"%>
	</div>
	
	<div id="main">
		
		<table>
			<c:if test="${sessionScope.order==null}">
				您还没有订单！
			</c:if>
			<c:if test="${sessionScope.order!=null}">
				<tr>
					<td>日期</td>
					<td>金额</td>
					<td>状态</td>
					<td>详情</td>
				</tr>
				<c:forEach items="${sessionScope.order}" var="order">
					<tr>
						<td>${order.createTime}</td>
						<td>${order.price}</td>
						<td>
							<c:if test="${order.status==0}">
								未发货
							</c:if>
							<c:if test="${order.status==1}">
								准备发货
							</c:if>
							<c:if test="${order.status==2}">
								已发货
							</c:if></td>
						<td><a href="order?action=queryItem&orderId=${order.orderId}">查看详情</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	
	<div id="bottom">
		<span>
			书城.Copyright &copy;2015
		</span>
	</div>
</body>
</html>