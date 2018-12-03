<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%--
  Created by IntelliJ IDEA.
  User: ben
  Date: 2015/1/14
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>系统部署、维护</title>
    <link rel="stylesheet" href="/scripts/jquery-ui-1.9.2.custom/development-bundle/themes/base/jquery.ui.all.css">
    <script src="/scripts/jquery-ui-1.9.2.custom/js/jquery-1.8.3.js"></script>
    <script src="/scripts/jquery-ui-1.9.2.custom/development-bundle/external/jquery.bgiframe-2.1.2.js"></script>
    <script src="/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.core.js"></script>
    <script src="/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.widget.js"></script>
    <script src="/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.mouse.js"></script>
    <script src="/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.draggable.js"></script>
    <script src="/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.position.js"></script>
    <script src="/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.resizable.js"></script>
    <script src="/scripts/jquery-ui-1.9.2.custom/development-bundle/ui/jquery.ui.dialog.js"></script>

    <script src="/scripts/jquery.json-2.4.js"></script>

    <style type="text/css">
        body {
            background: #EEEEEE;
            margin: 0;
            padding: 0;
            font-size: 12px;
        }

        .deviceInfo {
            width: 170px;
            margin: 5px;
            padding: 10px;
            background: lightgray;
        }

        .deviceStatus {
            width: 10px;
            height: 10px;
            background: green;
        }

        .appStatus {
            width: 10px;
            height: 10px;
            background: darkgray;
            margin: 3px;
        }

        .fl {
            float: left;
        }

        .fr {
            float: right;
        }

        .titleBar {
            background: #308F5A;
            padding: 5px;
            margin: 0 0 5px 0;
            font-weight: bold;
            color: #444;
        }

        .serviceTable {
            /*width:100%;*/
            font-size: 12px;
        }

        .serviceTable th, .serviceTable td {
            padding: 3px;
        }

        .serviceTable th {
            background: lightgray;
            font-weight: bolder;
        }

        .serviceTable tr.odd {
            background: lightgray;
        }

        .serviceTable tr.even {
        }

        .messageWindow{

            /*background: lightgray;*/

        }
        .tc{
            text-align: center;
        }
        .clear{
            clear: both;
        }

         .appBlock {
            font-size: 14px;
            margin: 1px;
            padding: 2px 0;
            border-radius: 5px;
            width: 95px;
            text-align: center;
        }

         .appBlock a{
             text-decoration: none;
             color: #444;
         }

         .activeApp {
            background: #94C07F;
            color: #44523E;
        }

         .inactiveApp {
            background: #D3D3D3;
            /*background: #94C07F;*/
            color: #44523E;
        }

        .odd .inactiveApp {
            background: #A9A9A9;
            /*background: #94C07F;*/
            color: #44523E;
        }

        .deviceMessageBlock{
            margin-top: 5px;
            background: lightgray;
        }

        .deviceMessageBlock .title{

        }

        .hidden{
            display: none;
            visibility: hidden;
        }

        .serviceTabs{

        }

        .serviceTabs li{
            list-style: none;
            float: left;
            margin-right: 5px;
            background: darkgray;
            padding: 5px 8px;
        }

        .serviceTabs li a{
            text-decoration: none;
            color: whitesmoke;
        }

        .serviceTabs li.active{
            background: #308F5A;
        }

        .servicePanel{
            min-height: 550px;
        }

        .serviceTable tr:hover{
            background: #BDCEAD;
        }

        .p1_serviceTable tr:hover{
            background: #BDCEAD;
        }

        .ui-tabs{

        }

        .ui-tabs li{
            list-style: none;
            float : left;
            margin-left: 5px;
        }

        .ui-tabs li a{
            color : #444;
            font-weight: bold;
            text-decoration: none;
            background: #CCCCCC;
            padding: 5px 10px;
        }

        .ui-tabs li a:hover{
            background: #5BA676;
        }

        .ui-tabs li.active a{
            background: #308F5A;
            color:#274E2A;
        }
    </style>
</head>
<body>

