<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>商品不存在或已下架</title>
    <meta name="heading" content="商品不存在或已下架"/>
    <meta name="column-name" content="news"/>
    <style type="text/css">
    </style>
</head>

<div class="container" style="height:600px;margin: 0 auto;text-align: center">
    <div class="row" style="margin-top: 100px;font-size: 18px;">
        <span>商品不存在或已下架，将在<span id="secondView" style="color: red;padding:0 2px;"></span>秒后自动跳转回之前页面</span>
    </div>
</div>

<script type="text/javascript">

    var secs = 5; //倒计时的秒数
    function Load(){
        for(var i=secs;i>=0;i--)
        {
            window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000);
        }
    }
    function doUpdate(num)
    {
        document.getElementById('secondView').innerHTML = num;
        if(num == 0) { window.history.back(); }
    }
    //initiating jQuery
    $(document).ready(function () {
        Load();
    });


</script>
