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
            font-size: 8px;
            margin: 1px;
            padding: 2px;
            border-radius: 5px;
            width: 35px;
            text-align: center;
        }

         .activeApp {
            background: #94C07F;
            color: #44523E;
        }

         .inactiveApp {
            background: lightgray;
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

        .serviceTable tr:hover{
            background: #BDCEAD;
        }

        .p1_serviceTable tr:hover{
            background: #BDCEAD;
        }
    </style>
</head>
<body>

<jsp:include page="segments/header.jsp"/>

<div>

    <div style="width: 1300px; margin: 10px auto; background: #DEDEDE;">

        <div class="fl" style="width: 1000px;">
            <div style="padding: 15px 20px;">
                <div style="font-weight: bold; color: #666;">
                    目标服务器
                </div>

                <div style="background: #DDDDDD; border-radius: 5px;padding: 10px; margin-top: 5px;">

                    <div style="width: 970px; overflow-x: auto; margin-top: 10px;">

                        <div style="margin-bottom: 5px;">
                            <form name="form1" id="form1" action="updateWebapps" method="get">
                                服务器<input type="text" name="qMachineName" value="${qMachineName}"/>
                                客户<input type="text" name="qClientName" value="${qClientName}"/>
                                <input type="checkbox" value="1" id="noYunNo" name="qYunNo" /> <label for="noYunNo">无云编号</label>
                                <input type="checkbox" value="1" id="dbUpdate" name="qDbUpgrade" /> <label for="dbUpdate">数据库需要升级</label>
                                <input type="button" value="搜索" />
                            </form>
                        </div>

                        <table class="serviceTable" width="100%">
                            <colgroup>
                                <col/>
                                <col/>
                                <col/>
                                <col/>
                                <col/>
                                <col/>
                            </colgroup>
                            <tr>
                                <th rowspan="2">
                                    <input type="checkbox" id="selectAll" />
                                </th>
                                <th rowspan="2">
                                    #
                                </th>
                                <th rowspan="2">
                                    客户ID
                                </th>
                                <th rowspan="2">
                                    客户名
                                </th>
                                <th rowspan="2">
                                    服务器
                                </th>
                                <th rowspan="2">
                                    IP
                                </th>
                                <th rowspan="2">
                                    状态时间
                                </th>
                                <th rowspan="2">
                                    Revision
                                </th>
                                <th colspan="3">
                                    应用
                                </th>
                                <th colspan="2">
                                    tomcat
                                </th>
                                <th colspan="3">
                                    数据库
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    版本
                                </th>
                                <th>
                                    数据库版本
                                </th>
                                <th>
                                    状态
                                </th>
                                <th>
                                    服务名称
                                </th>
                                <th>
                                    状态
                                </th>
                                <th>
                                    数据库名称
                                </th>
                                <th>
                                    版本
                                </th>
                                <th>
                                    云编号
                                </th>
                            </tr>
                        <c:forEach items="${clientList}" var="item" varStatus="status">

                            <c:forEach begin="0" end="9" var="sindex">
                                <c:set var="appClass" value="inactiveApp"/>
                                <c:if test="${'1' eq item.status[sindex]}">
                                    <c:set var="appClass" value="activeApp"/>
                                </c:if>

                                <c:set var="rowClass" value="odd"/>
                                <c:if test="${status.index mod 2 == 0}">
                                    <c:set var="rowClass" value="even"/>
                                </c:if>
                                <tr class="${rowClass}">
                                    <td>
                                        <input type="checkbox" name="deviceItem" value="${item.deviceId}" id="deviceItem-${item.deviceId}-${sindex}" group="${item.deviceId}"/>
                                    </td>
                                    <td>
                                        ${status.index * 10 + 1 + sindex}
                                    </td>
                                    <td>
                                        <div>
                                            <label for="deviceItem-${item.deviceId}-${sindex}">
                                                    ${item.companyId[sindex]}&nbsp;
                                            </label>
                                        </div>
                                    </td>
                                    <td>
                                        <div>${item.companyName[sindex]}&nbsp;</div>
                                    </td>
                                    <td>
                                        <label onclick="selectGroup('${item.deviceId}');">
                                            <div>${item.machineName}</div>
                                        </label>
                                    </td>
                                    <td>
                                        <label onclick="selectGroup('${item.deviceId}');">
                                            <div>${item.ip}</div>
                                        </label>
                                    </td>
                                    <td>
                                        <div><fmt:formatDate value="${item.statusUpdateTime}" pattern="yyyy/MM/dd"/></div>
                                        <div><fmt:formatDate value="${item.statusUpdateTime}" pattern="HH:mm:ss"/></div>
                                    </td>
                                    <td>
                                        <div>${item.svnRevision}&nbsp;</div>
                                    </td>
                                    <td>
                                        <div>${item.webappStatuses[sindex].version}&nbsp;</div>
                                    </td>
                                    <td>
                                        <div>${item.webappStatuses[sindex].dbVersion}&nbsp;</div>
                                    </td>
                                    <td>
                                        <div>
                                            <c:set var="itemStatus" value="${item.webappStatuses[sindex].status}"/>
                                            <c:choose>
                                                <c:when test="${itemStatus eq '运行中'}">
                                                    <img src="/images/icon/Box_Green.png" style="max-width:15px;"/>
                                                </c:when>
                                                <c:otherwise>
                                                    ${itemStatus}
                                                </c:otherwise>
                                            </c:choose>
                                            &nbsp;
                                        </div>
                                    </td>
                                    <td>
                                        <div>${item.webserverStatuses[sindex].serviceName}&nbsp;</div>
                                    </td>
                                    <td>
                                        <div>
                                            <c:set var="itemStatus" value="${item.webserverStatuses[sindex].status}"/>
                                            <c:choose>
                                                <c:when test="${itemStatus eq 'Running'}">
                                                    <img src="/images/icon/Box_Green.png" style="max-width:15px;"/>
                                                </c:when>
                                                <c:when test="${itemStatus eq 'Stopped'}">
                                                    <img src="/images/icon/Box_Red.png" style="max-width:15px;"/>
                                                </c:when>
                                                <c:otherwise>
                                                    ${itemStatus}
                                                </c:otherwise>
                                            </c:choose>
                                            &nbsp;
                                            &nbsp;</div>
                                    </td>
                                    <td>
                                        <div>${item.databaseStatuses[sindex].databaseName}&nbsp;</div>
                                    </td>
                                    <td>
                                        <div>${item.databaseStatuses[sindex].version}&nbsp;</div>
                                    </td>
                                    <td>
                                        <div>${item.databaseStatuses[sindex].yunNo}&nbsp;</div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="fr" style="width: 250px; background: #cccccc;">
            <div>
                <div class="titleBar">
                    <div style="color: white;">维护操作</div>
                </div>
                <div style="padding-left: 15px;">

                    <div>
                        <div>维护内容</div>
                        <ul style="list-style:none;">
                            <li><input type="checkbox" checked="checked" id="a1lService"/><label for="a1lService">全部</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="Webapp" id="a4"/><label for="a4">房友WEBAPP更新</label></li>
                            <li><input type="checkbox" checked="checked" name="serviceItem" value="DbConnect" id="a6"/><label for="a6">数据库升级</label></li>
                            <li><input type="checkbox" checked="checked" name="yunNoItem" value="DbConnect" id="a7"/><label for="a7">更新云编号</label></li>
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

            <div>
                <div class="titleBar">
                    <div style="color: white;">服务控制</div>
                </div>
                <div style="padding-left: 15px;">

                    <div style="margin: 10px 0;">
                        <security:authorize ifAnyGranted="ROLE_ADMIN">
                            <input type="button" value="启动" id="ButtonStartServiceCommand"/>
                            <input type="button" value="停止" id="ButtonStopServiceCommand"/>
                            <input type="button" value="重启" id="ButtonRestartServiceCommand"/>
                        </security:authorize>
                        <security:authorize ifNotGranted="ROLE_ADMIN">
                            <input type="button" value="启动" onclick="alert('仅限管理员身份操作！');"/>
                            <input type="button" value="停止" onclick="alert('仅限管理员身份操作！');"/>
                            <input type="button" value="重启" onclick="alert('仅限管理员身份操作！');"/>
                        </security:authorize>
                    </div>
                </div>
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

    var identity = "id:" + Math.floor(Math.random() * 9000);

    $(document).ready(function () {

        $("#selectAll").bind("click", function(){
            var checked = ("checked" == $("#selectAll").attr("checked"));
            $("input[name='deviceItem']").attr("checked", checked);
        });

        $("#clientAll").bind("click", function(){
            var checked = ("checked" == $("#clientAll").attr("checked"));
            console.log("status=" + checked);
            $("input[name='updateClient']").attr("checked", checked);
        });

        $("#a1lService").bind("click", function(){
            var checked = ("checked" == $("#a1lService").attr("checked"));
            console.log("status=" + checked);
            $("input[name='serviceItem']").attr("checked", checked);
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
                        var newRequest = $("<div>" + JSON.stringify(data) + "</div>");
                        $(".messageWrapper").append(newRequest);

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

                if ( $(document.getElementById(deviceId)).length > 0 ) {
                    var newRequest = $("<div>" + Message + "</div>");
                    $(document.getElementById(deviceId)).append(newRequest);
                }
                else{
                    var newRequest = $("<div>" + Message + "</div>");
                    $(".messageWrapper").append(newRequest);
                }

                showAlertMessage((deviceId == undefined ? "" : deviceId) + "状态已更新！")
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
    });

    function log(message) {
        console.log(message);
    }

    function selectGroup(groupName){
        $("input[name='deviceItem'][group='" + groupName + "']").each(function(index, element){
            var check = $(element).attr("checked");
            $(element).attr("checked", !check);
        });
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
        $("#messageContent").html(msg);
        $( "#dialog-message" ).dialog({
            modal: true,
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

</script>