<jsp:include page="segments/header.jsp"/>

<div>

    <div style="width: 1300px; margin: 10px auto; background: #DEDEDE;">

        <div class="fl" style="width: 950px;">

            <div style="padding: 15px 10px;">

                <div style="margin-bottom: 5px;">
                    <form name="form1" id="form1" action="deploy/search" method="get">
                        服务器<input type="text" name="qMachineName" value="${qMachineName}"/>
                        客户<input type="text" name="qClientName" value="${qClientName}"/>
                        <input type="checkbox" value="1" id="noYunNo" name="qYunNo" <c:if test="${not empty qYunNo}"> checked="checked" </c:if> /> <label for="noYunNo">无云编号</label>
                        <input type="checkbox" value="1" id="dbUpdate" name="qDbUpgrade" <c:if test="${not empty qDbUpgrade}"> checked="checked" </c:if>/> <label for="dbUpdate">数据库需要升级</label>
                        <input type="submit" value="搜索" />
                    </form>
                </div>

                <div>
                    <ul class="ui-tabs">
                        <c:forEach begin="1" end="10" var="pageIndex">
                            <li <c:if test="${pageNum == pageIndex}">class="active"</c:if>> <a href="${ctx}/deploy?pageNum=${pageIndex}">组${pageIndex}</a></li>
                        </c:forEach>
                    </ul>
                </div>

                <div style="background: #DDDDDD; border-radius: 5px;margin-top: 5px;">

                    <div style="margin-top: 10px;">
                        <table class="serviceTable" width="100%">
                            <colgroup>
                                <col width="10px"/>
                                <col width="60px"/>
                                <col width="60px"/>
                                <col/>
                                <col />
                                <col width="60px"/>
                                <col width="30px"/>
                                <col width="80px"/>
                            </colgroup>
                            <tr>
                                <th>
                                    <input type="checkbox" id="selectAll" />
                                </th>
                                <th>
                                    机器
                                </th>
                                <th>
                                    IP
                                </th>
                                <th>
                                    &nbsp;
                                </th>
                                <th>
                                    服务状态
                                </th>
                                <th>
                                    客户端
                                </th>
                                <th>
                                    Rev
                                </th>
                                <th>
                                    状态时间
                                </th>
                            </tr>
                        <c:forEach items="${clientList}" var="item" varStatus="status">
                            <c:set var="rowClass" value="odd"/>
                            <c:if test="${status.index mod 2 == 0}">
                                <c:set var="rowClass" value="even"/>
                            </c:if>
                            <tr class="${rowClass}">
                                <td>
                                    <input type="checkbox" name="deviceItem" value="${item.deviceId}" id="deviceItem${status.index}"/>
                                </td>
                                <td>
                                    <label for="deviceItem${status.index}">
                                        <div>${item.machineName}</div>
                                    </label>
                                </td>
                                <td>
                                    <label for="deviceItem${status.index}">
                                        <div><a href="/deviceInfo/${item.deviceId}" target="_blank">${item.ip}</a></div>
                                    </label>
                                </td>
                                <td>
                                    <a href="javascript:void(0);" onclick="detailInfo('${item.deviceId}');"><img src="/images/icon/information_more_detail-128.png" style="max-width: 13px;"/></a>
                                </td>
                                <td>
                                    <div>
                                        <c:forEach begin="0" end="9" var="sindex">
                                            <c:set var="appClass" value="inactiveApp"/>
                                            <c:if test="${'1' eq item.status[sindex]}">
                                                <c:set var="appClass" value="activeApp"/>
                                            </c:if>
                                            <div class="appBlock fl ${appClass}">
                                                <c:if test="${not empty item.companyId[sindex]}">
                                                    <a href="javascript:void(0);" title="${item.companyName[sindex]}">${item.companyId[sindex]}</a>
                                                </c:if>
                                                <c:if test="${empty item.companyId[sindex]}">
                                                    <div>&nbsp;</div>
                                                </c:if>
                                                <div style="font-size: 12px;">
                                                    <div>[${item.webappStatuses[sindex].version}:${item.webappStatuses[sindex].dbVersion}]</div>
                                                    <div>[${item.databaseStatuses[sindex].yunNo}:${item.databaseStatuses[sindex].version}]</div>
                                                </div>
                                            </div>
                                            <c:if test="${(sindex + 1) % 5 == 0}">
                                                <div class="clear"></div>
                                            </c:if>
                                        </c:forEach>
                                        <div class="clear"></div>
                                    </div>
                                </td>
                            <td>
                                ${item.clientVersion}
                            </td>
                            <td>
                                    ${item.svnRevision}
                            </td>
                                <td>
                                    <fmt:formatDate value="${item.statusUpdateTime}" pattern="yyyy/MM/dd HH:mm:ss"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="fr" style="width: 350px; background: #cccccc;">
            <div>
                <ul class="serviceTabs">
                    <li class="active"><a href="javascript:void(0);">EtmBase</a></li>
                    <li><a href="javascript:void(0);">房友webapp</a></li>
                    <li><a href="javascript:void(0);">Tomcat</a></li>
                    <li><a href="javascript:void(0);">环境安装</a></li>
                </ul>
                <div class="clear"></div>
            </div>

            <div class="servicePanel">
                <div class="titleBar">
                    <div style="color: white;">EtmBase更新</div>
                </div>
                <div style="padding-left: 15px;">

                    <div>
                        <ul style="list-style:none;">
                            <li><input type="checkbox" checked="checked" name="serviceItemEtmBase" value="Latest" id="s1"/><label for="s1">从服务器上获取最新的文件</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItemEtmBase" value="EtmBase" id="a21"/><label for="a2">更新EtmBase</label></li>
                        </ul>
                    </div>

                    <div style="margin: 10px 0;">
                        <security:authorize ifAnyGranted="ROLE_ADMIN">
                            <input type="button" value="执行" id="ButtonCommandEtmBase"/>
                        </security:authorize>
                        <security:authorize ifNotGranted="ROLE_ADMIN">
                            <input type="button" value="执行" onclick="alert('仅限管理员身份操作！');"/>
                        </security:authorize>
                    </div>
                </div>
            </div>

            <div class="servicePanel">
                <div class="titleBar">
                    <div style="color: white;">应用更新</div>
                </div>
                <div style="padding-left: 15px;">

                    <div>
                        <div>客户</div>
                        <div style="margin-left: 40px;">
                            <input type="checkbox" id="clientAllWebapp" checked="checked" /><label for="clientAllWebapp">全部</label>
                            <div class="clear"></div>
                            <input type="checkbox" value="0" name="updateClientWebapp" id="aclient0" checked="checked"/><label for="aclient0">客户0</label>
                            <input type="checkbox" value="1" name="updateClientWebapp" id="aclient1" checked="checked"/><label for="aclient1">客户1</label>
                            <input type="checkbox" value="2" name="updateClientWebapp" id="aclient2" checked="checked"/><label for="aclient2">客户2</label>
                            <input type="checkbox" value="3" name="updateClientWebapp" id="aclient3" checked="checked"/><label for="aclient3">客户3</label>
                            <input type="checkbox" value="4" name="updateClientWebapp" id="aclient4" checked="checked"/><label for="aclient4">客户4</label>
                            <div class="clear"></div>
                            <input type="checkbox" value="5" name="updateClientWebapp" id="aclient5" checked="checked"/><label for="aclient5">客户5</label>
                            <input type="checkbox" value="6" name="updateClientWebapp" id="aclient6" checked="checked"/><label for="aclient6">客户6</label>
                            <input type="checkbox" value="7" name="updateClientWebapp" id="aclient7" checked="checked"/><label for="aclient7">客户7</label>
                            <input type="checkbox" value="8" name="updateClientWebapp" id="aclient8" checked="checked"/><label for="aclient8">客户8</label>
                            <input type="checkbox" value="9" name="updateClientWebapp" id="aclient9" checked="checked"/><label for="aclient9">客户9</label>
                        </div>
                    </div>

                    <div>
                        <div>安装内容</div>
                        <ul style="list-style:none;">
                            <li><input type="checkbox" checked="checked" id="a1lServiceWebapp"/><label for="a1lServiceWebapp">全部</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItemWebapp" value="Latest" id="bs1"/><label for="bs1">从服务器上获取最新的文件</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItemWebapp" value="Webapp" id="b42"/><label for="b42">更新房友WEBAPP</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItemWebapp" value="WebConfig" id="ba5"/><label for="ba5">更新房友WEBAPP配置文件</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItemWebapp" value="DbUpdate" id="ba6"/><label for="ba6">房友WEBAPP数据库升级</label></li>
                        </ul>
                    </div>

                    <div style="margin: 10px 0;">
                        <security:authorize ifAnyGranted="ROLE_ADMIN">
                            <input type="button" value="执行" id="ButtonCommandWebapp"/>
                        </security:authorize>
                        <security:authorize ifNotGranted="ROLE_ADMIN">
                            <input type="button" value="执行" onclick="alert('仅限管理员身份操作！');"/>
                        </security:authorize>
                    </div>
                </div>
            </div>

            <div class="servicePanel">
                <div class="titleBar">
                    <div style="color: white;">服务更新</div>
                </div>
                <div style="padding-left: 15px;">

                    <div>
                        <div>客户</div>
                        <div style="margin-left: 40px;">
                            <input type="checkbox" id="clientAllService" checked="checked" /><label for="clientAllService">全部</label>
                            <div class="clear"></div>
                            <input type="checkbox" value="0" name="updateClientService" id="client0Service" checked="checked"/><label for="client0Service">客户0</label>
                            <input type="checkbox" value="1" name="updateClientService" id="client1Service" checked="checked"/><label for="client1Service">客户1</label>
                            <input type="checkbox" value="2" name="updateClientService" id="client2Service" checked="checked"/><label for="client2Service">客户2</label>
                            <input type="checkbox" value="3" name="updateClientService" id="client3Service" checked="checked"/><label for="client3Service">客户3</label>
                            <input type="checkbox" value="4" name="updateClientService" id="client4Service" checked="checked"/><label for="client4Service">客户4</label>
                            <div class="clear"></div>
                            <input type="checkbox" value="5" name="updateClientService" id="client5Service" checked="checked"/><label for="client5Service">客户5</label>
                            <input type="checkbox" value="6" name="updateClientService" id="client6Service" checked="checked"/><label for="client6Service">客户6</label>
                            <input type="checkbox" value="7" name="updateClientService" id="client7Service" checked="checked"/><label for="client7Service">客户7</label>
                            <input type="checkbox" value="8" name="updateClientService" id="client8Service" checked="checked"/><label for="client8Service">客户8</label>
                            <input type="checkbox" value="9" name="updateClientService" id="client9Service" checked="checked"/><label for="client9Service">客户9</label>
                        </div>
                    </div>

                    <div>
                        <ul style="list-style:none;">
                            <li><input type="checkbox" checked="checked" name="serviceItemService" value="Latest" id="a1Service"/><label for="a1Service">从服务器上获取最新的文件</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItemService" value="Tomcat" id="a2Service"/><label for="a2Service">更新Tomcat</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItemService" value="WebConfig" id="a3Service"/><label for="a3Service">更新房友WEBAPP配置文件</label></li>
                        </ul>
                    </div>

                    <div style="margin: 10px 0;">
                        <security:authorize ifAnyGranted="ROLE_ADMIN">
                            <input type="button" value="执行" id="ButtonCommandService"/>
                        </security:authorize>
                        <security:authorize ifNotGranted="ROLE_ADMIN">
                            <input type="button" value="执行" onclick="alert('仅限管理员身份操作！');"/>
                        </security:authorize>
                    </div>
                </div>
            </div>

            <div class="servicePanel">
                <div class="titleBar">
                    <div style="color: white;">部署选项</div>
                </div>
                <div style="padding-left: 15px;">
                    <div>
                        <div>安装模式</div>
                        <div style="margin-left: 40px;">
                            <input type="radio" name="updateMode" value="update" id="b1" checked="checked"/><label for="b1">更新</label>
                            <input type="radio" name="updateMode" value="rewrite" id="b2"/><label for="b2">重写</label>
                            <input type="radio" name="updateMode" value="strict" id="b3"/><label for="b3">完全同步</label>
                        </div>
                    </div>
                    <div>
                        <div>客户</div>
                        <div style="margin-left: 40px;">
                            <input type="checkbox" id="clientAll" checked="checked" /><label for="clientAll">全部</label>
                            <div class="clear"></div>
                            <input type="checkbox" value="0" name="updateClient" id="client0" checked="checked"/><label for="client0">客户0</label>
                            <input type="checkbox" value="1" name="updateClient" id="client1" checked="checked"/><label for="client1">客户1</label>
                            <input type="checkbox" value="2" name="updateClient" id="client2" checked="checked"/><label for="client2">客户2</label>
                            <input type="checkbox" value="3" name="updateClient" id="client3" checked="checked"/><label for="client3">客户3</label>
                            <input type="checkbox" value="4" name="updateClient" id="client4" checked="checked"/><label for="client4">客户4</label>
                            <div class="clear"></div>
                            <input type="checkbox" value="5" name="updateClient" id="client5" checked="checked"/><label for="client5">客户5</label>
                            <input type="checkbox" value="6" name="updateClient" id="client6" checked="checked"/><label for="client6">客户6</label>
                            <input type="checkbox" value="7" name="updateClient" id="client7" checked="checked"/><label for="client7">客户7</label>
                            <input type="checkbox" value="8" name="updateClient" id="client8" checked="checked"/><label for="client8">客户8</label>
                            <input type="checkbox" value="9" name="updateClient" id="client9" checked="checked"/><label for="client9">客户9</label>
                        </div>
                    </div>
                    <div>
                        <div>安装内容</div>
                        <ul style="list-style:none;">
                            <li><input type="checkbox" checked="checked" id="a1lService"/><label for="a1lService">全部</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="Latest" id="a1"/><label for="a1">从服务器上获取最新的文件</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="EtmBase" id="a2"/><label for="a2">安装或更新EtmBase</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="Tomcat" id="a3"/><label for="a3">安装或更新Tomcat</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="Webapp" id="a4"/><label for="a4">安装或更新房友WEBAPP</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="WebConfig" id="a5"/><label for="a5">更新TOMCAT和房友WEBAPP配置文件</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="DbConnect" id="a6"/><label for="a6">数据库连接测试</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="DbDirectory" id="a7"/><label for="a7">准备数据库目录结构</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="DbNew" id="a8"/><label for="a8">创建空白数据库(数据库已存在则略过)</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="DbImport" id="a9"/><label for="a9">导入样例数据库(已导入过的略过)</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="DbYunNo" id="a10"/><label for="a10">更新数据库编号设置</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="TomcatService" id="a11"/><label for="a11">TOMCAT服务安装</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="TomcatShortcut" id="a12"/><label for="a12">创建TOMCAT服务管理快捷方式</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="StartTomcatService" id="a13"/><label for="a13">启动TOMCAT服务</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="WebappTest" id="a14"/><label for="a14">WEBAPP启动测试</label></li>
                        </ul>
                    </div>

                    <div style="margin: 10px 0;">
                        <security:authorize ifAnyGranted="ROLE_ADMIN">
                            <input type="button" value="执行" id="ButtonCommand"/>
                        </security:authorize>
                        <security:authorize ifNotGranted="ROLE_ADMIN">
                            <input type="button" value="执行" onclick="alert('仅限管理员身份操作！');"/>
                        </security:authorize>
                    </div>
                </div>
            </div>

            <div style="text-align: right; padding: 10px 20px;">
                <a href="javascript:void(0);" id="messageBoxId">显示详细信息</a>
            </div>

            <div class="hidden">
                <div id="dialog" title="服务消息">
                    <div class="messageWindow">
                        <div class="messageWrapper">

                        </div>
                    </div>
                </div>
            </div>

            <div class="hidden">
                <div id="dialog-message" title="提示" >

                    <p id="messageContent">

                    </p>
                </div>
            </div>

            <div class="hidden">
                <div id="client-profile" title="详细信息" style="max-height: 500px;">
                    <div id="clientContent">

                    </div>
                </div>
            </div>

        </div>

        <div class="clear"></div>
    </div>
