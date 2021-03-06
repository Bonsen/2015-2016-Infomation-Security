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
												<a href="profile.html" class="m-right-sm">Profile</a>
												<a href="signin.html">Log out</a>
											</div>
										</div>
									</li>	  
									<li>
										<a href="inbox.html">
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
												<a href="profile.html">
													<i class="fa fa-edit fa-lg"></i><span class="m-left-xs">My Profile</span>
												</a>
											</li>
-->
											<li>
												<a href="inbox.html">
													<i class="fa fa-inbox fa-lg"></i><span class="m-left-xs">管理员消息</span>
													<span class="badge badge-danger bounceIn animation-delay3">2</span>
												</a>
											</li>
											<li>
												<a href="signin.html">
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
			</header>			<aside class="sidebar-menu fixed">
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
									<li ><%
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
								</ul>
							</li>
							<li class="openable bg-palette4 open">
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
								<ul class="submenu ">
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
								<a href="form_validation.html">
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
									<li><a href="form_element.html"><span class="submenu-label">Form Element</span></a></li>
									<li><a href="form_validation.html"><span class="submenu-label">Form Validation</span></a></li>
									<li><a href="form_wizard.html"><span class="submenu-label">Form Wizard</span></a></li>
									<li><a href="dropzone.html"><span class="submenu-label">Dropzone</span></a></li>
								</ul>
-->
							</li>
							<li class="bg-palette2">
								<a href="timeline.html">
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
								<a href="inbox.html">
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
								<a href="profile.html">
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
					</div>						<div class="sidebar-fix-bottom clearfix">
						<div class="user-dropdown dropup pull-left">
							<a href="#" class="dropdwon-toggle font-18" data-toggle="dropdown"><i class="ion-person-add"></i>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="inbox.html">
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
						<a href="lockscreen.html" class="pull-right font-18"><i class="ion-log-out"></i></a>
					</div>
				</div><!-- sidebar-inner -->
			</aside>
			
			<div class="main-container">
				<div class="padding-md">
					<ul class="breadcrumb">
						<li><span class="primary-font"><i class="icon-home"></i></span><a href="index.html">总体情况</a></li>
						<li></li>	 
