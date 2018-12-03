<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>友情链接列表</title>
    <meta name="module-group" content="column-management"/>
    <meta name="module-group" content="website-management"/>
    <meta name="module" content="web-links"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jeditable/jquery.jeditable.js"></script>

    <style type="text/css">
        table.dataTables-example{
            font-size: 13px;
        }
        select.input-sm{
            /*height:30px;*/
            /*line-height:30px;*/
            padding: 2px 5px;
        }
        .table-striped>tbody>tr.selected{
            background: whitesmoke;
        }

        .bootstrap-dialog.type-primary .modal-header{
            background-color:#1ab394;
        }

        .queryform label{
            margin-top: 5px;
            font-weight:normal;
        }

        select.input-sm{
            padding: 2px 10px;
        }

        .imageWrapper{
            height: 110px;
            width: 150px;
            overflow: hidden;
        }

        .imageWrapper img{

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
            <li>
                <a>友情链接管理</a>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>友情链接</h5>
                    <div class="ibox-tools">
                        <a href="${ctx}/backend/cms/webLinkform">
                            <i class="fa fa-file-o"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="javascript:void(0);" onclick="query();">刷新</a>
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
                            <table class="table table-striped table-bordered table-hover dataTables-example" width="100%" >
                                <thead>
                                <tr>
                                    <th width="20">
                                        <input type="checkbox" class="checkAll" checkTarget="checkId"/>
                                    </th>
                                    <th width="25">#</th>
                                    <th>单位名称</th>
                                    <th>链接标题</th>
                                    <th>链接网址</th>
                                    <th>备注</th>
                                    <th>序号</th>
                                    <th>操作</th>
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

<script type="text/javascript">
    var mainDataTable;

    $(document).ready(function () {

        $(".checkAll").click(function(){
            var checked = $(this).prop("checked");
            var target = $(this).attr("checkTarget");
            $("input[name='" + target + "']").each(function(){
                $(this).prop("checked", checked);

                $(this).parents("tr:first").toggleClass("selected", checked);
            });
        });

        $.fn.checkvalues = function(){
            var val = [];
            $(this).each(function(index, element){
                val.push($(element).val());
            });

            return val.join(",");
        };

        $('.datebox').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format: "yyyy/mm/dd"
        });

        // 工具栏按钮事件绑定
        initToolBarActions();

        mainDataTable = $(".dataTables-example").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": true, //过滤功能 search 功能
            "paging": true,
            "iDisplayLength": 30,
            "aLengthMenu": [30, 50, 100],
            "ordering": true,
            "order": [[ 6, "asc" ]],
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
                "bSortable": false
            }, {
                "data": "seq",
                class: "text-center",
                "bSortable": false
            },{
                "data": "targetName",
                "bSortable": false
            },{
                "data": "title",
                "bSortable": false
            },{
                "data": "url",
                "bSortable": false
            },{
                "data": "memo",
                "bSortable": false
            },{
                "data": "seqNo"
            },{
                "data": "id",
                "bSortable": false
            }],
            "ajax": {
                "url": "${ctx}/backend/cms/webLinks/list/data.json",
                "type": "POST",
                "dataType": "json",
                "data": {

                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        return "<input type='checkbox' name='checkId' value=\"" + row.id + "\"/>";

                    }, "targets": 0
                },
                {
                    "render": function (data, type, row) {
                        return "<a class='btn btn-primary btn-xs' href=\"webLinkform?id=" + row.id + "\">编辑</a>";

                    }, "targets": 7
                }
            ]
        });

        $('.dataTables-example tbody').on( 'click', 'tr', function (e) {

            $(this).toggleClass('selected');
            var checkbox = $(this).find("input[name='checkId']").first();

            $(checkbox).prop("checked", $(this).hasClass('selected'));
        } );
    });

    function query(){
        mainDataTable.ajax.reload();
    }

    function initToolBarActions(){

        // 删除按钮
        $("#toolbar_delete").bind("click", function(){
            deleteItems();
        });

    }

    function deleteItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要删除的记录");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认删除所选记录？",
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
                            url:"${ctx}/backend/cms/webLinks/delete.json",
                            data:{checkId: function(){return $("input[name='checkId']:checked").checkvalues();}},
                            success:function(data){
                                dialogItself.close();

                                if (data && data.flag == "1"){
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选记录已删除！");
                                }
                                else if (data && data.flag == "0"){
                                    toastError("操作提示", "系统繁忙，请稍后再试！");
                                }
                                else{
                                    toastError("操作提示", "系统繁忙，请稍后再试！");
                                }
                            }
                        });
                    }
                }]
        });
    }

</script>
