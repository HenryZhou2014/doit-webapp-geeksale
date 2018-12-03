<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp"%>

<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5>访问排行</h5>
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
                <th>#</th>
                <th>内容</th>
                <th>访问</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${articles}" var="item" varStatus="status">
            <tr>
                <td><small>${status.index + 1}</small></td>
                <td><small>${item.title}</small></td>
                <td><small>${item.hits}</small></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>