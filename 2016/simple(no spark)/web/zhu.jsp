<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="topic.TopicDao" %>
<%@ page import="topic.TopicService" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="people.PeopleService" %>
<%@ page import="people.PeopleDao" %>
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
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">           <!--add-->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="">
	    <meta name="author" content="">

		                                         
		<link href="css/cover1.css" rel="stylesheet">         <!--add main container-->

	    <!-- Bootstrap core CSS -->
	    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Font Awesome -->
		<link href="css/font-awesome.min.css" rel="stylesheet">

		<!-- ionicons -->
		<link href="css/ionicons.min.css" rel="stylesheet">
		
		<!-- Morris -->
		<link href="css/morris.css" rel="stylesheet"/>	

		<!-- Datepicker -->
		<link href="css/datepicker.css" rel="stylesheet"/>	

		<!-- Animate -->
		<link href="css/animate.min.css" rel="stylesheet">

		<!-- Owl Carousel -->
		<link href="css/owl.carousel.min.css" rel="stylesheet">
		<link href="css/owl.theme.default.min.css" rel="stylesheet">

		<!-- Simplify -->
		<link href="css/simplify.min.css" rel="stylesheet">
	
  	</head>

  	<body class="overflow-hidden">
	<%
		if (session.getAttribute("login") == null)
			response.sendRedirect("index.jsp");
	%>
		<div class="wrapper preload">
			<div class="sidebar-right">
				<div class="sidebar-inner scrollable-sidebar">
					<div class="sidebar-header clearfix">
						<input class="form-control dark-input" placeholder="搜索" type="text">
						<div class="btn-group pull-right">
							<a href="#" class="sidebar-setting" data-toggle="dropdown"><i class="fa fa-cog fa-lg"></i></a>
							<ul class="dropdown-menu pull-right flipInV">
								<li><a href="#"><i class="fa fa-circle text-danger"></i><span class="m-left-xs">正忙</span></a></li>
								<li><a href="#"><i class="fa fa-circle-o"></i><span class="m-left-xs">关闭聊天</span></a></li>
							</ul>
						</div>
					</div>
					<div class="title-block">
						组内聊天
					</div>
					<div class="content-block">
						<ul class="sidebar-list">
							<li>
								<a href="#">
									<i class="fa fa-circle-o text-success"></i><span class="m-left-xs">亲密朋友</span>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-circle-o text-success"></i><span class="m-left-xs">工作</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="title-block">
						非常关注
					</div>
					<div class="content-block">
						<ul class="sidebar-list">
							<li>
								<a href="#" class="clearfix">
									<img src="images/profile/profile2.jpg" class="img-circle" alt="user avatar">
									<div class="chat-detail m-left-sm">
										<div class="chat-name">
											John Doe
										</div>
										<div class="chat-message">
											Where are you?
										</div>
									</div>
									<div class="chat-status">
										<i class="fa fa-circle-o text-success"></i>
									</div>
									<div class="chat-alert">
										<span class="badge badge-purple bounceIn animation-delay2">2</span>
									</div>
								</a>
							</li>
							<li>
								<a href="#" class="clearfix">
									<img src="images/profile/profile3.jpg" class="img-circle" alt="user avatar">
									<div class="chat-detail m-left-sm">
										<div class="chat-name">
											Jane Doe
										</div>
										<div class="chat-message">
											Hello
										</div>
									</div>
									<div class="chat-status">
										<i class="fa fa-circle-o text-success"></i>
									</div>
									<div class="chat-alert">
										<span class="badge badge-info bounceIn animation-delay2">1</span>
									</div>
								</a>
							</li>
							<li>
								<a href="#" class="clearfix">
									<img src="images/profile/profile4.jpg" class="img-circle" alt="user avatar">
									<div class="chat-detail m-left-sm">
										<div class="chat-name">
											John Doe
										</div>
										<div class="chat-message">
											See you again next week.
										</div>
									</div>
									<div class="chat-status">
										<i class="fa fa-circle-o text-danger"></i>
									</div>
									<div class="chat-alert">
										<i class="fa fa-check text-success"></i>
									</div>
								</a>
							</li>
							<li>
								<a href="#" class="clearfix">
									<img src="images/profile/profile5.jpg" class="img-circle" alt="user avatar">
									<div class="chat-detail m-left-sm">
										<div class="chat-name">
											John Doe
										</div>
										<div class="chat-message">
											Hello, Are you there?
										</div>
									</div>
									<div class="chat-status">
										<i class="fa fa-circle-o text-danger"></i>
									</div>
									<div class="chat-alert">
										<i class="fa fa-reply"></i>
									</div>
								</a>
							</li>
						</ul>
					</div>
					<div class="title-block">
						更多朋友
					</div>
					<div class="content-block">
						<ul class="sidebar-list">
							<li>
								<a href="#" class="clearfix">
									<img src="images/profile/profile6.jpg" class="img-circle" alt="user avatar">
									<div class="chat-detail m-left-sm">
										<div class="chat-name">
											John Doe
										</div>
										<div class="chat-message">
											Where are you?
										</div>
									</div>
									<div class="chat-status">
										<i class="fa fa-circle-o text-success"></i>
									</div>
									<div class="chat-alert">
										<span class="badge badge-success bounceIn animation-delay2">2</span>
									</div>
								</a>
							</li>
							<li>
								<a href="#" class="clearfix">
									<img src="images/profile/profile7.jpg" class="img-circle" alt="user avatar">
									<div class="chat-detail m-left-sm">
										<div class="chat-name">
											Jane Doe
										</div>
										<div class="chat-message">
											Hello
										</div>
									</div>
									<div class="chat-status">
										<i class="fa fa-circle-o text-success"></i>
									</div>
									<div class="chat-alert">
										<span class="badge badge-danger bounceIn animation-delay2">1</span>
									</div>
								</a>
							</li>
							<li>
								<a href="#" class="clearfix">
									<img src="images/profile/profile8.jpg" class="img-circle" alt="user avatar">
									<div class="chat-detail m-left-sm">
										<div class="chat-name">
											John Doe
										</div>
										<div class="chat-message">
											See you again next week.
										</div>
									</div>
									<div class="chat-status">
										<i class="fa fa-circle-o text-danger"></i>
									</div>
									<div class="chat-alert">
										<i class="fa fa-check text-success"></i>
									</div>
								</a>
							</li>
							<li>
								<a href="#" class="clearfix">
									<img src="images/profile/profile9.jpg" class="img-circle" alt="user avatar">
									<div class="chat-detail m-left-sm">
										<div class="chat-name">
											John Doe
										</div>
										<div class="chat-message">
											Hello, Are you there?
										</div>
									</div>
									<div class="chat-status">
										<i class="fa fa-circle-o text-danger"></i>
									</div>
									<div class="chat-alert">
										<i class="fa fa-reply"></i>
									</div>
								</a>
							</li>
						</ul>
					</div>
				</div><!-- sidebar-inner -->
			</div><!-- sidebar-right -->
			
			
			
			
			<header class="top-nav">
				<div class="top-nav-inner">
					<div class="nav-header">
						<button type="button" class="navbar-toggle pull-left sidebar-toggle" id="sidebarToggleSM">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						
						<ul class="nav-notification pull-right">
							<li>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog fa-lg"></i></a>
								<span class="badge badge-danger bounceIn">1</span>
								<ul class="dropdown-menu dropdown-sm pull-right user-dropdown">
									<li class="user-avatar">
										<img src="images/profile/profile1.jpg" alt="" class="img-circle">
										<div class="user-content">
											<h5 class="no-m-bottom">Jane Doe</h5>
											<div class="m-top-xs">
												<a href="profile.jsp" class="m-right-sm">Profile</a>
												<a href="index.jsp">Log out</a>
											</div>
										</div>
									</li>	  
									<li>
										<a href="inbox.jsp">
											管理员列表
											<span class="badge badge-danger bounceIn animation-delay2 pull-right">1</span>
										</a>
									</li>			  
									<li>
										<a href="#">
											通知
											<span class="badge badge-purple bounceIn animation-delay3 pull-right">2</span>
										</a>
									</li>			  
									<li>
										<a href="#" class="sidebarRight-toggle">
											消息
											<span class="badge badge-success bounceIn animation-delay4 pull-right">7</span>
										</a>
									</li>			  	  
									<li class="divider"></li>
									<li>
										<a href="#">设置</a>
									</li>			  	  	  	  
								</ul>
							</li>
						</ul>
						<%
							List<Map<String, Object>> list;
							TopicService service = new TopicDao();
							list = service.queryall(null);
						%>
						<%
							String choose;
							int z=0;
							try {
								choose = request.getParameter("choose");

								if (choose.equals("")) choose = "0";
								z = 0;
								if (choose.equals("0")) z = 0;
								if (choose.equals("1")) z = 1;
								if (choose.equals("2")) z = 2;
								if (choose.equals("3")) z = 3;
								if (choose.equals("4")) z = 4;
								if (choose.equals("5")) z = 5;
								if (choose.equals("6")) z = 6;
								if (choose.equals("7")) z = 7;
								if (choose.equals("8")) z = 8;
								if (choose.equals("9")) z = 9;
								if (choose.equals("10")) z = 10;
								System.out.print(z);
							}catch (Exception e){
								System.out.print(e);
							}
						%>
						<%
							List<Map<String, Object>> plist;
							PeopleService pservice = new PeopleDao();
							List<Object> params = new ArrayList<Object>();
							plist = pservice.queryall(params,list.get(z).get("containerid").toString());
						%>
						<%
							out.print("<a href=\"/zhu.jsp?choose="+z+"\"class=\"brand\">");
						%>
						<%--<a href="zhu.jsp" class="brand">--%>
						<i class="fa fa-database"></i><span class="brand-name">社交网络监控管理</span>
						<%
							out.print("</a>");
						%>
					</div>
					<div class="nav-container">
						<button type="button" class="navbar-toggle pull-left sidebar-toggle" id="sidebarToggleLG">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<ul class="nav-notification">	
							<li class="search-list">
								<div class="search-input-wrapper">
									<div class="search-input">
										<input type="text" class="form-control input-sm inline-block">
										<a href="#" class="input-icon text-normal"><i class="ion-ios7-search-strong"></i></a>
									</div>
								</div>
							</li>
						</ul>
						<div class="pull-right m-right-sm">
							<div class="user-block hidden-xs">
								<a href="#" id="userToggle" data-toggle="dropdown">
									<img src="images/profile/profile1.jpg" alt="" class="img-circle inline-block user-profile-pic">
									<div class="user-detail inline-block">
										Bonsen
										<i class="fa fa-angle-down"></i>
									</div>
								</a>
								<div class="panel border dropdown-menu user-panel">
									<div class="panel-body paddingTB-sm">
										<ul>
