<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>公司管理</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu-item-group" content="02"/>
    <meta name="menu-item-module" content="0220"/>
    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>

    <style type="text/css">
        .form-control-feedback{
            right: 20px;
            color: darkred;
        }
        .bv-form .help-block{
            color: darkred;
        }
    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <%--<div class="pull-right">
                <a class="btn btn-success btn-sm btn-company-new"><i class="fa fa-fire"></i> 添加公司</a>
            </div>--%>

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#tab1" data-toggle="tab">员工</a></li>
                <li><a href="#tab2" data-toggle="tab">公司</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="tab-pane fade in active" id="tab1">
                    <div>
                        <div class="form-inline">
                            公司 <select id="companyId" name="companyId" class="form-control">
                                <option value="">全部公司</option>
                                <c:forEach items="${companyInfoList}" var="item">
                                    <option value="${item.id}">${item.companyName}</option>
                                </c:forEach>
                            </select>
                            <input name="userName" id="userName" type="text" class="form-control width-200"/>
                            <button class="btn btn-default btn-query">查询</button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example" width="100%">
                        </table>
                    </div>

                </div>
                <div class="tab-pane fade" id="tab2">

                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover dataTables-example2" width="100%">
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
                    <label class="desc text-right">公司名称</label>
                </div>
                <div class="col-lg-10">
                    <input name="companyName" type="text" class="form-control" placeholder="子公司名称" value="{{companyName}}" maxlength="60"/>
                </div>
            </div>

            <div class="row margin-top-10">
                <div class="col-lg-2">
                    <label class="desc text-right">客户简称（品牌名称）</label>
                </div>
                <div class="col-lg-10">
                    {{if id}}
                    <input name="slogan" type="text" class="form-control" placeholder="客户简称或品牌名称" value="{{slogan}}" readonly="readonly"/>
                    {{else}}
                    <input name="slogan" type="text" class="form-control" placeholder="客户简称或品牌名称" value="{{slogan}}"/>
                    {{/if}}
                    <div>
                        (注：该信息将在发送的消息中显示，且开户后，该信息不能更改，请慎重！)
                    </div>
                </div>
            </div>

            <%--<div class="row">
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
            </div>--%>
        </form>
    </div>
</script>

<script id="employeeTemplate" type="text/html">

    <div>
        <form id="employeeForm" name="employeeForm" class="form">
            <input type="hidden" name="id" value="{{employeeId}}"/>
            <input type="hidden" name="companyId" value="{{companyId}}"/>
            <div class="row">
                <div class="col-lg-2">
                    <label class="desc text-right">公司</label>
                </div>
                <div class="col-lg-10">
                    {{companyName}}
                </div>
            </div>

            <div class="row margin-top-10">
                <div class="col-lg-2">
                    <label class="desc text-right">手机号</label>
                </div>
                <div class="col-lg-10">
                    {{if employeeId}}
                    <input name="accountName" type="text" class="form-control" placeholder="填写11位手机号码" value="{{accountName}}" maxlength="11" readonly="readonly"/>
                    {{else}}
                    <input name="accountName" type="text" class="form-control" placeholder="填写11位手机号码" value="{{accountName}}" maxlength="11"/>
                    {{/if}}
                </div>
            </div>

            <div class="row">
                <div class="col-lg-2">
                    <label class="desc text-right">姓名</label>
                </div>
                <div class="col-lg-10">
                    <input name="userName" type="text" class="form-control" placeholder="员工姓名" value="{{userName}}" maxlength="16"/>
                </div>
            </div>
        </form>
    </div>

</script>

<script id="employeeActionsColumnTemplate" type="text/html">
    <a class="btn btn-warning btn-xs btn-employee-edit" data-employee-id="{{id}}" data-account-name="{{accountName}}" data-user-name="{{userName}}" data-company-name="{{companyName}}" data-company-id="{{companyId}}">编辑</a>
    {{if deleteable == "true"}}
    <a class="btn btn-danger btn-xs btn-employee-delete" data-employee-id="{{id}}">删除</a>
    {{/if}}
    <a href="${ctx}/agent/{{openid}}" class="btn btn-success btn-xs btn-employee-link" data-id="{{id}}" target="_blank">员工推广链接</a>
