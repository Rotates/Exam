<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>考试中</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
</head>
<body>
<div class="mind">
    <div class="swiper-container">
        <div class="mindtop">
            <span class="swiper-button-prev swiper-button-blue"></span>
            <h4>${record.title}</h4>
            <input type="hidden" id="userName" value="${userName}">
            <span class="swiper-button-next swiper-button-blue"></span>
        </div>
        <div class="mindmiddle">
                <span class="sum-score">
                    <img style="width: 25px;height: 25px; float:left;" src="${pageContext.request.contextPath}/static/img/score.png">
                    <h4 style="float: left">&nbsp;30分</h4>
                    <input id="endTime" type="hidden" value="${endTime}">
                </span>
                <%--<h5 style="float: left;">30分 &nbsp &nbsp</h5>--%>
                <span class="progress-time">
                    <img style="width: 25px;height: 25px; float: left;" src="${pageContext.request.contextPath}/static/img/progresstime.png">
                    <h4 class="time-h5" style="float: left"></h4>
                </span>
        </div>
        <div class="swiper-wrapper">
            <c:forEach var="question" items="${questions}" varStatus="status">
                <dl class="swiper-slide">
                    <dt id="${question.id}">${status.index + 1}.${question.title}</dt>
                    <c:if test="${question.type_id == '1' || question.type_id == '2'}">
                        <c:if test="${not empty question.option_a}">
                            <dd id="A">A、${question.option_a}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_b}">
                            <dd id="B">B、${question.option_b}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_c}">
                            <dd id="C">C、${question.option_c}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_d}">
                            <dd id="D">D、${question.option_d}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_e}">
                            <dd id="E">E、${question.option_e}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_f}">
                            <dd id="F">F、${question.option_f}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_g}">
                            <dd id="G">G、${question.option_g}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_h}">
                            <dd id="H">H、${question.option_h}</dd>
                        </c:if>
                    </c:if>
                    
                    <c:if test="${question.type_id == '3'}">
                        ?
                    </c:if>
                    <c:if test="${question.type_id == '4'}">
                        对或者错
                    </c:if>
                </dl>
            </c:forEach>
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
<script src="${pageContext.request.contextPath}/static/js/layer-mobile/layer.js"></script>
<script type="text/javascript">

    var userName = $("#userName").val();

    $(document).ready(function () {

        var cookie_name = getCookie(userName);

        if (cookie_name == null || cookie_name == '') {
            var dt = $("dt");
            var dts = [];
            for (i=0,len=dt.length; i<len; i++) {
                dts.push({id:dt[i].id,key:""});
            }
            setCookie(userName, JSON.stringify(dts));
        }
    });

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

        var cookie_name = JSON.parse(getCookie(userName));

        var id = $(this).parent("dl").find("dt").attr("id");

        var key = $(this).attr("id");

        var t = cookie_name.filter((p) => {
            return p.id == id;
        });

        var index = cookie_name.indexOf(t[0]);
        index > -1 && cookie_name.splice(index, 1);
        cookie_name.push({id:id,key:key});

        delCookie(userName);

        setCookie(userName, JSON.stringify(cookie_name));

        alert(getCookie(userName));

    });

    //交卷
    $("#numok").click(function(){

        $(".swiper-pagination").hide();
        var allnum = $("#totnum").text();
        $("#subnum").text(allnum);
        var lengths = $(".swiper-pagination span.curr").length;

        if(lengths==allnum){
            //底部对话框
            layer.open({
                content: '你已经完成所有试题,确认提交吗?'
                ,btn: ['提交', '取消']
                ,skin: 'footer'
                ,yes: function(index){
                    layer.close(index);
                    //loading带文字
                    layer.open({
                        type: 2
                        ,content: '提交中'
                    });

                }
            });

        } else{
            //底部提示
            layer.open({
                content: '试题未作答完!'
                ,skin: 'footer'
            });

        }
    });

    var endTime = $("#endTime").val();
    endTime = endTime.replace(/:/g,',');
    endTime = endTime.replace(' ', ',');
    var endtimes = endTime.split(',');

    var end = new Date(endtimes[0],
        parseInt(endtimes[1])-1,
        parseInt(endtimes[2]),
        endtimes[3],
        endtimes[4],
        endtimes[5]);

    setInterval(function () {
        var now = new Date();
        var time = end - now;
        var hour = parseInt(time / 1000 / 60 / 60 % 24);
        var minute = parseInt(time / 1000 / 60 % 60);
        var seconds = parseInt(time / 1000 % 60);
        $('.time-h5').html(hour + ":" + minute + ":" + seconds);
    }, 1000);

    function setCookie(name,value) {
        var exp = new Date();
        exp.setTime(exp.getTime() + 8.5*60*60*1000);
        document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
    }

    function getCookie(c_name) {
        if (document.cookie.length>0) {
            c_start=document.cookie.indexOf(c_name + "=");
            if (c_start!=-1) {
                c_start=c_start + c_name.length+1;
                c_end=document.cookie.indexOf(";",c_start);
                if (c_end==-1)
                    c_end=document.cookie.length;
                return unescape(document.cookie.substring(c_start,c_end));
            }
        }
        return ""
    }

    function delCookie(name)
    {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval=getCookie(name);
        if(cval!=null)
            document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }
</script>
</html>
