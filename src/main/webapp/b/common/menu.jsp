<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <%--<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_USER">--%>

                <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="${ctx$resource$b}/common/images/photo-128.png" style="max-width: 50px; background: whitesmoke;"/>
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong
                                    class="font-bold"><security:authentication property="principal.userName"/></strong>
                             </span> <span class="text-muted text-xs block"><security:authentication
                                    property="principal.username"/> <b
                                    class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="<c:url value="/app/backend/user/userform"/>">账号信息</a></li>
                        <li><a href="<c:url value="/app/backend/user/resetPassword"/>">修改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/app/backend/logout"/>">退出</a></li>
                    </ul>
                </div>
                <%--</security:authorize>--%>

                <div class="logo-element">
                    IN+
                </div>
            </li>
            <li class="menu-item-group active" data-menu-group="website-dashboard">
                <a href="${ctx}/backend/index.html" data-menu-module="website-dashboard"><i class="fa fa-th-large"></i> <span
                        class="nav-label">系统面板
                    </span></a>
            </li>
            <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_BASIC_INFO,ROLE_USER">
                <li class="menu-item-group active" data-menu-group="website-basic-info">
                    <a href="${ctx}/backend/website/websiteSettingform.html" data-menu-module="website-basic-info"><i
                            class="fa fa-info-circle"></i> <span class="nav-label">网站基本信息</span></a>
                </li>
            </security:authorize>

            <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_CONTENT,ROLE_USER">
                <li class="menu-item-group" data-menu-group="website-management">
                    <a href="#"><i class="fa fa-laptop"></i> <span class="nav-label">网站管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FIXED_CONTENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="notifications"><a
                                    href="${ctx}/backend/cms/notifications.html">公告通知管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FIXED_CONTENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="website-content"><a
                                    href="${ctx}/backend/cms/namedTextModules.html">网站内容管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FILE_MANAGEMENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="menus"><a
                                    href="${ctx}/backend/cms/menus.html">菜单管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_VISITOR_MESSAGES,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="visitor-messages"><a
                                    href="${ctx}/backend/cms/namedTextModules.html">留言管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_VISITOR_MESSAGES,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="web-links"><a
                                    href="${ctx}/backend/cms/webLinks.html">友情链接管理</a></li>
                        </security:authorize>
                    </ul>
                </li>
            </security:authorize>

            <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_CONTENT,ROLE_USER">
                <li class="menu-item-group" data-menu-group="content-management">
                    <a href="#"><i class="fa fa-cloud"></i> <span class="nav-label">内容管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_ARTICLE_CATEGORY,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="article-categories"><a
                                    href="${ctx}/backend/cms/articleCategories.html">分类管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_ARTICLES,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="articles"><a
                                    href="${ctx}/backend/cms/articles.html">资讯管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FILE_MANAGEMENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="slides"><a
                                    href="${ctx}/backend/cms/slideGroupInfos.html">幻灯片管理</a></li>
                        </security:authorize>
                    </ul>
                </li>
            </security:authorize>

            <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_CONTENT,ROLE_USER">
                <li class="menu-item-group" data-menu-group="account-management">
                    <a href="#"><i class="fa fa-user"></i> <span class="nav-label">会员管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FIXED_CONTENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="user-accounts"><a
                                    href="${ctx}/backend/account/accounts.html">会员账号管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FIXED_CONTENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="user-employee-accounts"><a
                                    href="${ctx}/backend/employeeaccount/accounts.html">员工账号管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FIXED_CONTENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="user-agent-accounts"><a
                                    href="${ctx}/backend/agentaccount/accounts.html">代理账号管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FIXED_CONTENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="user-oem-accounts"><a
                                    href="${ctx}/backend/oemagentaccount/accounts.html">OEM代理账号管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FIXED_CONTENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="user-userGroups"><a
                                    href="${ctx}/backend/account/userGroups.html">用户组管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FIXED_CONTENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="account-companyinfoes"><a
                                    href="${ctx}/backend/account/companyInfoes.html">会员公司信息管理</a></li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_WEBSITE_FIXED_CONTENT,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="accounts-queue-audit"><a
                                    href="${ctx}/backend/account/accounts-queue-audit">开户审核</a></li>
                        </security:authorize>
                    </ul>
                </li>
            </security:authorize>

            <%--<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM,ROLE_USER">
                <li class="menu-item-group" data-menu-group="weixin-management">
                    <a href="#"><i class="fa fa-weixin"></i> <span class="nav-label">微信管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM_USERS,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="weixin-menus">
                                <a href="${ctx}/backend/weixin/menus">菜单管理</a>
                            </li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM_DEPARTMENTS,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="weixin-material">
                                <a href="${ctx}/backend/weixin/materials">素材管理</a>
                            </li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM_DEPARTMENTS,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="weixin-users">
                                <a href="${ctx}/backend/weixin/users">用户管理</a>
                            </li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM_DEPARTMENTS,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="weixin-messages">
                                <a href="${ctx}/backend/weixin/messages">消息管理</a>
                            </li>
                        </security:authorize>
                    </ul>
                </li>
            </security:authorize>--%>

            <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM,ROLE_USER">
                <li class="menu-item-group" data-menu-group="ecommerce-management">
                    <a href="#"><i class="fa fa-cubes"></i><span class="nav-label">产品管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li class="menu-item-subgroup" data-menu-subgroup="ecommerce-product">
                            <a href="#">产品管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li class="menu-item-module" data-menu-module="ecommerce-product-info">
                                    <a href="${ctx}/backend/ecommerce/product/sellOffers.html">产品信息管理</a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-subgroup" data-menu-subgroup="ecommerce-sale">
                            <a href="#">销售管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li class="menu-item-module" data-menu-module="ecommerce-sale-management">
                                    <a href="${ctx}/backend/ecommerce/product/sellOfferSaleManagement.html">产品销售管理</a>
                                </li>
                                <li class="menu-item-module" data-menu-module="ecommerce-presentation-management">
                                    <a href="${ctx}/backend/ecommerce/product/sellOfferPresentationManagement.html">产品展示管理</a>
                                </li>
                                <li class="menu-item-module" data-menu-module="ecommerce-sale-now">
                                    <a href="${ctx}/backend/ecommerce/product/sellOffersInSale.html">上架产品</a>
                                </li>
                                <li class="menu-item-module" data-menu-module="ecommerce-sale-ready">
                                    <a href="${ctx}/backend/ecommerce/product/sellOffersReadyForSale.html">未上架产品</a>
                                </li>
                                <li class="menu-item-module" data-menu-module="ecommerce-sale-category">
                                    <a href="${ctx}/backend/ecommerce/product/goodsSaleCategories.html">销售分类管理</a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-module" data-menu-module="ecommerce-categories">
                            <a href="${ctx}/backend/ecommerce/product/productCategories.html">产品分类管理</a>
                        </li>
                        <%--<li class="menu-item-module" data-menu-module="ecommerce-brands">
                            <a href="${ctx}/backend/ecommerce/product/productCategories.html">图书品牌管理</a>
                        </li>--%>
                        <%--<li class="menu-item-subgroup" data-menu-subgroup="column-stock">
                            <a href="#">库存管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                    <li class="menu-item-module" data-menu-module="column-stock-inventory">
                                        <a href="${ctx}/backend/ecommerce/stock/inventory">库存查询</a>
                                    </li>
                                    <li class="menu-item-module" data-menu-module="column-stock-management">
                                        <a href="${ctx}/backend/ecommerce/stock/inventoryManagement">库存管理</a>
                                    </li>
                                    <li class="menu-item-module" data-menu-module="column-stock-outofstock">
                                        <a href="${ctx}/backend/ecommerce/stock/out-of-stock">缺货商品</a>
                                    </li>
                            </ul>
                        </li>--%>
                        <li class="menu-item-module" data-menu-module="ecommerce-product-trash">
                            <a href="${ctx}/backend/ecommerce/product/sellOffersInTrash.html"><i class="fa fa-trash-o"></i>回收站</a>
                        </li>
                    </ul>
                </li>
            </security:authorize>
            <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM,ROLE_USER">
                <li class="menu-item-group" data-menu-group="ecommerce-order-management">
                    <a href="#"><i class="fa fa-file-text"></i> <span class="nav-label">订单管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li class="menu-item-module" data-menu-module="ecommerce-orders-list">
                            <a href="${ctx}/backend/ecommerce/order/goodsOrders">订单管理</a>
                        </li>
                        <li class="menu-item-module" data-menu-module="ecommerce-orders-valet">
                            <a href="${ctx}/backend/ecommerce/order/valetOrders">代客下单</a>
                        </li>
                        <li class="menu-item-module" data-menu-module="ecommerce-orders-delivery">
                            <a href="${ctx}/backend/ecommerce/order/goodsOrders">发货管理</a>
                        </li>
                    </ul>
                </li>
            </security:authorize>
            <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM,ROLE_USER">
                <li class="menu-item-group" data-menu-group="customer-management">
                    <a href="#"><i class="fa fa-bar-chart"></i> <span class="nav-label">统计分析</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li class="menu-item-subgroup" data-menu-subgroup="column-cooperation">
                            <a href="#">会员<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li class="menu-item-module" data-menu-module="column-cooperation-fixedcontent">
                                    <a href="${ctx}/backend/column-cooperation/fixed-articles">注册统计</a>
                                </li>
                                <li class="menu-item-module" data-menu-module="cooperation-news">
                                    <a href="${ctx}/backend/column-cooperation/cooperation-news/articles">活动分析</a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-subgroup" data-menu-subgroup="column-cooperation">
                            <a href="#">商品<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li class="menu-item-module" data-menu-module="column-cooperation-fixedcontent">
                                    <a href="${ctx}/backend/column-cooperation/fixed-articles">商品统计</a>
                                </li>
                                <li class="menu-item-module" data-menu-module="cooperation-news">
                                    <a href="${ctx}/backend/column-cooperation/cooperation-news/articles">销售分析</a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-subgroup" data-menu-subgroup="column-cooperation">
                            <a href="#">订单<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li class="menu-item-module" data-menu-module="column-cooperation-fixedcontent">
                                    <a href="${ctx}/backend/column-cooperation/fixed-articles">订单统计</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </security:authorize>
            <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM,ROLE_USER">
                <li class="menu-item-group" data-menu-group="system-management">
                    <a href="#"><i class="fa fa-cogs"></i> <span class="nav-label">系统管理</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM_USERS,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="system-users">
                                <a href="${ctx}/backend/admin/users.html">运营账号管理</a>
                            </li>
                        </security:authorize>
                        <%--<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM_DEPARTMENTS,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="system-activeUsers">
                                <a href="${ctx}/backend/admin/activeUsers.html">在线用户管理</a>
                            </li>
                        </security:authorize>--%>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM_DEPARTMENTS,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="system-departments">
                                <a href="${ctx}/backend/admin/departments.html">部门管理</a>
                            </li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM_DEPARTMENTS,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="system-roles">
                                <a href="${ctx}/backend/admin/roles.html">角色管理</a>
                            </li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM_DEPARTMENTS,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="system-rightUnits">
                                <a href="${ctx}/backend/admin/rightUnits.html">权限单元管理</a>
                            </li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_LOGS,ROLE_USER">
                            <li class="menu-item-subgroup" data-menu-subgroup="system-logs">
                                <a href="#">系统日志<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li class="menu-item-module" data-menu-module="system-logs-login">
                                        <a href="${ctx}/backend/admin/logs/userLoginLogs">用户登录日志</a>
                                    </li>
                                    <li class="menu-item-module" data-menu-module="system-logs-access">
                                        <a href="${ctx}/backend/admin/logs/accessLogs">网站访问日志</a>
                                    </li>
                                </ul>
                            </li>
                            </li>
                        </security:authorize>
                        <security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_SYSTEM_PARAMETERS,ROLE_USER">
                            <li class="menu-item-module" data-menu-module="system-parameters-setting">
                                <a href="${ctx}/backend/admin/parameters.html">参数设置</a>
                            </li>
                        </security:authorize>
                    </ul>
                </li>
            </security:authorize>
        </ul>
    </div>
</nav>