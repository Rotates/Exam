<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
    <title>online-exam手机版</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0 , maximum-scale=1.0, account-scalable=0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/apply.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/share.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/public.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/swiper-2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/lazyload.js"></script>
    <script type="text/javascript" charset="utf-8">
        $(function () {
            $("img").lazyload({
                effect: "fadeIn"
            });
        });
    </script>
</head>
<body>
<div id="wrap" class="clearfix overflow mg-auto">
    <div class="i-head mg-auto overflow area border-bom">
        about me
    </div>

    <!--xxx-->
    <div class="i-tab mg-auto overflow area clearfix">
        <div class="tab-content clearfix overflow" id="con1">
            <div class="clearfix tab-con2 tab-con-info">
                <ul class="clearfix">
                    <li>
                        <a href="soft/list_956_1.html" class="tab-con-href2 clearfix">
                            <h4>帐号</h4>
                        </a>
                    </li>
                    <li>
                        <a href="../test/tested.html" class="tab-con-href2 clearfix">
                            <h4>考过的答卷</h4>
                        </a>
                    </li>
                    <li>
                        <a href="resetpwd.html" class="tab-con-href2 clearfix">
                            <h4>个人信息</h4>
                        </a>
                    </li>
                    <li>
                        <a href="resetpwd.html" class="tab-con-href2 clearfix">
                            <h4>安全设置</h4>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="logout()" class="tab-con-href2 clearfix">
                            <h4>退出登录</h4>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!--底部-->
    <div style="margin-top:15px;display: block;border-bottom: solid 1px #FFF;border-top: solid 1px #cacaca;text-indent: -9999px;height: 0px;">
        line
    </div>
    <div style="width: 100%; height: 3.8em; line-height: 3.8em; text-align: center;">online-exam手机版</div>

</div>

<!--<div class="return-top tianstion" title="返回顶部"></div>-->

<jsp:include page="/template/nav.jsp"/>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/com.js"></script>
<script type="text/javascript">
    window.onload = function () {
        var mySwiper = new Swiper('.swiper-container', {
            pagination: '.pagination',
            loop: true,
            autoplay: 3000,
            paginationClickable: true,
            onSlideChangeStart: function () {
                //回调函数
            }
        });
        cTab("#tab1", "#con1");
        cTab("#tab2", "#con2");
    };

    function logout() {
        $.ajax({
            url: "${pageContext.request.contextPath}/logout",

            success: function (result) {
                var dataObj=eval("("+result+")")
                if (dataObj.success) {
                    window.location.href="${pageContext.request.contextPath}/login";
                }
            },

            error: function () {
                alert("error");
            }

        });
    }
</script>
</html>