<!-- 						<li>Static Table</li>	 --> 
					</ul>

					<h3 class="header-text m-top-lg">总体情况</h3>

					    <div class="blockToGo" id="h5" name="h5"></div>
						<h1 class="page-header" >博主相关用户关系度分析</h1>
						<div class="weiboNumber" id="info7"> </div>

						<div class="blockToGo" id="h6" name="h6"></div>
						<h1 class="page-header" >博主相关用户倾向分析</h1>
						<div class="weiboNumber" id="info8"></div>
          
						<div class="weiboNumber table-responsive"style="height:auto" > 
				            <table class="table table-striped" style="margin-top:30px">
				              <thead>
				                <tr>
				                  <th>#</th>
				                  <th>id</th>
				                  <th>亲密度</th>
				                </tr>
				              </thead>
				              <tbody>
				                <tr>
				                  <td>1</td>
				                  <td>Skiiasone</td>
				                  <td>85</td>
				                  
				                </tr>
				                <tr>
				                  <td>2</td>
				                  <td>女汉子不是女神经</td>
				                  <td>80</td>
				                  
				                </tr>
				                <tr>
				                  <td>3</td>
				                  <td>少女壁纸匠</td>
				                  <td>77</td>
				                  
				                </tr>
				                <tr>
				                  <td>4</td>
				                  <td>Esther_7q</td>
				                  <td>75</td>
				                  
				                </tr>
				                <tr>
				                  <td>5</td>
				                  <td>李小晨的少女心</td>
				                  <td>60</td>
				                  
				                </tr>
				                <tr>
				                  <td>6</td>
				                  <td>无伤优优 </td>
				                  <td>55</td>
				                  
				                </tr>
				                <tr>
				                  <td>7</td>
				                  <td>H_UY</td>
				                  <td>53</td>
				                  
				                </tr>
				                <tr>
				                  <td>8</td>
				                  <td>章阳la2</td>
				                  <td>50</td>
				                  
				                </tr>
				              </tbody>
				            </table>
				        </div>
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
		require(
                    [
                        'echarts',
                        'echarts/chart/bar'
                    ],
                    function(ec){
                        var myChart=ec.init(document.getElementById('info7'));
                        var zrColor = require('zrender/tool/color');
                        var colorList = [
                          '#ff7f50','#87cefa','#da70d6','#32cd32','#6495ed',
                          '#ff69b4','#ba55d3','#cd5c5c','#ffa500','#40e0d0'
                        ];
                        var itemStyle = {
                            normal: {
                                color: function(params) {
                                  if (params.dataIndex < 0) {
                                    // for legend
                                    return zrColor.lift(
                                      colorList[colorList.length - 1], params.seriesIndex * 0.1
                                    );
                                  }
                                  else {
                                    // for bar
                                    return zrColor.lift(
                                      colorList[params.dataIndex], params.seriesIndex * 0.1
                                    );
                                  }
                                }
                            }
                        };
                        var option;
                        option = {
                          title: {
                              text: '博主与粉丝分析'
                              
                          },
                          tooltip: {
                              trigger: 'axis',
                              backgroundColor: 'rgba(255,255,255,1)',
                              axisPointer: {
                                  type: 'shadow'
                              },
                              formatter: function(params) {
                                  // for text color
                                  var color = colorList[params[0].dataIndex];
                                  var res = '<div style="color:' + color + '">';
                                  res += '<strong>' + params[0].name + ' '
                                  for (var i = 0, l = params.length; i < l; i++) {
                                      res += '<br/>' + params[i].seriesName + ' : ' + params[i].value 
                                  }
                                  res += '</div>';
                                  return res;
                              }
                          },
                          legend: {
                              x: 'right',
                              data:['点赞数','转发数','评论数']
                          },
                          toolbox: {
                              show: true,
                              orient: 'vertical',
                              y: 'center',
                              feature: {
                                  mark: {show: true},
                                  dataView: {show: true, readOnly: false},
                                  restore: {show: true},
                                  saveAsImage: {show: true}
                              }
                          },
                          calculable: true,
                          grid: {
                              y: 80,
                              y2: 40,
                              x2: 40
                          },
                          xAxis: [
                              {
                                  type: 'category',
                                  data: ['Skiiasone ', '女汉子不是女神经', '少女壁纸匠 ', 'Esther_7q', '李小晨的少女心', '无伤优优 ', 'H_UY ', '章阳la2 ']
                              }
                          ],
                          yAxis: [
                              {
                                  type: 'value'
                              }
                          ],
                          series: [
                              {
                                  name: '点赞数',
                                  type: 'bar',
                                  itemStyle: itemStyle,
                                  data: [370,258,232,108,91,123,127,88]
                              },
                              {
                                  name: '转发数',
                                  type: 'bar',
                                  itemStyle: itemStyle,
                                  data: [498,150,137,123,89,184,123,65]
                              },
                              {
                                  name: '评论数',
                                  type: 'bar',
                                  itemStyle: itemStyle,
                                  data: [589,232,184,101,102,33,223,74]
                              }
                          ]
                      };
                        
                    
                        myChart.setOption(option);
                    }
        );//博主与粉丝关系度分析7
        require(
                    [
                        'echarts',
                        'echarts/chart/force'

                    ],
                    function(ec){
                        var myChart=ec.init(document.getElementById('info8'));
                        var option;
                        option = {
                          title : {
                              text: '博主人物关系',   
                              x:'right',
                              y:'bottom'
                          },
                          tooltip : {
                              trigger: 'item',
                              formatter: '{a} : {b}'
                          },
                          toolbox: {
                              show : true,
                              feature : {
                                  restore : {show: true},
                                  magicType: {show: true, type: ['force', 'chord']},
                                  saveAsImage : {show: true}
                              }
                          },
                          legend: {
                              x: 'left',
                              data:['粉丝','关注']
                          },
                          series : [
                              {
                                  type:'force',
                                  name : "人物关系",
                                  ribbonType: false,
                                  categories : [
                                      {
                                          name: '人物'
                                      },
                                      {
                                          name: '粉丝'
                                      },
                                      {
                                          name:'关注'
                                      }
                                  ],
                                  itemStyle: {
                                      normal: {
                                          label: {
                                              show: true,
                                              textStyle: {
                                                  color: '#333'
                                              }
                                          },
                                          nodeStyle : {
                                              brushType : 'both',
                                              borderColor : 'rgba(255,215,0,0.4)',
                                              borderWidth : 1
                                          },
                                          linkStyle: {
                                              type: 'curve'
                                          }
                                      },
                                      emphasis: {
                                          label: {
                                              show: false
                                              // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                                          },
                                          nodeStyle : {
                                              //r: 30
                                          },
                                          linkStyle : {}
                                      }
                                  },
                                  useWorker: false,
                                  minRadius : 15,
                                  maxRadius : 25,
                                  gravity: 1.1,
                                  scaling: 1.1,
                                  roam: 'move',
                                  nodes:[
                                  
                                      {category:0, name: '博主', value : 10, label: '博主\n（博主）'},
                                      {category:1, name: '章阳la2',value : 2},
                                      {category:1, name: 'H_UY',value : 3},
                                      {category:1, name: '无伤优优',value : 3},
                                      {category:1, name: '少女壁纸匠',value : 7},
                                      {category:2, name: 'Esther_7q',value : 5},
                                      {category:2, name: '女汉子不是女神经',value : 8},
                                      {category:2, name: 'Skiiasone',value : 9},
                                      {category:2, name: '李小晨的少女心',value : 4},
                                      
                                  ],
                                  links : [
                                 
                                      {source : '女汉子不是女神经', target : '博主', weight : 2},
                                      {source : '少女壁纸匠', target : '博主', weight : 2},
                                      {source : 'Esther_7q', target : '博主', weight : 1},
                                      {source : '李小晨的少女心', target : '博主', weight : 2},
                                      {source : '无伤优优', target : '博主', weight : 3},
                                      {source : '章阳la2', target : '博主', weight : 1},
                                      {source : 'Skiiasone', target : '博主', weight : 6},
                                      {source : 'H_UY', target : '博主', weight : 1},
                                      {source : '章阳la2', target : '李小晨的少女心', weight : 1},
                                      {source : 'Skiiasone', target : '章阳la2', weight : 6},
                                      {source : 'Skiiasone', target : 'Esther_7q', weight : 1},
                                      {source : 'H_UY', target : '章阳la2', weight : 1}
                                  ]
                              }
                          ]
                      };
                      var ecConfig = require('echarts/config');
                      function focus(param) {
                          var data = param.data;
                          var links = option.series[0].links;
                          var nodes = option.series[0].nodes;
                          if (
                              data.source !== undefined
                              && data.target !== undefined
                          ) { //点击的是边
                              var sourceNode = nodes.filter(function (n) {return n.name == data.source})[0];
                              var targetNode = nodes.filter(function (n) {return n.name == data.target})[0];
                              console.log("选中了边 " + sourceNode.name + ' -> ' + targetNode.name + ' (' + data.weight + ')');
                          } else { // 点击的是点
                              console.log("选中了" + data.name + '(' + data.value + ')');
                          }
                      }
                      myChart.on(ecConfig.EVENT.CLICK, focus)

                      myChart.on(ecConfig.EVENT.FORCE_LAYOUT_END, function () {
                          console.log(myChart.chart.force.getPosition());
                      });


                    
                        
                    
                        myChart.setOption(option);
                    }
        );//博主相关用户倾向分析8   
		</script>
  	</body>
</html>
