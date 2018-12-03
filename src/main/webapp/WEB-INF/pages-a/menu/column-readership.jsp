<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<style type="text/css">

    ul.menu-list li {
        line-height: 35px;
        padding-left: 30px;
    }

    ul.menu-list li a{
        color: #666;
    }

    ul.menu-list li a:hover{
        font-weight: bold;
    }

    ul.menu-list li:hover{
        background: #ffffff;
    }

    ul.menu-list li.active{
        background: #ffffff;
    }

    ul.menu-list li.active a{
        color:#2C3E50;
        font-weight: 800;
    }
</style>
<div class="col-lg-12">
    <div class="margin-bottom-60 nopadding">
        <div class="row">
            <h4 class="margin-left-10" style="color:#2C3E50;"><i class="fa fa-bookmark"></i> 读者服务</h4>
        </div>
        <div class="row">
            <ul class="list-unstyled menu-list"><!-- NOTE: "collapse in" to be open on page load -->
                <li data-menu="shopping-need-to-know"><a class="size-14" href="${ctx}/readership/shopping-need-to-know"><i class="fa fa-angle-right"></i> 购书指南</a></li>
                <li data-menu="service-for-reader"><a href="${ctx}/download" class="active size-14"><i class="fa fa-angle-right"></i> 书目信息</a></li>
                <li data-menu="how-to-read-ebooks"><a class="size-14" href="${ctx}/agent"><i class="fa fa-angle-right"></i> 分销商名录</a></li>
                <li data-menu="suggest"><a class="size-14" href="${ctx}/readership/suggest"><i class="fa fa-angle-right"></i> 留言建议</a></li>
                <li data-menu="order-book"><a class="size-14" href="${ctx}/readership/order-book"><i class="fa fa-angle-right"></i> 预约订货</a></li>
                <li data-menu="contribute"><a class="size-14" href="${ctx}/readership/contribute"><i class="fa fa-angle-right"></i> 投稿须知</a></li>
            </ul>
        </div>

    </div>
    <!-- /SIDE NAV -->
</div>

<script type="text/javascript">

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class

        // 突出显示菜单
        <c:choose>
            <c:when test="${not empty namedTextModule}">
                $(".menu-list li[data-menu='${namedTextModule.aliasName}']").addClass("active");
            </c:when>
            <c:otherwise>
                $(".menu-list li[data-menu='"+$('meta[name="column-name"]').attr('content')+"']").addClass("active");
            </c:otherwise>
        </c:choose>



    });
</script>