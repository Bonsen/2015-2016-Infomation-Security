<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    request.getSession().setAttribute("username", ""); //初始化，使得session取消周期记录时间
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>OCIA_Login</title>
    <style>
        body {
            font-size: 16px;
            line-height: 24px;
            background: #fff;
            color: #330;
            font-family: "Georgia", FreeSerif, serif;
            padding-left: 30px;
        }


    </style>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="Examples and documentation on grumble.js">
    <link rel="stylesheet" href="css/grumble.min.css?v=5">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->

    <link rel="stylesheet" href="css/reset.css">
<%--<link rel="stylesheet" href="css/bootstrap.css">--%>
    <link rel="stylesheet" href="css/instyle.css" media="screen"
          type="text/css"/>
    <link href="css/flat-ui.css" rel="stylesheet">

</head>

<body>
<%--<div class="alert alert-danger" role="alert" style="height: 55px">--%>
    <%--<a href="#" class="alert-link" style="margin-top: -10px">Well done! You successfully read this important alert message.</a>--%>
<%--</div>--%>

<embed type="application/plugin-npocia" id="Ocia" height="0px" width="0px"></embed>
<div style="text-align:center;clear:both;">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>
<div id="window" style="display:none;">

    <div class="page page-front">
        <div class="page-content">

            <div class="input-row">
                <label class="label fadeIn"></label>
            </div>
            <form name="reg-form" id="reg-form" method="post" action="servlet/LoginAction">
                <div class="input-row">
                    <label class="label fadeIn">用户名</label>
                    <input name="username" id="username" type="text" value="用户名(1-20位中英文、数字、下划线)" style="color:#BBBBBB"
                           data-fyll="" class="input fadeIn delay1"/>
                </div>

                <div class="input-row">
                    <label class="label fadeIn delay2">口令</label>
                    <input name="pswd" id="password1" type="text" value="口令(6-20位数字、英文)" style="color:#BBBBBB"
                           data-fyll="" class="input fadeIn delay3"/>
                </div>

                <div class="input-row">
                    <table>
                        <tr>

                            <td>
                                <label class="label2 fadeIn delay2" style="margin-left:230px;"><a
                                        href="register.jsp">注册</a></label>
                                <label class="label2 fadeIn delay2" style="margin-left:10px;"><a
                                        href="#">忘记密码?</a></label>
                            </td>
                        </tr>
                    </table>


                    </br>
                    <div class="label34 fadeIn delay2">
                        <a id="su">
                            <input type="button" class="btn btn-primary btn-lg btn-block"
                                   value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;陆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">
                            </input>
                        </a></div>
                </div>


            </form>
        </div>
    </div>

    <script src='js/injquery.js'></script>

    <script src="js/index.js"></script>
    <script src="js/jquery.grumble.min.js?v=7"></script>
    <!--script src="js/Bubble.js?v=5"></script>
    <script src="js/jquery.grumble.js?v=5"></script-->
    <script type="text/javascript">
        function doFind() {
            $.ajax({
                cache: false,
                type: "POST",
                url: "servlet/LoginAction", //把表单数据发送到ajax.jsp
                data: {
                    username: $("input[name='username']").val(),
                    pswd: $("input[name='pswd']").val()
                }, //要发送的是ajaxFrm表单中的数据
                async: false,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                },
                success: function (data) {  //java string 需要变成var
                    if (data == "") {
                        eeero();
                        $("#username").focus();
                    } else {
                        window.location.href = "main.jsp";
                    }
                }
            });
        }
    </script>
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


        $("#username").focus(function () {
            if ($("#username")[0].value == "用户名(1-20位中英文、数字、下划线)") {
                $("#username").val("");
                $("#username")[0].style.color = '#000000';
            }
        });
        $("#username").blur(function () {
            if ($("#username")[0].value == "") {
                $("#username").val("用户名(1-20位中英文、数字、下划线)");
                $("#username")[0].style.color = '#BBBBBB';
                $("#username")[0].style.color = '#BBBBBB';
            }
        });


        /*
         $(function() {
         $("#optionsRadios2").click(function() {
         $("#optionsRadios1").attr("checked",true);
         });
         });
         */
    </script>

    <script src="js/flat-ui.min.js"></script>
    <script src="js/application.js"></script>
    <script>

        function eeero() {
            var $me = $('#username'), interval;


            $me.grumble(
                    {
                        angle: 95,
                        text: '登陆信息错误啊!',
                        type: 'alt-',
                        distance: 235,
                        hideOnClick: true,
                        onShow: function () {
                            var angle = 95, dir = 1;
                            interval = setInterval(function () {
                                (angle > 100 ? (dir = -1, angle--) : ( angle < 95 ? (dir = 1, angle++) : angle += dir));
                                $me.grumble('adjust', {angle: angle});
                            }, 200);
                        },
                        onHide: function () {
                            clearInterval(interval);
                        }
                    }
            );
        }

    </script>

    <script>


        function eeerp() {
            if ($('#password2').val() != $('#password1').val()) {
                var $me = $('#password2'), interval;


                $me.grumble(
                        {
                            angle: 270,
                            text: '密码不一致呀!',
                            type: 'alt-',
                            distance: 200,
                            hideOnClick: true,
                            onShow: function () {
                                var angle = 270, dir = 1;
                                interval = setInterval(function () {
                                    (angle > 300 ? (dir = -1, angle--) : ( angle < 270 ? (dir = 1, angle++) : angle += dir));
                                    $me.grumble('adjust', {angle: angle});
                                }, 200);
                            },
                            onHide: function () {
                                clearInterval(interval);
                            }
                        }
                );
            }
        }

    </script>
</body>

</html>