</div>
</body>
</html>

<script type="text/javascript">
    var m_socket;

//    var url = "ws://localhost:8081/websocket/command";
    var url = "${WebsocketCommandUrl}";

    var jobIds = [];

    var identity = "id:" + Math.floor(Math.random() * 9000);

    $(document).ready(function () {



        $("#messageBoxId").click(function(){
            $( "#dialog" ).dialog({
                modal: true,
                width: 700,
                height: 450,
                position: ["center", 200],
                buttons: {
                    Ok: function() {
                        $( this ).dialog( "close" );
                    }
                }
            });
        });

        $("#selectAll").bind("click", function(){
            var checked = ("checked" == $("#selectAll").attr("checked"));
            $("input[name='deviceItem']").attr("checked", checked);
        });

        $("#clientAll").bind("click", function(){
            var checked = ("checked" == $("#clientAll").attr("checked"));
            console.log("status=" + checked);
            $("input[name='updateClient']").attr("checked", checked);
        });

        $("#clientAllWebapp").bind("click", function(){
            var checked = ("checked" == $("#clientAllWebapp").attr("checked"));
            console.log("status=" + checked);
            $("input[name='updateClientWebapp']").attr("checked", checked);
        });

        $("#clientAllService").bind("click", function(){
            var checked = ("checked" == $("#clientAllService").attr("checked"));
            console.log("status=" + checked);
            $("input[name='updateClientService']").attr("checked", checked);
        });

        $("#a1lService").bind("click", function(){
            var checked = ("checked" == $("#a1lService").attr("checked"));
            console.log("status=" + checked);
            $("input[name='serviceItem']").attr("checked", checked);
        });

        $("#ButtonCommandEtmBase").bind("click", function(){
            var clientIds = [];
            var updateClients = [];
            var updateServices = [];

            $("input[name='deviceItem']:checked").each(function(index, element){
                clientIds[index] = $(element).val();
            });

            if (clientIds.length == 0){
                showAlertMessage("请选择目标服务器！");
                return;
            }

            $("input[name='serviceItemEtmBase']:checked").each(function(index, element){
                console.log("updateServices[" + index + "] checked");
                updateServices[index] = $(element).val();
            });
            console.log("clientIds = " + clientIds.join(","));
            console.log("updateClient = " + updateClients.join(","));
            console.log("updateServices = " + updateServices.join(","));

            var params = {clientId: clientIds, action: "Command", command: "Install", mode: "1", updateClients: updateClients, updateServices: updateServices};
            $.ajax({
                url: "/command",
                data: $.param(params, true),
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data){

                        $(".messageWrapper").empty();

                        jobIds[jobIds.length + 1] = data.JobId;

                        for(var i=0; i<clientIds.length; i++){
                            var id = clientIds[i];

                            var newBlock = $("<div class='deviceMessageBlock' id='"+id+"'><div>" + id + "</div></div>")
                            $(".messageWrapper").append(newBlock);
                        }

                        showAlertMessage("已发送请求，等待返回结果！");
                    }
                }
            });

        });

        $("#ButtonCommandWebapp").bind("click", function () {
            var clientIds = [];
            var updateClients = [];
            var updateServices = [];

            $("input[name='deviceItem']:checked").each(function(index, element){
                clientIds[index] = $(element).val();
            });

            if (clientIds.length == 0){
                showAlertMessage("请选择目标服务器！");
                return;
            }

            $("input[name='updateClientWebapp']:checked").each(function(index, element){
                console.log("updateClient[" + index + "] checked");
                updateClients[index] = $(element).val();
            });

            $("input[name='serviceItemWebapp']:checked").each(function(index, element){
                console.log("updateServices[" + index + "] checked");
                updateServices[index] = $(element).val();
            });
            console.log("clientIds = " + clientIds.join(","));
            console.log("updateClient = " + updateClients.join(","));
            console.log("updateServices = " + updateServices.join(","));

            var params = {clientId: clientIds, action: "Command", command: "Install", mode: "1", updateClients: updateClients, updateServices: updateServices};
            $.ajax({
                url: "/command",
                data: $.param(params, true),
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data){

                        $(".messageWrapper").empty();

                        jobIds[jobIds.length + 1] = data.JobId;

                        for(var i=0; i<clientIds.length; i++){
                            var id = clientIds[i];

                            var newBlock = $("<div class='deviceMessageBlock' id='"+id+"'><div>" + id + "</div></div>")
                            $(".messageWrapper").append(newBlock);
                        }

                        showAlertMessage("已发送请求，等待返回结果！");
                    }
                }
            });
        });

        $("#ButtonCommandService").bind("click", function () {
            var clientIds = [];
            var updateClients = [];
            var updateServices = [];

            $("input[name='deviceItem']:checked").each(function(index, element){
                clientIds[index] = $(element).val();
            });

            if (clientIds.length == 0){
                showAlertMessage("请选择目标服务器！");
                return;
            }

            $("input[name='updateClientService']:checked").each(function(index, element){
                console.log("updateClient[" + index + "] checked");
                updateClients[index] = $(element).val();
            });

            $("input[name='serviceItemService']:checked").each(function(index, element){
                console.log("updateServices[" + index + "] checked");
                updateServices[index] = $(element).val();
            });
            console.log("clientIds = " + clientIds.join(","));
            console.log("updateClient = " + updateClients.join(","));
            console.log("updateServices = " + updateServices.join(","));

            var params = {clientId: clientIds, action: "Command", command: "Install", mode: "1", updateClients: updateClients, updateServices: updateServices};
            $.ajax({
                url: "/command",
                data: $.param(params, true),
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data){

                        $(".messageWrapper").empty();

                        jobIds[jobIds.length + 1] = data.JobId;

                        for(var i=0; i<clientIds.length; i++){
                            var id = clientIds[i];

                            var newBlock = $("<div class='deviceMessageBlock' id='"+id+"'><div>" + id + "</div></div>")
                            $(".messageWrapper").append(newBlock);
                        }

                        showAlertMessage("已发送请求，等待返回结果！");
                    }
                }
            });
        });

        $("#ButtonCommand").bind("click", function () {
            var clientIds = [];
            var updateClients = [];
            var updateServices = [];

            $("input[name='deviceItem']:checked").each(function(index, element){
                clientIds[index] = $(element).val();
            });

            if (clientIds.length == 0){
                showAlertMessage("请选择目标服务器！");
                return;
            }

            $("input[name='updateClient']:checked").each(function(index, element){
               console.log("updateClient[" + index + "] checked");
                updateClients[index] = $(element).val();
            });

            $("input[name='serviceItem']:checked").each(function(index, element){
                console.log("updateServices[" + index + "] checked");
                updateServices[index] = $(element).val();
            });
            console.log("clientIds = " + clientIds.join(","));
            console.log("updateClient = " + updateClients.join(","));
            console.log("updateServices = " + updateServices.join(","));

            var params = {clientId: clientIds, action: "Command", command: "Install", mode: "1", updateClients: updateClients, updateServices: updateServices};
            $.ajax({
                url: "/command",
                data: $.param(params, true),
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data){

                        $(".messageWrapper").empty();

                        jobIds[jobIds.length + 1] = data.JobId;

                        for(var i=0; i<clientIds.length; i++){
                            var id = clientIds[i];

                            var newBlock = $("<div class='deviceMessageBlock' id='"+id+"'><div>" + id + "</div></div>")
                            $(".messageWrapper").append(newBlock);
                        }

                        showAlertMessage("已发送请求，等待返回结果！");
                    }
                }
            });
        });

        $("#statusButton").bind("click", function(){
            var params = {clientId:"${deviceInfo.deviceId}", action: "Command", command: "Environment"};

            $.ajax({
                url: "/environment",
                data: $.param(params, true),
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data){
                        for(var i=0; i<data.length;i++){
                            var jobItem = data[i];
                            jobIds[jobIds.length + 1] = jobItem.JobId;

                            var newRequest = $("<div>" + JSON.stringify(jobItem) + "</div>");
                            $(".messageWrapper").append(newRequest);
                        }

                        showAlertMessage("已发送请求，等待返回结果！");
                    }
                }
            });
        });

        if (window.WebSocket) {
            m_socket = new WebSocket(url);
            m_socket.onopen = function () {
                log("onopen>连接已打开!");
                // 发送身份认证
            };

            m_socket.onmessage = function (evt) {
                console.log('Retrieved data from server: ' + evt.data);
//                alert(evt.data);
                var eventObj = $.parseJSON(evt.data);
                var deviceId = eventObj.DeviceId;
                var refJobId = eventObj.RefJobId;
                var JobId = eventObj.JobId;
                var Message = eventObj.Message;
                var action = eventObj.Action;

                if ( $(document.getElementById(deviceId)).length > 0 ) {
                    var newRequest = $("<div>" + Message + "</div>");
                    $(document.getElementById(deviceId)).append(newRequest);
                }
                else{
                    var newRequest = $("<div>" + Message + "</div>");
                    $(".messageWrapper").append(newRequest);
                }
                console.log("jobIds:" + jobIds);
                for(var i=0; i<jobIds.length; i++){
                    console.log("jobid=" + refJobId + " | jobId=" + jobIds[i] + " action=" + action);
                    if (refJobId == jobIds[i] && "Finish" == action){

                        showAlertMessage(deviceId + ":执行完毕，状态已更新！");

                        break;
                    }
                }

//                showAlertMessage((deviceId == undefined ? "" : deviceId) + "状态已更新！")
            };

            m_socket.onerror = function (e) {
                log("无法连接，请查连接地址与端口号！");
            };
            m_socket.onclose = function (e) {
                log("连接被关闭");
            };
            //var eventHelp = new EventHelp(m_socket);
        } else {
            log("浏览器不支持websocket!");
        }

        $(".serviceTabs li a").each(function(index, element){

            $(element).bind("click", function(){

                $(".serviceTabs li").removeClass("active");
                $(".serviceTabs li").eq(index).addClass("active");

                $(".servicePanel").each(function(panelIndex, element){
                    if(index != panelIndex){
                        $(element).addClass("hidden");
                    }
                });

                $(".servicePanel").eq(index).removeClass("hidden");
            });
        });

        $(".servicePanel").each(function(index, element){
            if(index > 0){
                $(element).addClass("hidden");
            }
        });
    });

    function log(message) {
        console.log(message);
    }

    function sendMessage() {
        var text = $("#messageText").val();
        if (m_socket) {
            var tapObj = {"command": "Input", "value": text};
            var json = $.toJSON(tapObj);
            log("command: " + json);
            m_socket.send(json);
        }
    }

    function showAlertMessage(msg){
        var msgDiv = "<div>"+msg+"</div>";

        $("#messageContent").append(msgDiv);

        $( "#dialog-message" ).dialog({
            modal: true,
            width: 450,
            position:["center", 200],
            buttons: {
                Ok: function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }

    function appendMessage(msg){
        var newRequest = $("<div>" + msg + "</div>");
        $(".messageWrapper").append(newRequest);
    }

    function detailInfo(clientId){

        $("#clientContent").load("/deviceInfo/profileInfo/" + clientId, {limit: 25}, function(){

            $( "#client-profile" ).dialog({
                modal: false,
                width : 1100,
                height: 650,
                position:["center", 100],
                buttons: {
                    Ok: function() {
                        $( this ).dialog( "close" );
                    }
                }
            });

        });


    }
</script>
