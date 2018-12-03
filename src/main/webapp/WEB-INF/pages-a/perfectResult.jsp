<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<%@ include file="/a/common/taglibs.jsp"%>
<%--代理商开通-完善信息提交激活--%>
<html lang="en">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title><fmt:message key="webapp.name"/></title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu" content="signup"/>

    <link href="${ctx}/scripts/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/scripts/jquery-validation/jquery-validation.css" rel="stylesheet">
    <link href="${ctx}/styles/signup.css" rel="stylesheet">

</head>

<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">消息</h3>
        </div>
        <div class="panel-body">
            <div class="alert alert-success" role="alert">你的申请已提交，我们会尽快为您审核,谢谢您的使用！</div>
        </div>
    </div>
</div>
</body>

<script src="${ctx}/scripts/jquery-1.11.2.min.js"></script>
<script src="${ctx}/scripts/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