<!--
											<li>
												<a href="profile.jsp">
													<i class="fa fa-edit fa-lg"></i><span class="m-left-xs">My Profile</span>
												</a>
											</li>
-->
											<li>
												<a href="inbox.jsp">
													<i class="fa fa-inbox fa-lg"></i><span class="m-left-xs">管理员消息</span>
													<span class="badge badge-danger bounceIn animation-delay3">2</span>
												</a>
											</li>
											<li>
												<a href="index.jsp">
													<i class="fa fa-power-off fa-lg"></i><span class="m-left-xs">退出</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<ul class="nav-notification">
								<li>
									<a href="#" data-toggle="dropdown"><i class="fa fa-envelope fa-lg"></i></a>
									<span class="badge badge-purple bounceIn animation-delay5 active">2</span>
									<ul class="dropdown-menu message pull-right">
										<li><a>您有两条来自其他管理员的未读消息</a></li>					  
										<li>
											<a class="clearfix" href="#">
												<img src="images/profile/profile2.jpg" alt="User Avatar">
												<div class="detail">
													<strong>John Doe</strong>
													<p class="no-margin">
														Lorem ipsum dolor sit amet...
													</p>
													<small class="text-muted"><i class="fa fa-check text-success"></i> 27m ago</small>
												</div>
											</a>	
										</li>
										<li>
											<a class="clearfix" href="#">
												<img src="images/profile/profile3.jpg" alt="User Avatar">
												<div class="detail">
													<strong>Jane Doe</strong>
													<p class="no-margin">
														Lorem ipsum dolor sit amet...
													</p>
													<small class="text-muted"><i class="fa fa-check text-success"></i> 5hr ago</small>
												</div>
											</a>	
										</li>
										<li>
											<a class="clearfix" href="#">
												<img src="images/profile/profile4.jpg" alt="User Avatar">
												<div class="detail m-left-sm">
													<strong>Bill Doe</strong>
													<p class="no-margin">
														Lorem ipsum dolor sit amet...
													</p>
													<small class="text-muted"><i class="fa fa-reply"></i> Yesterday</small>
												</div>
											</a>	
										</li>
										<li>
											<a class="clearfix" href="#">
												<img src="images/profile/profile5.jpg" alt="User Avatar">
												<div class="detail">
													<strong>Baby Doe</strong>
													<p class="no-margin">
														Lorem ipsum dolor sit amet...
													</p>
													<small class="text-muted"><i class="fa fa-reply"></i> 1 Jan 2016</small>
												</div>
											</a>	
										</li>
										<li><a href="#">查看所有消息</a></li>					  
									</ul>
								</li>
								<li>
									<a href="#" data-toggle="dropdown"><i class="fa fa-bell fa-lg"></i></a>
									<span class="badge badge-info bounceIn animation-delay6 active">4</span>
									<ul class="dropdown-menu notification dropdown-3 pull-right">
										<li><a href="#">您有五条新通知</a></li>					  
										<li>
											<a href="#">
												<span class="notification-icon bg-warning">
													<i class="fa fa-warning"></i>
												</span>
												<span class="m-left-xs">服务器 #2 未响应</span>
												<span class="time text-muted">刚才</span>
											</a>
										</li>
										<li>
											<a href="#">
												<span class="notification-icon bg-success">
													<i class="fa fa-plus"></i>
												</span>
												<span class="m-left-xs">一位新管理员通过注册</span>
												<span class="time text-muted">两分钟前</span>
											</a>
										</li>
										<li>
											<a href="#">
												<span class="notification-icon bg-danger">
													<i class="fa fa-bolt"></i>
												</span>
												<span class="m-left-xs">应用错误</span>
												<span class="time text-muted">五分钟前</span>
											</a>
										</li>
										<li>
											<a href="#">
												<span class="notification-icon bg-success">
													<i class="fa fa-usd"></i>
												</span>
												<span class="m-left-xs">微博红包异常发放</span>
												<span class="time text-muted">1小时前</span>
											</a>
										</li>
										<li>
											<a href="#">
												<span class="notification-icon bg-success">
													<i class="fa fa-plus"></i>
												</span>
												<span class="m-left-xs">一位新管理员通过注册</span>
												<span class="time text-muted">1小时前</span>
											</a>
										</li>
										<li><a href="#">查看所有通知</a></li>					  
									</ul>
								</li>
								<li class="chat-notification">
									<a href="#" class="sidebarRight-toggle"><i class="fa fa-comments fa-lg"></i></a>
									<span class="badge badge-danger bounceIn">1</span>

									<div class="chat-alert">
										我发现一个异常用户,请留意
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div><!-- ./top-nav-inner -->	
			</header>

			<aside class="sidebar-menu fixed">
				<div class="sidebar-inner scrollable-sidebar">
					<div class="main-menu">
						<ul class="accordion">
							<li class="menu-header">
								Main Menu
							</li>

							<li class="bg-palette2">
								<%
									out.print("<a href=\"/landing.jsp?choose="+z+"\">");
								%>
								<%--<a href="/landing.jsp">--%>
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-desktop fa-lg"></i></span>
										<span class="text m-left-sm">今日微博</span>
									</span>
									<span class="menu-content-hover block">
										今日微博
									</span>

								<%
									out.print("</a>");
								%>
							</li>

							<li class="bg-palette1">
								<%
									out.print("<a href=\"/zhu.jsp?choose="+z+"\">");
								%>
								<%--<a href="zhu.jsp">--%>
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-home fa-lg"></i></span>
										<span class="text m-left-sm">微博总体情况</span>
									</span>
									<span class="menu-content-hover block">
										菜单
									</span>

								<% out.print("</a>");%>
							</li>

							<li class="openable bg-palette4">
								<a href="#">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-tags fa-lg"></i></span>
										<span class="text m-left-sm">潜在危险人物列表</span>
										<span class="submenu-icon"></span>
									</span>
									<span class="menu-content-hover block">
										危险列表
									</span>
								</a>
								<ul class="submenu">
									<li class="">										<%
										out.print("<a href=\"/zongf1.jsp?choose="+z+"\">");
									%>
										<%--<a href="zongf1.jsp">--%>
										<span class="submenu-label">总体情况</span><% out.print("</a>");%></li>

									<%
										if(z==1){
											for(int v=0;v<plist.size();++v){
												if(v==0){
													out.print("<li><a href=\"zong1.jsp?choose=1\"><span class=\"submenu-label\">"+plist.get(v).get("pname")+"</span></a></li>");
												}else{
													out.print("<li><a href=\"zong2.jsp?choose=1\"><span class=\"submenu-label\">"+plist.get(v).get("pname")+"</span></a></li>");
												}
											}
										}else{
											for(int v=0;v<plist.size();++v){
												if(v==0){
													out.print("<li><a href=\"zong3.jsp?choose=8\"><span class=\"submenu-label\">"+plist.get(v).get("pname")+"</span></a></li>");
												}else{
													out.print("<li><a href=\"zong4.jsp?choose=8\"><span class=\"submenu-label\">"+plist.get(v).get("pname")+"</span></a></li>");
												}
											}
										}
									%>
									<%--<li><a href="zong1.jsp"><span class="submenu-label">Bonsen</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Joe</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Alice</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Mike</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Bob</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Jack</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Candy</span></a></li>--%>
								</ul>
							</li>

							<li class="openable bg-palette4">
								<a href="#">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-list fa-lg"></i></span>
										<span class="text m-left-sm">危险用户关联信息</span>
										<span class="submenu-icon"></span>
									</span>
									<span class="menu-content-hover block">
										人物关联
									</span>
								</a>
								<ul class="submenu">
									<li>
										<%
											out.print("<a href=\"/zongf2.jsp?choose="+z+"\">");
										%>
										<%--<a href="zongf2.jsp">--%>
										<span class="submenu-label">总体情况</span><% out.print("</a>");%></li>
									<li class="">
										<%
											if(z==1){
												for(int v=0;v<plist.size();++v){
													if(v==0){
														out.print("<a href=\"zong11.jsp?choose=1\"><span class=\"submenu-label\">"+plist.get(v).get("pname")+"</span></a>");
													}else{
														out.print("<a href=\"zong22.jsp?choose=1\"><span class=\"submenu-label\">"+plist.get(v).get("pname")+"</span></a>");
													}
												}
											}else{
												for(int v=0;v<plist.size();++v){
													if(v==0){
														out.print("<a href=\"zong33.jsp?choose=8\"><span class=\"submenu-label\">"+plist.get(v).get("pname")+"</span></a>");
													}else{
														out.print("<a href=\"zong44.jsp?choose=8\"><span class=\"submenu-label\">"+plist.get(v).get("pname")+"</span></a>");
													}
												}
											}
										%>
										<%--<a href="zong11.jsp">--%>
										<%--<span class="submenu-label">Bonsen</span>--%>
										<%--<small class="badge badge-success badge-square bounceIn animation-delay2 m-left-xs pull-right">3</small>--%>
										<%--</a>--%>

										<%--<ul class="submenu third-level">--%>
										<%--<li><a href="#"><span class="submenu-label">Jack</span></a></li>--%>
										<%--<li><a href="#"><span class="submenu-label">Alice</span></a></li>--%>
										<%--<li class="openable">--%>
										<%--<a href="#">--%>
										<%--<span class="submenu-label">Bob</span>--%>
										<%--<small class="badge badge-danger badge-square bounceIn animation-delay2 m-left-xs pull-right">2</small>--%>
										<%--</a>--%>
										<%--<ul class="submenu fourth-level">--%>
										<%--<li><a href="#"><span class="submenu-label">Mike</span></a></li>--%>
										<%--<li><a href="#"><span class="submenu-label">Joe</span></a></li>--%>
										<%--</ul>--%>
										<%--</li>--%>
										<%--</ul>--%>
									</li>
									<%--<li><a href="#"><span class="submenu-label">Ben</span></a></li>--%>
								</ul>
							</li>

							<li class="bg-palette3">
								<a href="form_validation.jsp">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-list fa-lg"></i></span>
										<span class="text m-left-sm">危险信息上报</span>
