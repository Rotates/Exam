<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, account-scalable=no" name="viewport">
    <title>错误 - {SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="{SITE_KEYS}"/>
    <meta name="description" content="{SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link href="${pageContext.request.contextPath}/static/manage/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/manage/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/manage/css/AdminLTE.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/manage/css/skins/_all-skins.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/manage/js/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/js/respond.min.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/manage/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/js/layer.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/js/app.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content">
            <div class="box-body">
                <div class="row">
                    <div class="alert alert-error alert-dismissible text-center">
                        {msg}
                    </div>
                </div>
            </div>
        </section>
    </div>
<#include "/manage/common/footer.ftl"/>
</div>
</body>
</html>
