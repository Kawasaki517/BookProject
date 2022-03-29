<%--
  Created by IntelliJ IDEA.
  User: 26256
  Date: 2021/12/20
  Time: 8:36
  To change this template use File | Settings | File Templates.
--%>
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
            <tr>
                <td>名字</td>
                <td>数量</td>
                <td>单价</td>
                <td>总价</td>
            </tr>
            <c:forEach items="${sessionScope.orderItem}" var="orderItem">
                <tr>
                    <td>${orderItem.name}</td>
                    <td>${orderItem.count}</td>
                    <td>${orderItem.price}</td>
                    <td>${orderItem.totalPrice}</td>
                </tr>
            </c:forEach>
    </table>
</div>
<div id="bottom">
		<span>
			书城.Copyright &copy;2015
		</span>
</div>
</body>
</html>