<!-- 										<span class="submenu-icon"></span> -->
									</span>
									<span class="menu-content-hover block">
										危险上报
									</span>
								</a>
<!--
								<ul class="submenu bg-palette4">
									<li><a href="form_element.jsp"><span class="submenu-label">Form Element</span></a></li>
									<li><a href="form_validation.jsp"><span class="submenu-label">Form Validation</span></a></li>
									<li><a href="form_wizard.jsp"><span class="submenu-label">Form Wizard</span></a></li>
									<li><a href="dropzone.jsp"><span class="submenu-label">Dropzone</span></a></li>
								</ul>
-->
							</li>

							
							<li class="bg-palette2">
								<a href="timeline.jsp">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-clock-o fa-lg"></i></span>
										<span class="text m-left-sm">事件处理时间表</span>
										<small class="badge badge-warning badge-square bounceIn animation-delay6 m-left-xs pull-right">7</small>
									</span>
									<span class="menu-content-hover block">
										时间表
									</span>
								</a>
							</li>

							<li class="bg-palette1">
								<a href="inbox.jsp">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-envelope fa-lg"></i></span>
										<span class="text m-left-sm">管理员列表</span>
										<small class="badge badge-danger badge-square bounceIn animation-delay5 m-left-xs">5</small>
									</span>
									<span class="menu-content-hover block">
										管理员
									</span>
								</a>
							</li>
							<li class="menu-header">
								Others
							</li>
							<li class=" bg-palette3">
								<a href="profile.jsp">
									<span class="menu-content block">
										<span class="menu-icon"><i class="block fa fa-gift fa-lg"></i></span>
										<span class="text m-left-sm">个人信息</span>
									</span>
									<span class="menu-content-hover block">
										个人
									</span>
								</a>

							</li>

						</ul>
					</div>	
					<div class="sidebar-fix-bottom clearfix">
						<div class="user-dropdown dropup pull-left">
							<a href="#" class="dropdwon-toggle font-18" data-toggle="dropdown"><i class="ion-person-add"></i>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="inbox.jsp">
										管理员列表
										<span class="badge badge-danger bounceIn animation-delay2 pull-right">1</span>
									</a>
								</li>			  
								<li>
									<a href="#">
										通知
										<span class="badge badge-purple bounceIn animation-delay3 pull-right">2</span>
									</a>
								</li>			  
								<li>
									<a href="#" class="sidebarRight-toggle">
										消息
										<span class="badge badge-success bounceIn animation-delay4 pull-right">7</span>
									</a>
								</li>			  	  
								<li class="divider"></li>
								<li>
									<a href="#">设置</a>
								</li>			  	  
							</ul>
						</div>
						<a href="lockscreen.jsp" class="pull-right font-18"><i class="ion-log-out"></i></a>
					</div>
				</div><!-- sidebar-inner -->
			</aside>
			
			<div class="main-container">
				<div class="padding-md">
					<div class="row">
						<div class="col-sm-6">
							<div class="page-title">
								概述
							</div>
							<div class="page-sub-header">
								欢迎回来, Bonsen , <i class="fa fa-map-marker text-danger"></i> Shanghai
							</div>
						</div>
						<div class="col-sm-6 text-right text-left-sm p-top-sm">
							<div class="btn-group">
								<button class="btn btn-default"><% out.print("#"+list.get(z).get("tname")+"#"); %></button>
							  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							    <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu zbh pull-right" role="menu" aria-labelledby="dropdownMenu">
								  <%
									  for(int i =0;i<list.size();++i){
										  out.print("<li><a href=\"zhu.jsp?choose="+i+"\"");
										  out.print("tabindex=\"-1\">#");
										  out.print(list.get(i).get("tname")+"#</a></li>");
									  }
								  %>
								  <%--<li><a href="#">#女子痛斥医院票贩#</a></li>--%>
							    <%--<li><a href="#">#对口型大作战#</a></li>--%>
							    <%--<li><a href="#">#女医明妃传#</a></li>--%>
							    <%--<li><a href="#">#今年夏天都会变瘦#</a></li>--%>
							    <%--<li><a href="#">#最强大脑#</a></li>--%>
							    <%--<li><a href="#">#我是歌手#</a></li>--%>
							    <%--<li><a href="#">#上瘾网络剧#</a></li>--%>
							    <%--<li><a href="#">#你是怎么弄丢那个对你好的人的#</a></li>--%>
							    <%--<li><a href="#">#假期别走#</a></li>--%>
