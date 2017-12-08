<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>心理健康评估</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
</head>
<body>
<div class="mind">
    <div class="swiper-container">
        <div class="mindtop">
            <span class="swiper-button-prev swiper-button-blue"></span>
            <h4>生活常识选择题及答案</h4>
            <span class="swiper-button-next swiper-button-blue"></span>
        </div>
        <div class="mindmiddle">
                <span class="sum-score">
                    <img style="width: 25px;height: 25px; float:left;" src="${pageContext.request.contextPath}/static/img/score.png">
                    <h4 style="float: left">&nbsp;30分</h4>
                    <input id="startTime" type="hidden" value="${startTime}">
                </span>
                <%--<h5 style="float: left;">30分 &nbsp &nbsp</h5>--%>
                <span class="progress-time">
                    <img style="width: 25px;height: 25px; float: left;" src="${pageContext.request.contextPath}/static/img/progresstime.png">
                    <h4 class="time-h5" style="float: left"></h4>
                </span>
        </div>
        <div class="swiper-wrapper">

            <dl class="swiper-slide">
                <dt>1、“大煮干丝”是哪个菜系的代表菜之一( )</dt>
                <dd>A、四川菜系</dd>
                <dd>B、山东菜系</dd>
                <dd>C、广东菜系</dd>
                <dd>D、淮扬菜系</dd>
            </dl>
            <dl class="swiper-slide">
                <dt>2. 吃冰淇淋不解渴主要是因为它:</dt>
                <dd>A、含蛋白质</dd>
                <dd>B、含脂肪</dd>
                <dd>C、含糖</dd>
            </dl>
            <dl class="swiper-slide">
                <dt>3. 工笔是哪种绘画形式的技法</dt>
                <dd>A、水彩画</dd>
                <dd>B、油画</dd>
                <dd>C、水粉画</dd>
                <dd>D、国画</dd>
            </dl>
            <dl class="swiper-slide">
                <dt>4、“大煮干丝”是哪个菜系的代表菜之一( )</dt>
                <dd>A、四川菜系</dd>
                <dd>B、山东菜系</dd>
                <dd>C、广东菜系</dd>
                <dd>D、淮扬菜系</dd>
            </dl>
            <dl class="swiper-slide">
                <dt>5. 吃冰淇淋不解渴主要是因为它:</dt>
                <dd>A、含蛋白质</dd>
                <dd>B、含脂肪</dd>
                <dd>C、含糖</dd>
            </dl>
        </div>
        <div class="swiper-pagination"></div>
        <div class="mindfot">
            <div class="fl-left" id="numok"><img src="${pageContext.request.contextPath}/static/img/mindok.png"><span>交卷</span></div>
            <div class="fl-right" id="showall"><img src="${pageContext.request.contextPath}/static/img/mindnum.png"><span id="curnum">1</span>/<span id="totnum"></span></div>
            <div class="clearfix"></div>
        </div>
        <div class="maskwhite"></div>
        <div class="subjuan">
            <p>提示</p>
            <p>您已经回答了<span id="subnum"></span>题，确定要交卷么？</p>
            <div class="subyn">
                <div class="fl-left" id="subno">取消</div>
                <div class="fl-right" id="subyes">交卷</div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/swiper.min.js"></script>
<script type="text/javascript">

    //题目轮播
    var swiper = new Swiper('.swiper-container', {

        pagination: '.swiper-pagination',

        prevButton:'.swiper-button-prev',
        nextButton:'.swiper-button-next',

        paginationClickable: true,



        paginationBulletRender: function (index, className) {
            $("#totnum").text(index+1);//总页码
            return '<span class="' + className + '">' + (index + 1) + '</span>';


        },

        onSlideChangeEnd: function(swiper){
            $("#curnum").text(swiper.activeIndex+1);//当前页
        }

    });



    //点击底部出现题目数
    $("#showall").click(function(){
        $(".maskwhite").toggle();
        $(".swiper-pagination").toggle();
    });

    //选择答案
    $("dl.swiper-slide dd").click(function(){
        $(this).parent("dl").find("dd").removeClass("chance");
        $(this).addClass("chance");
        var indexnum = $(this).parent("dl").index();
        $(".swiper-pagination span").eq(indexnum).addClass("curr");
    });

    //交卷
    $("#numok").click(function(){

        $(".swiper-pagination").hide();

        var allnum = $("#totnum").text();
        $("#subnum").text(allnum);
        var lengths = $(".swiper-pagination span.curr").length;

        if(lengths==allnum){
            $(".maskwhite").show();
            $(".subjuan").show();
            $("#subno").click(function(){//取消
                $(".maskwhite").hide();
                $(".subjuan").hide();
            });
            $("#subyes").click(function(){//取消
                $(".maskwhite").hide();
                $(".subjuan").hide();
                window.location.href="#"
            });
        } else{
            $(".maskwhite").hide();
        }
    });

    var test = $("#startTime").val();
    test = test.replace(/:/g,',');
    test = test.replace(' ', ',');
    var test2 = test.split(',');
    var starttime = new Date(test2[0], test2[1], test2[2], test2[3]);

    setInterval(function () {
        var nowtime = new Date();
        var time = nowtime - starttime;
        var hour = parseInt(time / 1000 / 60 / 60 % 24);
        var minute = parseInt(time / 1000 / 60 % 60);
        var seconds = parseInt(time / 1000 % 60);
        $('.time-h5').html(hour + ":" + minute + ":" + seconds);
    }, 1000);

</script>
</html>
