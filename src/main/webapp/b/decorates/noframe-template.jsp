<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ include file="/b/common/taglibs.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <%@ include file="/b/common/meta.jsp" %>
    <title><decorator:title/> | <fmt:message key="webapp.name"/></title>

    <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/custom.css'/>"/>
    <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/override.css'/>"/>
    <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/${appConfig["csstheme"]}/theme.css'/>"/>
    <link rel="stylesheet" type="text/css" media="print" href="<c:url value='/styles/${appConfig["csstheme"]}/print.css'/>"/>

    <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/styles/${appConfig["csstheme"]}/gs960/960_12_col.css'/>"/>

    <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/scripts/jquery-easyui-1.4.2/themes/default/easyui.css'/>"/>
    <link rel="stylesheet" type="text/css" media="all" href="<c:url value='/scripts/jquery-easyui-1.4.2/themes/icon.css'/>"/>

    <script src="<c:url value='/scripts/jquery-1.11.2.min.js'/>"></script>
    <script src="<c:url value='/scripts/jquery-easyui-1.4.2/jquery.easyui.min.js'/>"></script>
    <script src="<c:url value='/scripts/jquery-easyui-1.4.2/locale/easyui-lang-zh_CN.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.json-2.4.js'/>"></script>
    <script src="<c:url value='/scripts/jquery.pin/jquery.pin.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/global.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/scripts/tab.js'/>"></script>
    <decorator:head/>
</head>
<body>
<decorator:body/>
</body>
</html>

<%@ include file="/b/common/messages.jsp" %>
