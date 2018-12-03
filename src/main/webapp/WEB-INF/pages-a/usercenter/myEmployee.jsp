<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>公司管理</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myOrders"/>

    <style type="text/css">

    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <div class="pull-right">
                <a class="btn btn-success btn-sm btn-company-new"><i class="fa fa-fire"></i> 添加公司</a>
            </div>

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#tab1" data-toggle="tab">员工</a></li>
                <li><a href="#tab2" data-toggle="tab">公司</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="tab-pane fade in active" id="tab1">
                    <div>
                        <div class="form-inline">
                            <input type="text" class="form-control width-200"/>
                            <button class="btn btn-default">查询</button>
                        </div>
                    </div>

                    <div class="table-responsive margin-top-10">
                        <table class="table table-hover table-bordered table-striped">
                            <colgroup>
                                <col/>
                                <col/>
                                <col/>
                                <col width="240"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>员工</th>
                                <th>手机号</th>
                                <th>公司</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${accounts}" var="accountItem">
                                <tr>
                                    <td>
                                            ${accountItem.userName}
                                    </td>
                                    <td>${accountItem.mobileNumber}</td>
                                    <td>金山河</td>
                                    <td>
                                        <a class="btn btn-warning btn-xs btn-employee-edit" data-employee-id="${accountItem.id}" data-employee-phone="${accountItem.mobileNumber}" data-employee-name="${accountItem.userName}">编辑</a>
                                        <a class="btn btn-danger btn-xs btn-employee-delete" data-employee-id="${accountItem.id}">删除</a>
                                        <a href="${ctx}/agent/987623" class="btn btn-success btn-xs btn-employee-link" data-id="${accountItem.id}">员工推广链接</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="tab2">

                    <div class="table-responsive margin-top-10">
                        <table class="table table-hover table-bordered table-striped">
                            <colgroup>
                                <col/>
                                <col/>
                                <col width="280"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>公司</th>
                                <th>公司简称（品牌名称）</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${companyInfoList}" var="company">
                                <tr>
                                    <td>${company.companyName}</td>
                                    <td>${company.companyName2}</td>
                                    <td>
                                        <a class="btn btn-success btn-xs btn-employee-show" data-company-id="${company.id}">查看员工</a>
                                        <a class="btn btn-info btn-xs btn-employee-new" data-company-id="${company.id}" data-company-name="${company.companyName}">增加员工</a>
                                        <a class="btn btn-warning btn-xs btn-company-edit" data-company-id="${company.id}" data-company-name="${company.companyName}" data-company-name2="${company.companyName2}">编辑</a>
                                        <a class="btn btn-danger btn-xs btn-company-delete" data-company-id="${company.id}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- LEFT -->
        <div class="col-lg-2 col-md-2 col-sm-3 col-lg-pull-10 col-md-pull-10 col-sm-pull-7">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>
    </div>
</section>

<script id="companyTemplate" type="text/html">

    <div>
        <form id="companyForm" class="form">
            <input type="hidden" name="id" value="{{id}}"/>
            <div class="row">
                <div class="col-lg-2">
                    <label class="desc text-right">子公司名称</label>
                </div>
                <div class="col-lg-10">
                    <input name="companyName" type="text" class="form-control" placeholder="子公司名称" value="{{companyName}}"/>
                </div>
            </div>

            <div class="row margin-top-10">
                <div class="col-lg-2">
                    <label class="desc text-right">客户简称（品牌名称）</label>
                </div>
                <div class="col-lg-10">
                    <input name="companyName2" type="text" class="form-control" placeholder="客户简称或品牌名称" value="{{companyName2}}"/>
                    <div>
                        (注：客户名称将在发送的消息中显示，且开户后，客户名称不能更改，请慎重！)
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-2">
                    <label class="desc text-right">联系人</label>
                </div>
                <div class="col-lg-10">
                    <input name="linkPerson" type="text" class="form-control" placeholder="联系人"/>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-2">
                    <label class="desc text-right">联系电话</label>
                </div>
                <div class="col-lg-10">
                    <input name="mobileNumber" type="text" class="form-control" placeholder="联系电话"/>
                </div>
            </div>
        </form>
    </div>

</script>

<script id="employeeTemplate" type="text/html">

    <div>
        <form class="form">

            <div class="row">
                <div class="col-lg-2">
                    <label class="desc text-right">子公司</label>
                </div>
                <div class="col-lg-10">
                    金山河
                </div>
            </div>

            <div class="row margin-top-10">
                <div class="col-lg-2">
                    <label class="desc text-right">手机号</label>
                </div>
                <div class="col-lg-10">
                    <input type="text" class="form-control" placeholder="填写11位手机号码"/>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-2">
                    <label class="desc text-right">姓名</label>
                </div>
                <div class="col-lg-10">
                    <input type="text" class="form-control" placeholder="员工姓名"/>
                </div>
            </div>
        </form>
    </div>

</script>

