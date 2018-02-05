<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  User: liao
  Date: 17-12-4
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

        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">
                                <a target="_jeesnsOpen"
                                   width="1000px" height="680px">
                                    总数:${sum}
                                </a>
                            </h3>

                            <div class="box-tools">
                                <form method="get" action="/cms/index">
                                    <div class="input-group input-group-sm" style="width: 350px;">
                                        <input type="text" name="key" class="form-control pull-right"
                                               placeholder="请输入关键词">
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 10px">#</th>
                                    <th>考试标题</th>
                                    <th>创建时间</th>
                                    <th>考试时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach var="record" items="${recordList}">
                                    <tr>
                                        <td>${record.id}</td>
                                        <td>${record.title}</td>
                                        <td><fmt:formatDate value="${record.createDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
                                        <td>${record.time}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${record.isStart == '0'}">
                                                    <a class="marg-l-5" target="_jeesnsLink"
                                                       href="${pageContext.request.contextPath}/teacher/exam/examRecord/release/${record.id}">
                                                        <span class="label label-danger">未发布</span>
                                                    </a>
                                                </c:when>
                                                <c:when test="${record.isStart == '1'}">
                                                    <a class="marg-l-5" target="_jeesnsLink"
                                                       href="${pageContext.request.contextPath}/teacher/exam/examRecord/cancel/${record.id}">
                                                        <span class="label label-success">已发布</span>
                                                    </a>
                                                    <a class="marg-l-5" download="${record.qrcodeUrl}.png"
                                                       href="${pageContext.request.contextPath}/static/qrcode/${record.qrcodeUrl}.png">
                                                        <span class="label label-primary">二维码</span>
                                                    </a>
                                                </c:when>
                                            </c:choose>

                                        </td>
                                        <td>
                                            <a href="{managePath}/cms/article/edit/rticle.id}" target="_jeesnsOpen"
                                               title="编辑文章" width="1000px" height="680px">
                                                <span class="label label-warning"><i class="fa fa-edit green"></i></span>
                                            </a>
                                            <a class="marg-l-5" target="_jeesnsLink"
                                               href="${pageContext.request.contextPath}/teacher/exam/examRecord/delete/${record.id}" confirm="确定要删除此考试记录吗？">
                                                <span class="label label-danger"><i class="fa fa-trash red"></i></span>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="{managePath}/cms/index?key=key}"
                                currentPage="{model.page.pageNo}"
                                pageCount="{model.page.totalPage}">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="${pageContext.request.contextPath}/teacher/common/footer.jsp"/>
</div>

</body>
</html>

