<%@ include file="/a/common/taglibs.jsp"%>

<%--<page:applyDecorator name="default">--%>

<head>
    <title><fmt:message key="403.title"/></title>
    <meta name="heading" content="<fmt:message key='403.title'/>"/>
</head>
    <div style="text-align: center;">
<p style="font-size: 1.5em; margin: 60px">
    <fmt:message key="403.message">
        <fmt:param><c:url value="/"/></fmt:param>
    </fmt:message>
</p>
    </div>
<%--</page:applyDecorator>--%>