<!-- 							    <li class="divider"></li> -->
<!-- 							    <li><a href="#">Setting</a></li> -->
							  </ul>
							</div>

<!-- 							<a class="btn btn-default"><i class="fa fa-cog"></i></a> -->
						</div>
					</div>



					<div class="row m-top-md">
						<div class="col-lg-3 col-sm-6">
							<div class="statistic-box bg-danger m-bottom-md">
								<div class="statistic-title">
									总评论人数
								</div>

								<div class="statistic-value">
									<%
										out.print(list.get(z).get("pinglun")+"k");
									%>
									<%--96.7k--%>
								</div>

								<div class="m-top-md">比上周高了
									<%--11--%>
									<%
										out.print(list.get(z).get("pinglunrate")+"%");
									%>
									</div>

								<div class="statistic-icon-background">
									<i class="ion-eye"></i>
								</div>
							</div>
						</div>

						<div class="col-lg-3 col-sm-6">
							<div class="statistic-box bg-info m-bottom-md">
								<div class="statistic-title">
									总点赞人数
								</div>

								<div class="statistic-value">
									<%--751--%>
									<%
										out.print(list.get(z).get("dianzan")+"k");
									%>
								</div>

								<div class="m-top-md">比上周高了
									<%--8%--%>
									<%
										out.print(list.get(z).get("dianzanrate")+"%");
									%>
								</div>

								<div class="statistic-icon-background">
									<i class="ion-ios7-cart-outline"></i>
								</div>
							</div>
						</div>

						<div class="col-lg-3 col-sm-6">
							<div class="statistic-box bg-purple m-bottom-md">
								<div class="statistic-title">
									潜在危险人数
								</div>

								<div class="statistic-value">
									<%--28--%>
									<%
										out.print(list.get(z).get("qianzai")+"k");
									%>
								</div>

								<div class="m-top-md">比上周高了
									<%--3%--%>
									<%
										out.print(list.get(z).get("qianzairate")+"%");
									%>
								</div>

								<div class="statistic-icon-background">
									<i class="ion-person-add"></i>
								</div>
							</div>
						</div>

						<div class="col-lg-3 col-sm-6">
							<div class="statistic-box bg-success m-bottom-md">
								<div class="statistic-title">
									话题敏感度
								</div>

								<div class="statistic-value">
									<%--29%--%>
									<%
										out.print(list.get(z).get("mingan")+"%");
									%>
								</div>

								<div class="m-top-md">比上周高了
									<%--7%--%>
									<%
										out.print(list.get(z).get("minganrate")+"%");
									%>
								</div>

								<div class="statistic-icon-background">
									<i class="ion-stats-bars"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="site-wrapper">
					      <div class="site-wrapper-inner">
					        <div class="cover-container">
					          <h1 class="hotTopic">话题详情</h1>
					          <div class="top">
					            <div class="topleft">
									<%--<img src="./resource/topicPic/topicpic.jpg " class="pic img-thumbnail">--%>
								  <%
									  out.print("<img src=\"");
									  out.print(list.get(z).get("pic")+"\"");
									  out.print("class=\"pic img-thumbnail\">");

								  %>
								</div>
					            <div class="topright">
					              <div class="righttop"></div>
					              <div class="rightbuttom">
					                <h4><b>话题名称：</b>#
										<%--女子痛斥医院票贩--%>
										<%
											out.print(list.get(z).get("tname"));
										%>
										#</h4>
					              </div>
					            </div>
					            
					          </div>
					          
					          <div class="topic_info_wrapper">
					              <div class="topic_info">
					                <p><b>话题导语：</b>&nbsp;
										<%--近日，一女子在医院怒斥票贩子、医院和保安的视频在网上引发热议。女子说：“300块钱的号，他要4500，我天”、“这大北京，如果今天我回家死道上了，那这社会真没希望了。这是北京，首都啊。”看病难，难在此？--%>
										<%
											out.print(list.get(z).get("text"));
										%>
					                </p>
					              </div>
					          </div>
					          <div class="middle">
					            <div class="middleleft">
					              <div class="biaoti">
					                <h2 class="title">存在可疑用户</h2>  
					              </div>
					              <div class="box">
					                <ul class="picitems_ul">


					                  <%--<li class="picitem">--%>
					                    <%--<div class="midbox">--%>
					                      <%--<p class="pic_wrap">--%>
					                        <%--<span class="pic_box">--%>
					                          <%--<a target="_blank" href="./zong1.jsp">--%>
					                          <%--<img src="./resource/userPic/1.jpg" alt="中安在线"></a>--%>
					                        <%--</span> --%>
					                      <%--</p>--%>
					                      <%--<p class="name">--%>
					                        <%--<a target="_blank">中安在线</a>--%>
					                      <%--</p>--%>
					                    <%--</div>--%>
					                  <%--</li>--%>

								<%
									for(int n=0;n<plist.size();++n){
										out.print("<li class=\"picitem\">");
										out.print(" <div class=\"midbox\">");
										out.print("<p class=\"pic_wrap\">");
										out.print("<span class=\"pic_box\">");
										out.print("<a target=\"_blank\" href=\"zong1.jsp\">");
										out.print(" <img src=\""+plist.get(n).get("pic")+"\" alt=\"\"></a>");
										out.print("</span>");
										out.print(" </p>");
										out.print("<p class=\"name\">");
										out.print("<a target=\"_blank\">"+plist.get(n).get("pname")+"</a>");
										out.print("</p>");
										out.print("</div>");
										out.print("</li>");
									}
								%>

					                  <%--<li class="picitem">--%>
					                    <%--<div class="midbox">--%>
					                      <%--<p class="pic_wrap">--%>
					                        <%--<span class="pic_box">--%>
					                          <%--<a target="_blank" href="./zong1.jsp">--%>
					                          <%--<img src="./resource/userPic/2.jpg" alt="毁在云端" title="毁在云端"></a>--%>
					                        <%--</span> --%>
					                      <%--</p>--%>
					                      <%--<p class="name">--%>
					                        <%--<a target="_blank" href="./zong1.jsp"title="毁在云端">毁在云端</a>--%>
					                      <%--</p>--%>
					                    <%--</div>--%>
					                  <%--</li>--%>
					                  <%--<li class="picitem">--%>
					                    <%--<div class="midbox">--%>
					                      <%--<p class="pic_wrap">--%>
					                        <%--<span class="pic_box">--%>
					                          <%--<a target="_blank" href="./zong1.jsp">--%>
					                          <%--<img src="./resource/userPic/3.jpg" alt="用户5634567231" title="用户5634567231"></a>--%>
					                        <%--</span> --%>
					                      <%--</p>--%>
					                      <%--<p class="name">--%>
					                        <%--<a target="_blank" href="./zong1.jsp"title="用户5634567231">用户5634567231</a>--%>
					                      <%--</p>--%>
					                    <%--</div>--%>
					                  <%--</li>--%>
					                  <%--<li class="picitem">--%>
					                    <%--<div class="midbox">--%>
					                      <%--<p class="pic_wrap">--%>
					                        <%--<span class="pic_box">--%>
					                          <%--<a target="_blank" href="./zong1.jsp">--%>
					                          <%--<img src="./resource/userPic/4.jpg" alt="过客5863229389" title="过客5863229389"></a>--%>
					                        <%--</span> --%>
					                      <%--</p>--%>
					                      <%--<p class="name">--%>
					                        <%--<a target="_blank" href="./zong1.jsp"title="过客5863229389">过客5863229389</a>--%>
					                      <%--</p>--%>
					                    <%--</div>--%>
					                  <%--</li>--%>
					                  <%--<li class="picitem">--%>
					                    <%--<div class="midbox">--%>
					                      <%--<p class="pic_wrap">--%>
					                        <%--<span class="pic_box">--%>
					                          <%--<a target="_blank" href="./zong1.jsp">--%>
					                          <%--<img src="./resource/userPic/5.jpg" alt="pxT一" title="pxT一"></a>--%>
					                        <%--</span> --%>
					                      <%--</p>--%>
					                      <%--<p class="name">--%>
					                        <%--<a target="_blank" href="./zong1.jsp"title="pxT一">pxT一</a>--%>
					                      <%--</p>--%>
					                    <%--</div>--%>
					                  <%--</li>--%>
					                  <%--<li class="picitem">--%>
					                    <%--<div class="midbox">--%>
					                      <%--<p class="pic_wrap">--%>
					                        <%--<span class="pic_box">--%>
					                          <%--<a target="_blank" href="./zong1.jsp">--%>
					                          <%--<img src="./resource/userPic/6.jpg" alt="fenger1205" title="fenger1205"></a>--%>
					                        <%--</span> --%>
					                      <%--</p>--%>
					                      <%--<p class="name">--%>
					                        <%--<a target="_blank" href="./zong1.jsp"title="fenger1205">fenger1205</a>--%>
					                      <%--</p>--%>
					                    <%--</div>--%>
					                  <%--</li>--%>
					                  <%--<li class="picitem">--%>
					                    <%--<div class="midbox">--%>
					                      <%--<p class="pic_wrap">--%>
					                        <%--<span class="pic_box">--%>
					                          <%--<a target="_blank" href="./zong1.jsp">--%>
					                          <%--<img src="./resource/userPic/7.jpg" alt="david-sam- " title="david-sam- "></a>--%>
					                        <%--</span> --%>
					                      <%--</p>--%>
					                      <%--<p class="name">--%>
					                        <%--<a target="_blank" href="./zong1.jsp"title="david-sam- ">david-sam- </a>--%>
					                      <%--</p>--%>
					                    <%--</div>--%>
					                  <%--</li>--%>
					                  <%--<li class="picitem">--%>
					                    <%--<div class="midbox">--%>
					                      <%--<p class="pic_wrap">--%>
					                        <%--<span class="pic_box">--%>
					                          <%--<a target="_blank" href="./zong1.jsp">--%>
					                          <%--<img src="./resource/userPic/8.jpg" alt="舊變新的香港人" title="舊變新的香港人"></a>--%>
					                        <%--</span> --%>
					                      <%--</p>--%>
					                      <%--<p class="name">--%>
					                        <%--<a target="_blank" href="./zong1.jsp"title="舊變新的香港人">舊變新的香港人</a>--%>
					                      <%--</p>--%>
					                    <%--</div>--%>
					                  <%--</li>--%>
					                </ul>
					              </div>
					
					            </div>
					            <div class="middleright">
					              <div class="fenlei">
					                <div class="fenlei1">
					                  <strong class="w_f">
										  <%--120.6--%>
										  <%
											  int i=Integer.parseInt(list.get(z).get("pinglun").toString());
											  int j=Integer.parseInt(list.get(z).get("dianzan").toString());
											  double d = (i*6+j)*1.3/10;
											  BigDecimal b = new BigDecimal(d);
											  double f1 = b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
											  out.print(f1);
										  %>
										  万</strong>
					                  <span class="s_txt">阅读</span>
					                </div>
					                <div class="fenlei2">
					                  <strong class="w_f">
										  <%--7460--%>
										  <%
											  out.print(list.get(z).get("pinglun")+"k");
										  %>
									  </strong>
					                  <span class="s_txt">讨论</span>
					                </div>
					                <div class="fenlei3">
					                  <strong class="w_f">
										  <%--170--%>
										  <%
											  int x=Integer.parseInt(list.get(z).get("pinglun").toString());
											  double d1 = x*1.2;
											  BigDecimal b1 = new BigDecimal(d1);
											  double f11 = b1.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
											  out.print(f11+"k");
										  %>
									  </strong>
					                  <span class="s_txt">粉丝</span>
					                </div>
					              </div>
					              <div class="space"></div>
					              <div class="guanyu">
					                <div class="biaoti">
					                  <h2 class="title">关于</h2>
					                </div>
					                <div class="neirong">
					                  <span class="s_txt_f">分类：&nbsp;&nbsp;&nbsp;</span>
					                  <strong >社会</strong>
					                  <br/>
					                  <br/>
					                  <span class="s_txt_f">地区：&nbsp;&nbsp;&nbsp;</span>
					                  <strong >全国</strong>
					                </div>
					              </div>
					            </div>
					          </div>
					          <div style="height:20px"></div>
					        </div>
					      </div>	
					    </div>	
					</div>
					
				</div><!-- ./padding-md -->
			</div><!-- /main-container -->

			<footer class="footer">
				<span class="footer-brand">
					<strong class="text-danger">社交网络监控</strong> 管理
				</span>
				<p class="no-margin">
					&copy; 2016 <strong>Bonsen</strong>. ALL Rights Reserved. 
				</p>	
			</footer>
		</div><!-- /wrapper -->

		<a href="#" class="scroll-to-top hidden-print"><i class="fa fa-chevron-up fa-lg"></i></a>

		<!-- Delete Widget Confirmation -->
