<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: liao
  Date: 17-7-13
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="${pageContext.request.contextPath}/teacher/common/style.jsp"/>
    <script src="${pageContext.request.contextPath}/static/manage/js/extendPagination.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/css.css" rel="stylesheet">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="${pageContext.request.contextPath}/teacher/common/header.jsp"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>选择班级</h1>
            <ol class="breadcrumb">
                <li><a href="{managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">发布试题</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12" align="center">
                    <center>
                        <table id="schedule" border="1" bordercolor="#000000" style="border-collapse: collapse" cellpadding="2" cellspacing="0" width=750>
                            <tr>
                                <td width="4%" align="center" colspan=2>时间</td>
                                <td width="13.5%" align="center">星期一</td>
                                <td width="13.5%" align="center">星期二</td>
                                <td width="13.5%" align="center">星期三</td>
                                <td width="13.5%" align="center">星期四</td>
                                <td width="13.5%" align="center">星期五</td>
                            </tr>

                            <tr><c:if test=""></c:if>
                                <td width="2%" align="center" rowspan=2>上午</td>
                                <td width="2%" align="center"> 12节</td>
                                <td id="0" width='13.5%' valign=top align=center height=50><input type="hidden" value="${requestScope.class0.weekmessage}"><c:if test="${requestScope.class0 != null}">${requestScope.class0.courseName}<br>${requestScope.class0.compus}:${requestScope.class0.classroom}<h6>${requestScope.class0.weekmessage}</h6></c:if></td>
                                <td id="7" width='13.5%' valign=top align=center height=50><input type="hidden" value="${requestScope.class0.weekmessage}"><c:if test="${requestScope.class7 != null}">${requestScope.class7.courseName}<br>${requestScope.class7.compus}:${requestScope.class7.classroom}<h6>${requestScope.class7.weekmessage}</h6></c:if></td>
                                <td id="14" width='13.5%' valign=top align=center height=50><input type="hidden" value="${requestScope.class0.weekmessage}"><c:if test="${requestScope.class14 != null}">${requestScope.class14.courseName}<br>${requestScope.class14.compus}:${requestScope.class14.classroom}<h6>${requestScope.class14.weekmessage}</h6></c:if></td>
                                <td id="21" width='13.5%' valign=top align=center height=50><input type="hidden" value="${requestScope.class0.weekmessage}"><c:if test="${requestScope.class21 != null}">${requestScope.class21.courseName}<br>${requestScope.class21.compus}:${requestScope.class21.classroom}<h6>${requestScope.class21.weekmessage}</h6></c:if></td>
                                <td id="28" width='13.5%' valign=top align=center height=50><input type="hidden" value="${requestScope.class0.weekmessage}"><c:if test="${requestScope.class28!=null}">${requestScope.class28.courseName}<br>${requestScope.class28.compus}:${requestScope.class28.classroom}<h6>${requestScope.class28.weekmessage}</h6></c:if></td>
                            </tr>
                            <tr>
                                <td width="2%" align="center">34节</td>
                                <td id="1" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class1!=null}">${requestScope.class1.courseName}<br>${requestScope.class1.compus}:${requestScope.class1.classroom}<h6>${requestScope.class1.weekmessage}</h6></c:if></td>
                                <td id="8" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class8!=null}">${requestScope.class8.courseName}<br>${requestScope.class8.compus}:${requestScope.class8.classroom}<h6>${requestScope.class8.weekmessage}</h6></c:if></td>
                                <td id="15" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class15!=null}">${requestScope.class15.courseName}<br>${requestScope.class15.compus}:${requestScope.class15.classroom}<h6>${requestScope.class15.weekmessage}</h6></c:if></td>
                                <td id="22" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class22!=null}">${requestScope.class22.courseName}<br>${requestScope.class22.compus}:${requestScope.class22.classroom}<h6>${requestScope.class22.weekmessage}</h6></c:if></td>
                                <td id="29" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class29!=null}">${requestScope.class29.courseName}<br>${requestScope.class29.compus}:${requestScope.class29.classroom}<h6>${requestScope.class29.weekmessage}</h6></c:if></td>
                            </tr>
                            <tr>
                                <td width="2%" align="center" rowspan=2>下午</td>
                                <td width="2%" align="center">56节</td>
                                <td id="2" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class2!=null}">${requestScope.class2.courseName}<br>${requestScope.class2.compus}:${requestScope.class2.classroom}<h6>${requestScope.class2.weekmessage}</h6></c:if></td>
                                <td id="9" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class9!=null}">${requestScope.class9.courseName}<br>${requestScope.class9.compus}:${requestScope.class9.classroom}<h6>${requestScope.class9.weekmessage}</h6></c:if></td>
                                <td id="16" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class16!=null}">${requestScope.class16.courseName}<br>${requestScope.class16.compus}:${requestScope.class16.classroom}<h6>${requestScope.class16.weekmessage}</h6></c:if></td>
                                <td id="23" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class23!=null}">${requestScope.class23.courseName}<br>${requestScope.class23.compus}:${requestScope.class23.classroom}<h6>${requestScope.class23.weekmessage}</h6></c:if></td>
                                <td id="30" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class30!=null}">${requestScope.class30.courseName}<br>${requestScope.class30.compus}:${requestScope.class30.classroom}<h6>${requestScope.class30.weekmessage}</h6></c:if></td>

                            </tr>
                            <tr>
                                <td width="2%" align="center">78节</td>
                                <td id="3" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class3!=null}">${requestScope.class3.courseName}<br>${requestScope.class3.compus}:${requestScope.class3.classroom}<h6>${requestScope.class3.weekmessage}</h6></c:if></td>
                                <td id="10" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class10!=null}">${requestScope.class10.courseName}<br>${requestScope.class10.compus}:${requestScope.class10.classroom}<h6>${requestScope.class10.weekmessage}</h6></c:if></td>
                                <td id="17" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class17!=null}">${requestScope.class17.courseName}<br>${requestScope.class17.compus}:${requestScope.class17.classroom}<h6>${requestScope.class17.weekmessage}</h6></c:if></td>
                                <td id="24" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class24!=null}">${requestScope.class24.courseName}<br>${requestScope.class24.compus}:${requestScope.class24.classroom}<h6>${requestScope.class24.weekmessage}</h6></c:if></td>
                                <td id="31" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class31!=null}">${requestScope.class31.courseName}<br>${requestScope.class31.compus}:${requestScope.class31.classroom}<h6>${requestScope.class31.weekmessage}</h6></c:if></td>
                            </tr>
                            <tr>
                                <td width="2%" align="center" rowspan=1>晚上</td>
                                <td width="2%" align="center">910节</td>
                                <td id="4" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class4!=null}">${requestScope.class4.courseName}<br>${requestScope.class4.compus}:${requestScope.class4.classroom}<h6>${requestScope.class4.weekmessage}</h6></c:if></td>
                                <td id="11" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class11!=null}">${requestScope.class11.courseName}<br>${requestScope.class11.compus}:${requestScope.class11.classroom}<h6>${requestScope.class11.weekmessage}</h6></c:if></td>
                                <td id="18" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class18!=null}">${requestScope.class18.courseName}<br>${requestScope.class18.compus}:${requestScope.class18.classroom}<h6>${requestScope.class18.weekmessage}</h6></c:if></td>
                                <td id="25" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class25!=null}">${requestScope.class25.courseName}<br>${requestScope.class25.compus}:${requestScope.class25.classroom}<h6>${requestScope.class25.weekmessage}</h6></c:if></td>
                                <td id="32" width='13.5%' valign=top align=center height=50><c:if test="${requestScope.class32!=null}">${requestScope.class32.courseName}<br>${requestScope.class32.compus}:${requestScope.class32.classroom}<h6>${requestScope.class32.weekmessage}</h6></c:if></td>
                            </tr>

                        </table>
                    </center>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/teacher/common/footer.jsp"/>
