<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<style type="text/css">

    #topBar ul.top-links > li > a {
        font-family: "Microsoft Yahei", "微软雅黑", "宋体", "新宋体", "黑体", STHeiti;
    }
</style>

<!-- Top Bar -->
<div id="topBar">
    <div class="container">
        <div class="col-lg-12">

            <!-- right -->
            <ul class="top-links list-inline pull-right">
                <li class="text-welcome hidden-xs">欢迎您！<strong>张子枫</strong></li>
                <li>
                    <a class="dropdown-toggle no-text-underline" data-toggle="dropdown" href="#"><i
                            class="fa fa-user hidden-xs"></i> 我的账号 </a>
                    <ul class="dropdown-menu pull-right">
                        <li><a tabindex="-1" href="#"><i class="fa fa-history"></i> 投稿</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="#"><i class="fa fa-bookmark"></i> 我的投稿</a></li>
                        <li><a tabindex="-1" href="#"><i class="fa fa-edit"></i> 我的评论</a></li>
                        <li><a tabindex="-1" href="#"><i class="fa fa-cog"></i> 特约记者申请</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="#"><i class="glyphicon glyphicon-off"></i> 退出 </a></li>
                    </ul>
                </li>
            </ul>

            <!-- left -->
            <ul class="top-links list-inline">
                <li class="hidden-xs">
                    <a>
                        上海市卓越新闻人才教育培养计划 | 上海大学影视艺术与技术学院
                    </a>
                </li>
            </ul>

        </div>
    </div>
</div>
<!-- /Top Bar -->

<div id="header" class="sticky shadow-after-3 clearfix">

    <!-- TOP NAV -->
    <header id="topNav">
        <div class="container">
            <div class="col-lg-12">

                <!-- Mobile Menu Button -->
                <button class="btn btn-mobile" data-toggle="collapse" data-target=".nav-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- BUTTONS -->
                <ul class="pull-right nav nav-pills nav-second-main">

                    <!-- SEARCH -->
                    <li class="search">
                        <a href="javascript:;">
                            <i class="fa fa-search"></i>
                        </a>
                        <div class="search-box">
                            <form action="page-search-result-1.html" method="get">
                                <div class="input-group">
                                    <input type="text" name="src" placeholder="搜索" class="form-control"/>
											<span class="input-group-btn">
												<button class="btn btn-primary" type="submit">搜索</button>
											</span>
                                </div>
                            </form>
                        </div>
                    </li>
                    <!-- /SEARCH -->

                </ul>
                <!-- /BUTTONS -->


                <!-- Logo -->
                <a class="logo pull-left" href="index.html">
                    <img src="${ctx}/resource/common/smarty/data/images/logo.png" alt=""/>
                </a>

                <!--
                    Top Nav

                    AVAILABLE CLASSES:
                    submenu-dark = dark sub menu
                -->
                <div class="navbar-collapse pull-right nav-main-collapse collapse submenu-dark">
                    <nav class="nav-main">

                        <ul id="topMain" class="nav nav-pills nav-main">
                            <li class="dropdown"><!-- HOME -->
                                <a class="dropdown-toggle" href="#">
                                    首页
                                </a>
                            </li>
                            <li class="dropdown active"><!-- HOME -->
                                <a class="dropdown-toggle" href="${ctx}/news/index.html">
                                    新闻
                                </a>
                            </li>
                            <li class="dropdown active"><!-- HOME -->
                                <a class="dropdown-toggle" href="#">
                                    评论
                                </a>
                            </li>
                            <li class="dropdown active"><!-- HOME -->
                                <a class="dropdown-toggle" href="#">
                                    副刊
                                </a>
                            </li>
                            <li class="dropdown active"><!-- HOME -->
                                <a class="dropdown-toggle" href="#">
                                    视角
                                </a>
                            </li>
                            <li class="dropdown active"><!-- HOME -->
                                <a class="dropdown-toggle" href="#">
                                    影音
                                </a>
                            </li>
                            <li class="dropdown active"><!-- HOME -->
                                <a class="dropdown-toggle" href="#">
                                    问答
                                </a>
                            </li>
                            <li class="dropdown active"><!-- HOME -->
                                <a class="dropdown-toggle" href="#">
                                    电子报
                                </a>
                            </li>
                        </ul>

                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- /Top Nav -->
</div>


