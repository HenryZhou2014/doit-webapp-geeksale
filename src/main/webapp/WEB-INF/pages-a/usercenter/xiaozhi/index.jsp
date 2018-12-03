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

    <style type="text/css">
        body {
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

        .hidden{
            display: block;
            visibility: hidden;
        }

        .serviceTable {

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

        .webappLabel {

        }

        .dbLabel {
            /*background: yellow;*/
        }

        .clear {
            clear: both;
        }

        .groupBlock {
            padding: 15px 25px;
            font-size: 32px;
            font-weight: bolder;
            background: lightgray;
            margin-right: 10px;
        }

        .tc {
            width: 1300px;
            margin: 0 auto;
            text-align: right;
            margin-top: 10px;
            padding: 5px 0;

        }

        .cardsWrapper {
            width: 1300px;
            margin: 0 auto;
            background: #DEDEDE;
            min-height: 400px;
        }

        .card {
            width: 250px;
            margin: 5px;
            background: #CCCCCC;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        .card .title {
            background: #BCBCBC;
            padding: 5px 0;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        .card .title a {
            text-decoration: none;
            color: #444;
        }

        .card .title a:hover {
            color: #2A4E6C;
        }

        .card .machineName {
            text-align: center;
            font-size: 12px;
            color: #444;
            font-family: "Arial";
        }

        .card .ip {
            text-align: center;
            font-weight: bold;
            font-size: 14px;
            color: #444;
            font-family: "Arial Black";
        }

        .card .updateTime {
            text-align: center;
            /*padding: 5px 0;*/
            font-size: 10px;
            background: #CDCDCD;
            border-radius: 5px;
            padding: 5px 10px;
            /*margin: 10px;*/
            font-family: "Arial";
            font-style: italic;
        }

        .card .appStatusWrapper {
            width: 245px;
            margin: 10px auto;
        }

        .card .appBlock {
            font-size: 12px;
            margin: 2px;
            padding: 2px;
            border-radius: 5px;
            width: 40px;
            text-align: center;
        }

        .card .activeApp {
            background: #94C07F;
            color: #44523E;
        }

        .card .inactiveApp {
            background: lightgray;
            /*background: #94C07F;*/
            color: #44523E;
        }

        .ui-dialog-title{
            font-size: 12px;
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

        .disconnected{
            background: #FF0000;
            color:white;
            border-radius: 5px;
            padding: 5px;
            font-size: 10px;
            margin: 5px;
        }
    </style>

    <script type="text/javascript">

    </script>
</head>
<body>

<jsp:include page="segments/header.jsp"/>

<div class="tc">
    <div class="fl">
        <ul class="ui-tabs">
            <c:forEach begin="1" end="10" var="pageIndex">
                <li <c:if test="${pageNum == pageIndex}">class="active"</c:if>> <a href="${ctx}/index?pageNum=${pageIndex}">组${pageIndex}</a></li>
            </c:forEach>
        </ul>
    </div>
    <div class="fr">
        <form name="form1" id="form1" method="post" action="/search">
            <input type="text" name="queryName" value="${queryName}" style="padding: 5px 8px; font-size: 16px;"/> <input type="submit" style="background: #308F5A; border: none; color:white; font-size:14px; padding: 5px 8px;" value="搜索"/> <a class="normalButton" href="javascript:void(0);" onclick="showMessageDialogue();">显示消息框</a> <a class="normalButton" href="javascript:void(0);" onclick="requestLatestStatus();">刷新状态</a>
        </form>
    </div>
    <div class="clear"></div>
</div>

<div>
    <div class="cardsWrapper">
        <c:forEach items="${clientList}" var="item" varStatus="status">
            <div class="card fl">
                <input type="hidden" name="deviceId" value="${item.deviceId}"/>
                <div class="title">
                    <div class='ip'><a href="/deviceInfo/${item.deviceId}">${item.machineName}</a></div>
                    <div class="machineName">&nbsp;${item.ip}&nbsp;</div>
                </div>
                <div>
                    <div class="appStatusWrapper">
                        <c:forEach begin="0" end="9" var="sindex">
                            <c:set var="appClass" value="inactiveApp"/>
                            <c:if test="${'1' eq item.status[sindex]}">
                                <c:set var="appClass" value="activeApp"/>
                            </c:if>
                            <div title="${item.companyName[sindex]}" class="appBlock fl ${appClass}">${item.companyId[sindex]}<c:if
                                    test="${empty item.companyId[sindex]}">&nbsp;</c:if></div>
                        </c:forEach>
                    </div>
                    <div class="clear"></div>
                </div>
                <div style="height: 30px;">
                    <div class="fl" style="margin-top: 8px;">
                        <c:choose>
                            <c:when test="${item.connected}">
                                <div class="updateTime">
                                    <fmt:formatDate value="${item.statusUpdateTime}" pattern="yyyy/MM/dd HH:mm:ss"/>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <label class="disconnected">未连接</label>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <c:if test="${not empty item.deviceId}">
                    <div class="fr" style="margin: 8px 4px 0 4px;">
                        <a href="javascript:void(0);" onclick="requestLatestStatus('${item.deviceId}');"><img src="/images/icon/0000_Refresh-inactive.png" style="max-width: 13px;"/></a>
                        <a href="javascript:void(0);" onclick="detailInfo('${item.deviceId}');"><img src="/images/icon/information_more_detail-128.png" style="max-width: 13px;"/></a>
                    </div>
                    </c:if>
                    <div class="clear"></div>
                </div>

            </div>
            <c:if test="${(status.index + 1) mod 5 == 0}">
                <div class="clear"></div>
            </c:if>
        </c:forEach>

        <div class="clear"></div>
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
        <div id="dialog-message" title="提示" style="max-height: 500px;">

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
</body>
</html>

<script type="text/javascript">
    var m_socket;
//    var url = "ws://localhost:8081/websocket/command";
    var url = "${WebsocketCommandUrl}";

    var jobIds = [];

    $(document).ready(function () {

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
                var action = eventObj.Action;
                var command = eventObj.Command;
                var refJobId = eventObj.RefJobId;
                var JobId = eventObj.JobId;
                var deviceId = eventObj.DeviceId;
                var clientMessage = eventObj.Message;

                if ("Id" == action){
                    showAlertMessage("发现新的客户端连接：" + deviceId);
                }

                if (clientMessage != undefined && clientMessage.length >0){
                    var newRequest = $("<div>" + clientMessage + "</div>");
                    $(".messageWrapper").append(newRequest);
                }
                else{
                    var newRequest = $("<div>" + evt.data + "</div>");
                    $(".messageWrapper").append(newRequest);
                }

                $("input[name='deviceId']").each(function(index, element){
                    if ($(element).val() == deviceId){
                        var card = $(element).parent();

                        $(card).load("/deviceInfo/statusCard/" + deviceId, {limit: 25}, function(){

                        });
                    }
                });

                for(var i=0; i<jobIds.length; i++){
                    if (refJobId == jobIds[i]){
                        showAlertMessage((deviceId == undefined ? "" : deviceId) + "状态已更新！");
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

    function log(message) {
        console.log(message);
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

    function showMessageDialogue(){
        $( "#dialog" ).dialog({
            modal: false,
            width : 500,
            height: 300,
            position:["center", 200],
            buttons: {
                Ok: function() {
                    $( this ).dialog( "close" );
                }
            }
        });
    }

    function requestLatestStatus(itemId){
        var deviceIds = [];

        if (itemId != undefined){
            deviceIds[0] = itemId;
        }
        else{
            $("input[name='deviceId']").each(function(index, element){
                deviceIds[index] = $(element).val();
            });
        }

        if(deviceIds.length == 0){
            showAlertMessage("请选择目标服务器！");

            return;
        }

        var params = {clientIds: deviceIds, action: "Command", command: "Environment"};

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

    function detailInfo(clientId){

        $("#clientContent").load("/deviceInfo/profileInfo/" + clientId, {limit: 25}, function(){

            $( "#client-profile" ).dialog({
                modal: false,
                width : 900,
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