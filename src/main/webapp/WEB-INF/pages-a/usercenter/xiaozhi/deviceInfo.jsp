<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%--
  Created by IntelliJ IDEA.
  User: ben
  Date: 2015/1/14
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title></title>
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
    <script src="/scripts/jquery.alerts.js"></script>

    <style type="text/css">
        body {
            font-size: 12px;
            font-family: "雅黑";
            background: #EEEEEE;
            margin: 0;
            padding: 0;
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

        .clear {
            clear: both;
        }

        .titleBar {
            background: #308F5A;
            padding: 5px;
            margin: 15px 0 5px 0;
            font-weight: bold;
            color: #444;
        }

        .serviceTable {
            width:100%;
        }

        .serviceTable th, .serviceTable td {
            padding: 3px;
        }

        .serviceTable th {
            background: lightgray;
            font-weight: bolder;
            font-size: 12px;
        }

        .serviceTable td{
            font-size: 12px;
        }

        .serviceTable tr.odd {
            background: lightgray;
        }

        .serviceTable tr.even {
        }

        .serviceTable tr:hover{
            background: #BDCEAD;
        }

        .p1_serviceTable tr:hover{
            background: #BDCEAD;
        }

        .messageWindow{

            background: lightgray;

        }
        .tc{
            text-align: center;
        }

        .hidden{
            display: none;
            visibility: hidden;
        }

        .ui-dialog-title{
            font-size: 12px;
        }

        .formButton{
            text-decoration: none;
            background: #B8B8B8;
            color:#246B44;
            font-size: 12px;
            padding: 2px 10px;
            border-radius: 5px;
        }

        .formButton:hover{
            background: #246B44;
            color:white;
        }

        .normalButton{
            text-decoration: none;
            background: #308F5A;
            color:white;
            font-size: 14px;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .normalButton:hover{
            background: #246B44;
        }

        .highlightRow{
            background: yellow;
        }
    </style>
</head>
<body>

<jsp:include page="segments/header.jsp"/>

<div>

    <div style="width: 1300px; margin: 15px auto; background: #DEDEDE; border-radius: 5px;">
        <div style="padding: 15px;">
        <div class="titleBar">
            <div>
                <label style="color:#ffffff;">设备信息</label>
            </div>
        </div>
            <div style="margin-left: 10px;">
                <div style="padding:5px;">
                    <label style="width: 80px; display: inline-block; text-align: right;">机器名：</label>${deviceInfo.machineName}
                </div>
                <div style="padding:5px;">
                    <label style="width: 80px; display: inline-block; text-align: right;">IP地址：</label>${deviceInfo.ip}
                </div>
                <div style="padding:5px;">
                    <label style="width: 80px; display: inline-block; text-align: right;">客户端版本：</label>${deviceInfo.clientVersion}
                </div>
                <div style="padding:5px;">
                    <label style="width: 80px; display: inline-block; text-align: right;">Revision：</label>${deviceInfo.svnRevision}
                </div>
            </div>
        <hr/>

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

    <div style="text-align: center; width: 1300px; margin: 15px auto;">
        <a class="normalButton" href="/index">返回</a>

        <a class="normalButton" href="javascript:window.opener=null;window.open('','_self');window.close();">关闭窗口</a>
        <div class="fr">
            <a class="normalButton" href="javascript:void(0);" id="showMessageDetailButton">显示消息内容</a>
        </div>
    </div>
</div>
</body>
</html>

<script type="text/javascript">
    var m_socket;

    var jobIds = [];

//    var url = "ws://localhost:8081/websocket/command";
    var url = "${WebsocketCommandUrl}";

    var identity = "id:" + Math.floor(Math.random() * 9000);

    $(document).ready(function () {

        /*$(".serviceTable tr").mouseover(function(){
            console.log("tr mouseover");
            $(this).toggleClass("highlightRow");
        });

        $(".serviceTable tr").mouseout(function(){
            console.log("tr mouseout");
            $(this).toggleClass("highlightRow");
        });

        $(".serviceTable tr.odd").mouseover(function(){
            console.log("tr mouseover");
            $(this).toggleClass("highlightRow");
        });

        $(".serviceTable tr.odd").mouseout(function(){
            console.log("tr mouseout");
            $(this).toggleClass("highlightRow");
        });*/

//        showMessageDialogue();

//        $( "#dialog-message" ).dialog("close");

        $("#showMessageDetailButton").bind("click", function(){
            $( "#dialog" ).dialog({
                modal: true,
                width : 500,
                height: 300,
                position:["center", 200],
                buttons: {
                    Ok: function() {
                        $( this ).dialog( "close" );
                    }
                }
            });
        });

        /*$("#startServiceButton").bind("click", function(){
            serviceCommand("Start");
        });

        $("#stopServiceButton").bind("click", function(){
            serviceCommand("Stop");
        });

        $("#restartServiceButton").bind("click", function(){
            serviceCommand("Restart");
        });*/

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

/*
        $("#statusButton").bind("click", function(){
            var params = {clientId:"${deviceInfo.deviceId}", action: "Command", command: "Environment"};

            $.ajax({
                url: "/environment",
                data: $.param(params, true),
                type : "POST",
                dataType: "json",
                success: function (data) {
                    if (data){
                        jobIds[jobIds.length + 1] = data.JobId;
                        alert("已发送请求，等待返回结果！");

                        var newRequest = $("<div>" + JSON.stringify(data) + "</div>");
                        $(".messageWrapper").append(newRequest);
                    }
                }
            });
        });
*/

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
                var refJobId = eventObj.RefJobId;
                var JobId = eventObj.JobId;
                var clientMessage = eventObj.Message;
                var action = eventObj.Action;

                if (clientMessage != undefined && clientMessage.length >0){
                    var newRequest = $("<div>" + clientMessage + "</div>");
                    $(".messageWrapper").append(newRequest);
                }
                else{
                    var newRequest = $("<div>" + evt.data + "</div>");
                    $(".messageWrapper").append(newRequest);
                }

                for(var i=0; i<jobIds.length; i++){
                    if (refJobId == jobIds[i] && "Finish" == action){
                        $("#serviceTableBlock").load("/deviceInfo/statusTable/${deviceInfo.deviceId}", {limit: 25}, function(){

                            showAlertMessage("执行完毕，状态已更新！");

                            appendMessage("状态已更新！<a href='/deviceInfo/${deviceInfo.deviceId}'>点击更新</a>");
                        });
                        break;
                    }
                }
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

    function selectAll(){
        var checked = ("checked" == $("#selectAll").attr("checked"));
        $("input[name='serviceItem']").attr("checked", checked);
    }

    function updateStatus(){
        var params = {clientIds:["${deviceInfo.deviceId}"], action: "Command", command: "Environment"};

        $.ajax({
            url: "/environment",
            data: $.param(params, true),
            type : "POST",
            dataType: "json",
            success: function (data) {
                if (data){

                    showAlertMessage("已发送请求，等待返回结果！");

                    for(var i=0; i<data.length; i++){
                        var responseItem = data[i];
                        jobIds[jobIds.length + 1] = responseItem.JobId;

                    }

                    var newRequest = $("<div>" + JSON.stringify(data) + "</div>");
                    $(".messageWrapper").append(newRequest);
                }
            }
        });
    }

    function showMessageDialogue(){
        var dialogOpts = {
            position: ["right", "bottom"]
        };
        $( "#dialog" ).dialog(dialogOpts);
    }

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

    function serviceCommand(action, itemId){

        var updateClients = [];

        if (itemId != undefined){
            console.log("itemId=" + itemId);
            updateClients[0] = itemId;
        }
        else{
            $("input[name='serviceItem']:checked").each(function(index, element){
                console.log("serviceItem[" + index + "] checked");
                updateClients[index] = $(element).val();
            });
        }

        if(updateClients.length == 0){
            showAlertMessage("请选择目标服务！", false);

            return;
        }

        var params = {clientId:"${deviceInfo.deviceId}", action: "Command", command: "ServiceControl", serviceAction: action, updateClients: updateClients};
        $.ajax({
            url: "/service",
            data: $.param(params, true),
            type : "POST",
            dataType: "json",
            success: function (data) {
                if (data){
                    jobIds[jobIds.length + 1] = data.JobId;
//                    appendMessage("已发送请求，等待返回结果！");
                    showAlertMessage("已发送请求，等待返回结果！");

                    var newRequest = $("<div>" + JSON.stringify(data) + "</div>");
                    $(".messageWrapper").append(newRequest);
                }
            }
        });
    }

    function showAlertMessage(msg, newMsg){
        var msgDiv = "<div>"+msg+"</div>";

        if (!newMsg){
            $("#messageContent").append(msgDiv);
        }

        $( "#dialog-message" ).dialog({
            modal: true,
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

    function showMessageDialogue(){
        $( "#dialog" ).dialog({
            modal: false,
            width : 900,
            height: 450,
            position:["center", 200],
            buttons: {
                Ok: function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }

</script>
