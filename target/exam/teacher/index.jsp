<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>后台管理首页</title>
    <jsp:include page="${pageContext.request.contextPath}/teacher/common/style.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<jsp:include page="common/header.jsp"/>
    <div class="content-wrapper">
        <section class="content">
            <div class="box-body">
                <div class="row">
                    <div class="alert alert-info alert-dismissible">
                        感谢您使用,系统正在不断完善中...
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="box box-primary">
                        <div class="box-body">
                            <p>
                                感谢您使用
                            </p>
                            <p>
                                <a class="btn btn-success"
                                   href="http://wpa.qq.com/msgrd?v=3&uin=582866070&site=qq&menu=yes" target="_blank">
                                    <i class="fa fa-qq"> </i> 联系我
                                </a>
                                <a class="btn btn-white btn-bitbucket" href="http://www.jeesns.cn" target="_blank">
                                    <i class="fa fa-home"></i> 访问官网
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="box box-primary">
                        <div class="box-body">
                            <p>
                                技术支持：<a href="http://www.lxinet.com">（www.lxinet.com）</a><br/>
                                产品交流：<a href="http://www.jeesns.cn">社区</a><br/>
                                服务器赞助：<a href="http://www.919dns.com">919数据中心（www.919dns.com）</a><br/>
                                QQ交流群：280062708<br/>
                                商业授权QQ：582866070
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="col-sm-6">
                                <p>JAVA版本:static/manage{javaVersion}</p>
                                <p>MYSQL版本:static/manage{mysqlVersion}</p>
                                <p>WEB服务器:static/manage{webVersion}</p>
                                <p>CPU个数:static/manage{cpu}</p>
                                <p>虚拟机内存总量:static/manage{totalMemory}</p>
                                <p>虚拟机空闲内存量:{freeMemory}</p>
                                <p>虚拟机使用的最大内存量:{maxMemory}</p>
                            </div>
                            <div class="col-sm-6">
                                <p>客户端IP:{clientIP}</p>
                                <p>服务器IP:{serverIP}</p>
                                <p>操作系统:{osName}</p>
                                <p>用户主目录:{userHome}</p>
                                <p>工作目录:{userDir}</p>
                                <p>系统目录:{webRootPath}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-body">
                            <p>系统支持:{systemName}</p>
                            <p>当前版本:{systemVersion}</p>
                            <p>当前版本更新时间:{systemUpdateTime}</p>
                            <p>最新版本:<span class="lastSystemVersion"></span> &nbsp;&nbsp;
                                <a href="http://www.jeesns.cn" target="_blank">官网查看</a></p>
                            <p>最新版本更新时间:<span class="lastSystemUpdateTime"></span></p>
                            <p>&nbsp;</p>
                            <p>&nbsp;</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h5 class="box-title">二次开发</h5>
                        </div>
                        <div class="box-body">
                            <p>我们提供基于JEESNS的二次开发、模板定制服务，具体费用请联系我们。</p>
                            <p>同时，我们也提供以下服务：</p>
                            <ol>
                                <li>网站定制开发</li>
                                <li>仿站服务</li>
                                <li>APP开发</li>
                                <li>微信开发等</li>
                                <li>......</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h5 class="box-title">商业授权说明</h5>
                        </div>
                        <div class="box-body">
                            <p>商业授权后我可以获得什么？</p>
                            <ol>
                                <li>可以用于商业网站</li>
                                <li>可以去除Powered by JEESNS</li>
                                <li>获得更多功能；</li>
                                <li>意见或建议优先考虑；</li>
                                <li>提供技术服务支持；</li>
                                <li>……</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h5 class="box-title">更新日志</h5>
                        </div>
                        <div class="box-body">
                            <div class="panel-body">
                                <div class="panel-group" id="version">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version"
                                                   href="#v102">v0.2</a><code class="pull-right">2017.7.3</code>
                                            </h5>
                                        </div>
                                        <div id="v102" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="alert alert-success">
                                                    <ul>
                                                        <li>单点登录</li>
                                                        <li>权限过滤</li>
                                                        <li>更换登录页面</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<jsp:include page="common/footer.jsp"/>
</div>
<script>

</script>
</body>
</html>
