<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>尚硅谷会员注册页面</title>
	<%@include file="/pages/common/head.jsp"%>
<style type="text/css">
	.login_form{
		height:420px;
		margin-top: 25px;
	}
</style>

	<script type="text/javascript">
		$(function () {
			var name=false;
			var pw=false;
			var em=false;
			var yzm=false;
			$("#username").blur(function () {
				var usename = $("#username").val();
				var patt = /^\w{5,12}$/;
				$.getJSON("verify","username="+this.value,function (data) {
					if(this.value!="") {
						if(!patt.test(usename)){
							$("span.errorMsg").text("用户名不合法");
							name= false;
						}else {
							if (data.result == "false") {
								$("span.errorMsg").text("用户名可用");
								name = true;
							} else {
								$("span.errorMsg").text("用户名已存在");
								name = false;
							}
						}
					}
					else {
						$("span.errorMsg").text("用户名不能为空");
						name=false;
					}
				})
			});


			$("#img_code").click(function () {
				this.src="${baseUrl}kaptcha.jpg?d="+new Date();
			});



			$("#email").click(function () {
				var pwd=$("#password").val();
				var rep=$("#repwd").val();
				if(pwd!="") {

					if (pwd == rep) {
						pw=true;
					} else {
						$("span.errorMsg").text("重复密码不正确");
						pw = false;
					}
				}
				else {
					$("span.errorMsg").text("密码不能为空");
					pw=false;
				}

			});



			$("#code").click(function () {
				var patt=/\b[\w.%+-]+@[\w.-]+\.[a-zA-Z]{2,6}\b/g;
				var email=$("#email").val();
				if (!patt.test(email)) {
					$("span.errorMsg").text("邮箱不合法");
					em= false;
				} else {
					$("span.errorMsg").text("");
					em= true;
				}
			});


			$("#sub_btn").click(function () {
				$("#email").click();
				$("#code").click();
				$("#username").blur();
				 return em&&pw&&name;
			});

		})
	</script>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎注册</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>注册会员</h1>
								<span class="errorMsg">${requestScope.msg}</span>
							</div>
							<div class="form">
								<form action="register" method="post">
									<input type="hidden" name="action" value="regist">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username" id="username" value="${requestScope.username}" />
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password" value="${requestScope.password}"/>
									<br />
									<br />
									<label>确认密码：</label>
									<input class="itxt" type="password" placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" value="${requestScope.password}"/>
									<br />
									<br />
									<label>电子邮件：</label>
									<input class="itxt" type="text" placeholder="请输入邮箱地址" autocomplete="off" tabindex="1" name="email" id="email" value="${requestScope.email}"/>
									<br />
									<br />
									<label>验证码：</label>
									<input class="itxt" type="text" style="width: 150px;" name="code" id="code"/>
									<img src="kaptcha.jpg" id="img_code" style="float: right; margin-right: 20px; width: auto;height: 28px">
									<br />
									<br />
									<input type="submit" value="注册" id="sub_btn" />
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		<div id="bottom">
			<span>
				书城.Copyright &copy;2015
			</span>
		</div>
</body>
</html>