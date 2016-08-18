<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    
    <link rel="stylesheet" type="text/css" media="all" href="style.css">

    <script type="text/javascript" src="jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="jquery.leanModal.min.js"></script>
    <script type="text/javascript" src="jquery.qrcode.min.js"></script>
    <script type="text/javascript" src="js/easyform.js"></script>
    <script type="text/javascript" src="js/my_fi.js"></script>
    <title>OCIA_Register</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->

    <link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="css/instyle.css" media="screen"
          type="text/css"/>
    <link href="css/flat-ui.css" rel="stylesheet">
    <script type="text/javascript">

function myreg(){
	 var th = document.getElementById("reg-form");
	
	th.action="servlet/RegisterActionNoOcia";
	th.submit();
}
</script>
</head>

<body>
<embed type="application/plugin-npocia" id="Ocia" width="0px" height="0px"></embed>
<div style="text-align:center;clear:both;">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>
<div id="window" style="display:none;">
    <form name="reg-form" id="reg-form" method="post" action="servlet/RegisterAction">
        <div class="page page-front">
            <div class="page-content">
                <div id="myuser" class="input-row" style="">
                    <label class="label fadeIn">注册用户名</label>
                    <input name="username" id="username" type="text" value="用户名(1-20位中英文、数字、下划线)" style="color:#BBBBBB"
                           data-fyll="" class="input fadeIn delay1" easyform="length:4-16;char-normal;real-time;"
                           message="用户名必须为4—16位的英文字母或数字" easytip="disappear:lost-focus;theme:blue;"
                           ajax-message="用户名已存在!"/>
                </div>
                <div id="mypswd1" class="input-row" style="">
                    <label class="label fadeIn delay2">口令</label>
                    <input name="pswd" id="password1" type="text" value="口令(6-20位数字、英文)" style="color:#BBBBBB"
                           data-fyll="" class="input fadeIn delay3" easyform="length:6-16;real-time;"
                           message="密码必须为6—16位;" easytip="disappear:lost-focus;theme:blue;"/>
                </div>
                <div id="mypswd2" class="input-row" style="">
                    <label class="label fadeIn delay2">确认口令</label>
                    <input id="password2" type="text" value="确认口令" style="color:#BBBBBB" data-fyll=""
                           class="input fadeIn delay3" easyform="length:6-16;equal:#password1;real-time;"
                           message="两次密码输入要一致" easytip="disappear:lost-focus;theme:blue;"/>
                </div>


                <div id="myemail" class="input-row" style="display: none">
                    <label class="label fadeIn delay33">请输入您的email</label>
                    <input name="email" id="email" type="mail" style="color:#BBBBBB" data-fyll=""
                           value="例如(email@email.com)"
                           class="input fadeIn delay44" easyform="email;real-time;" message="Email格式要正确"
                           easytip="disappear:lost-focus;theme:blue;" ajax-message="这个Email地址已经被注册过，请换一个吧!"/>
                </div>
                <div id="myphone" class="input-row" style="display: none">
                    <label class="label fadeIn delay33">请输入您的手机号码</label>
                    <input name="phone" id="phone" type="text" style="color:#BBBBBB" data-fyll="" value="手机(11位数字)"
                           class="input fadeIn delay44" easyform="length:11;number;real-time;" message="手机必须要11位数字"
                           easytip="disappear:lost-focus;theme:blue;"/>
                </div>

                <table>
                    <tr>
                        <td class="pbm">

                        </td>
                        <td class="label1 fadeIn delay2">

                        </td>
                        <td class="label1 fadeIn delay2">

                        </td>
                        <td class="label5 fadeIn delay2">
                            <label id="mylogin1" style="margin-left: 300px" class="label5 fadeIn delay3"><a
                                    href="index.jsp">登陆</a></label>
                        </td>

                    </tr>
                </table>

                <table id="mytable" style="display: none;">
                    <tr>
                        <td class="pbm">
                            <label class="label2 fadeIn delay33">启用OCIA认证</label> &nbsp;&nbsp;
                        </td>
                        <td class="label1 fadeIn delay44">
                            <div class="bootstrap-switch-square">
                                <input  type="checkbox" data-toggle="switch" id="zzzz"/>
                            </div>
                            <input name="openfea"id="openfea" type="text" style="display:none" value="3"/>
                        </td>
                        <td class="label1 fadeIn delay44">
                            <label style="margin-left: 120px" class="label2 fadeIn delay44"><a
                                    href="index.jsp">登陆</a></label>
                        </td>
                    </tr>
                </table>
                <div id="openfeat" name="openfeat" class="col-xs-3" style="display:none">
                    <div class="label1 fadeIn delay22">
                        <label class="label2 fadeIn delay22">opportunistic</label> &nbsp;&nbsp;
                        <label class="radio">
                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="2"
                                   data-toggle="radio" checked="">
                        </label>

                        <label class="label2 fadeIn delay22">strict</label> &nbsp;&nbsp;
                        <label class="radio">
                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="3"
                                   data-toggle="radio">
                        </label>
                    </div>
                </div>

                <div id="myitem" class="label1 fadeIn delay44" style="display:none">
                    <label class="checkbox" for="checkbox2">
                        <input type="checkbox" checked="checked" value="" id="checkbox2" data-toggle="checkbox"
                               checked="">
                        <label class="label2 fadeIn delay44">我已阅读并同意<a>使用条款和隐私政策</a></label>
                    </label>
                </div>


                <div class="input-row">
                    <br/>

                    <div id="loginmodal" style="display:none;"><!--弹出来的二维码-->
                        <center>
                            <div id="qrcode"></div>
                        </center>
                        </br>
						<table>
                        	<tr>
                            	<td>
                                	<div class="center">
                                   		<input type="submit" style="margin-left:20px;" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal"
                                           value="确定" onclick="" tabindex="3"></center>
                                	</div>
                           		</td>
                            	<td>
                                	<div class="center" >
                                    	<input style="width:97px;margin-left:25px" name="btnno" id="btnno" class="flatbtn-blu hidemodal"
                                           value="取消" onclick="" tabindex="3">
                                	</div>
                            	</td>
                            </tr>
                        </table>

                    </div>


                    <input type="hidden" id="hidden1" value="">

                    <%--<table>--%>
                    <%--<tr>--%>

                    <%--<div id="foreregister" class="label3 fadeIn delay44" style="display: none;">--%>

                    <%--<button type="button" onclick="changenext(1);" class="btn btn-primary btn-lg btn-block">--%>
                    <%--<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上一步&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>--%>
                    <%--</button>--%>
                    <%--</br>--%>
                    <%--</div>--%>
                    <%--</tr>--%>
                    <%--<tr >--%>
                    
                   <div id="nextregister2" style="display: none;" onclick="myreg();">
                        <center>
                            <input type="submit" class="btn btn-primary btn-lg btn-block"
                                   value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确定&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">
                            </input>
                        </center>
                    </div>
                    
                    <div id="nextregister" class="label3 fadeIn delay44" style="display: none;">
                        <center><a href="#loginmodal"
                                   id="modaltrigger" onclick="generateQR();">
                            <input type="submit" class="btn btn-primary btn-lg btn-block"
                                   value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确定&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">
                            </input>
                        </a></center>
                    </div>

                    <%--</tr>--%>
                    <%--</table>--%>


                    <div id="firstregister" class="label3 fadeIn delay2">

                        <input type="button" onclick="changenext();" class="btn btn-primary btn-lg btn-block"
                               value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下一步&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">
                        </input>

                    </div>
                    <br><br><br><br><br><br>

                    <div>
                        <label class="label fadeIn delay33">请输入您的手机号码</label>
                        <input id="phone1" type="text"
                               class="input fadeIn delay44" />
                    </div>

                </div>
            </div>

        </div>
    </form>
