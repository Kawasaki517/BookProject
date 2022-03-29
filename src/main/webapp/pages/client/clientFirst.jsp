<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书城首页</title>
<link type="text/css" rel="stylesheet" href="static/css/style.css" >
	<%@include file="/pages/common/head.jsp"%>
</head>

<script type="text/javascript">
	$(function () {
		$("[id=join]").click(function () {
			$.getJSON("<%=request.getContextPath()%>/cart/add","id="+this.value,function (data) {
				$("#totalCount").text("您的购物车中有"+data.totalCount+"件商品");
				$("#lastName").text("您刚刚将【"+data.lastName+"】加入到了购物车中");
			})

		})
	})
</script>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
			<span class="wel_word">网上书城</span>
			<div>
				<c:if test="${sessionScope.user!=null}">
					<span>欢迎<span class="um_span">${sessionScope.user.username}</span>光临尚硅谷书城</span>
					<a href="order?action=query">我的订单</a>
					<a href="client/clientServlet?action=destroy">注销</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${sessionScope.user==null}">
					<a href="pages/user/login.jsp">登录</a>  |
					<a href="pages/user/regist.jsp">注册</a> &nbsp;&nbsp;
				</c:if>
				<a href="pages/cart/cart.jsp">购物车</a>
				<a href="pages/manager/manager.jsp">后台管理</a>
			</div>
	</div>
		<div id="main">
			<div id="book">
				<div class="book_cond">
					<form action="client" method="get">
						价格：<input id="min" type="text" name="low" value="${requestScope.Low}"> 元 -
							<input id="max" type="text" name="high" value="${requestScope.High}"> 元
							<input type="submit" value="查询" />
					</form>
				</div>

					<div style="text-align: center">
						<span id="totalCount"></span>
						<div>
							<span style="color: red" id="lastName"></span>
						</div>
					</div>

				<c:forEach items="${requestScope.AllBook.list}" var="book">
				<div class="b_list">
					<div class="img_div">
						<img class="book_img" alt="" src="${book.imgPath}" />
					</div>
					<div class="book_info">
						<div class="book_name">
							<span class="sp1">书名:</span>
							<span class="sp2">${book.name}</span>
						</div>
						<div class="book_author">
							<span class="sp1">作者:</span>
							<span class="sp2">${book.author}</span>
						</div>
						<div class="book_price">
							<span class="sp1">价格:</span>
							<span class="sp2">￥${book.price}</span>
						</div>
						<div class="book_sales">
							<span class="sp1">销量:</span>
							<span class="sp2">${book.sales}</span>
						</div>
						<div class="book_amount">
							<span class="sp1">库存:</span>
							<span class="sp2">${book.stock}</span>
						</div>
						<div class="book_add">
							<button id="join" name="join" value="${book.id}">加入购物车</button>
						</div>
					</div>
				</div>
				</c:forEach>
			<%--</div>
			<c:if test="${requestScope.page.low!=null}">
				<jsp:include page="/WEB-INF/pages/common/page_nav1.jsp"></jsp:include>
			</c:if>
			<c:if test="${requestScope.page.low==null}">
				<jsp:include page="/WEB-INF/pages/common/page_nav.jsp"></jsp:include>
			</c:if>
		</div>--%>
			</div>
				<div id="page_nav">



					<c:if test="${!requestScope.AllBook.isFirstPage}">
						<a href="<%=request.getContextPath()%>/client?page=${requestScope.AllBook.prePage}${requestScope.low}${requestScope.high}">上一页</a>
						<a href="<%=request.getContextPath()%>/client?page=${requestScope.AllBook.navigateFirstPage}${requestScope.low}${requestScope.high}">首页</a>
					</c:if>
					<C:forEach begin="${requestScope.AllBook.navigateFirstPage}" end="${requestScope.AllBook.navigateLastPage}" var="i">

						<c:if test="${i!=requestScope.AllBook.pageNum}">
							<a href="<%=request.getContextPath()%>/client?page=${i}${requestScope.low}${requestScope.high}">${i}</a>
						</c:if>
						<c:if test="${i==requestScope.AllBook.pageNum}">
							【${i}】
						</c:if>

					</C:forEach>
					<c:if test="${!requestScope.AllBook.isLastPage}">
						<a href="<%=request.getContextPath()%>/client?page=${requestScope.AllBook.pages}${requestScope.low}${requestScope.high}">尾页</a>
						<a href="<%=request.getContextPath()%>/client?page=${requestScope.AllBook.pageNum+1}${requestScope.low}${requestScope.high}">下一页</a>
					</c:if>

					共${requestScope.AllBook.pages}页，${requestScope.AllBook.total}条记录 到第<input value="${requestScope.AllBook.pageNum}" name="pn" id="pn_input"/>页
					<input id="reachPageBtn" type="button" value="确定">
				</div>


		</div>
	
	<div id="bottom">
		<span>
			书城.Copyright &copy;2015
		</span>
	</div>

	<script type="text/javascript">
		$("#reachPageBtn").click(function () {
			var pageNo=$("#pn_input").val();
			if(pageNo>=1&&pageNo<=${requestScope.AllBook.pages}){
				location.href = "client?page="+pageNo;
			}
		})
	</script>
</body>
</html>