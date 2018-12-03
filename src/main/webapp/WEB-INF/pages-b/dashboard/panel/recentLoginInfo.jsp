<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5>最近登陆账号</h5>
        <div class="ibox-tools">
            <a class="collapse-link">
                <i class="fa fa-chevron-up"></i>
            </a>
            <a class="close-link">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
    <div class="ibox-content">
        <table class="table table-hover no-margins">
            <thead>
            <tr>
                <th>账号</th>
                <th>用户</th>
                <th>登陆时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="item">
            <tr>
                <td><small>${item.accountName}</small></td>
                <td><small>${item.userName}</small></td>
                <td><small><fmt:formatDate value="${item.loginDate}" pattern="yyyy/MM/dd HH:mm"/></small></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>