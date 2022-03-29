<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
<%@include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			$("button.delete").click(function () {
				if(confirm("是否要将【"+$(this).parent().parent().find("td:first").text()+"】从购物车中删除？")){
					$.getJSON("<%=request.getContextPath()%>/cart/delete","id="+$(this).attr("cartId"),function (data) {
						$("span.b_count").text(data.totalCount);
						$("span.b_price").text(data.totalPrice);
						window.location.reload();
					})
				}
			});

			$("input.update").change(function () {
				var index=$(this).parent().parent().find("td:first").text();
				var pattern=/^(0|[1-9]\d*)\b/g;
				if(pattern.test(this.value)==true){
					if(confirm("是否要将【"+index+"】的数量改为"+this.value+"？")) {
						$.getJSON("<%=request.getContextPath()%>/cart/update", "totalCount=" + this.value + "&id=" + $(this).attr("bookId"), function (data) {
							$("span.b_count").text(data.totalCount);
							$("span.b_price").text(data.totalPrice);
							window.location.reload();
						})
					}
				}else alert("请输入正确的数量");

			});

			$("#clear").click(function () {
				$.getJSON("<%=request.getContextPath()%>/cart/clear","",function (data) {
					//$("span.b_count").text(data.totalCount);
					//$("span.b_price").text(data.totalPrice);
					window.location.reload();
				})
			})
		})
	</script>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
			<span class="wel_word">购物车</span>
		<%@include file="/pages/common/menu.jsp"%>
	</div>
	<div id="main">
	
		<table>
			<tr>
				<td>商品名称</td>
				<td>数量</td>
				<td>单价</td>
				<td>金额</td>
				<td>操作</td>
			</tr>
			<c:if test="${sessionScope.cart.totalCount!=0&&sessionScope.cart!=null}">
				<c:forEach items="${sessionScope.cart.map}" var="cart">
					<tr>
						<td>${cart.value.book.name}</td>
						<td><input class="update" bookId="${cart.value.book.id}" type="text" style="width: 20px" value="${cart.value.count}"></td>
						<td>${cart.value.book.price}</td>
						<td>${cart.value.totalPrice}</td>
						<td><button class="delete" cartId="${cart.value.book.id}">删除</button></td>
					</tr>
				</c:forEach>


			</c:if>
		</table>
		<c:if test="${sessionScope.cart.totalCount!=0&&sessionScope.cart!=null}">
			<div class="cart_info">
				<span class="cart_span">购物车中共有<span class="b_count">${sessionScope.cart.totalCount}</span>件商品</span>
				<span class="cart_span">总金额<span class="b_price">${sessionScope.cart.totalPrice}</span>元</span>
				<span class="cart_span"><button id="clear">清空购物车</button></span>
				<span class="cart_span"><a href="order?action=saveOrder">去结账</a></span>
			</div>
		</c:if>
		<c:if test="${sessionScope.cart.totalCount==0||sessionScope.cart==null}">
			<div class="cart_info">
				<span class="cart_span" style="color: red;text-align:center">你还没有商品在购物车中，快去购物吧!!!</span>
			</div>

		</c:if>
	
	</div>
	
	<div id="bottom">
		<span>
			书城.Copyright &copy;2015
		</span>
	</div>
</body>
</html>