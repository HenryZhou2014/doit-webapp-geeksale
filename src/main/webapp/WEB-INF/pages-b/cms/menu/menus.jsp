<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>菜单管理</title>
    <meta name="heading" content="<fmt:message key='parameterList.heading'/>"/>
    <meta name="module-group" content="system-management"/>
    <meta name="module" content="system-parameters-setting"/>

    <link rel="stylesheet" href="${ctx}/resource/common/scripts/plugins/jqselectable/style/selectable/style.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/font-awesome-zTree.css" type="text/css">

    <script src="${ctx}/resource/common/scripts/zTree-v3.5.02/js/jquery.ztree.all-3.5.js"></script>

    <script src="${ctx}/resource/common/scripts/plugins/jqselectable/jqselectable.js"></script>

    <style type="text/css">
        .dataTables-example th {
            font-size: 13px;
        }

        .dataTables-example td {
            font-size: 13px;
        }

        table.table tr td {
            padding: 8px 0 0 8px;
        }

        .control-label {
            font-weight: normal;
        }

        label {
            font-weight: normal;
        }

        .form-group {
            margin-bottom: 5px;
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
                <a>网站管理</a>
            </li>
            <li class="active">
                <strong>菜单管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>菜单管理</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="javascript:void(0);">
                            <i class="fa fa-file-o"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/admin/parameters.html">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
                            </li>
                            <li>
                                <a href="${ctx}/backend/admin/parameterGroups">参数组维护</a>
                            </li>
                            <li>
                                <a id="toolbar_update_cache" href="javascript:void(0);">更新缓存</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">

                    <div class="row">
                        <div class="pull-left" style="width:200px;">
                            <ul id="treeDemo" class="ztree"></ul>
                        </div>
                        <div class="col-lg-9">
                            <div class="table-responsive">
                                <h2 id="group_name">
                                    <span id="groupName">应用管理</span>
                                    <input type="hidden" name="groupCode" id="groupCode" value=""/>
                                </h2>
                                <table class="table table-striped table-bordered table-hover dataTables-example"
                                       width="100%">

                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="itemEditDialogue" tabindex="-1" role="dialog"
         data-backdrop="false" data-show="false">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 600px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                        参数设置
                    </h4>
                </div>
                <div class="modal-body" style="min-height:300px;max-height: 455px;overflow: auto; position: relative;">

                    <form class="form-horizontal" id="itemEditForm">
                        <input type="hidden" name="id"/>
                        <input type="hidden" name="groupId"/>
                        <div class="form-group margin-top-20">
                            <label class="col-sm-2 control-label">参数组</label>
                            <div class="col-sm-8">
                                <div style="position: relative;">
                                    <div>
                                        <input id="citySel" name="citySel" type="text" class="form-control pull-left" readonly value="" style="width:180px;" onclick="showMenu();"/>
                                        <a id="menuBtn" class="btn btn-default btn-md margin-left-10 pull-left" href="#" onclick="showMenu(); return false;">选择</a>
                                    </div>

                                    <div id="menuContent" class="menuContent" style="display:none; position: absolute;z-index: 99999; border: 1px solid lightgrey; background: #fff;">
                                        <ul id="treeDemo2" class="ztree" style="margin-top:0; width:260px; height: 180px; background: #fff;overflow-y: auto;"></ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">编码</label>
                            <div class="col-sm-8">
                                <input type="text" name="parameterCode" placeholder="编码" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-8">
                                <input type="text" name="parameterName" placeholder="名称" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">默认值</label>
                            <div class="col-sm-8">
                                <input type="text" name="defaultValue" placeholder="默认值" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">说明</label>
                            <div class="col-sm-8">
                                <input type="text" name="parameterDesc" placeholder="说明" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label nopadding-top">值类型</label>
                            <div class="col-sm-8">
                                <label><input type="radio" name="dataType" value="text" data-tag="text"> 文本</label>
                                <label class="margin-left-10"><input type="radio" name="dataType" value="number" data-tag="number"> 数值</label>
                                <label class="margin-left-10"><input type="radio" name="dataType" value="select" data-tag="select"> 单选</label>
                                <label class="margin-left-10"><input type="radio" name="dataType" value="multi" data-tag="select"> 多选</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">值定义</label>
                            <div class="col-sm-10">
                                <div class="panel_0 data_option_panel" data-tag="text">
                                    无
                                </div>
                                <div class="panel_1 data_option_panel hidden" data-tag="number">
                                    <div class="form-group">
                                        <div class="col-lg-4">最小值</div>
                                        <div class="col-lg-8">
                                            <input type="text" name="min" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-4">最大值</div>
                                        <div class="col-lg-8">
                                            <input type="text" name="max" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel_2 data_option_panel hidden" data-tag="select">

                                    <div class="form-group">
                                        <div class="col-lg-4">
                                            <input type="text" name="itemValue" placeholder="值" class="form-control"/>
                                        </div>
                                        <div class="col-lg-7">
                                            <input type="text" name="itemText" placeholder="文本" class="form-control"/>
                                        </div>
                                        <div class="col-lg-1 nopadding nomargin">
                                            <a class="btn btn-default btn-xs margin-top-10"><i class="fa fa-plus fa-fw nopadding-right"></i></a>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-4">
                                            <input type="text" name="itemValue" placeholder="值" class="form-control"/>
                                        </div>
                                        <div class="col-lg-7">
                                            <input type="text" name="itemText" placeholder="文本" class="form-control"/>
                                        </div>
                                        <div class="col-lg-1 nopadding nomargin">
                                            <a class="btn btn-default btn-xs margin-top-10"><i class="fa fa-minus-circle fa-fw nopadding-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="updateItem();">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>

    <%--修改参数值对话框--%>
    <div class="modal fade" id="itemValueSettingDialogue" tabindex="-1" role="dialog"
         data-backdrop="false" data-show="false">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 600px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                        修改参数值
                    </h4>
                </div>
                <div class="modal-body" style="min-height:300px;max-height: 455px;overflow: auto; position: relative;">

                    <form class="form-horizontal" id="itemValueSettingForm">
                        <input type="hidden" name="id"/>
                        <input type="hidden" name="groupId"/>
                        <input type="hidden" name="dataType"/>
                        <div class="form-group margin-top-20">
                            <label class="col-sm-2 control-label">参数组</label>
                            <div class="col-sm-8">
                                <div style="position: relative;">
                                    <div>
                                        <input name="groupName" type="text" class="form-control" readonly/>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">编码</label>
                            <div class="col-sm-8">
                                <input type="text" name="parameterCode" placeholder="编码" class="form-control" readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-8">
                                <input type="text" name="parameterName" placeholder="名称" class="form-control" readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">值</label>
                            <div class="col-sm-8" id="value-setting-panel">

                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="updateItemValue();">
                        确认
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
</div>

<script id="valueSettingTemplate" type="text/html">

    {{if dataType == "text"}}
    <input type="text" name="itemValue" placeholder="值" class="form-control"/>
    {{else}}
    {{if dataType == "number"}}
    <div><input type="text" name="itemValue" placeholder="值" class="form-control"/></div>
    <div>(min:{{dataOptions.min}}, max:{{dataOptions.max}})</div>
    {{/if}}
    {{if dataType == "select"}}
    <select name="itemValue" class="col-lg-6 form-control">
        {{each dataOptions as dataItem i}}
        <option value="{{dataItem.value}}">{{dataItem.text}}</option>
        {{/each}}
    </select>
    {{/if}}
    {{if dataType == "multi"}}
    {{each dataOptions as dataItem i}}
    <label><input type="checkbox" value="{{dataItem.value}}"/>{{dataItem.text}}</label>
    {{/each}}
    {{/if}}
    {{/if}}
</script>

<script id="newItemTemplate" type="text/html">
    <div class="form-group">
        <div class="col-lg-4">
            <input type="text" name="itemValue" placeholder="值" class="form-control"/>
        </div>
        <div class="col-lg-7">
            <input type="text" name="itemText" placeholder="文本" class="form-control"/>
        </div>
        <div class="col-lg-1 nopadding nomargin">
            <a class="btn btn-default btn-xs margin-top-10"><i class="fa fa-minus-circle fa-fw nopadding-right"></i></a>
        </div>
    </div>
</script>

<script id="columnCodeTemplate" type="text/html">
    <div>{{menuName}}</div>
</script>

<script id="columnButtonsTemplate" type="text/html">
    <a class='btn btn-default btn-xs btn_edit' href="javascript:void(0);" data-id="{{id}}" data-group-id="{{groupId}}" data-code="{{parameterCode}}"
       data-name="{{parameterName}}" data-value="{{parameterValue}}" data-memo="{{parameterDesc}}" data-group-name="{{groupName}}"
       data-default-value="{{defaultValue}}" data-type="{{dataType}}" data-options="{{dataOptions}}">修改</a>
    <a class='btn btn-default btn-xs btn_config' href="javascript:void(0);" data-id="{{id}}" data-group-id="{{groupId}}" data-code="{{parameterCode}}"
       data-name="{{parameterName}}" data-value="{{parameterValue}}" data-memo="{{parameterDesc}}" data-group-name="{{groupName}}"
       data-default-value="{{defaultValue}}" data-type="{{dataType}}" data-options="{{dataOptions}}">配置</a>
</script>


<script type="text/javascript">

    var mainDataTable;

    $(document).ready(function () {

        var setting = {
            check: {
                enable: false
            },
            data: {
                simpleData: {
                    enable: false
                }
            },
            callback: {
                onClick: zTreeOnClick
            },
            async: {
                url: "${ctx}/backend/json/menu/menuGroups/ztree",
                otherParam:{
                    root: "root",
                    include:true,
                    depth:0,
                    open:2
                },
                enable: true,
                type: "post"
            }
        };

        var zNodes = [
            {
                name: "父节点1", children: [
                {name: "子节点1"},
                {name: "子节点2"}
            ]
            }
        ];

        $.fn.zTree.init($("#treeDemo"), setting, []);

        var setting2 = {
            check: {
                enable: true,
                chkStyle: "radio",
                radioType: "all"
            },
            view: {
                dblClickExpand: false
            },
            data: {
                simpleData: {
                    enable: false
                }
            },
            callback: {
                onClick: onClick2,
                onCheck: onCheck
            },
            async: {
                url: "${ctx}/backend/json/menu/menuGroups/ztree",
                otherParam:{
                    root: "root",
                    include:true,
                    depth:0,
                    open:2
                },
                enable: true,
                type: "post"
            }

        };

        var zNodes2 = [
            {id: 1, pId: 0, name: "北京"},
            {id: 2, pId: 0, name: "天津"},
            {id: 3, pId: 0, name: "上海"},
            {id: 6, pId: 0, name: "重庆"},
            {id: 4, pId: 0, name: "河北省", open: true, nocheck: true},
            {id: 41, pId: 4, name: "石家庄"},
            {id: 42, pId: 4, name: "保定"},
            {id: 43, pId: 4, name: "邯郸"},
            {id: 44, pId: 4, name: "承德"},
            {id: 5, pId: 0, name: "广东省", open: true, nocheck: true},
            {id: 51, pId: 5, name: "广州"},
            {id: 52, pId: 5, name: "深圳"},
            {id: 53, pId: 5, name: "东莞"},
            {id: 54, pId: 5, name: "佛山"},
            {id: 6, pId: 0, name: "福建省", open: true, nocheck: true},
            {id: 61, pId: 6, name: "福州"},
            {id: 62, pId: 6, name: "厦门"},
            {id: 63, pId: 6, name: "泉州"},
            {id: 64, pId: 6, name: "三明"}
        ];

        $.fn.zTree.init($("#treeDemo2"), setting2, []);

        $.fn.checkvalues = function () {
            var val = [];
            $(this).each(function (index, element) {
                val.push($(element).val());
            });

            return val.join(",");
        };

        mainDataTable = $(".dataTables-example").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
            "scrollY": "500px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
            "paging": false,
            "iDisplayLength": 25,
            "aLengthMenu": [25, 50, 100],
            "ordering": false,
//            "order": [[1, "desc"]],
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
                {"data": "id", class: "text-center", "bSortable": false, title: "<input type='checkbox' class='checkAll'' checkTarget='checkId'/>"},
                {"data": "seqNo", class: "text-center", "bSortable": false, title: "#"},
                {"data": "menuName", title: "名称", "bSortable": false},
                {"data": "groupName", title: "组", "bSortable": false},
                {"data": "url", title: "url", "bSortable": false},
//                {"data": "parameterDesc", title: "说明", "bSortable": false},
                {"data": "id", "bSortable": false, title: "操作"}
            ],
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        return "<input type='checkbox' name='checkId' value=\"" + row.id + "\"/>";

                    }, "targets": 0
                },
                {
                    "render": function (data, type, row) {
                        var html = template("columnCodeTemplate", row);
                        //                        var html = "<div class='imageWrapper'><img class='img-responsive block-center' src=\"" + row.thumbImageUrl + "\"/></div>";
                        return html;
                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
                        if(row.dataOption){
                            var dataOptions = JSON.stringify(row.dataOption);
                            row.dataOptions = dataOptions;
                        }
                        var html = template("columnButtonsTemplate", row);
                        return html;

                    }, "targets": 5
                }
            ],
            "ajax": {
                url: "${ctx}/backend/json/menu/menus",
                type: "POST",
                dataType: "json",
                data: {
                    groupCode: function () {
                        return $("#groupCode").val();
                    }
                }
            }
        });

        $(".dataTables-example").on("click", ".btn_edit", function () {
            var id = $(this).attr("data-id");
            var groupId = $(this).attr("data-group-id");
            var groupName = $(this).attr("data-group-name");
            var parameterCode = $(this).attr("data-code");
            var parameterName = $(this).attr("data-name");
            var parameterDesc = $(this).attr("data-memo");
            var defaultValue = $(this).attr("data-default-value");
            var dataValue = $(this).attr("data-value");
            var dataType = $(this).attr("data-type");
            var dataOptions = $(this).attr("data-options");

            if(dataType == ""){
                dataType = "text";
            }

            $("#itemValueSettingForm input[name='id']").val(id);
            $("#itemValueSettingForm input[name='groupName']").val(groupName);
            $("#itemValueSettingForm input[name='parameterCode']").val(parameterCode);
            $("#itemValueSettingForm input[name='parameterName']").val(parameterName);
            $("#itemValueSettingForm input[name='dataType']").val(dataType);
//            $("#itemValueSettingForm input[name='defaultValue']").val(defaultValue);

            if(dataOptions == ""){
                dataOptions = "[]";
            }

            // 显示值设置的模板
            var html = template("valueSettingTemplate", {dataType: dataType, dataValue:dataValue, dataOptions: JSON.parse(dataOptions)});
            $("#value-setting-panel").html($(html));

            // 设置值
            if(dataType == "text" || dataType == "number"){
                $("#itemValueSettingForm input[name='itemValue']").val(dataValue);
            }

            $("#itemValueSettingDialogue").modal("show");
        });

        $(".dataTables-example").on("click", ".btn_config", function () {
            var id = $(this).attr("data-id");
            var groupId = $(this).attr("data-group-id");
            var groupName = $(this).attr("data-group-name");
            var parameterCode = $(this).attr("data-code");
            var parameterName = $(this).attr("data-name");
            var parameterDesc = $(this).attr("data-memo");
            var defaultValue = $(this).attr("data-default-value");
            var dataType = $(this).attr("data-type");
            var dataOptions = $(this).attr("data-options");

            $("#itemEditForm input[name='id']").val(id);
            $("#itemEditForm input[name='groupId']").val(groupId);
            $("#itemEditForm input[name='citySel']").val(groupName);
            $("#itemEditForm input[name='parameterCode']").val(parameterCode);
            $("#itemEditForm input[name='parameterName']").val(parameterName);
            $("#itemEditForm input[name='defaultValue']").val(defaultValue);
            $("#itemEditForm input[name='parameterDesc']").val(parameterDesc);

            if(dataType == ""){
                dataType = "text";
            }
            if(dataOptions == ""){
                dataOptions = "[]";
            }

            $("#itemEditForm input[name='dataType'][data-tag='"+ dataType +"']").click();

            if(dataType == "number"){
                var options = JSON.parse(dataOptions);
                if(options.min){
                    $("#itemEditForm input[name='min']").val(options.min);
                }
                if(options.max){
                    $("#itemEditForm input[name='max']").val(options.max);
                }
            }
            else if(dataType == "select" || dataType == "multi"){
                var items = JSON.parse(dataOptions);
                $(".data_option_panel").html("");
                for(var i=0; i<items.length; i++){
                    var value = items[i].value;
                    var text = items[i].text;

                    var html = template("newItemTemplate", {value: value, text: text});
                    $(".data_option_panel").append($(html));
                }
            }

            var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
            var treeNode = zTree.getNodeByParam("id", groupId);
            if(treeNode){
                zTree.checkNode(treeNode, true, null, true);
            }
            else{
                zTree.checkAllNodes(false);
            }

            $("#itemEditDialogue").modal("show");
        });

        initToolBarActions();

        $("input[name='dataType']").change(function(){
//            var $selectedvalue = $("input[name='dataType']:checked").val();
            var tag = $("input[name='dataType']:checked").attr("data-tag");
            $(".data_option_panel").each(function(){
                var panelTag = $(this).attr("data-tag");
                if (panelTag == tag){
                    $(this).removeClass("hidden");
                }
                else{
                    $(this).addClass("hidden");
                }
            });
        });
    });

    function onClick2(e, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
        zTree.checkNode(treeNode, !treeNode.checked, null, true);
        return false;
    }

    function onCheck(e, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo2"),
            nodes = zTree.getCheckedNodes(true),
            v = "";
        var groupId = "";
        for (var i = 0, l = nodes.length; i < l; i++) {
            v += nodes[i].name + ",";
            groupId = nodes[i].id;
        }
        if (v.length > 0) v = v.substring(0, v.length - 1);
        var cityObj = $("#citySel");
        cityObj.attr("value", v);
        $("#itemEditForm input[name='groupId']").val(groupId);
    }

    function showMenu() {
        var cityObj = $("#citySel");
        var cityOffset = $("#citySel").offset();
        $("#menuContent").css({left: "0px", top: cityObj.outerHeight() + "px", display: "block"}).slideDown("fast");

        $("body").bind("mousedown", onBodyDown);
    }
    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }

    function onBodyDown(event) {
        if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
            hideMenu();
        }
    }

    function initToolBarActions() {
        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });

        // 新增
        $("#toolbar_new").bind("click", function () {
            $("#itemEditForm")[0].reset();
            $("#itemEditForm input[name='id']").val("");
            $("#itemEditForm input[name='groupId']").val("");

            var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
            zTree.checkAllNodes(false);

            $("#itemEditDialogue").modal("show");
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
            message: "<p>确认删除所选项？</p>",
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
                            url: "${ctx}/backend/json/admin/parameters/deleteItems",
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
                                    toastError("操作提示", "删除失败！");
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

    function updateItem() {

        var id = $("#itemEditForm input[name='id']").val();
        var groupId = $("#itemEditForm input[name='groupId']").val();
        var parameterCode = $("#itemEditForm input[name='parameterCode']").val();
        var parameterName = $("#itemEditForm input[name='parameterName']").val();
        var defaultValue = $("#itemEditForm input[name='defaultValue']").val();
        var parameterDesc = $("#itemEditForm input[name='parameterDesc']").val();
        var dataType = $("#itemEditForm input[name='dataType']:checked").val();
        var dataOptions = "";
        if(dataType == "number"){
            var min = $("#itemEditForm input[name='min']").val();;
            var max = $("#itemEditForm input[name='max']").val();;
            var options = {min : min, max : max};
            dataOptions = JSON.stringify(options);
        }
        else if(dataType == "select" || dataType == "multi"){
            var items = [];
            var size = $("#itemEditForm input[name='itemValue']").size();
            for(var i=0; i < size; i++){

                var value = $($("#itemEditForm input[name='itemValue']")[i]).val();
                var text = $($("#itemEditForm input[name='itemText']")[i]).val();
                items.push({value: value, text:text});
            }
            dataOptions = JSON.stringify(items);
        }

        $.ajax({
            url: "${ctx}/backend/json/admin/parameters/update",
            data: {
                id: id,
                groupId: groupId,
                parameterCode: parameterCode,
                parameterName: parameterName,
                defaultValue: defaultValue,
                parameterDesc: parameterDesc,
                dataType: dataType,
                dataOption: dataOptions
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#itemEditDialogue").modal("hide");
                    toastSuccess("操作提示", "参数设置成功！");
                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }

    function updateItemValue() {

        var id = $("#itemValueSettingForm input[name='id']").val();
        var dataValue;
        var dataType = $("#itemValueSettingForm input[name='dataType']").val();

        if(dataType == "number" || dataType == "text"){
            var min = $("#itemValueSettingForm input[name='min']").val();
            var max = $("#itemValueSettingForm input[name='max']").val();

            dataValue = $("#itemValueSettingForm input[name='itemValue']").val();
        }
        else if(dataType == "select"){
            dataValue = $("#itemValueSettingForm [name='itemValue']").val();
        }
        else if(dataType == "multi"){

        }
        else{
            dataValue = $("#itemValueSettingForm [name='itemValue']").val();
        }

        $.ajax({
            url: "${ctx}/backend/json/admin/parameters/updateValue",
            data: {
                id: id,
                parameterValue: dataValue
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    $("#itemValueSettingDialogue").modal("hide");
                    toastSuccess("操作提示", "参数值修改成功！");
                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", data.msg);
                }

            }
        });
    }


    function newItem() {
        var html = template("newItemTemplate", []);
        $("#newItemsForm").append(html);
    }

    function removeItem(element) {
        $(element).parents(".form-group").remove();
    }

    function action_reload() {
        location.href = '<c:url value="/app/admin/parameters"/>';
    }

    function zTreeOnClick(event, treeId, treeNode) {
        var groupCode = treeNode.aliasName;
        $("#groupCode").val(groupCode);

        mainDataTable.ajax.reload();
    }

    function zTreeCheckedNodeProcess() {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);
        var json = $.toJSON(nodes);

        $("#roleForm input[name=checkedRights]").val(json);
        $("#button_save").click();

    }


</script>
