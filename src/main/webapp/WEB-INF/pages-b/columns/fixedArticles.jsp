<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>${columnMenu}-内容管理</title>
    <meta name="module-group" content="column-management"/>
    <meta name="module-subgroup" content="column-${columnName}"/>
    <meta name="module" content="column-${columnName}-fixedcontent"/>

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
                <a>栏目管理</a>
            </li>
            <li>
                <a>${columnMenu}</a>
            </li>
            <li>
                <a class="active">内容管理</a>
            </li>
        </ol>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>内容管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="panel">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover dataTables-example" width="100%" >
                                <thead>
                                <tr>
                                    <th width="25">#</th>
                                    <th>名称</th>
                                    <th>别名</th>
                                    <th>类型</th>
                                    <th>说明</th>
                                    <th>修改时间</th>
                                    <th>修改人</th>
                                    <th width="40">操作</th>
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

        // 工具栏按钮事件绑定
        initToolBarActions();

        mainDataTable = $(".dataTables-example").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
            "paging": false,
            "iDisplayLength": 30,
            "aLengthMenu": [30, 60, 100],
            "ordering": true,
            "order": [[ 2, "asc" ]],
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
                "data": "seqNo",
                class: "text-center",
                "bSortable": false
            }, {
                "data": "title"
            },{
                "data": "aliasName"
            }, {
                "data": "contentType"
            }, {
                "data": "memo",
                "bSortable": false
            },{
                "data": "updateDate",
                "bSortable": false
            },{
                "data": "updateBy",
                "bSortable": false
            },{
                "data": "id",
                "bSortable": false
            }],
            "ajax": {
                "url": "${ctx}/backend/json/column/fixed-articles",
                "type": "GET",
                "data": {
                    columnName: "${columnName}"
                }
            },
            "columnDefs": [
                {
                    "render": function (data, type, row) {

                        return "<security:authorize ifAnyGranted='ROLE_WEBSITE_FIXED_CONTENT_EDIT'><a class='btn btn-primary btn-xs' href=\"${ctx}/backend/column-${columnName}/fixed-articleform?id=" + row.id + "\">编辑</a></security:authorize>";

                    }, "targets": 7
                }
            ]
        });
    });

    function initToolBarActions() {
        // 刷新按钮
        $("#toolbar_reload").bind("click", function () {
            action_reload();
        });
    }

    function openItem(itemId) {
        location.href = "${ctx}/backend/cms/namedTextModuleform?id=" + itemId;
    }

    function viewItem(itemId) {
        location.href = "${ctx}/backend/cms/namedTextModuleform?id=" + itemId;
    }

    function action_reload() {
        location.href = '${ctx}/backend/column-${columnName}/fixed-articles';
    }

</script>
