<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="main-header">
    <a href="http://www.jeesns.cn" class="logo" target="_blank">
        <span class="logo-mini"><b>JEE</b></span>
        <span class="logo-lg"><b>JEESNS</b></span>
    </a>
    <nav class="navbar navbar-static-top">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${pageContext.request.contextPath}/static/manage/img/default-avatar.png" class="user-image" alt="User Image">
                        <span class="hidden-xs">liao</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header">
                            <img src="${pageContext.request.contextPath}/static/manage/img/default-avatar.png" class="img-circle" alt="User Image">
                            <p>
                                liao
                            </p>
                        </li>
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="" class="btn btn-default btn-flat" target="_blank">设置</a>
                            </div>
                            <div class="pull-right">
                                <a href="javascript:void(0)" onclick="logout()" class="btn btn-default btn-flat">退出</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<aside class="main-sidebar">
    <section class="sidebar">
        <ul class="sidebar-menu">
            <li class="header">功能模块</li>
            <li class="treeview" module="index">
                <a href="${pageContext.request.contextPath}/manage/index">
                    <i class="fa fa-dashboard"></i> <span>后台主页</span>
                </a>
            </li>
            <li><a href=""><i class="fa fa-dashboard"></i> <span>发布题目</span></a></li>
            <li class="treeview" module="config">
                <a href="#">
                    <i class="fa fa-cog"></i> <span>系统设置</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="" module="config"><i class="fa fa-circle-o"></i>系统设置</a></li>
                    <li><a href="" module="config"><i class="fa fa-circle-o"></i>管理员列表</a></li>
                    <li><a href="" module="config"><i class="fa fa-circle-o"></i>积分规则</a></li>
                </ul>
            </li>
            <li class="treeview" module="action">
                <a href="#">
                    <i class="fa fa-cog"></i> <span>动态管理</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="" module="action"><i class="fa fa-circle-o"></i>动态类型</a></li>
                    <li><a href="" module="action"><i class="fa fa-circle-o"></i>会员日志</a></li>
                    <li><a href="" module="action"><i class="fa fa-circle-o"></i>会员动态</a></li>
                </ul>
            </li>
            <li class="treeview" module="cms">
                <a href="#">
                    <i class="fa fa-book"></i> <span>文章管理</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="" module="cms"><i class="fa fa-circle-o"></i>栏目管理</a></li>
                    <li><a href="" module="cms"><i class="fa fa-circle-o"></i>文章管理</a></li>
                </ul>
            </li>
            <li class="treeview" module="exam">
                <a href="#">
                    <i class="fa fa-archive"></i> <span>考试管理</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a module="exam" href="${pageContext.request.contextPath}/teacher/exam/import"><i class="fa fa-circle-o"></i>发布考试</a></li>
                    <li><a module="exam" href="${pageContext.request.contextPath}/teacher/exam/examRecord/list"><i class="fa fa-circle-o"></i>管理考试</a></li>
                </ul>
            </li>
        </ul>
    </section>
</aside>
<script>
    $(function () {

       var uri = window.document.location.pathname;
        $(".treeview").each(function(){
            var _this = $(this);
            var module = _this.attr("module");
            if(uri.indexOf(module) > -1){
                _this.addClass("active");
            }else {
                _this.removeClass("active");
            }
        });
        $(".treeview-menu li").each(function(){
            var _this = $(this);
            if(uri == _this.find("a").attr("href")){
                _this.addClass("active");
            }else {
                _this.removeClass("active");
            }
        });
    });

    function logout() {
        $.ajax({
            url: '${pageContext.request.contextPath}/logout',
            dataType: 'json',
            type: 'post',
            success: function (result) {

                /*var dataObj=eval("("+result+")")*/
                if (result.success) {
                    window.location.href="${pageContext.request.contextPath}/login";
                }
            },

            error: function () {
                alert("error");
            }

        });
    }
</script>