</script>

<script id="companyActionsColumnTemplate" type="text/html">
    <%--<a class="btn btn-success btn-xs btn-employee-show" data-company-id="{{id}}">查看员工</a>--%>
    <a class="btn btn-info btn-xs btn-employee-new" data-company-id="{{id}}" data-company-name="{{companyName}}">增加员工</a>
    <a class="btn btn-warning btn-xs btn-company-edit" data-company-id="{{id}}" data-company-name="{{companyName}}" data-company-slogan="{{slogan}}" data-company-type="{{companyType}}">编辑</a>
    {{if companyType == '2'}}
    <a class="btn btn-danger btn-xs btn-company-delete" data-company-id="{{id}}">删除</a>
    {{/if}}
</script>

<script type="text/javascript">

    var employeeDataTable;
    var companyDataTable;

    $(document).ready(function () {
        $(".btn-company-new").click(function () {
            updateCompanyInfo({});
        });

        $(document).on("click", ".btn-company-edit", function () {

            var companyId = $(this).attr("data-company-id");
            var companyName = $(this).attr("data-company-name");
            var slogan = $(this).attr("data-company-slogan");

            updateCompanyInfo({id : companyId, companyName:companyName, slogan: slogan });
        });

        $(document).on("click", ".btn-employee-new , .btn-employee-edit", function () {
            var employeeId = $(this).attr("data-employee-id");
            var accountName = $(this).attr("data-account-name");
            var userName = $(this).attr("data-user-name");
            var companyName = $(this).attr("data-company-name");
            var companyId = $(this).attr("data-company-id");
            var html = template("employeeTemplate", {employeeId:employeeId, accountName:accountName, userName:userName, companyName:companyName, companyId:companyId});
            BootstrapDialog.show({
                title: "<div class='size-20'>员工信息</div>",
                draggable: true,
                size: BootstrapDialog.SIZE_WIDE,
                cssClass: 'introduction-dialogue',
                message: $("<div></div>").html(html),
                onshown: function(){

                    $('#employeeForm').bootstrapValidator({
                        message: 'This value is not valid',
                        feedbackIcons: {
                            valid: 'glyphicon glyphicon-ok',
                            invalid: 'glyphicon glyphicon-remove',
                            validating: 'glyphicon glyphicon-refresh'
                        },
                        fields: {
                            accountName: {
                                message: '账号不能为空',
                                validators: {
                                    notEmpty: {
                                        message: '账号不能为空'
                                    },
                                    regexp: {
                                        regexp: /^[0-9]{11}$/,
                                        message: '仅限11位的手机号码'
                                    },
                                    remote: {
                                        type: 'GET',
                                        url: "${ctx}/usercenter/myCompany/checkEmployeeInfo",
                                        data:{"id": function(){return $("#employeeForm [name=id]").val();}, "accountName":function(){return $("#employeeForm [name=accountName]").val();}},
                                        dataType: 'json',
                                        message: '该手机号码已经被使用',
                                        delay: 1000
                                    }
                                }
                            },
                            userName: {
                                message: '员工姓名不能为空',
                                validators: {
                                    notEmpty: {
                                        message: '员工姓名不能为空'
                                    }
                                }
                            }
                        }
                    }).on('success.form.bv', function (e) {
                        // 转换、获取附件列表信息

                    });
                },
                buttons: [
                    {
                        label: '保存',
                        cssClass: "btn btn-success dialogue-save",
                        action: function (dialogItself) {
                            var bootstrapValidator = $("#employeeForm").data('bootstrapValidator');
                            //手动触发验证
                            bootstrapValidator.validate();
                            if(! bootstrapValidator.isValid()){
                                return;
                            }

                            var formdata = $("#employeeForm").serialize();
                            $.ajax({
                                type: 'POST',
                                url: "${ctx}/usercenter/myCompany/updateEmployeeInfo",
                                data: formdata,
                                dataType: "json",
                                success: function (data) {

                                    if (data.flag == "0") {
                                        toastError("提示", data.msg);
                                        return;
                                    }
                                    else{
                                        employeeDataTable.ajax.reload();
                                        toastInfo("提示", "员工信息已保存！");
                                        $(".dialogue-close").click();
                                    }
                                }
                            });

//                            dialogItself.close();
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
            var html = "删除确认！该子公司所属的员工信息将移至主公司下。";
            var companyId = $(this).attr("data-company-id");
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

                            $.ajax({
                                type: 'POST',
                                url: "${ctx}/usercenter/myCompany/deleteCompanyInfo",
                                data: {companyId: companyId},
                                dataType: "json",
                                success: function (data) {

                                    if (data.flag == "0") {
                                        toastError("提示", data.msg);
                                        return;
                                    }
                                    else{
                                        $(".dialogue-close").click();
                                        employeeDataTable.ajax.reload();
                                        companyDataTable.ajax.reload();
                                        toastInfo("提示", "公司信息已删除！");
                                    }
                                }
                            });
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
            var employeeId = $(this).attr("data-employee-id");

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

                            $.ajax({
                                type: 'POST',
                                url: "${ctx}/usercenter/myCompany/deleteEmployeeInfo",
                                data: {employeeId: employeeId},
                                dataType: "json",
                                success: function (data) {

                                    if (data.flag == "0") {
                                        toastError("提示", data.msg);
                                        return;
                                    }
                                    else{
                                        $(".dialogue-close").click();
                                        employeeDataTable.ajax.reload();
                                        companyDataTable.ajax.reload();
                                        toastInfo("提示", "员工信息已删除！");
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

        // 员工列表
        employeeDataTable = $(".dataTables-example").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
            "paging": false,
            "iDisplayLength": 25,
            "aLengthMenu": [25, 50, 100],
            "ordering": false,
            "order": [[1, "desc"]],
            "pagingType": "full_numbers",
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sSearch": "搜索",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据"
            },
            "columns": [
                {"data": "id","bSortable": false, visible:false},
                {"data": "userName","bSortable": false, title:"员工"},
                {"data": "accountName","bSortable": false, title:"手机号"},
                {"data": "companyName",title:"公司"},
                {"data": "id","bSortable": false, title:"操作"}
            ],
            "ajax": {
                url: "${ctx}/usercenter/myCompany/employeeList",
                type: "POST",
                dataType: "json",
                data: {
                    companyId: function(){
                        return $("#companyId").val();
                    },
                    userName: function () {
                        return $("#userName").val();
                    }
                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        var html = template("employeeActionsColumnTemplate", row);
                        return html;

                    }, "targets": 4
                }
            ]
        });


        // 公司列表
        companyDataTable = $(".dataTables-example2").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
            "paging": false,
            "iDisplayLength": 25,
            "aLengthMenu": [25, 50, 100],
            "ordering": false,
            "order": [[1, "desc"]],
            "pagingType": "full_numbers",
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sSearch": "搜索",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                },
                "sZeroRecords": "没有检索到数据"
            },
            "columns": [
                {"data": "id","bSortable": false, visible:false},
                {"data": "companyName","bSortable": false, title:"公司"},
                {"data": "slogan","bSortable": false, title:"公司简称(品牌名称)"},
//                {"data": "employeeNumber",title:"员工数"},
                {"data": "id","bSortable": false, title:"操作"}
            ],
            "ajax": {
                url: "${ctx}/usercenter/myCompany/companyList",
                type: "POST",
                dataType: "json",
                data: {

                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        var html = template("companyActionsColumnTemplate", row);
                        return html;
                    }, "targets": 3
                }
            ]
        });

        $(".btn-query").click(function(){
            employeeDataTable.ajax.reload();
        });
    });

    function updateCompanyInfo(companyInfo){

        var html = template("companyTemplate", companyInfo);
        BootstrapDialog.show({
            title: "<div class='size-20'>公司信息</div>",
            draggable: true,
            size: BootstrapDialog.SIZE_WIDE,
            cssClass: 'introduction-dialogue',
            message: $("<div></div>").html(html),
            onhidden: function () {
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
                                    companyDataTable.ajax.reload();
                                    toastInfo("提示", "公司信息已保存！");
                                    $(".dialogue-close").click();
                                }
                            }
                        });

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
    }

</script>
