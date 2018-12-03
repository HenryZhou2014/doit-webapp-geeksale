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
        color:#444;
        background: #ffffff;
        font-weight: 800;
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
            <h4 class="margin-left-10" style="color:#2C3E50;"><i class="fa fa-bookmark"></i> 本社概况</h4>
        </div>
        <div class="row">
            <ul class="list-unstyled menu-list"><!-- NOTE: "collapse in" to be open on page load -->
                <li data-menu="about-us"><a href="${ctx}/aboutus" class="active"><i class="fa fa-angle-right"></i> 本社简介</a></li>
                <li data-menu="leadership"><a href="${ctx}/aboutus/leadership"><i class="fa fa-angle-right"></i> 领导班子</a></li>
                <%--<li data-menu="organization"><a href="${ctx}/aboutus/organization"><i class="fa fa-angle-right"></i> 部门设置</a></li>--%>
                <%--<li data-menu="medal-wall"><a href="${ctx}/aboutus/medal-wall"><i class="fa fa-angle-right"></i> 集体荣誉</a></li>--%>
                <li data-menu="medal-books"><a href="${ctx}/aboutus/medal-books"><i class="fa fa-angle-right"></i> 获奖图书一览</a></li>
            <%--<li data-menu="contactus"><a href="${ctx}/aboutus/contactus"><i class="fa fa-angle-right"></i> 联系我们</a></li>--%>
                <%--<li data-menu="join-us"><a href="${ctx}/aboutus/join-us"><i class="fa fa-angle-right"></i> 招聘信息</a></li>--%>
                <%--<li data-menu="partnership"><a href="${ctx}/aboutus/partnership"><i class="fa fa-angle-right"></i> 合作伙伴</a></li>--%>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">

    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class

        $(".menu-list li[data-menu='${namedTextModule.aliasName}']").addClass("active");

    });
</script>