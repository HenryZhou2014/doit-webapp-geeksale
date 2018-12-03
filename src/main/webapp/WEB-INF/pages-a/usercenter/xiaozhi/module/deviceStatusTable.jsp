<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<div id="serviceTableBlock">
    <div class="titleBar">
        <div>
            <label style="color:#ffffff;">服务信息</label>

        </div>
    </div>

    <div style="padding: 10px;">
        <div>
            <div class="fl">
                <a class="formButton" href="javascript:void(0);" onclick="serviceCommand('Start');" id="startServiceButton">启动</a>
                <a class="formButton" href="javascript:void(0);" onclick="serviceCommand('Stop');" id="stopServiceButton">停止</a>
                <a class="formButton" href="javascript:void(0);" onclick="serviceCommand('Restart');" id="restartServiceButton">重启</a>
                |
                <a class="formButton" href="javascript:void(0);" onclick="serviceCommand('DbYunNo');" id="yunNoButton">刷新云编号</a>
                |
                <a class="formButton" href="javascript:void(0);" onclick="serviceCommand('DbUpdate');" id="dbUpgradeButton">数据库升级</a>
                <a class="formButton" href="javascript:void(0);" onclick="serviceCommand('Webapp');" id="appUpgradeButton">应用更新</a>
            </div>

            <div class="fr">
                更新时间：<fmt:formatDate value="${deviceInfo.statusUpdateTime}" pattern="yyyy/MM/dd HH:mm:ss"/> <a class="formButton" href="javascript:void(0);" onclick="updateStatus();" id="statusButton">刷新</a>
            </div>
            <div class="clear"></div>
        </div>
        <div style="margin-top: 10px;">
            <table class="serviceTable" >
                <tr>
                    <th rowspan="2"><input type="checkbox" id="selectAll" onclick="selectAll();"/></th>
                    <th rowspan="2">客户ID</th>
                    <th rowspan="2">客户名称</th>
                    <th colspan="3">应用</th>
                    <th colspan="3">TOMCAT</th>
                    <th colspan="4">数据库</th>
                    <th rowspan="2">控制</th>
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
                        <td class="tc"><input type="checkbox" name="serviceItem" value="${sIndex}" id="${deviceInfo.deviceId}-${sIndex}"/></td>
                        <td>
                            <label for="${deviceInfo.deviceId}-${sIndex}">${deviceInfo.databaseStatusMap[databaseKey].companyId}</label>
                        </td>
                        <td>
                            <label for="${deviceInfo.deviceId}-${sIndex}">${deviceInfo.databaseStatusMap[databaseKey].companyName}</label>
                        </td>
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
                        <td>
                                ${deviceInfo.databaseStatusMap[databaseKey].yunNo}
                        </td>

                        <td>${deviceInfo.databaseStatusMap[databaseKey].createTime}</td>
                        <td>
                            <a class="formButton" href="javascript:void(0);" onclick="serviceCommand('Start', '${sIndex}');">启动</a>
                            <a class="formButton" href="javascript:void(0);" onclick="serviceCommand('Stop', '${sIndex}');">停止</a>
                            <a class="formButton" href="javascript:void(0);" onclick="serviceCommand('Restart', '${sIndex}');">重启</a>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
</div>