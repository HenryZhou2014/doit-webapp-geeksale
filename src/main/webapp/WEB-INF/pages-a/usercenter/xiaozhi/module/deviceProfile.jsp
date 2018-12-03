<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<style type="text/css">

    .p1_titleBar {
        background: #308F5A;
        padding: 5px;
        margin: 15px 0 5px 0;
        font-weight: bold;
        color: #444;
    }

    .p1_serviceTable {
        width:100%;
    }

    .p1_serviceTable th, .p1_serviceTable td {
        padding: 3px;
    }

    .p1_serviceTable th {
        background: lightgray;
        font-weight: bolder;
        font-size: 12px;
    }

    .p1_serviceTable td{
        font-size: 12px;
    }

    .p1_serviceTable tr.odd {
        background: lightgray;
    }

    .p1_serviceTable tr.even {
    }


</style>

<div>

    <div style="margin-left: 10px; font-size: 14px;">
        <div style="padding:5px;">
            <label style="width: 100px; display: inline-block; text-align: right;font-size: 12px;">机器名：</label>${deviceInfo.machineName}
        </div>
        <div style="padding:5px;">
            <label style="width: 100px; display: inline-block; text-align: right;font-size: 12px;">IP地址：</label>${deviceInfo.ip}
        </div>
        <div style="padding:5px;">
            <label style="width: 100px; display: inline-block; text-align: right;font-size: 12px;">客户端版本：</label>${deviceInfo.clientVersion}
        </div>
        <div style="padding:5px;">
            <label style="width: 100px; display: inline-block; text-align: right;font-size: 12px;">Revision：</label>${deviceInfo.svnRevision}
        </div>
    </div>

    <div class="p1_titleBar">
        <div>
            <label style="color:#ffffff;">服务信息</label>
        </div>
    </div>

    <div style="padding: 10px;">
        <div>
            <div class="fr">
                更新时间：<fmt:formatDate value="${deviceInfo.statusUpdateTime}" pattern="yyyy/MM/dd HH:mm:ss"/>
            </div>
            <div class="clear"></div>
        </div>
        <div style="margin-top: 10px;">
            <table class="p1_serviceTable">
                <tr>
                    <th rowspan="2">客户ID</th>
                    <th rowspan="2">客户名称</th>
                    <th colspan="3">应用</th>
                    <th colspan="3">TOMCAT</th>
                    <th colspan="4">数据库</th>
                </tr>
                <tr>
                    <th>版本号</th>
                    <th>数据库版本</th>
                    <th>状态</th>

                    <th>服务名</th>
                    <th>端口</th>
                    <th>状态</th>

                    <th>数据库名</th>
                    <th>数据库版本</th>
                    <th>云编号</th>
                    <th>数据库创建时间</th>
                </tr>

                <c:forEach begin="0" end="9" var="sIndex" >

                    <c:set var="appKey" value="app${sIndex}"/>
                    <c:set var="databaseKey" value="EtmDB${sIndex}"/>
                    <c:set var="serviceKey" value="client$${sIndex}"/>

                    <c:set var="rowClass" value="odd"/>
                    <c:if test="${sIndex % 2 == 0}">
                        <c:set var="rowClass" value="even"/>
                    </c:if>

                    <tr class="${rowClass}">
                        <td>${deviceInfo.databaseStatusMap[databaseKey].companyId}</td>
                        <td>${deviceInfo.databaseStatusMap[databaseKey].companyName}</td>
                            <%--<td>${deviceInfo.webappStatusMap['app0'].domainName}</td>--%>
                            <%--<td>${deviceInfo.webappStatusMap['app0'].expireDate}</td>--%>
                        <td>${deviceInfo.webappStatusMap[appKey].version}</td>
                        <td>${deviceInfo.webappStatusMap[appKey].dbVersion}</td>
                        <td>
                            <c:set var="itemStatus" value="${deviceInfo.webappStatusMap[appKey].status}"/>
                            <c:choose>
                                <c:when test="${itemStatus eq '运行中'}">
                                    <img src="/images/icon/Box_Green.png" style="max-width:15px;"/>
                                </c:when>
                                <c:otherwise>
                                    ${itemStatus}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${serviceKey}</td>
                        <td>808${sIndex}</td>
                        <td>
                            <c:set var="itemStatus" value="${deviceInfo.webserverStatusMap[serviceKey].status}"/>
                            <c:choose>
                                <c:when test="${itemStatus eq 'Stopped'}">
                                    <img src="/images/icon/Box_Green-inactive.png" style="max-width:15px;"/>
                                </c:when>
                                <c:when test="${itemStatus eq 'Running'}">
                                    <img src="/images/icon/Box_Green.png" style="max-width:15px;"/>
                                </c:when>
                                <c:otherwise>
                                    ${itemStatus}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${databaseKey}</td>
                        <td>${deviceInfo.databaseStatusMap[databaseKey].version}</td>
                        <td>${deviceInfo.databaseStatusMap[databaseKey].yunNo}</td>

                        <td>${deviceInfo.databaseStatusMap[databaseKey].createTime}</td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
</div>