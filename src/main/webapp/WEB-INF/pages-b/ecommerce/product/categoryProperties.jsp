<%@ page import="com.doit.ecommerce.enums.DisplayType" %>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="productCategoryList.title"/></title>
    <meta name="heading" content="<fmt:message key='productCategoryList.heading'/>"/>

    <meta name="module-group" content="ecommerce-management"/>
    <%--<meta name="module-subgroup" content="ecommerce-product"/>--%>
    <meta name="module" content="ecommerce-categories"/>


    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jeditable/jquery.jeditable.js"></script>


    <style type="text/css">
        table.dataTables-example {
            font-size: 13px;
        }

        select.input-sm {
            /*height:30px;*/
            /*line-height:30px;*/
            padding: 2px 5px;
        }

        .bootstrap-dialog.type-primary .modal-header {
            background-color: #18a689;
        }

        .sub_category_title {
            padding-left: 30px;
        }

        .padding-1 {
            padding-left: 0;
        }

        .padding-2 {
            padding-left: 20px;
        }

        .padding-3 {
            padding-left: 40px;
        }

        .padding-4 {
            padding-left: 60px;
        }
    </style>

</head>

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <%--<h2>Basic Form</h2>--%>
        <ol class="breadcrumb">
            <li>
                <a href="${ctx}/backend/index.html">首页</a>
            </li>
            <li>
                <a>商城管理</a>
            </li>
            <li class="active">
                <strong>商品分类管理-属性</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">


            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>商品分类属性管理</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="javascript:void(0);">
                            <i class="fa fa-plus-circle"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a id="toolbar_reload" href="javascript:void(0);">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_publish" href="javascript:void(0);">发布</a>
                            </li>
                            <li>
                                <a id="toolbar_unpublish" href="javascript:void(0);">下架</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="panel">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover dataTables-example"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th width="20">
                                        <input type="checkbox" class="checkAll" checkTarget="checkId"/>
                                    </th>
                                    <th>编号</th>
                                    <th>属性名称</th>
                                    <th>商品分类</th>
                                    <th>属性值录入方式</th>
                                    <th>可选值列表</th>
                                    <th>是否显示</th>
                                    <th width="140">操作</th>
                                </tr>
                                </thead>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="modal fade" id="newItemDialogue" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     data-backdrop="false" data-show="false">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 800px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加分类信息
                </h4>
            </div>
            <div class="modal-body" id="userForm" style="min-height:300px;max-height: 455px;overflow: auto;">
                <form class="form-horizontal" id="newItemForm">
                    <input type="hidden" name="id"/>
                    <input type="hidden" name="cpid" value="${cpid}"/>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <i class="fa fa-align-left"></i> <span id="rootName">商品分类属性</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属商品类型</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="productCategory"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="propertyNo" class="col-sm-2 control-label">属性编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="propertyNo" name="propertyNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="propertyName" class="col-sm-2 control-label">属性名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="propertyName" name="propertyName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">是否显示</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="displayFlag" id="radio_display" value="1" checked="true"> 显示
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="displayFlag" id="radio_display_none" value="0"> 不显示
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="displayType" class="col-sm-2 control-label">属性录入方式</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="displayType" name="displayType">
                                <option value="<%=DisplayType.INPUT.getCode()%>"><%=DisplayType.INPUT.getName()%></option>
                                <option value="<%=DisplayType.SELECT.getCode()%>"><%=DisplayType.SELECT.getName()%></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="propertyValue" class="col-sm-2 control-label">属性值可选项</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="5" id="propertyValue" name="propertyValue"></textarea>
                            <span class="help-block">输入时，一行代表一个可选值.</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="saveAndQuit();">
                    保存
                </button>
                <button type="button" class="btn btn-primary" onclick="saveAndNew();">
                    保存并新增
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


