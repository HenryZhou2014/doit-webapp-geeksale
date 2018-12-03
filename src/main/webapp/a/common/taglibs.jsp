<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springmodules.org/tags/commons-validator" prefix="v" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://struts-menu.sf.net/tag-el" prefix="menu" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="http://www.appfuse.org/tags/spring" prefix="appfuse" %>

<%@ taglib uri="/doit-tags" prefix="doit" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="resource" value="${pageContext.request.contextPath}/resource"/>
<c:set var="ctx$a" value="${pageContext.request.contextPath}/a"/>
<c:set var="ctx$resource" value="${pageContext.request.contextPath}/a/resource"/>
<c:set var="ctx$theme" value="${pageContext.request.contextPath}/a/resource/theme"/>
<c:set var="ctx$theme$default" value="${pageContext.request.contextPath}/a/resource/theme/default"/>

<c:set var="datePattern"><fmt:message key="date.format"/></c:set>

<appfuse:constants/>
