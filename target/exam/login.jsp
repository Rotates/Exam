<%@ page language="java" contentType="text/html; charse=tutf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>

<html lang="en" class="no-js">
<head>

    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="${pageContext.request.contextPath}/static/img/favicon.ico" rel="shortcut icon">
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/supersized.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">

    <%--滑动开关css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/honeySwitch.css">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/js/respond.min.js"></script>
    <![endif]-->

    <style>
        .tab-menu{
            margin-top: 20px;
            height: 26px;
            overflow: hidden;
            position: relative;
            border-radius: 20px;
        }
        ul{
            padding: 0;
            margin: 0;
            list-style: none;
        }
        li{
            height: 24px;
            line-height: 24px;
            float: left;
            text-align: center;
            position: relative;
            font-size: 12px;
        }
        .tab-menu span{
            display: inline-block;
            height: 27px;
            position: absolute;
            left: 0;
            top: 0;
            border-radius: 20px;
            transition: left .4s;
            -webkit-transition: left .4s;
            -moz-transition: left .4s;
        }
        li:hover{
            cursor: pointer;
        }
        .tworow{
            width: 160px;
            background-color: rgba(224, 229, 232, 1);
        }
        .tworow span{
            width: 81px;
            background-color: green;
        }
/*        .tworow .active{
            color: white;
        }*/
        .tworow li{
            width: 80px;
            color: green;
        }
    </style>

</head>

<body oncontextmenu="return false">

<div class="page-container">
    <h1>登录</h1>
    <form action="" method="post">
        <div>
            <input id="username" type="text" name="userName" class="username" placeholder="学号/工号"
                   autocomplete="off"/>
        </div>
        <div>
            <input id="password" type="password" name="password" class="password" placeholder="密码"
                   onpaste="return false"/>
        </div>
        <div class="verCode-block">
            <input type="text" id="vercode" name="vercode" class="vercode" placeholder="验证码"
                   onpaste="return false"/>
            <img id="imgVerify" src="${pageContext.request.contextPath}/login/getVerify" alt="点击更换"
                 onclick="refresh()">
        </div>

        <div class="remember-me">
            <span id="hony-switch" class="switch-off"></span>
            <strong class="remember-me-text">记住我</strong>
        </div>

        <a class="forget-pw" href="#">忘记密码</a>

        <button id="btn" type="button">确定</button>
    </form>

</div>

<script src="${pageContext.request.contextPath}/static/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/supersized-init.js"></script>
<script src="${pageContext.request.contextPath}/static/js/honeySwitch.js" type="text/javascript"></script>
<script>
    var rememberMe='0';
    $(function() {
        switchEvent("#hony-switch",function () {
            rememberMe = '1';
        }, function () {
            rememberMe = '0';
        });
    });
        $("#btn").click(function () {

        var verCode=$("#vercode").val();
        var userName=$("#username").val();
        var password=$("#password").val();

        $.ajax({
            url: '${pageContext.request.contextPath}/login/authenticate',
            type: 'post',
            data: {userName:userName, password:password, verCode:verCode, rememberMe:rememberMe },
            dataType: 'json',
            beforeSend: function () {
                alert("before");
            },
            error: function () {
                alert("error");
            },
            success: function (t) {

                if (t.verCode == '-1') {
                    alert("验证码错误");
                    /*清空*/
                    $("#vercode").val("");
                    /*刷新验证码*/
                    $("#imgVerify").attr("src","${pageContext.request.contextPath}/login/getVerify?"+Math.random());
                    return;
                }

                if (t.result == '0') {
                    alert("登录成功!");
                    window.location.href='${pageContext.request.contextPath}';
                } else if (t.result == '1') {
                    alert("登录成功!");
                    window.location.href='${pageContext.request.contextPath}/teacher/index';
                } else if (t.result == '2') {
                    alert("登录成功!");
                    //admin页面
                } else if (t.result == '3') {
                    alert("登录成功!");
                    window.location.href='${pageContext.request.contextPath}'+t.url;
                } else {
                    alert(t.result);
                    /*刷新验证码*/
                    $("#imgVerify").attr("src","${pageContext.request.contextPath}/login/getVerify?"+Math.random());
                }
            }
        });
    });

    function refresh() {
        $("#imgVerify").attr("src","${pageContext.request.contextPath}/login/getVerify?"+Math.random());
    }

</script>
</body>

</html>