</div>


<script>
    function aa() {
        if ($('#zzzz').bootstrapSwitch('state')) {
            $('#openfeat').css("display", "block");
            document.getElementById("openfea").value = "1";
            document.getElementById("nextregister2").style.display = "none";
            document.getElementById("nextregister").style.display = "block";
        } else {
            $('#openfeat').css("display", "none");
           document.getElementById("openfea").value = "0";
           if(document.getElementById("openfea").value!=3){document.getElementById("nextregister2").style.display = "block";}
           
           document.getElementById("nextregister").style.display = "none";
        }
    }


    function changenext() {
   
            document.getElementById("myitem").style.display = "";
            document.getElementById("mytable").style.display = "";
            document.getElementById("myphone").style.display = "";
            document.getElementById("myemail").style.display = "";
            document.getElementById("myuser").style.display = "none";
            document.getElementById("mypswd1").style.display = "none";
            document.getElementById("mypswd2").style.display = "none";
            document.getElementById("nextregister2").style.display = "";
            document.getElementById("firstregister").style.display = "none";
            document.getElementById("mylogin1").style.display = "none";
         
        setInterval("aa()", 100);
      
    }

    function generateQR() {

        var str = document.getElementById('hidden1').value;
        $('#qrcode').qrcode({
            render: 'canvas',
            width: 256,
            height: 256,
            text: str,
            background: '#FFFFFF',
            foreground: '#000000'
        });
    }

