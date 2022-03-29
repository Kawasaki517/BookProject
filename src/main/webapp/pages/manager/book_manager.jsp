<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>title</title>
	<%@include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			$(".deleteClass").click(function () {
				return confirm("是否要删除书本名为:"+$(this).parent().parent().find("td:first").text()+"?")
			})
		})
	</script>
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
			<span class="wel_word">图书管理系统</span>
		<%@include file="/pages/common/managerMenu.jsp"%>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>名称</td>
				<td>价格</td>
				<td>作者</td>
				<td>销量</td>
				<td>库存</td>
				<td colspan="2">操作</td>
			</tr>		

			<C:forEach items="${requestScope.page.items}" var="book">
				<tr>
					<td>${book.name}</td>
					<td>${book.price}</td>
					<td>${book.author}</td>
					<td>${book.sales}</td>
					<td>${book.stock}</td>
					<td><a href="manager/book?action=getBook&id=${book.id}&method=update&pageNo=${requestScope.page.pageNo}">修改</a></td>
					<td><a class="deleteClass" href="manager/book?action=delete&id=${book.id}&pageNo=${requestScope.page.pageNo}">删除</a></td>
				</tr>
			</C:forEach>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="pages/manager/book_edit.jsp?method=save">添加图书</a></td>
			</tr>	
		</table>
		<div id="page_nav">

			<c:if test="${requestScope.page.pageNo>1}">
				<a href="manager/book?action=page&pageNo=1">首页</a>
				<a href="manager/book?action=page&pageNo=${requestScope.page.pageNo-1}">上一页</a>
			</c:if>
			<%--1.不需要移动页码的情况--%>
			<C:if test="${requestScope.page.pageTotal<=5}">
				<c:forEach begin="1" end="${requestScope.page.pageTotal}" var="i">
				<c:if test="${i!=requestScope.page.pageNo}">
					<a href="manager/book?action=page&pageNo=${i}">${i}</a>
				</c:if>
				<c:if test="${i==requestScope.page.pageNo}">
					【${i}】
				</c:if>
				</c:forEach>
			</C:if>
			<%--2.需要移动页码的情况--%>
			<C:if test="${requestScope.page.pageTotal>5}">
				<%--访问最前面的3个页码，页码不需要移动--%>
					<C:if test="${requestScope.page.pageNo<=3}">
						<C:forEach begin="1" end="5" var="i">
							<c:if test="${i!=requestScope.page.pageNo}">
								<a href="manager/book?action=page&pageNo=${i}">${i}</a>
							</c:if>
							<c:if test="${i==requestScope.page.pageNo}">
								【${i}】
							</c:if>
						</C:forEach>
					</C:if>

				<%--访问中间页码，页码需要移动--%>
				<C:if test="${requestScope.page.pageNo>3&&requestScope.page.pageNo<=requestScope.page.pageTotal-2}">
					<C:forEach begin="${requestScope.page.pageNo-2}" end="${requestScope.page.pageNo+2}" var="i">
						<c:if test="${i!=requestScope.page.pageNo}">
							<a href="manager/book?action=page&pageNo=${i}">${i}</a>
						</c:if>
						<c:if test="${i==requestScope.page.pageNo}">
							【${i}】
						</c:if>
					</C:forEach>
				</C:if>
				<%--访问最后的3个页码，页码不需要移动--%>
				<C:if test="${requestScope.page.pageNo>requestScope.page.pageTotal-2}">
					<C:forEach begin="${requestScope.page.pageTotal-4}" end="${requestScope.page.pageTotal}" var="i">
						<c:if test="${i!=requestScope.page.pageNo}">
							<a href="manager/book?action=page&pageNo=${i}">${i}</a>
						</c:if>
						<c:if test="${i==requestScope.page.pageNo}">
							【${i}】
						</c:if>
					</C:forEach>
				</C:if>

			</C:if>



			<c:if test="${requestScope.page.pageNo<requestScope.page.pageTotal}">
				<a href="manager/book?action=page&pageNo=${requestScope.page.pageNo+1}">下一页</a>
				<a href="manager/book?action=page&pageNo=${requestScope.page.pageTotal}">末页</a>
			</c:if>
			共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录 到第<input value="${requestScope.page.pageNo}" name="pn" id="pn_input"/>页
			<input id="reachPageBtn" type="button" value="确定">

			<script type="text/javascript">
				$("#reachPageBtn").click(function () {
					var pageNo=$("#pn_input").val();
					if(pageNo>=1&&pageNo<=${requestScope.page.pageTotal}){
						location.href="manager/book?action=page&pageNo="+pageNo;
					}
				})
			</script>
		</div>
	</div>
	
	<div id="bottom">
		<span>
			书城.Copyright &copy;2015
		</span>
	</div>
</body>
</html>