<script type="text/javascript">
    var mainDataTable;

    $(document).ready(function () {
        $(".checkAll").click(function () {
            var checked = $(this).prop("checked");
            var target = $(this).attr("checkTarget");
            $("input[name='" + target + "']").each(function () {
                $(this).prop("checked", checked);

                $(this).parents("tr:first").toggleClass("selected", checked);
            });
        });

        $.fn.checkvalues = function () {
            var val = [];
            $(this).each(function (index, element) {
                val.push($(element).val());
            });

            return val.join(",");
        };

        // 工具栏按钮事件绑定
        initToolBarActions();

        //编辑属性信息form验证规则
        $('#newItemForm').bootstrapValidator({
            message: '无效的值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            excluded: [':disabled'],
            fields: {
                propertyNo: {
                    trigger: 'blur',
                    validators: {
                        notEmpty: {
                            message: '编号不能为空'
                        },
                        regexp: {
                            regexp: /^[a-z|A-Z|0-9|_]*$/,
                            message: '仅限字母数字下划线,不能含有空格'
                        },
                        remote: {
                            data:{
                                "id": function(){return $("#newItemForm input[name='id']").val();},
                                "propertyName":function(){return $("#propertyName").val();},
                                "fieldName":"propertyNo"
                            },
                            url: '${ctx}/backend/json/ecommerce/product/categoryProperties/fieldValidate',
                            message: '该属性编号已存在'
                        }
                    }
                },
                propertyName: {
                    trigger: 'blur',
                    validators: {
                        notEmpty: {
                            message: '属性名不能为空'
                        },
                        remote: {
                            data:{
                                "id": function(){return $("#newItemForm input[name='id']").val();},
                                "propertyName":function(){return $("#propertyName").val();},
                                "fieldName":"propertyName"
                            },
                            url: '${ctx}/backend/json/ecommerce/product/categoryProperties/fieldValidate',
                            message: '该属性名已存在'
                        }
                    }
                }
            }
        });

        mainDataTable = $(".dataTables-example").on('init.dt', function () {
            $(".dataTables-example").on("click", ".btn_sort_up", function (element) {
                var id = $(this).attr("data-id");

                var prevElement;
                var found = false;
                $(".btn_sort_up").each(function () {
                    if (found){
                        return true;
                    }

                    var itemId = $(this).attr("data-id");
                    if (itemId == id){
                        found = true;
                    }
                    else{
                        prevElement = $(this);
                    }
                });

                if(!prevElement){
                    return;
                }

                seqNoExchange(id, $(prevElement).attr("data-id"));

            });

            $(".dataTables-example").on("click", ".btn_sort_down", function (element) {
                var id = $(this).attr("data-id");

                var nextElement;
                var found = false;
                var nextIndex = -1;
                $(".btn_sort_down").each(function (index) {
                    if (found){
                        return;
                    }

                    var itemId = $(this).attr("data-id");
                    if (itemId == id){
                        nextIndex = index+1;
                    }
                    else if(nextIndex == index){
                        nextElement = $(this);
                        found = true;
                    }
                });

                if(!nextElement){
                    return;
                }

                seqNoExchange(id, $(nextElement).attr("data-id"));
            });


            $(".dataTables-example").on("click", ".btn_edit", function (element) {
                $("#newItemForm")[0].reset();
                $("#newItemForm").data('bootstrapValidator').resetForm();
                $("#newItemDialogue").modal("show");
                var id = $(this).attr("data-id");
                $.ajax({
                    url: "${ctx}/backend/json/ecommerce/product/categoryProperties/update?id=" + id,
                    dataType: "json",
                    success: function (data) {
                        if (data.flag == "1") {
                            $("#newItemForm input[name='id']").val(id);
                            $("#newItemForm input[name='propertyNo']").val(data.propertyNo);
                            $("#newItemForm input[name='propertyName']").val(data.propertyName);
                            //$("#newItemForm input[name='displayFlag']").val(data.displayFlag);
                            if(data.displayFlag){
                                if(data.displayFlag==="1"){
                                    $("#radio_display").attr("checked",true);
                                    $("#radio_display_none").attr("checked",false);
                                }else{
                                    $("#radio_display_none").attr("checked",true);
                                    $("#radio_display").attr("checked",false);
                                }
                            }
                            $("#newItemForm input[name='displayType']").val(data.displayType);
                            var properties = "";
                            if(data.propertyValue&&data.propertyValue.value){
                                $.each(data.propertyValue.value,function(i,value){
                                    properties += value;
                                    if(i<data.propertyValue.value.length-1){
                                        properties +="\n";
                                    }
                                });
                            }
                            $("#propertyValue").text(properties);

                        } else {
                            toastError("操作提示", data.msg);
                        }
                    }
                });
            });

        }).DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": true, //过滤功能 search 功能
            "paging": true,
            "iDisplayLength": 50,
            "aLengthMenu": [50, 100, 150],
            "ordering": true,
            "order": [[1, "asc"]],
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
            "columns": [{
                data: "id",
                class: "text-center",
                bSortable: false,
                render: function (data, type, row) {
                    return "<input type='checkbox' name='checkId' value=\"" + row.id + "\"/>";
                }
            },  {
                data: "propertyNo",
                bSortable: false,
            }, {
                "data": "propertyName",
                "bSortable": false
            }, {
                "data": "productCategory"
            },
            {
                "data": "displayType",
            },
            {
                "data": "selectableValue",
                "render": function (data,type,row) {
                    var selectAbleVals = row.selectableValue&&row.selectableValue.value;
                    var selectDisplayVal = "";
                    if(selectAbleVals){
                        const endWord = ",  ";
                        $.each(selectAbleVals,function (i,value) {
                            selectDisplayVal += value;
                            if(i<selectAbleVals.length-1){
                                selectDisplayVal += endWord;
                            }
                        })
                    }
                    return selectDisplayVal;
                }
            }, {
                data: "displayFlag",
                bSortable: false,
                render: function(data, type, row, meta) {
                    //type 的值  dispaly sort filter
                    //代表，是显示类型的时候判断值的长度是否超过8，如果是则截取
                    //这里只处理了类型是显示的，过滤和排序返回原始数据
                    if (type === 'display') {
                        if (data == '1') {
                            return '<p class="text-center"><span class="glyphicon glyphicon-ok text-success"></span></p>';
                        } else {
                            return '<p class="text-center"><span class="glyphicon glyphicon-remove text-danger"></span></p>';
                        }
                    }
                    return data;
                }
            }, {
                data: "id",
                bSortable: false,
                render: function (data, type, row) {
                    var buttons = "<a class='btn btn-default btn-xs btn_sort_up' href=\"javascript:void(0);\" data-id='" + row.id + "'><i class='fa fa-long-arrow-up'></i></a>";
                    buttons += " <a class='btn btn-default btn-xs btn_sort_down' href=\"javascript:void(0);\" data-id='" + row.id + "' data-parent-id='" + row.parentId + "'><i class='fa fa-long-arrow-down'></i></a>";
                    buttons += " <a class='btn btn-primary btn-xs btn_edit' href=\"javascript:void(0);\" data-id='" + row.id + "' data-code='" + row.aliasName + "' data-name='" + row.title + "' data-memo='" + row.memo + "'>编辑</a>";
                    return buttons;

                }
            }],
            "ajax": {
                "url": "${ctx}/backend/json/ecommerce/product/categoryProperties?cpid=${cpid}",
                "type": "GET",
                "dataType": "json",
                "data": {}
            },
        });

        $('.dataTables-example tbody').on('click', 'tr', function (e) {
            // 排除按钮等
            if ($(e.target).is("button") || $(e.target).parent().is("button") || $(e.target).is("a") || $(e.target).parent().is("a")) {
                return;
            }

            $(this).toggleClass('selected');
            var checkbox = $(this).find("input[name='checkId']").first();

            $(checkbox).prop("checked", $(this).hasClass('selected'));
        });

        $("#toolbar_new").bind("click", function(){
            $("#newItemForm")[0].reset();
            $("#newItemForm").data('bootstrapValidator').resetForm();

            $("#newItemForm input[name='id']").val("");
            $("#newItemForm #rootName").text("商品分类属性");

            $('#productCategory').text('${categoryName}');

            $("#newItemDialogue").modal("show");
        });

        // Add event listener for opening and closing details
        $('#example tbody').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = table.row( tr );

            if ( row.child.isShown() ) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                // Open this row
                row.child( format(row.data()) ).show();
                tr.addClass('shown');
            }
        } );
    });



    function initToolBarActions() {

        // 刷新按钮
        $("#toolbar_reload").bind("click", function () {
            action_reload();
        });
        // 发布按钮
        $("#toolbar_publish").bind("click", function () {
            publishItems();
        });
        // 取消发布按钮
        $("#toolbar_unpublish").bind("click", function () {
            unpublishItems();
        });
        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });
    }

    function deleteItems() {
        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要删除的记录项");
            return;
        }

        BootstrapDialog.show({
            title: "删除确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认删除所选项？",
            buttons: [{
                label: '取消',
                action: function (dialogItself) {
                    dialogItself.close();
                }
            },
                {
                    label: '确认',
                    cssClass: "btn-primary",
                    action: function (dialogItself) {
                        $.ajax({
                            url: "${ctx}/backend/json/ecommerce/product/categoryProperties/deleteItems",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选项目已经删除！");
                                }
                                else if (data && data.flag == "0") {
                                    toastError("操作提示", data.msg);
                                }
                                else {
                                    toastError("操作提示", "删除失败！");
                                }
                            }
                        });
                    }
                }]
        });
    }


    function action_reload() {
        mainDataTable.ajax.reload();
    }

    function seqNoExchange(id1, id2) {
        $.ajax({
            url: "${ctx}/backend/json/ecommerce/product/categoryProperties/seqNoExchange",
            data: {
                id1: id1,
                id2: id2
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {

                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    function formValidate(){
        $("#newItemForm").data('bootstrapValidator').validate();
        const validFlag = $("#newItemForm").data('bootstrapValidator').isValid();
        if(!validFlag){
            return false;
        }
        else return true;
    }

    //保存分类属性
    function save (exitBeforeSuccess) {
        var formData = $("#newItemForm").serialize();
        console.log("formdata=" + JSON.stringify(formData));
        $.ajax({
            url: "${ctx}/backend/json/ecommerce/product/categoryProperties/createOrUpdate",
            data: formData,
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    if(exitBeforeSuccess){
                        $("#newItemDialogue").modal("hide");
                    }
                    toastSuccess("操作提示", "分类属性设置成功！");
                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    //重置分类属性表单
    function resetForm() {
        $("#newItemForm")[0].reset();
        $("#newItemForm").data('bootstrapValidator').resetForm();

        $("#newItemForm input[name='id']").val("");
        $("#newItemForm #rootName").text("商品分类属性");

        $('#productCategory').text('${categoryName}');
    }

    function saveAndNew() {
        const isValidate = formValidate();
        if(isValidate){
            save();
            resetForm();
        }
    }

    function saveAndQuit() {
        const isValidate = formValidate();
        if(isValidate){
            save(true);
        }
    }

</script>

