<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>会员公司管理</title>
    <meta name="heading" content="<fmt:message key='namedTextModuleList.heading'/>"/>
    <meta name="module-group" content="account-management"/>
    <meta name="module" content="account-companyinfoes"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>

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
                <a>会员管理</a>
            </li>
            <li class="active">
                <strong>会员公司管理</strong>
            </li>
        </ol>
    </div>
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">


            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>会员公司管理</h5>
                    <div class="ibox-tools">
                        <a id="toolbar_new" href="${ctx}/backend/account/companyInfoform.html">
                            <i class="fa fa-file-o"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li><a id="toolbar_reload" href="${ctx}/backend/account/companyInfoes.html">刷新</a></li>
                            <li><a id="toolbar_delete" href="javascript:void(0);">删除</a></li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover dataTables-example" width="100%" >
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    var mainDataTable;
    var zTreeObj;
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
            "bFilter": true, //过滤功能 search 功能
            "paging": true,
            "iDisplayLength": 30,
            "aLengthMenu": [30, 60, 100],
            "ordering": true,
            "order": [[ 8, "desc" ]],
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
            "columns": [{data: "id",class: "text-center","bSortable": false, title:""},
                {"data": "seqNo",class: "text-center","bSortable": false, title:"#"},
                {"data": "account.userName",title:"会员"},
                {"data": "companyName",title:"公司名称"},
                {"data": "companyType",title:"类型"},
                {"data": "slogan",title:"品牌"},
                {"data": "linkPerson",title:"联系人"},
                {"data": "phoneNumber",title:"联系电话"},
                {"data": "createDate",title:"注册时间"},
                {"data": "id","bSortable": false,title:"操作"}],
            "ajax": {
                "url": "${ctx}/backend/account/companyInfoes/list",
                "type": "GET",
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
                        if (data == "1") return "主";
                        if (data == "2") return "分";
                        return data;

                    }, "targets": 4
                },
                {
                    "render": function (data, type, row) {
                        return "<a class='btn btn-primary btn-xs' href=\"companyInfoform?id=" + row.id + "\">编辑</a>";

                    }, "targets": 9
                }
            ]
        });

        $('.dataTables-example tbody').on( 'click', 'tr', function (e) {

            $(this).toggleClass('selected');
            var checkbox = $(this).find("input[name='checkId']").first();

            $(checkbox).prop("checked", $(this).hasClass('selected'));
        } );

    });

    function initToolBarActions() {
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
                            url:"${ctx}/backend/ecommerce/product/productCompanyInfos/deleteItems.json",
                            data:{checkId: function(){return $("input[name='checkId']:checked").checkvalues();}},
                            success:function(data){
                                dialogItself.close();

                                if (data && data.flag == "1"){
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选项目已经删除！");
                                }
                                else if (data && data.flag == "0"){
                                    toastError("操作提示", "删除失败！");
                                }
                                else{
                                    toastError("操作提示", "删除失败！");
                                }
                            }
                        });
                    }
                }]
        });
    }

    function openItem(itemId) {
        location.href = "${ctx}/backend/cms/namedTextModuleform?id=" + itemId;
    }

    function viewItem(itemId) {
        location.href = "${ctx}/backend/cms/namedTextModuleform?id=" + itemId;
    }

    function action_reload() {
        location.href = '${ctx}/backend/cms/namedTextModules';
    }

</script>
