<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"  %>
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

					<form action="/RegisterAction" method="post" id="registerform" name="registerform">
						<div class="form-group m-bottom-md">
							<input type="text" class="form-control" placeholder="邮箱地址" id="username" name="username">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="密码" id="pswd" name="pswd">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="确认密码" id="pswd2" name="pswd2">
						</div>
						<div class="form-group">
							<div class="custom-checkbox">
								<input type="checkbox" id="chkAccept">
								<label for="chkAccept"></label>
							</div>
							我同意以上协议
						</div>

						<div class="m-top-md p-top-sm">
							<a onclick="register()" class="btn btn-success block">创建账号</a>
						</div>

						<div class="m-top-md p-top-sm">
							<div class="font-12 text-center m-bottom-xs">已经有一个账号?</div>
							<a href="index.jsp" class="btn btn-default block">登录</a>
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
			function register() {
				var th = document.registerform;
				if (th.username.value == "") {
					alert("用户名不能为空");
					th.username.focus();
					return;
				}
				if (th.pswd.value == "" || th.pswd2.value == "") {
					alert("密码不能为空");
					th.pswd.focus();
					return;
				}

				if (th.pswd.value!=th.pswd2.value) {
					alert("两次输入的密码不同");
					th.pswd.focus();
					return;
				}
				$.ajax({
					cache : false,
					type : "POST",
					url : "/RegisterAction", //把表单数据发送到ajax.jsp
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
						if(data=="error"){alert("已存在的用户！");}else{
							window.location.href="light.jsp";
						}
					}
				});
			}
		</script>
  	</body>

</html>
