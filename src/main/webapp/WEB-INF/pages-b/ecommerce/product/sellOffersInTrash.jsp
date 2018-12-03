<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>商品回收站管理</title>
    <meta name="heading" content="<fmt:message key='articleList.heading'/>"/>
    <meta name="module-group" content="ecommerce-management"/>
    <%--<meta name="module-subgroup" content="ecommerce-sale"/>--%>
    <meta name="module" content="ecommerce-product-trash"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/plugins/jqselectable/style/selectable/style.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/font-awesome-zTree.css" type="text/css">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jeditable/jquery.jeditable.js"></script>

    <script src="${ctx}/resource/common/scripts/zTree-v3.5.02/js/jquery.ztree.all-3.5.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jqselectable/jqselectable.js"></script>

    <style type="text/css">
        i.icon-center{
            padding-right: 0;
        }

        table.dataTables-example {
            font-size: 13px;
        }

        select.input-sm {
            /*height:30px;*/
            /*line-height:30px;*/
            padding: 2px 5px;
        }

        .table-striped > tbody > tr.selected {
            background: whitesmoke;
        }

        .bootstrap-dialog.type-primary .modal-header {
            background-color: #1ab394;
        }

        .queryform label {
            margin-top: 5px;
            font-weight: normal;
        }

        select.input-sm {
            padding: 2px 10px;
        }

        .imageWrapper {
            height: 100px;
            width: 160px;
            overflow: hidden;
        }

        .imageWrapper img {

        }

        .goods_property_name{
            width:60px;
            display: inline-block;
        }

        .goods_property_value{

        }

        .saleInfo .form-group{
            margin-bottom: 5px;
        }

        .search_input_group{
            width:260px;
        }

        .search_input_group input{
            margin:2px;
            padding:0
        }
        .search_view_more{
            overflow-y: hidden;
            height:40px;
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
                <a>书城管理</a>
            </li>
            <li>
                <a>销售管理</a>
            </li>
            <li class="active">
                <strong>商品回收站管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">

                    <ul class="pull-left list-inline list-unstyled">
                        <li>
                            <div class="weight-600">商品回收站管理</div>
                        </li>
                    </ul>
                    <div class="ibox-tools">

                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/ecommerce/product/sellOffers.html">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_resume" href="javascript:void(0);">恢复</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">彻底删除</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row" style="min-width:980px;">
                        <div class="col-lg-12 queryform">
                            <!--查询区域-->
                            <form id="productInfoform" class="form-inline" style="margin-bottom: 5px;">
                                <div class="row" id="currentCheckedCategory">

                                </div>
                                <div class="row">
                                    <div class="col-sm-10 search_view_more" id="search_area">
                                        <div class="form-group search_input_group">
                                            <label class="control-label" for="productName">书名</label>
                                            <input type="text" class="form-control" id="productName" name="productName" placeholder="">
                                        </div>
                                        <div class="form-group search_input_group">
                                            <label class="control-label" for="SPU">编号</label>
                                            <input type="text" class="form-control" id="SPU" name="SPU" placeholder="">
                                        </div>
                                        <div class="form-group search_input_group">
                                            <select name="offerProperty" class="form-control">
                                                <option value="ISBN">ISBN</option>
                                                <option value="author">作者</option>
                                                <option value="pressName">出版社</option>
                                            </select>
                                            <input type="text" class="form-control" id="offerPropertyVal" name="offerPropertyVal" >
                                        </div>

                                    </div>
                                    <div class="col-sm-2" style="display: block;font-size: 0">
                                        <button class="btn btn-primary btn-sm" style="width:50px;height:32px;border-radius:0" type="button" onclick="query();">查询</button>
                                    </div>
                                </div>
                            </form>
                            <!--查询区域结束-->

                            <hr style="margin-bottom: 10px; margin-top: 5px;"/>

                            <div class="panel">
                                <div class="table-responsive">
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
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    批量更改商品分类
                </h4>
            </div>
            <div class="modal-body">
                <select name="categoryId" class="form-control" id="modalCategoryId">
                    <option value="">全部</option>
                    <c:forEach items="${productCategoryList}" var="item">
                        <option value="${item.id}">${item.title}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="updateCategory();">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="saleInfoModal" tabindex="-1" role="dialog"
     aria-labelledby="saleInfoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="saleInfoModalLabel">
                    商品销售信息
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal saleInfo">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="form-group">
                                <label class="col-sm-3">书名</label>
                                <div class="col-sm-9">
                                    MySQL内核：InnoDB存储引擎 卷1
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">编号</label>
                                <div class="col-sm-9">
                                    9787121229084003
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">标题</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">副标题</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">价格</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">市场价</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">库存</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control"/>
                                </div>
                            </div>
                            <hr/>
                            <div class="form-group">
                                <label class="col-sm-3">在线销售</label>
                                <div class="col-sm-9">
                                    <label class="radio-inline"><input type="radio" id="saleOnlineYes" name="saleOnline"/> 是</label>
                                    <label class="radio-inline"><input type="radio" id="saleOnlineNo" name="saleOnline"/> 否</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3">其他销售平台</label>
                                <div class="col-sm-9">
                                    <div class="form-inline">
                                        <label class="radio-inline"><input type="checkbox"/> 天猫</label>
                                        <input type="text" class="form-control" style="width:300px;"/>
                                    </div>
                                    <div class="form-inline" style="margin-top: 5px;">
                                        <label class="radio-inline"><input type="checkbox"/> 京东</label>
                                        <input type="text" class="form-control" style="width:300px;"/>
                                    </div>
                                    <div class="form-inline" style="margin-top: 5px;">
                                        <label class="radio-inline"><input type="checkbox"/> 淘宝</label>
                                        <input type="text" class="form-control" style="width:300px;"/>
                                    </div>
                                    <div class="form-inline" style="margin-top: 5px;">
                                        <label class="radio-inline"><input type="checkbox"/> 当当</label>
                                        <input type="text" class="form-control" style="width:300px;"/>
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
                <button type="button" class="btn btn-primary" onclick="updateCategory();">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script id="sellOfferInfoTemplate" type="text/html">
    {{if thumbImageUrl}}
    <div class='pull-right imageWrapper'>
        <img class='img-responsive block-center' src="{{thumbImageUrl}}"/>
    </div>
    {{/if}}

    <div>
        <h4><a>{{productName}}</a></h4>
    </div>
    <div>
        <span class="goods_property_name">商品编号</span> <span class="goods_property_value">{{sku}}</span>
    </div>
    <div>
        <span class="goods_property_name">中图分类</span> <span class="goods_property_value">{{categoryName}}</span>
    </div>
    <div class="size-12">
        <span class="goods_property_name">ISBN</span> <span class="goods_property_value">{{isbn}}</span>
    </div>
    <div class="size-12">
        <span class="goods_property_name">作者</span> <span class="goods_property_value">{{author}}</span>
    </div>
    <div class="size-12">
        <span class="goods_property_name">出版社</span> <span class="goods_property_value">{{pressName}}</span>
    </div>
</script>

<script id="columnSaleChannelTemplate" type="text/html">
    <div>
        {{if buyable == '1'}}
        <div>
            <a class="text-success" title="在线销售">
                <i class="fa fa-shopping-cart"></i> 在线销售
            </a>
        </div>
        {{/if}}

        {{if buyable2 == '1'}}
        <div>
            <a title="已配置天猫链接">
                <i class="fa fa-share-alt"></i> 天猫销售
            </a>
        </div>
        {{/if}}
    </div>
</script>

<script id="columnStatusTemplate" type="text/html">
    <div>
        {{if publishFlag == '1'}}
        <div>
            <a title="已发布">
                <i class="fa fa-check text-success"></i> 已发布
            </a>
        </div>
        {{/if}}
    </div>
</script>

<script id="columnSaleCategoryTemplate" type="text/html">
    <div>
        <ul class="list-unstyled">
            {{each saleCategories as value i}}
            <li data-categoryId="{{id}}" title="{{value.fullTitle}}">{{value.title}}</li>
            {{/each}}
        </ul>
    </div>
</script>

<script type="text/javascript">
    var mainDataTable;
    var zTreeObj;

    var goodSaleCategory = "";
    var goodSaleCategory_temp = "";

    $(document).ready(function () {
        // 工具栏按钮事件绑定
        initToolBarActions();

        $(document).on("click", ".checkAll", function(){
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

        $('.datebox').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format: "yyyy/mm/dd"
        });

        mainDataTable = $(".dataTables-example").DataTable({
//            dom: '<"html5buttons"B>lTfgitp',
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true,
//            "scrollY": "600px",
            "scrollCollapse": true,
            "bFilter": false, //过滤功能 search 功能
            "paging": true,
            "iDisplayLength": 25,
            "aLengthMenu": [25, 50, 100],
            "ordering": true,
            "order": [[1, "desc"]],
            "pagingType": "full_numbers",
            "rowId":"id",
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
                {"data": "id", class: "text-center", "bSortable": false, title:"<input type='checkbox' class='checkAll'' checkTarget='checkId'/>"},
//                {"data": "spu", class: "text-center", "bSortable": false, title:"编号"},
                {"data": "id","bSortable": false, title:"商品",width:'320px'},
                {"data": "categoryName","name":"categoryName","bSortable": false, title:"销售分类"},
                {"data": "mediaType", title:"类型","bSortable": false},
                {"data": "price", title:"价格","bSortable": false},
                {"data": "stockNum", title:"库存","bSortable": false},
                {"data": "id", title:"销售"},
                {"data": "publishFlag","bSortable": false, title:"状态"},
                {"data": "seqNo","visible": false,"name" : "seqNo"}
            ],
            "columnDefs": [
                {
                    "render": function (data, type, row) {
                        return "<input type='checkbox' name='checkId' value=\"" + row.id + "\"/>";

                    }, "targets": 0
                },
                {
                    "render": function (data, type, row) {
                        var html = template("sellOfferInfoTemplate", row);
//                        var html = "<div class='imageWrapper'><img class='img-responsive block-center' src=\"" + row.thumbImageUrl + "\"/></div>";
                        return html;
                    }, "targets": 1
                },
                {
                    "render": function (data, type, row) {
                        var html = template("columnSaleCategoryTemplate", row);
                        return html;
                    }, "targets": 2
                },
                {
                    "render": function (data, type, row) {
//                        var html = template("sellOfferInfoTemplate", row);
                        if(data == "EBOOK"){
                            return "电子书";
                        }

                        return "纸质书";
                    }, "targets": 3
                },
                {
                    "render": function (data, type, row) {
                        var html = template("columnSaleChannelTemplate", row);
                        return html;

                    }, "targets": 6
                },
                {
                    "render": function (data, type, row) {
                        var html = template("columnStatusTemplate", row);
                        return html;

                    }, "targets": 7
                }
            ],
            "ajax": {
                url: "${ctx}/backend/ecommerce/product/items.json",
                type: "POST",
                dataType: "json",
                data: {
                    goodSaleCategory: function () {
                        return goodSaleCategory?goodSaleCategory:"";
                    },
                    SPU:function () {
                        const spu = $("input[name='SPU']").val();
                        return spu?spu:"";
                    },
                    productName: function () {
                        const productName = $("input[name='productName']").val();
                        return productName?productName:"";
                    },
                    offerProperty: function () {
                        const offerProperty = $("select[name='offerProperty']").val();
                        return offerProperty?offerProperty:"";
                    },
                    offerPropertyVal: function () {
                        const offerPropertyVal = $("input[name='offerPropertyVal']").val();
                        return offerPropertyVal?offerPropertyVal:"";
                    },
                    mediaTpye:function () {
                        const mediaTpye = $("select[name='mediaTpye']").val();
                        return mediaTpye?mediaTpye:"";
                    },
                    publishDateStart: function () {
                        const publishDateStart = $("input[name='publishDateStart']").val();
                        return publishDateStart?publishDateStart:"";
                    },
                    publishDateEnd: function () {
                        const publishDateEnd = $("input[name='publishDateEnd']").val();
                        return publishDateEnd?publishDateEnd:"";
                    },
                    editDateStart: function () {
                        const editDateStart = $("input[name='editDateStart']").val();
                        return editDateStart?editDateStart:"";
                    },
                    editDateEnd: function () {
                        const editDateEnd = $("input[name='editDateEnd']").val();
                        return editDateEnd?editDateEnd:"";
                    },
                    publishStatus: function () {
                        const publishFlag = $("input[name='publishFlag']:checked").checkvalues();
                        return publishFlag?publishFlag:"";
                    },
                    deleteFlag : "1"
                }
            }
        });

        $('.dataTables-example tbody').on('click', 'tr', function (e) {

            $(this).toggleClass('selected');
            var checkbox = $(this).find("input[name='checkId']").first();

            $(checkbox).prop("checked", $(this).hasClass('selected'));
        });

    });

    function query() {
        mainDataTable.ajax.reload();
    }

    function initToolBarActions() {

        // 恢复
        $("#toolbar_resume").bind("click", function () {
            resumeItems();
        });

        // 彻底删除
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });
    }

    function deleteItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要删除的图书");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认删除所选图书？",
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
                            url: "${ctx}/backend/json/ecommerce/product/sellOffers/realDelete",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选图书已删除！");
                                }
                                else if (data && data.flag == "0") {
                                    toastError("操作提示", "操作失败！");
                                }
                                else {
                                    toastError("操作提示", "操作失败！");
                                }
                            }
                        });
                    }
                }]
        });
    }

    function resumeItems() {
        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要恢复的图书");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认恢复所选图书？",
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
                            url: "${ctx}/backend/json/ecommerce/product/sellOffers/resume",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选图书已恢复！");
                                }
                                else if (data && data.flag == "0") {
                                    toastError("操作提示", "操作失败！");
                                }
                                else {
                                    toastError("操作提示", "操作失败！");
                                }
                            }
                        });
                    }
                }]
        });
    }



</script>
