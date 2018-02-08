<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>考试中</title>
    <link href="${pageContext.request.contextPath}/static/img/favicon.ico" rel="shortcut icon">
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
                    <c:if test="${question.type_id == '1'}">
                        <dl class="swiper-slide">
                        <dt id="${question.id}" class="${question.type_id}">${status.index + 1}.${question.title}</dt>
                        <c:if test="${not empty question.option_a}">
                            <dd title="A">A、${question.option_a}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_b}">
                            <dd title="B">B、${question.option_b}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_c}">
                            <dd title="C">C、${question.option_c}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_d}">
                            <dd title="D">D、${question.option_d}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_e}">
                            <dd title="E">E、${question.option_e}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_f}">
                            <dd title="F">F、${question.option_f}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_g}">
                            <dd title="G">G、${question.option_g}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_h}">
                            <dd title="H">H、${question.option_h}</dd>
                        </c:if>
                        </dl>
                    </c:if>

                <c:if test="${question.type_id == '2'}">
                    <dl class="swiper-slide">
                        <dt id="${question.id}" class="${question.type_id}">${status.index + 1}.${question.title}</dt>
                        <c:if test="${not empty question.option_a}">
                            <dd title="A">A、${question.option_a}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_b}">
                            <dd title="B">B、${question.option_b}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_c}">
                            <dd title="C">C、${question.option_c}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_d}">
                            <dd title="D">D、${question.option_d}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_e}">
                            <dd title="E">E、${question.option_e}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_f}">
                            <dd title="F">F、${question.option_f}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_g}">
                            <dd title="G">G、${question.option_g}</dd>
                        </c:if>

                        <c:if test="${not empty question.option_h}">
                            <dd title="H">H、${question.option_h}</dd>
                        </c:if>
                    </dl>
                </c:if>

                <c:if test="${question.type_id == '3'}">
                    <dl class="swiper-slide">
                        <dt id="${question.id}" class="${question.type_id}">${status.index + 1}.${question.title}</dt>
                        <input name="${question.id}" type="text">
                    </dl>
                </c:if>

                <c:if test="${question.type_id == '4'}">
                    <dl class="swiper-slide">
                        <dt id="${question.id}" class="${question.type_id}">${status.index + 1}.${question.title}</dt>
                        <input type="radio" name="${question.id}" value="1">正确<br>
                        <input type="radio" name="${question.id}" value="0">错误
                    </dl>
                </c:if>
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
        var cookie = getCookie(userName);
        var dt = $("dt");
        if (cookie == null || cookie == '') {
            var dts = {};
            for (i=0,len=dt.length; i<len; i++) {
                var key = dt[i].id;
                dts[key] = "";
            }
            setCookie(userName, JSON.stringify(dts));
        } else {
            /*将答案写上html标签上*/
            var json_class = JSON.parse(cookie);

            /*单项选择题与多项选择题*/
            for (var t in json_class) {
                var dt = $("#" + t);
                var dd = $("#" + t).parent("dl").find("dd");
                for (var i=0; i<dd.length; i++) {
                    if (dt.attr('class') == '1') {
                        //获取一个HTMLElement对象,不能直接用便签语法,因为这里已经变成了对象
                        if (dd[i].title == json_class[t]) {
                            $('#'+t).siblings("[title='"+json_class[t]+"']").addClass("chance");
                        }

                        var indexnum = dt.parent("dl").index();
                        $(".swiper-pagination span").eq(indexnum).addClass("curr");
                    } else if (dt.attr('class') == '2') {
                        /*将乱序答案排序*/
                        var keys = json_class[t].split('');
                        for (var y=0; y<keys.length; y++) {
                            for (var j=y+1; j<keys.length; j++) {
                                if (keys[y] > keys[j]) {
                                    var temp = keys[y];
                                    keys[y] = keys[j];
                                    keys[j] = temp;
                                }
                            }
                        }

                        /*选择答案*/
                        for (var x=0; x<keys.length; x++) {
                            if (dd[i].title == keys[x]) {
                                $('#'+t).siblings("[title='"+keys[x]+"']").addClass("chance");
                                var indexnum = dt.parent("dl").index();
                                $(".swiper-pagination span").eq(indexnum).addClass("curr");
                            }
                        }
                    }
                }

                /*填空题与判断题*/
                if (dd.length == 0 && dt.attr('class') == '3') {
                    $('#'+t).siblings("[name='"+t+"']").attr("value", json_class[t]);
                    var indexnum = dt.parent("dl").index();
                    $(".swiper-pagination span").eq(indexnum).addClass("curr");
                } else if (dd.length == 0 && dt.attr('class') == '4') {
                    $('#'+t).siblings("[value='"+json_class[t]+"']").attr('checked', true);
                    var indexnum1 = dt.parent("dl").index();
                    $(".swiper-pagination span").eq(indexnum1).addClass("curr");
                }
            }
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
        var dl_class = $(this).parent('dl').children('dt').attr('class');
        var indexnum = $(this).parent("dl").index();
        $(".swiper-pagination span").eq(indexnum).addClass("curr");
        var cookie = JSON.parse(getCookie(userName));
        var id = $(this).parent("dl").find("dt").attr("id");
        var key = $(this).attr("title");

        /*单选题与多选题*/
        if (dl_class == 1 || dl_class == '1') {
            //更换答案
            var bool = new Boolean($(this).hasClass('chance'))
            if (bool.toString() == 'false') {
                $(this).parent("dl").find("dd").removeClass("chance");
                $(this).addClass('chance');
                var id = $(this).parent("dl").find("dt").attr("id");
                var key = $(this).attr("title");
                //过滤修改
                for (var t in cookie) {
                    if (t == id) {
                        cookie[t] = key;
                    }
                }
            }
        } else if (dl_class == 2 || dl_class == '2') {
            if ($(this).hasClass('chance')) {
                //过滤修改
                for (var t in cookie) {
                    if (t == id) {
                        //如果答案不是本身就修改
                        if (cookie[t].length != 1) {
                            cookie[t] = cookie[t].replace(key, '');
                            $(this).removeClass('chance');
                        }
                    }
                }
            } else {
                $(this).addClass('chance');
                //过滤修改
                for (var t in cookie) {
                    if (t == id) {
                        cookie[t] += key;
                    }
                }
            }
        }

        delCookie(userName);
        setCookie(userName, JSON.stringify(cookie));
    });

    //判断题
    $("dl.swiper-slide input:radio").click(function () {
        var indexnum = $(this).parent("dl").index();
        $(".swiper-pagination span").eq(indexnum).addClass("curr");
        var cookie = JSON.parse(getCookie(userName));
        var id = $(this).parent("dl").find("dt").attr("id");
        var key = $(this).attr("value");

        //过滤修改
        for (var t in cookie) {
            if (t == id) {
                cookie[t] = key;
            }
        }
        delCookie(userName);
        setCookie(userName, JSON.stringify(cookie));
    });

    //填空题
    $("dl.swiper-slide input:text").click(function () {
        var indexnum = $(this).parent("dl").index();
        $(".swiper-pagination span").eq(indexnum).addClass("curr");
    });

    //交卷
    $("#numok").click(function(){

        var c = $('.swiper-wrapper').find(':text');
        var cookie = JSON.parse(getCookie(userName));
        for (var i=0; i < c.length; i++) {
            var k = c.eq(i).attr('name');
            var v = c.eq(i).val();
            cookie[k] = v;
        }

        /*保存答案*/
        setCookie(userName, JSON.stringify(cookie))

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
                    var submit_log = layer.open({
                        type: 2
                        ,content: '提交中'
                    });

                    //ajax提交答案
                    $.ajax({
                        url: '${pageContext.request.contextPath}/student/submit/exam',
                        type: 'post',
                        data: {keys:JSON.stringify(cookie)},
                        dataType: 'json',
                        error: function () {
                            alert("error");
                        },
                        success: function (t) {
                            layer.close(submit_log);
                            window.location.href='${pageContext.request.contextPath}/student/exam/finished';
                            /*layer.msg('交卷成功!')*/
                        }
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

    var interval = setInterval(function () {
        var now = new Date();
        var time = end - now;
        var hour = parseInt(time / 1000 / 60 / 60 % 24);
        var minute = parseInt(time / 1000 / 60 % 60);
        var seconds = parseInt(time / 1000 % 60);
        $('.time-h5').html(hour + ":" + minute + ":" + seconds);

        if (hour == 0 && minute == 2 && seconds == 0) {
            alert("离考试结束还有2分钟!");
        }

        if (hour == 0 && minute == 0 && seconds == 0) {
            alert("考试时间到！即将收卷！");
            //关闭时间循环
            clearInterval(interval);
            //提交答案请求
            alert("提交试卷");

            $.ajax({
                url: '${pageContext.request.contextPath}/submit/exam',
                type: 'post',
                data: {},
                dataType: 'json',
                beforeSend: function () {
                    alert("before");
                },
                error: function () {
                    alert("error");
                },
                success: function (t) {

                }
            });
        }

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

    function delCookie(name) {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval=getCookie(name);
        if(cval!=null)
            document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }
</script>
</html>
