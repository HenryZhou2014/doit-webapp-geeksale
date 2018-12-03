<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>
<style type="text/css">

</style>


<%-- Put constants into request scope --%>
<appfuse:constants scope="request"/>

<div>
    <div class="fl" style="padding: 5px 25px;">
        <img src="${ctx}/images/lhs-arts/logo.png"/>
    </div>
    <div class="fr" style="padding-top: 18px;">

        <div class="fl">
            <img src="${ctx}/images/icon/profile_image_male.png" style="max-height: 60px;"/>
        </div>

        <div class="fl" style="padding-top: 30px; color: darkgray; font-weight: bold;">

            <%--<security:authorize ifAnyGranted="ROLE_ADMIN,ROLE_USER">
                <div>账号：
                    <a id="header_account" href="javascript:void(0);"><security:authentication property="principal.username"></security:authentication></a>
                </div>
                <div>用户：<security:authentication property="principal.name"></security:authentication>
                </div>
            </security:authorize>--%>

        </div>

        <div class="fl" style="margin-left: 20px; padding-top: 30px;">
            <div>
                <a href="${ctx}/backend/logout"><img src="${ctx}/images/icon/logout-32.png"/></a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {

    });
</script>