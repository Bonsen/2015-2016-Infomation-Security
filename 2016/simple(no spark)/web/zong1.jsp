<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="people.PeopleService" %>
<%@ page import="people.PeopleDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="topic.TopicService" %>
<%@ page import="topic.TopicDao" %>
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

		<link href="css/cover3.css" rel="stylesheet">
	    <!-- Bootstrap core CSS -->
	    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Font Awesome -->
		<link href="css/font-awesome.min.css" rel="stylesheet">

		<!-- ionicons -->
		<link href="css/ionicons.min.css" rel="stylesheet">
		
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


							
							<li class="openable bg-palette4 open">
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
									<li>
									<%
										out.print("<a href=\"/zongf1.jsp?choose="+z+"\">");
									%>
									<%--<a href="zongf1.jsp">--%>
									<span class="submenu-label">总体情况</span><% out.print("</a>");%>
									</li>
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
									<%--<li class="active"><a href="zong1.jsp"><span class="submenu-label">Bonsen</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Joe</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Alice</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Mike</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Bob</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Jack</span></a></li>--%>
									<%--<li><a href="#"><span class="submenu-label">Cindy</span></a></li>--%>
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
							<li class=" bg-palette3">
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
					<ul class="breadcrumb">
						<li><span class="primary-font"><i class="icon-home"></i></span><a href="zongf1.jsp">总体情况</a></li>
						<li>aaGaodOng</li>
