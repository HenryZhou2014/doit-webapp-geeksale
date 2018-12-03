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
  <style type="text/css">
    .deviceInfo{
      width: 170px;
      margin: 5px;
      padding: 10px;
      background: lightgray;
    }

    .deviceStatus{
      width: 10px;
      height: 10px;
      background: green;
    }

    .appStatus{
      width: 10px;
      height: 10px;
      background: darkgray;
      margin: 3px;
    }
    .fl{
      float: left;
    }
    .fr{
      float: right;
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

      .webappLabel{

      }

      .dbLabel{
          /*background: yellow;*/
      }

      .clear{
          clear: both;
      }

      .groupBlock{
          padding: 15px 25px;
          font-size: 32px;
          font-weight: bolder;
          background: lightgray;
          margin-right: 10px;
      }

      .tc{
          text-align: center;
      }
  </style>
</head>
<body>
<div class="tc">
    <input type="tex" value=""/> <input type="button" value="搜索"/>
</div>
<div>
    <div class="groupBlock fl">
        <div class="groupWrapper">
            F1~F50
        </div>
    </div>

    <div class="groupBlock fl">
        <div class="groupWrapper">
            F51~F100
        </div>
    </div>

    <div class="groupBlock fl">
        <div class="groupWrapper">
            F101~F150
        </div>
    </div>

    <div class="groupBlock fl">
        <div class="groupWrapper">
            F151~F200
        </div>
    </div>

    <div class="clear"></div>
</div>

<table class="serviceTable" width="100%">
    <tr>
        <th rowspan="2">
            <input type="checkbox"/>
        </th>
        <th rowspan="2">序号</th>
        <th rowspan="2">机器名</th>
        <th rowspan="2">IP地址</th>
        <th colspan="10">服务状态</th>
        <th rowspan="2">状态时间</th>
        <th rowspan="2">操作</th>
    </tr>
    <tr>
        <th>客户0</th>
        <th>客户1</th>
        <th>客户2</th>
        <th>客户3</th>
        <th>客户4</th>
        <th>客户5</th>
        <th>客户6</th>
        <th>客户7</th>
        <th>客户8</th>
        <th>客户9</th>
    </tr>
    <c:forEach items="${clientList}" var="item" varStatus="status">
        <c:set var="trClass" value="even"/>
        <c:if test="${status.index mod 2 == 1}">
            <c:set var="trClass" value="odd"/>
        </c:if>
        <tr class="${trClass}">
            <td>
                <input type="checkbox"/>
            </td>
            <td>${status.index + 1}</td>
            <td>
                <a href="/deviceInfo/${item.deviceId}">${item.machineName}</a>
            </td>
            <td>${item.ip}</td>

            <td>
                <div class="webappLabel">${item.companyId[0]}</div>
            </td>
            <td>
                <div class="webappLabel">${item.companyId[1]}</div>
            </td>
            <td>
                <div class="webappLabel">${item.companyId[2]}</div>
            </td>
            <td>
                <div class="webappLabel">${item.companyId[3]}</div>

            </td>
            <td>
                <div class="webappLabel">${item.companyId[4]}</div>

            </td>
            <td>
                <div class="webappLabel">${item.companyId[5]}</div>

            </td>
            <td>
                <div class="webappLabel">${item.companyId[6]}</div>

            </td>
            <td>
                <div class="webappLabel">${item.companyId[7]}</div>

            </td>
            <td>
                <div class="webappLabel">${item.companyId[8]}</div>

            </td>
            <td>
                <div class="webappLabel">${item.companyId[9]}</div>

            </td>

            <td><fmt:formatDate value="${item.statusUpdateTime}" pattern="yyyy/MM/dd HH:mm:ss"/> </td>
            <td></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