<!--
		<div class="custom-popup delete-widget-popup delete-confirmation-popup" id="deleteWidgetConfirm">
			<div class="popup-header text-center">
				<span class="fa-stack fa-4x">
				  <i class="fa fa-circle fa-stack-2x"></i>
				  <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
				</span>
			</div>
			<div class="popup-body text-center">
				<h5>Are you sure to delete this widget?</h5>
				<strong class="block m-top-xs"><i class="fa fa-exclamation-circle m-right-xs text-danger"></i>This action cannot be undone</strong>
			
				<div class="text-center m-top-lg">
					<a class="btn btn-success m-right-sm remove-widget-btn">Delete</a>
					<a class="btn btn-default deleteWidgetConfirm_close">Cancel</a>
				</div>
			</div>
		</div>
-->

		
	    <!-- Le javascript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
		
		<!-- Jquery -->
		<script src="js/jquery-1.11.1.min.js"></script>
		
		<!-- Bootstrap -->
	    <script src="bootstrap/js/bootstrap.min.js"></script>
	  
		<!-- Flot -->
		<script src='js/jquery.flot.min.js'></script>

		<!-- Slimscroll -->
		<script src='js/jquery.slimscroll.min.js'></script>
		
		<!-- Morris -->
		<script src='js/rapheal.min.js'></script>	
		<script src='js/morris.min.js'></script>	

		<!-- Datepicker -->
		<script src='js/uncompressed/datepicker.js'></script>

		<!-- Sparkline -->
		<script src='js/sparkline.min.js'></script>

		<!-- Skycons -->
		<script src='js/uncompressed/skycons.js'></script>
		
		<!-- Popup Overlay -->
		<script src='js/jquery.popupoverlay.min.js'></script>

		<!-- Easy Pie Chart -->
		<script src='js/jquery.easypiechart.min.js'></script>

		<!-- Sortable -->
		<script src='js/uncompressed/jquery.sortable.js'></script>

		<!-- Owl Carousel -->
		<script src='js/owl.carousel.min.js'></script>

		<!-- Modernizr -->
		<script src='js/modernizr.min.js'></script>
		
		<!-- Simplify -->
		<script src="js/simplify/simplify.js"></script>
		<script src="js/simplify/simplify_dashboard.js"></script>


		<script>
			$(function()	{
				$('.chart').easyPieChart({
					easing: 'easeOutBounce',
					size: '140',
					lineWidth: '7',
					barColor: '#7266ba',
					onStep: function(from, to, percent) {
						$(this.el).find('.percent').text(Math.round(percent));
					}
				});

				$('.sortable-list').sortable();

				$('.todo-checkbox').click(function()	{
					
					var _activeCheckbox = $(this).find('input[type="checkbox"]');

					if(_activeCheckbox.is(':checked'))	{
						$(this).parent().addClass('selected');					
					}
					else	{
						$(this).parent().removeClass('selected');
					}
				
				});

				//Delete Widget Confirmation
				$('#deleteWidgetConfirm').popup({
					vertical: 'top',
					pagecontainer: '.container',
					transition: 'all 0.3s'
				});
			});

		</script>

	<script >
		$(".zbh li").click(function(){
			$(".btn:first-child").text($(this).text());
			$(".btn:first-child").val($(this).index());
			//console.log($(this).index());
		});
	</script>

  	</body>
</html>