<!-- 						<li>Static Table</li>	 --> 
					</ul>

					<h3 class="header-text m-top-lg">aaGaodOng</h3>
					<h1 class="page-header" >基础信息</h1>
					<div  class="head-pic">
						<img src="http://tva1.sinaimg.cn/crop.0.0.664.664.180/006aJGaIjw8f5yak5yx2jj30ig0igq41.jpg" class="img-circle" style="width:100px">
							<h3 style="color:white">aaGaodOng</h3>
             		</div>
			 		
			 		
             			<div class="blockToGo"></div>
						<h1 class="page-header" >微博基本信息</h1>
						<div class="weiboNumber" id="info1"></div>
						<div class="weiboNumber" id="info2"> </div>
						<div class="btn-more">
							<button class="btn btn-primary btn-large">more</button>            
	          			</div>
			  			
	          			<div class="blockToGo"></div>
			  			<h1 class="page-header" >博主情感倾向分析</h1>
			  			<div class="weiboNumber" id="info3"> </div>
	          
			  			<div class="blockToGo"></div>
			  			<h1 class="page-header" >微博内容分析</h1>
	          
			  			<div class="weiboNumber" id="info4"></div>
			  			<div class="weiboNumber" id="info5"> </div>
			  			<div class="weiboNumber" id="info6"> </div>
			  			<div class="btn-more">
			  				<button class="btn btn-primary btn-large">more</button>            
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

		<!-- Delete Widget Confirmation -->
		<div class="custom-popup delete-widget-popup delete-confirmation-popup" id="deleteWidgetConfirm">
			<div class="popup-header text-center">
				<span class="fa-stack fa-4x">
				  <i class="fa fa-circle fa-stack-2x"></i>
				  <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
				</span>
			</div>
			<div class="popup-body text-center">
				<h5>确定要删除?</h5>
				<strong class="block m-top-xs"><i class="fa fa-exclamation-circle m-right-xs text-danger"></i>这个操作不能被撤回</strong>
			
				<div class="text-center m-top-lg">
					<a class="btn btn-success m-right-sm remove-widget-btn">删除</a>
					<a class="btn btn-default deleteWidgetConfirm_close">取消</a>
				</div>
			</div>
		</div>

		<a href="#" class="scroll-to-top hidden-print"><i class="fa fa-chevron-up fa-lg"></i></a>
		
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

		<script>
			$(function()	{
				//Delete Widget Confirmation
				$('#deleteWidgetConfirm').popup({
					vertical: 'top',
					pagecontainer: '.container',
					transition: 'all 0.3s'
				});
			});
		</script>
		<script src="js/echarts.js"></script>
		<script type="text/javascript">
    	require.config({
            paths: {
                echarts: './js'
                        
            }
        });

        require([
                    'echarts',
                    'echarts/chart/line'
                    ],
                    function(ec){
                      var myChart=ec.init(document.getElementById("info1"));
                      var option;
                      option = {
                        title : {
                            text: '微博数量',
                            subtext: '单位：条'

                        },
                        tooltip : {
                            trigger: 'axis'
                        },
                        legend: {
                            data:['数量']
                        },
                       
                        calculable : true,
                        xAxis : [
                            {
                                type : 'category',
                                boundaryGap : false,
                                data : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
                            }
                        ],
                        yAxis : [
                            {
                                type : 'value'
                            }
                        ],
                        series : [
                            
                            {
                                name:'数量',
                                type:'line',
                                smooth:true,

                                itemStyle: {normal: {areaStyle: {type: 'normal'}}},
                                data:[68, 80, 57, 34, 26, 30, 67, 102, 83, 56, 30, 40],
                                markPoint : {
                                          data : [
                                              {type : 'max', name: '最大值'}
                                             
                                          ]
                                      },
                                      markLine : {
                                          data : [
                                              {type : 'average', name: '平均值'}
                                          ]
                                }
                                
                            }
                        ]
                    };
                    myChart.setOption(option);
                  }
        );//微博基本信息折线图1                 

        require(
                  [
                      'echarts',
                      'echarts/chart/bar' 
                  ],
                  function(ec){
                      var myChart=ec.init(document.getElementById('info2'));
                      var option;
                      option = {
                        title: {
                            x: 'left',
                            text: '博主微博情况分析',
                            subtext: '',
                            
                        },
                        tooltip: {
                            trigger: 'item'
                        },
                        
                        calculable: true,
                        grid: {
                            borderWidth: 0,
                            y: 80,
                            y2: 60
                        },
                        xAxis: [
                            {
                                type: 'category',
                                show: false,
                                data: ['微博数', '粉丝数', '关注数', '点赞量', '转发量']
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value',
                                show: false
                            }
                        ],
                        series: [
                            {
                                name: '博主情况分析',
                                type: 'bar',
                                itemStyle: {
                                    normal: {
                                        color: function(params) {
                                            // build a color map as your need.
                                            var colorList = [
                                              '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                               '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                               '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                            ];
                                            return colorList[params.dataIndex]
                                        },
                                        label: {
                                            show: true,
                                            position: 'top',
                                            formatter: '{b}\n{c}'
                                        }
                                    }
                                },
                                data: [673,153,257,912,389]
                                
                            }
                        ]
                    };
                    
                      myChart.setOption(option);
                  }
        );//微博基本信息柱状图2
        require(
                    [
                        'echarts',
                        'echarts/chart/gauge'
                    ],
                    function(ec){
                        var myChart=ec.init(document.getElementById('info3'));
                        var option;
                        option = {
                          tooltip : {
                              formatter: "{a} <br/>{b} : {c}%"
                          },
                          toolbox: {
                              show : true,
                              feature : {
                                  mark : {show: true},
                                  restore : {show: true},
                                  saveAsImage : {show: true}
                              }
                          },
                          series : [
                              {
                                  name:'情感倾向指数',
                                  type:'gauge',
                                  startAngle: 180,
                                  endAngle: 0,
                                  center : ['50%', '90%'],    // 默认全局居中
                                  radius : 320,
                                  axisLine: {            // 坐标轴线
                                      lineStyle: {       // 属性lineStyle控制线条样式
                                          width: 200
                                      }
                                  },
                                  axisTick: {            // 坐标轴小标记
                                      splitNumber: 10,   // 每份split细分多少段
                                      length :12,        // 属性length控制线长
                                  },
                                  axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                                      formatter: function(v){
                                          switch (v+''){
                                              case '10': return '低';
                                              case '50': return '中';
                                              case '90': return '高';
                                              default: return '';
                                          }
                                      },
                                      textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                          color: '#fff',
                                          fontSize: 15,
                                          fontWeight: 'bolder'
                                      }
                                  },
                                  pointer: {
                                      width:50,
                                      length: '90%',
                                      color: 'rgba(255, 255, 255, 0.8)'
                                  },
                                  title : {
                                      show : true,
                                      offsetCenter: [0, '-60%'],       // x, y，单位px
                                      textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                          color: '#fff',
                                          fontSize: 30
                                      }
                                  },
                                  detail : {
                                      show : true,
                                      backgroundColor: 'rgba(0,0,0,0)',
                                      borderWidth: 0,
                                      borderColor: '#ccc',
                                      width: 100,
                                      height: 40,
                                      offsetCenter: [0, -40],       // x, y，单位px
                                      formatter:'{value}%',
                                      textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                          fontSize : 50
                                      }
                                  },
                                  data:[{value: 21, name: '情感倾向指数'}]
                              }
                          ]
                      };
                        
                    
                        myChart.setOption(option);
                    }
        );//博主情感倾向分析3
        require(
                    [
                        'echarts',
                        'echarts/chart/pie'
                    ],
                    function(ec){
                        var myChart=ec.init(document.getElementById("info4"));
                        var labelTop = {
                            normal : {
                                label : {
                                    show : true,
                                    position : 'center',
                                    formatter : '{b}',
                                    textStyle: {
                                        baseline : 'bottom'
                                    }
                                },
                                labelLine : {
                                    show : false
                                }
                            }
                        };
                        var labelFromatter = {
                            normal : {
                                label : {
                                    formatter : function (params){
                                        return 100 - params.value + '%'
                                    },
                                    textStyle: {
                                        baseline : 'top'
                                    }
                                }
                            },
                        }
                        var labelBottom = {
                            normal : {
                                color: '#ccc',
                                label : {
                                    show : true,
                                    position : 'center'
                                },
                                labelLine : {
                                    show : false
                                }
                            },
                            emphasis: {
                                color: 'rgba(0,0,0,0)'
                            }
                        };
                        var radius = [50, 70];
                        var option={
                              legend: {
                                    x : 'center',
                                    y : 'button',
                                    data:[
                                        '正面微博','原创比例','转发比例','点赞比例'
                                    ]
                                },
                                title : {
                                    text: '',
                                    subtext: '',
                                    x: 'center'
                                },
                                
                                series : [
                                    {
                                        type : 'pie',
                                        center : ['10%', '30%'],
                                        radius : radius,
                                        x: '0%', // for funnel
                                        itemStyle : labelFromatter,
                                        data : [
                                            {name:'other', value:46, itemStyle : labelBottom},
                                            {name:'正面微博', value:54,itemStyle : labelTop}
                                        ]
                                    },
                                    {
                                        type : 'pie',
                                        center : ['37%', '30%'],
                                        radius : radius,
                                        x:'20%', // for funnel
                                        itemStyle : labelFromatter,
                                        data : [
                                            {name:'other', value:56, itemStyle : labelBottom},
                                            {name:'原创比例', value:44,itemStyle : labelTop}
                                        ]
                                    },
                                    {
                                        type : 'pie',
                                        center : ['63%', '30%'],
                                        radius : radius,
                                        x:'40%', // for funnel
                                        itemStyle : labelFromatter,
                                        data : [
                                            {name:'other', value:65, itemStyle : labelBottom},
                                            {name:'转发比例', value:35,itemStyle : labelTop}
                                        ]
                                    },
                                    {
                                        type : 'pie',
                                        center : ['90%', '30%'],
                                        radius : radius,
                                        x:'60%', // for funnel
                                        itemStyle : labelFromatter,
                                        data : [
                                            {name:'other', value:70, itemStyle : labelBottom},
                                            {name:'点赞比例', value:30,itemStyle : labelTop}
                                        ]
                                    }
                                ]
                        };
                        myChart.setOption(option);
                    }
        );//微博内容分析4
        function createRandomItemStyle() {
                    return {
                        normal: {
                            color: 'rgb(' + [
                                Math.round(Math.random() * 160),
                                Math.round(Math.random() * 160),
                                Math.round(Math.random() * 160)
                            ].join(',') + ')'
                        }
                    };
        }
        require(
                    [
                        'echarts',
                        'echarts/chart/wordCloud'
                    ],
                    function(ec){
                        var myChart=ec.init(document.getElementById('info5'));
                        var option={
                                title: {
                                text: '关键字',
                                link: '#'
                                },
                                tooltip: {
                                    show: true
                                },
                                series: [{
                                    name: '关键字',
                                    type: 'wordCloud',
                                    size: ['80%', '80%'],
                                    textRotation : [0, 45, 90, -45],
                                    textPadding: 0,
                                    autoSize: {
                                        enable: true,
                                        minSize: 14
                                    },
                                    data: [
                                        {
                                            name: "美食",
                                            value: 500,
                                            itemStyle: {
                                                normal: {
                                                    color: 'black'
                                                }
                                            }
                                        },
                                        {
                                            name: "计算机",
                                            value: 484,
                                            itemStyle: createRandomItemStyle()
                                        },
                                        {
                                            name: "考研泄题",
                                            value: 386,
                                            itemStyle: createRandomItemStyle()
                                        },
                                        {
                                            name: "习大大",
                                            value: 155,
                                            itemStyle: createRandomItemStyle()
                                        },
                                        {
                                            name: "旅游",
                                            value: 167,
                                            itemStyle: createRandomItemStyle()
                                        },
                                        {
                                            name: "台独",
                                            value: 44,
                                            itemStyle: createRandomItemStyle()
                                        },
                                        {
                                            name: "二孩",
                                            value: 10,
                                            itemStyle: createRandomItemStyle()
                                        },
                                        
                                    ]
                                }]
                            };
                        myChart.setOption(option);
                    }
        );//微博内容分析字符云5
        require(
                    [
                        'echarts',
                        'echarts/chart/radar'
                    ],
                    function(ec){
                        var myChart=ec.init(document.getElementById('info6'));
                        var option;

                        option = {
                          title : {
                              text: '关注领域',
                              subtext: '博主关注领域'
                          },
                          tooltip : {
                              trigger: 'axis'
                          },
                          
                          
                          calculable : true,
                          polar : [
                              {
                                  indicator : [
                                      {text : '社会', max  : 100},
                                      {text : '体育', max  : 100},
                                      {text : '娱乐', max  : 100},
                                      {text : '新闻', max  : 100},
                                      {text : '科技', max  : 100},
                                      {text : '历史', max  : 100}
                                  ],
                                  radius : 130
                              }
                          ],
                          series : [
                              {
                                  name: '博主关注领域',
                                  type: 'radar',
                                  itemStyle: {
                                      normal: {
                                          areaStyle: {
                                              type: 'default'
                                          }
                                      }
                                  },
                                  data : [
                                      {
                                          value : [97, 42, 68, 94, 90, 34],
                                          name : '博主关注领域'
                                      },
                                      
                                  ]
                              }
                          ]
                      };
                    
                        myChart.setOption(option);
                    }
        );//微博内容分析关注领域6
		</script>
  	</body>
</html>
