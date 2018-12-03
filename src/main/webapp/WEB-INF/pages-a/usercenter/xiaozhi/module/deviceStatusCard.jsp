<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

    <input type="hidden" name="deviceId" value="${deviceInfo.deviceId}"/>
    <div class="title">
        <div class="ip"><a href="/deviceInfo/${deviceInfo.deviceId}">${deviceInfo.machineName}</a></div>
        <div class="machineName">${deviceInfo.ip}</div>
    </div>
    <div>
        <div class="appStatusWrapper">
            <c:forEach begin="0" end="9" var="sindex">
                <c:set var="appClass" value="inactiveApp"/>
                <c:if test="${'1' eq deviceInfo.status[sindex]}">
                    <c:set var="appClass" value="activeApp"/>
                </c:if>
                <div class="appBlock fl ${appClass}">${deviceInfo.companyId[sindex]}<c:if
                        test="${empty deviceInfo.companyId[sindex]}">&nbsp;</c:if></div>
            </c:forEach>
        </div>
    </div>
    <div style="height: 30px;">
        <div class="fl" style="margin-top: 8px;">
            <c:choose>
                <c:when test="${deviceInfo.connected}">
                    <div class="updateTime">
                        <fmt:formatDate value="${deviceInfo.statusUpdateTime}" pattern="yyyy/MM/dd HH:mm:ss"/>
                    </div>
                </c:when>
                <c:otherwise>
                    <label class="disconnected">未连接</label>
                </c:otherwise>
            </c:choose>
        </div>
        <c:if test="${not empty deviceInfo.deviceId}">
            <div class="fr" style="margin: 8px 4px 0 4px;">
                <a href="javascript:void(0);" onclick="requestLatestStatus('${deviceInfo.deviceId}');"><img src="/images/icon/0000_Refresh-inactive.png" style="max-width: 13px;"/></a>
                <a href="javascript:void(0);" onclick="detailInfo('${deviceInfo.deviceId}');"><img src="/images/icon/information_more_detail-128.png" style="max-width: 13px;"/></a>
            </div>
        </c:if>
        <div class="clear"></div>
    </div>