<script type="text/javascript">

    $(document).ready(function () {
        $(".btn-company-new").click(function () {
            var html = template("companyTemplate", {});
            BootstrapDialog.show({
                title: "<div class='size-20'>添加公司</div>",
                draggable: true,
                size: BootstrapDialog.SIZE_WIDE,
                cssClass: 'introduction-dialogue',
                message: $("<div></div>").html(html),
                buttons: [
                    {
                        label: '保存',
                        cssClass: "btn btn-success dialogue-save",
                        action: function (dialogItself) {

                            var formdata = $("#companyForm").serialize();
                            $.ajax({
                                type: 'POST',
                                url: "${ctx}/usercenter/myCompany/updateCompanyInfo",
                                data: formdata,
                                dataType: "json",
                                success: function (data) {

                                    if (data.flag == "0") {
                                        toastError("提示", data.msg);
                                        return;
                                    }
                                    else{
                                        toastError("提示", "已添加！");
                                    }
                                }
                            });

                            dialogItself.close();
                        }
                    },
                    {
                        label: '关闭',
                        cssClass: "btn btn-danger dialogue-close",
                        action: function (dialogItself) {
                            dialogItself.close();
                        }
                    }]
            });
        });

        $(document).on("click", ".btn-company-edit", function () {

            var companyId = $(this).attr("data-company-id");
            var companyName = $(this).attr("data-company-name");
            var companyName2 = $(this).attr("data-company-name2");

            var html = template("companyTemplate", {id : companyId, companyName:companyName, companyName2: companyName2 });
            BootstrapDialog.show({
                title: "<div class='size-20'>添加公司</div>",
                draggable: true,
                size: BootstrapDialog.SIZE_WIDE,
                cssClass: 'introduction-dialogue',
                message: $("<div></div>").html(html),
                onhidden: function () {
                    console.log("onhidden..");
                },
                onshow: function () {

                },
                onshown: function () {

                },
                buttons: [
                    {
                        label: '保存',
                        cssClass: "btn btn-success dialogue-save",
                        action: function (dialogItself) {
                            var formdata = $("#companyForm").serialize();
                            $.ajax({
                                type: 'POST',
                                url: "${ctx}/usercenter/myCompany/updateCompanyInfo",
                                data: formdata,
                                dataType: "json",
                                success: function (data) {

                                    if (data.flag == "0") {
                                        toastError("提示", data.msg);
                                        return;
                                    }
                                    else{
                                        toastError("提示", "已添加！");
                                    }
                                }
                            });

                            dialogItself.close();
                        }
                    },
                    {
                        label: '关闭',
                        cssClass: "btn btn-danger dialogue-close",
                        action: function (dialogItself) {
                            dialogItself.close();
                        }
                    }]
            });
        });

        $(document).on("click", ".btn-employee-new , .btn-employee-edit", function () {
            var html = template("employeeTemplate", {});
            BootstrapDialog.show({
                title: "<div class='size-20'>添加员工</div>",
                draggable: true,
                size: BootstrapDialog.SIZE_WIDE,
                cssClass: 'introduction-dialogue',
                message: $("<div></div>").html(html),
                buttons: [
                    {
                        label: '保存',
                        cssClass: "btn btn-success dialogue-save",
                        action: function (dialogItself) {


                            dialogItself.close();
                        }
                    },
                    {
                        label: '关闭',
                        cssClass: "btn btn-danger dialogue-close",
                        action: function (dialogItself) {
                            dialogItself.close();
                        }
                    }]
            });
        });

        $(document).on("click", ".btn-company-delete", function () {
            var html = "删除确认！";
            BootstrapDialog.show({
                title: "<div class='size-20'>确认</div>",
                draggable: true,
                size: BootstrapDialog.SIZE_SMALL,
                cssClass: 'introduction-dialogue',
                message: $("<div></div>").html(html),
                onhidden: function () {
                    console.log("onhidden..");
                },
                onshow: function () {
//                            $(".desc *").removeAttr("style");
                },
                onshown: function () {
//                            $(".desc *").removeAttr("style");
                },
                buttons: [
                    {
                        label: '确认',
                        cssClass: "btn btn-success dialogue-save",
                        action: function (dialogItself) {
                            dialogItself.close();
                        }
                    },
                    {
                        label: '关闭',
                        cssClass: "btn btn-danger dialogue-close",
                        action: function (dialogItself) {
                            dialogItself.close();
                        }
                    }]
            });
        });

        $(document).on("click", ".btn-employee-delete", function () {
            var html = "删除确认！";
            BootstrapDialog.show({
                title: "<div class='size-20'>确认</div>",
                draggable: true,
                size: BootstrapDialog.SIZE_SMALL,
                cssClass: 'introduction-dialogue',
                message: $("<div></div>").html(html),
                onhidden: function () {
                    console.log("onhidden..");
                },
                onshow: function () {
//                            $(".desc *").removeAttr("style");
                },
                onshown: function () {
//                            $(".desc *").removeAttr("style");
                },
                buttons: [
                    {
                        label: '确认',
                        cssClass: "btn btn-success dialogue-save",
                        action: function (dialogItself) {
                            dialogItself.close();
                        }
                    },
                    {
                        label: '关闭',
                        cssClass: "btn btn-danger dialogue-close",
                        action: function (dialogItself) {
                            dialogItself.close();
                        }
                    }]
            });
        });
    });

</script>
