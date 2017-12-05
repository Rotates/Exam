<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>online-exam手机版</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
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
        index
    </div>

    <!--xxx-->
    <div class="i-tab mg-auto overflow area clearfix">
        <div class="tab-content clearfix overflow" id="con1">
            <div class="clearfix tab-con2 tab-con-info">
                <ul class="clearfix">
                    <li>
                        <a href="soft/list_956_1.html" class="tab-con-href2 clearfix">
                            <div class="img2"><img src="img/loading.png"
                                                   original="img/oYYBAFIESqmIVMGEAAAbgfgp_ngAAAxYwLhqbMAABuZ781.jpg"
                                                   alt="互联网工具" title="互联网工具"></div>
                            <h4>互联网工具</h4>
                            <p><i>手机互联网应用,社交,购物,看视频听音乐等等</i></p>
                        </a>
                    </li>
                    <li>
                        <a href="soft/list_955_1.html" class="tab-con-href2 clearfix">
                            <div class="img2"><img src="img/loading.png" original="img/logo.gif" alt="多媒体" title="多媒体"></div>
                            <h4>多媒体</h4>
                            <p><i>多媒体应用,玩自拍,图像处理,拍微视频等</i></p>
                        </a>
                    </li>
                    <li>
                        <a href="soft/list_958_1.html" class="tab-con-href2 clearfix">
                            <div class="img2"><img src="img/loading.png"
                                                   original="img/ooYBAFKFmfWIRVKNAABhiGmqPSgAABD3QJPMx8AAGGg956.jpg"
                                                   alt="系统工具" title="系统工具"></div>
                            <h4>系统工具</h4>
                            <p><i>系统应用工具,强化你的手机系统,提高手机实用性能</i></p>
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
</script>
</html>