</script>


<script src="js/index.js"></script>
<script type="text/javascript">
    var a = 1, b = 1;
    $("#password1").focus(function () {
        if (a == 1) {
            $("#password1")[0].type = 'password';
            $("#password1").val("");
            a++;
            $("#password1")[0].style.color = '#000000';
        }
    });
    $("#password1").blur(function () {
        if ($("#password1")[0].value == "") {
            $("#password1")[0].type = 'text';
            $("#password1").val("口令(6-20位数字、英文)");
            $("#password1")[0].style.color = '#BBBBBB';
            a = 1;
        }
        else {
            $("#password1")[0].style.color = '#000000';
        }
    });

    $("#password2").focus(function () {
        if (b == 1) {
            $("#password2")[0].type = 'password';
            $("#password2").val("");
            b++;
            $("#password2")[0].style.color = '#000000';
        }
    });
    $("#password2").blur(function () {
        if ($("#password2")[0].value == "") {
            $("#password2")[0].type = 'text';
            $("#password2").val("确认口令");
            $("#password2")[0].style.color = '#BBBBBB';
            b = 1;
        }
        else {
            $("#password2")[0].style.color = '#000000';
        }
    });


    $("#username").focus(function () {
        if ($("#username")[0].value == "用户名(1-20位中英文、数字、下划线)") {
            $("#username")[0].type = 'password';
            $("#username")[0].type = 'text';
            $("#username").val("");
            $("#username")[0].style.color = '#000000';
        }
    });
    $("#username").blur(function () {
        if ($("#username")[0].value == "") {
            $("#username")[0].type = 'password';
            $("#username")[0].type = 'text';
            $("#username").val("用户名(1-20位中英文、数字、下划线)");
            $("#username")[0].style.color = '#BBBBBB';
            $("#username")[0].style.color = '#BBBBBB';
        }
    });
    $("#email").focus(function () {
        if ($("#email")[0].value == "例如(email@email.com)") {
            $("#email")[0].type = 'password';
            $("#email")[0].type = 'text';
            $("#email").val("");
            $("#email")[0].style.color = '#000000';
        }
    });
    $("#email").blur(function () {
        if ($("#email")[0].value == "") {
            $("#email")[0].type = 'password';
            $("#email")[0].type = 'text';
            $("#email").val("例如(email@email.com)");
            $("#email")[0].style.color = '#BBBBBB';
            $("#email")[0].style.color = '#BBBBBB';
        }
    });
    $("#phone").focus(function () {
        if ($("#phone")[0].value == "手机(11位数字)") {
            $("#phone")[0].type = 'password';
            $("#phone")[0].type = 'text';
            $("#phone").val("");
            $("#phone")[0].style.color = '#000000';
        }
    });
    $("#phone").blur(function () {
        if ($("#phone")[0].value == "") {
            $("#phone")[0].type = 'password';
            $("#phone")[0].type = 'text';
            $("#phone").val("手机(11位数字)");
            $("#phone")[0].style.color = '#BBBBBB';
            $("#phone")[0].style.color = '#BBBBBB';
        }
    });

    /*function aa() {
     if ($('#zzzz').bootstrapSwitch('state')) {
     $('#openfeat').css("display", "block");
     $('#openfea').css("value", "0");
     } else {
     $('#openfeat').css("display", "none");
     $('#openfea').css("value", "1");
     }
     }
     setInterval("aa()", 100);*/

    /*$(function() {
     $("#optionsRadios2").click(function() {
     //$("#optionsRadios1").attr("checked",true);
     alert("fesf");
     });
     });*/

</script>


<script src="js/flat-ui.min.js"></script>
<script src="js/application.js"></script>
<script type="text/javascript">
    $(function () {
		
        //弹出层调用语句
        $('#modaltrigger').leanModal({
            top: 110,
            overlay: 0.45,
            closeButton: "#loginbtn",
            closeButton: "#btnno"
        });

    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#reg-form').easyform();
    });
</script>
<script type="text/javascript">
    function msub() {
        var th = document.getElementById("reg-form");
        th.submit();
    }
</script>
</body>

</html>
