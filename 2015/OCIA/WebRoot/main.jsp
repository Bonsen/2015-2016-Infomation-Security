<%@ page language="java" import="java.lang.String" pageEncoding="UTF-8" %>
<%@ page import="login.UserDao" %>
<%@ page import="login.User" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    //String username = (String) session.getAttribute("username");
    //String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8 = "", s9 = "", s10 = "", s11 = "";
    //s1 = (String) session.getAttribute("s1");
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/base.css" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link href="css/bootstrap-switch.css" rel="stylesheet">

<script type="text/javascript">

function login(){
	var th =document.updatepersonalinfo;
	th.action="servlet/UpdatePersonalInfo";
	th.submit();
}
</script>
</head>
<body style="min-height:700px; height: auto">
<div class="container-fluid">

    <nav class="navbar navbar-default row no-yj  navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#nav-list-left" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a style="margin-left: 2px" class="navbar-brand" href="#">THE TEAM OF OCIA</a>
            </div>

            <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i
                            class="glyphicon glyphicon-bell"><i class="label label-warning label-nav">1</i></i></a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="#">通知</a></li>
                        </ul>
                    </li>
                    <li><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i
                            class="glyphicon glyphicon-envelope"><i class="label label-success label-nav">1</i></i></a>

                        <ul class="dropdown-menu dropdown-menu-right">
                            <li><a href="#">站内信</a></li>
                        </ul>
                    </li>


                    <%
                        if (session.getAttribute("login") == null) {
                            response.sendRedirect("index.jsp");
                            return;
                        }
                    %>

                    <li><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="height: 50px">
                        <img class="img-circle pull-left img-responsive nav-user-img" src="img/user/user.jpg"/>
                        <%
                            UserDao userDAO = new UserDao();
                            User user = userDAO.queryByEmail((String) session.getAttribute("login"));
                            out.println("<span class=\"pull-left nav-username\">");
                            out.println(user.getUsername());
                            out.println("</span>");
                        %>
                    </a>

                        <ul class="dropdown-menu dropdown-menu-right clearfix" style="padding-top: 0px">
                            <li class="user-li-head"><span>
                                    <img class="img-circle nav-user-img-xiala center-block"
                                         src="img/user/user.jpg"/></span>

                                <p></p>

                                <p class="text-center"><span>OCIA</span></p>

                                <p class="text-center"><span>OCIA</span></p>

                                <p class="text-center">
                                    <small><span>OCIA</span></small>
                                </p>
                            </li>
                            <li style="padding: 10px 20px; padding-bottom: 20px">

                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat no-yj">资料</a>
                                </div>
                                <div class="pull-right">
                                    <a href="mainout.jsp" class="btn btn-default btn-flat no-yj">注销</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>


            </div>


        </div>
    </nav>



    <div class="row" style="margin-top:70px">
        <div class="  nav-left col-md-2 no-padding" id="nav-list-left">
            <div class="user-panel">
                <img src="img/user/user.jpg" class="img-circle center-block"/>
            </div>

            <div class="nav-list">
                <ul>
                    <li>
                        <a href="#">个人资料</a>

                    </li>
                    <li class="nav-left-dropdown">
                        <a href="#">修改信息</a>
                        <ul class="nav-left-dropdown-menu">
                            <li><a href="#">头像</a></li>
                            <li><a href="#">昵称</a></li>
                            <li><a href="#">我的二维码</a></li>
                            <li><a href="#">用户详情</a></li>
                            <li><a href="#">手势密码</a></li>
                            <li><a href="#">密码管理</a></li>
                            <li><a href="#">支付设置</a></li>
                        </ul>
                    </li>
                    <li class="nav-left-dropdown">
                        <a href="#">我的购物车</a>
                        <ul class="nav-left-dropdown-menu">
                            <li><a href="#">在线支付</a></li>
                            <li><a href="#">亲密付</a></li>
                            <li><a href="#">信用卡</a></li>
                            <li><a href="#">付款码</a></li>
                            <li><a href="#">红包</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">我的金币</a>
                    </li>
                    <li>
                        <a href="#">秒拍</a>
                    </li>
                    <li class="nav-left-dropdown">
                        <a href="#">账户与安全</a>
                        <ul class="nav-left-dropdown-menu">
                            <li><a href="#">账户保护</a></li>
                            <li><a href="#">设备管理</a></li>
                            <li><a href="#">快速挂失</a></li>
                            <li><a href="#">用户授权管理</a></li>
                            <li><a href="#">用户安全险</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

        <div class="main-right  col-md-10 col-md-offset-2">
            <div class="span12">

                <div class="page-header" style="margin-left:70px;margin-top: -2px">
                    <h1>个人资料</h1>
                </div>
                                <%

                %>
                <%
                    if (session.getAttribute("noocia")=="yes"||user.getOpenfea().equals("0")) {
                        out.print("<div class=\"help-block alert alert-danger\">当前您尚未开启OCIA认证服务&hellip;</div>");
                    	
                    }else{
                    	if(user.getMopen().equals("2")&&user.getOpenfea().equals("1")){
	                        if(session.getAttribute("ocia")=="phone"){
	                          	 out.print("<div class=\"help-block alert alert-warning\">当前模式为opportunistic，并且已通过手机认证&hellip;</div>");
	                          	
	                          }else {
	                            	 out.print("<div class=\"help-block alert alert-warning\">当前模式为opportunistic，但是没有通过手机认证&hellip;</div>");
	                          }
                    	}else if(user.getMopen().equals("3")&&user.getOpenfea().equals("1")){
                         	 out.print("<div class=\"help-block alert alert-info\">当前模式为strict&hellip;</div>");
                    	}
                    }
                %>

                <%
                    if ((String)session.getAttribute("updatesuccess") == "true") {
                        out.print("<div class=\"help-block alert alert-success\">修改信息成功&hellip;</div>");
                        session.removeAttribute("updatesuccess");
                    }
                %>

                <form accept-charset="UTF-8" method="post" class="form-inline"
                      action="servlet/UpdatePersonalInfo" id="updatepersonalinfo" name="updatepersonalinfo">
                    <fieldset>
                        </br>
                        <div style="margin-left:70px">
                            <legend>基本信息</legend>
                        </div>
                        </br>
                        <div class="form-group" style="margin-left: 200px">
                            <label class="control-label" for="realname">姓名</label>
                            <input id="realname" name="realname" size="30" type="text"
                                   placeholder="我们需要你的真实姓名" class="form-control" style="margin-left: 20px"
                                   value="<%out.print(user.getRealname());%>"
                                   required/>
                        </div>
                        </br>
                        <div class="form-group" style="margin-left: 200px;margin-top: 20px">
                            <label class="control-label" for="gender">性别</label>
                            <select id="gender" name="gender" class="form-control"
                                    style="margin-left: 20px;width: 242px">
                                <option value="男"  <%
                                            if (user.getGender()=="男"){
                                                out.print("selected");}
                                        %>>男
                                      

                                </option>
                                <option value="女"  <%
                                            if (user.getGender()=="女"){
                                                out.print("selected");}
                                        %>>女
                                       

                                </option>
                                <option value="其他" <%
                                            if (user.getGender()=="其他"){
                                                out.print("selected");}
                                        %>>其他
                                       

                                </option>
                            </select>
                        </div>

                    </fieldset>

                    <fieldset>
                        </br>
                        <div style="margin-left:70px">
                            <legend>重要信息</legend>
                        </div>
                        </br>
                        <div class="form-group" style="margin-left: 200px;">
                            <label class="control-label" for="memail">邮箱</label>
                            <input id="memail" name="memail" size="30" type="email"
                                   placeholder="需要填写邮箱" class="form-control" style="margin-left: 20px"
                                   value="<%out.print(user.getEmail());%>"
                                   required/>
                        </div>
                        </br>
                        <div class="form-group" style="margin-left: 172px;margin-top: 20px">
                            <label class="control-label" for="phonenumber">联系电话</label>
                            <input id="phonenumber" name="phonenumber" size="30" type="text"
                                   placeholder="联系电话" class="form-control" style="margin-left: 20px"
                                   value="<%out.print(user.getPhone());%>"
                                   required/>
                        </div>
                        </br>

                    </fieldset>

                    <!-- <fieldset>
                        <legend>用户头像</legend>
                        <div class="control-group">
                            <div class="controls">
                                <img alt="Noavatar" height="128" src="">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="user_avatar">个人头像照片</label>
                            <div class="controls">
                                <input id="user_avatar" name="user[avatar]" type="file">
                            </div>
                        </div>
                    </fieldset> -->


                    <div class="form-group" style="margin-left: 137px;margin-top: 20px">
                        <label class="control-label" for="ifopen" style="margin-right: 20px">启用OCIA认证</label>
                        <input id="zzzz" name="zzzz" class="form-control" style="color:black" type="checkbox"
                           <% if((String)session.getAttribute("ocia")==null&&(String)session.getAttribute("noocia")==null){out.print("disabled");}else if(user.getOpenfea().equals("1")){out.print("checked");}%>
        
                                >
                    </div>
  <input id="ifopen" name="ifopen"  style="display:none"     />
                                  <input id="username" name="username"  style="display:none"     value="<%out.print(user.getUsername());%>"/>
                    </br>
                    <div id="mycontrol">
                        <div class="form-group" style="margin-left: 253px;margin-top: 20px">
                            <div class="radio">
                                <label>
                                    opportunistic
                                    <input type="radio" style="margin-left: 10px" name="optionsRadios"
                                           id="optionsRadios1"
                                           value="2"
                                        <%if (user.getMopen().equals("2"))
                                out.print("checked");%>
                                            >

                                </label>
                            </div>
                        </div>
                        <div class="form-group" style="margin-left: 10px;margin-top: 20px">
                            <div class="radio">
                                <label>
                                    strict
                                    <input type="radio" style="margin-left: 10px" name="optionsRadios"
                                           id="optionsRadios2"
                                           value="3"
                                        <%if (user.getMopen().equals("3"))
                                out.print("checked");%>>

                                </label>
                            </div>
                        </div>
                    </div>



                    <div  style="margin-left: 253px;margin-top: 20px">
                        <input class="btn btn-primary" type="button" onclick="login()" value="提交修改">
                    </div>

                </form>

            </div>
        </div>

    </div>
</div>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-switch.js"></script>
<script>
    $(document).ready(function () {
        $(".dropdownMenu").dropdown();
        $(".nav-left-dropdown>a").click(function () {


            if ($(this).attr("d") != 1 && $(this).attr("d") != undefined) {
                $(this).removeClass("nav-left-dropdown-a");
                $this = $(this);
                $(this).next("ul").slideUp(300, function () {
                    $this.removeClass("nav-left-bottrom-border");
                    $this.removeClass("nav-left-dropdown-ul")
                });

                $(this).attr("d", "1");

            } else {
                $(this).addClass("nav-left-dropdown-a");
                $(this).addClass("nav-left-bottrom-border");
                $(this).next("ul").addClass("nav-left-dropdown-ul").slideDown(300);
                $(this).attr("d", "2");

            }


        })
    });

</script>

<script>
    function aa() {
        if ($('#zzzz').bootstrapSwitch('state')) {
            $('#mycontrol').css("display", "block");
            document.getElementById("ifopen").value = "1";
        } else {
            $('#mycontrol').css("display", "none");
            document.getElementById("ifopen").value = "0";
        }
    }
    setInterval("aa()", 100);
</script>
</body>
</html>