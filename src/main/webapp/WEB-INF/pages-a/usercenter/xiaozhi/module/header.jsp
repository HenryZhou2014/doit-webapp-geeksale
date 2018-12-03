<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<style type="text/css">
    .menuItem{
        padding: 10px 20px;
        background: #316135;
        margin-right: 10px;
    }

    .menuItem:hover{
        background: #00DA87;
    }

    .menuItem a{
        text-decoration: none;
        color: #EEEEEE;
        font-size: 14px;
        font-weight: bold;
    }

    .exitButton{
        text-decoration: none;
        background: #308F5A;
        color:white;
        font-size: 14px;
        padding: 5px 10px;
        border-radius: 5px;
    }

    .exitButton:hover{
        background: #246B44;
    }
</style>

<div style="background: #3CB371; border-bottom: 2px solid #008331;">


    <div style="width: 1300px; margin: 0 auto; ">
        <div style="text-align: center;">
            <div style="padding: 22px 0 5px 0; font-weight: bolder; color: #EEFFEE;font-size: 28px;">
                房友客户系统监控维护平台
            </div>
        </div>

        <div class="fl">
            <div class="menuItem">
                <a href="/index">运行监控</a>
            </div>
        </div>

        <%--<div class="fl">
            <div class="menuItem">
                <a href="/updateWebapps">应用升级维护</a>
            </div>
        </div>--%>

        <div class="fl">
            <div class="menuItem">
                <a href="/deploy">安装维护</a>
            </div>
        </div>

        <div class="fr" style="padding-top: 15px;">
            <a href="/logout.jsp" class="exitButton">退出系统</a>
        </div>


        <div class="clear"></div>
    </div>
</div>