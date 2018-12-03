<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp"%>
<%--首页--%>
<head>
    <title>首页</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="column-name" content="home"/>
    <link rel="stylesheet" href="/styles/common/animate.css">
    <link rel="stylesheet" href="/styles/common/font-awesome.min.css">
    <link rel="stylesheet" href="/styles/common/jquery.bxslider.css">
    <link rel="stylesheet" type="text/css" href="/styles/common/isotope.css" media="screen" />
    <link rel="stylesheet" href="/scripts/common/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="/styles/index/style.css">
    <style type="text/css">
        .nav li a{
            padding: 30px 15px;
        }

        .nav li a{
            color: #444;
            font-family: "Microsoft Yahei", "微软雅黑", "宋体", "新宋体", "黑体", STHeiti;
            font-size: 18px;
            font-weight: bolder;
        }

        .dropdown-menu li a{
            padding: 10px 15px;
        }
    </style>
</head>
<div>

    <div style="margin-top:300px; height: 80px; background: #fff; opacity: 0.65;-moz-opacity: 0.65;filter:alpha(opacity=65);">
        <div class="container">
            <div class="row">
                <div class="col-lg-3" >
                    <div style="margin-top: 10px;">
                        <img src="${ctx}/images/lhs-arts/logo.png"/>
                    </div>
                </div>
                <div class="col-lg-9">
                    <ul class="nav navbar-nav" style="margin-left: 30px;">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">馆讯<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${ctx}/page/about/aboutus.html">新闻资讯</a></li>
                                <li><a href="${ctx}/page/about/joinus.html">馆际协作</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">展览<span class="caret"></span></a>
                            <ul  class="dropdown-menu" role="menu">
                                <li><a href="${ctx}/page/scenicSpot/snapshot.html">当前展览</a></li>
                                <li><a href="${ctx}/page/actPhoto/actPhoto.html">展览预告</a></li>
                                <li><a href="${ctx}/page/cityPhoto/cityPhoto.html">虚拟展览</a></li>
                                <li><a href="${ctx}/page/cityPhoto/cityPhoto.html">展览回顾</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">鉴赏<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${ctx}/page/about/aboutus.html">刘海粟国画</a></li>
                                <li><a href="${ctx}/page/about/joinus.html">刘海粟油画</a></li>
                                <%--<li><a href="${ctx}/agentList.html">馆藏历代书画</a></li>--%>
                                <%--<li><a href="${ctx}/page/about/services.html">当代绘画</a></li>--%>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">教育<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${ctx}/page/about/aboutus.html">艺术讲座</a></li>
                                <li><a href="${ctx}/agentList.html">工作坊</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">志愿者<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${ctx}/page/about/aboutus.html">志愿者队伍介绍</a></li>
                                <li><a href="${ctx}/page/about/joinus.html">志愿者动态</a></li>
                                <li><a href="${ctx}/agentList.html">志愿者申请</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">百年刘海粟<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${ctx}/page/about/aboutus.html">上海美专</a></li>
                                <li><a href="${ctx}/page/about/joinus.html">历史回顾</a></li>
                                <li><a href="${ctx}/agentList.html">美专毕业艺术家作品</a></li>
                                <li><a href="${ctx}/page/about/services.html">主题活动</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">青年艺术家<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${ctx}/page/about/aboutus.html">青年艺术家</a></li>
                                <li><a href="${ctx}/page/about/joinus.html">青年美展</a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>

        </div>

    </div>
<div class="container">

    <div >

    </div>

</div>
</div>
<script src="/scripts/common/jquery.easing.1.3.js"></script>
<script src="/scripts/common/jquery.bxslider.min.js"></script>
<script src="/scripts/common/jquery.isotope.min.js"></script>
<script src="/scripts/common/fancybox/jquery.fancybox.pack.js"></script>
<script src="/scripts/index/scripts.js"></script>
<script type="text/javascript">
</script>
