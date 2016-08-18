<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
  	<head>
		<base href="<%=basePath%>">
	    <meta charset="utf-8">
	    <title>社交网络监控管理</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="">
	    <meta name="author" content="">

	    <!-- Bootstrap core CSS -->
	    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Font Awesome -->
		<link href="css/font-awesome.min.css" rel="stylesheet">

		<!-- ionicons -->
		<link href="css/ionicons.min.css" rel="stylesheet">
		
		<!-- Simplify -->
		<link href="css/simplify.min.css" rel="stylesheet">
	
  	</head>

  	<body class="overflow-hidden light-background">
		<div class="wrapper no-navigation preload">
			<div class="sign-in-wrapper">
				<div class="sign-in-inner">
					<div class="login-brand text-center">
						<i class="fa fa-database m-right-xs"></i> 授权管理员 <strong class="text-skin">登录</strong>
					</div>

					<form action="/LoginAction" method="post" name="myform" id="myform">
						<div class="form-group m-bottom-md">
							<input type="text" class="form-control" placeholder="邮箱地址" name="username">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="密码" name="pswd">
						</div>

						<div class="form-group">
							<div class="custom-checkbox">
								<input type="checkbox" id="chkRemember">
								<label for="chkRemember"></label>
							</div>
							记住我
						</div>

						<div class="m-top-md p-top-sm">
							<a onclick="mylogin()" class="btn btn-success block">登录</a>
						</div>

						<div class="m-top-md p-top-sm">
							<div class="font-12 text-center m-bottom-xs">
								<a href="#" class="font-12">忘记密码?</a>
							</div>
							<div class="font-12 text-center m-bottom-xs">没有一个账号?</div>
							<a href="signup.jsp" class="btn btn-default block">创建账号</a>
						</div>
					</form>
				</div><!-- ./sign-in-inner -->
			</div><!-- ./sign-in-wrapper -->
		</div><!-- /wrapper -->

		<a href="" id="scroll-to-top" class="hidden-print"><i class="icon-chevron-up"></i></a>

	    <!-- Le javascript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
		
		<!-- Jquery -->
		<script src="js/jquery-1.11.1.min.js"></script>
		
		<!-- Bootstrap -->
	    <script src="bootstrap/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll -->
		<script src='js/jquery.slimscroll.min.js'></script>
		
		<!-- Popup Overlay -->
		<script src='js/jquery.popupoverlay.min.js'></script>

		<!-- Modernizr -->
		<script src='js/modernizr.min.js'></script>
		
		<!-- Simplify -->
		<script src="js/simplify/simplify.js"></script>
		<script type="text/javascript">
			function mylogin() {
				var th = document.myform;
				if (th.username.value == "") {
					alert("用户名不能为空");
					th.username.focus();
					return;
				}
				if (th.pswd.value == "") {
					alert("密码不能为空");
					th.pswd.focus();
					return;
				}
				$.ajax({
					cache : false,
					type : "POST",
					url : "/LoginAction", //把表单数据发送到ajax.jsp
					data : {username: $("input[name='username']").val(),
						pswd: $("input[name='pswd']").val()
					}, //要发送的是ajaxFrm表单中的数据
					async : false,
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						alert(XMLHttpRequest.status);
						alert(XMLHttpRequest.readyState);
						alert(textStatus);
					},
					success : function(data) {  //java string 需要变成var
						if(data=="error"){alert("用户名或密码不正确！");}else{
							window.location.href="light.jsp";
						}
					}
				});
			}
		</script>

  	</body>
</html>
