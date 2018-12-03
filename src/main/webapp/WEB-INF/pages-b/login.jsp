<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>登陆 | 上腾科技裂变营销运营管理系统</title>

    <link href="${ctx}/resource/common/styles/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resource/common/styles/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet">

    <link href="${ctx}/resource/common/styles/animate.css" rel="stylesheet">
    <link href="${ctx}/resource/common/styles/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">IN+</h1>

        </div>
        <h3>上腾科技裂变营销运营管理系统</h3>
        <c:if test="${param.error != null}">
            <p class="bg-danger">
                用户名或密码错误！${param.error}
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>
        </c:if>
        <p></p>
        <form class="m-t" role="form" action="${ctx}/backend/j_security_check" method="post">
            <div class="form-group">
                <input type="text" class="form-control" name="j_username" id="j_username" placeholder="账号" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="j_password" id="j_password" placeholder="密码" required="">
            </div>
            <div class="form-group">
                <label><input type="checkbox" name="_spring_security_remember_me" id="rememberMe">
                    <fmt:message key="login.rememberMe"/></label>
            </div>

            <button type="submit" class="btn btn-primary block full-width m-b">登陆</button>

            <%--<a href="#"><small>Forgot password?</small></a>--%>
            <%--<p class="text-muted text-center"><small>Do not have an account?</small></p>--%>
            <%--<a class="btn btn-sm btn-white btn-block" href="register.html">创建账号</a>--%>
        </form>
        <p class="m-t"> <small>powered by 上海上腾科技 &copy; 2017</small> </p>
    </div>
</div>

<!-- Mainly scripts -->
<script src="${ctx}/resource/common/scripts/jquery-2.1.1.js"></script>
<script src="${ctx}/resource/common/scripts/bootstrap.min.js"></script>

</body>

</html>

<script type="text/javascript">

    $(document).ready(function () {

    });
</script>