</div>

<div class="theme-popover">
    <div class="theme-poptit">
        <a href="javascript:;" title="关闭" class="close">×</a>
        <h3>填写信息</h3>
    </div>
    <div class="theme-popbod dform">
        <form class="theme-signin" id="uploadForm" name="loginform" action="" method="post">
            <ol>
                <li><strong>作业题目：</strong><input id="title" name="title" class="ipt"  size="20" /></li>
                <li>
                    <strong>选择周次：</strong>
                    <select id="selectWeek" name="selectWeek">

                    </select>
                </li>
                <li><strong>完成时间：</strong><input id="time" name="time" class="ipt" size="20" />(分钟)</li>
                <li><strong>文件：</strong><input id="file" type="file" name="file" class="ipt" /></li>
                <li><input type="button" class="btn btn-primary" onclick="submitFile()" name="submit" value=" 提 交 " /></li>
            </ol>
        </form>
    </div>
</div>

<div class="theme-popover-mask"></div>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
        $("td").click(function () {
            //星期几第几节课的数值
            var val = $(this).attr("id");
            var weekMessage = $(this).children("h6").html();

            flag = false
            x = 0
            y = 0
            for (i=0; i <= 4; i++) {
                for (j=0; j<=4; j++) {
                    if ((7*i + j)+'' == val) {
                        x = i
                        y = j
                        flag = true
                        break
                    }
                }

                if (flag == true) {
                    break
                }
            }

            if (weekMessage == null) {
                alert("此节无课")
            } else {

                $("#selectWeek").html('');
                $.ajax({
                    url:'${pageContext.request.contextPath}/teacher/getWeekList/exam',
                    method: 'post',
                    dataType: 'json',
                    data:{'weekMessage':weekMessage, 'val':val, 'x':x, 'y':y},
                    success:function (data) {
                        if (data.flag == "thisWeek") {

                            lastWeek = parseInt(data.lastWeek);
                            currentWeek = parseInt(data.currentWeek);
                            var flag = lastWeek - currentWeek;
                            while (flag >= 0) {
                                $("#selectWeek").append("<option name=\""+currentWeek+"\">"+currentWeek+"</option>");
                                currentWeek++;
                                flag--;
                            }

                            $('.theme-popover-mask').fadeIn(100);
                            $('.theme-popover').slideDown(200);
                            $('.theme-poptit .close').click(function(){
                                $('.theme-popover-mask').fadeOut(100);
                                $('.theme-popover').slideUp(200);
                            })
                        } else if (data.flag == "nextWeek") {
                            lastWeek = parseInt(data.lastWeek);
                            currentWeek = parseInt(data.currentWeek) + 1;

                            var flag = lastWeek - currentWeek;

                            while (flag >= 0) {
                                $("#selectWeek").append("<option name=\""+currentWeek+"\">"+currentWeek+"</option>");
                                currentWeek++;
                                flag--;
                            }

                            $('.theme-popover-mask').fadeIn(100);
                            $('.theme-popover').slideDown(200);
                            $('.theme-poptit .close').click(function(){
                                $('.theme-popover-mask').fadeOut(100);
                                $('.theme-popover').slideUp(200);
                            })
                        }
                    }
                })
            }

        });
    });


    function submitFile() {
        var index;
        var title = $("#title").val();
        var selectWeek = $("#selectWeek").val();
        var time = $("#time").val();

        if (title=='' || selectWeek=='' || time=='') {
            layer.msg('有字段为空!请检查!');
            return;
        }
        // FormData 对象
        var form = new FormData($( "#uploadForm" )[0]);
        $.ajax({
            url:'${pageContext.request.contextPath}/teacher/save/exam',
            method: 'post',
            contentType:false,
            processData:false,
            dataType: 'json',
            data:form,
            success: function(data) {
                if (data.error != null) {
                    layer.close(index);
                    layer.msg(data.error);
                } else if (data.success) {
                    layer.close(index);
                    layer.msg("上传成功！");
                }
            },
            beforeSend: function(){
                index = layer.load(1, {
                    shade: [0.1,'#fff'] //0.1透明度的白色背景
                });
            }

        });
    }
</script>
</body>
</html>
