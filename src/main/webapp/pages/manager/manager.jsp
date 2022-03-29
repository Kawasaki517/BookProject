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
			<span class="wel_word">后台管理系统</span>
		<%@include file="/pages/common/managerMenu.jsp"%>
	</div>
	
	<div id="main">
		<h1>欢迎管理员进入后台管理系统</h1>
	</div>
	
	<div id="bottom">
		<span>
			书城.Copyright &copy;2015
		</span>
	</div>
</body>
</html>