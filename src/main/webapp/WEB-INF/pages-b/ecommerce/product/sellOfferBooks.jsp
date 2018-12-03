<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>图书列表</title>
    <meta name="heading" content="<fmt:message key='articleList.heading'/>"/>
    <meta name="module-group" content="ecommerce-management"/>
    <meta name="module-subgroup" content="ecommerce-product"/>
    <meta name="module" content="ecommerce-product-info"/>

    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/resource/common/scripts/zTree-v3.5.02/css/zTreeStyle/font-awesome-zTree.css" type="text/css">

    <script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
    <script src="${ctx}/resource/common/scripts/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="${ctx}/resource/common/scripts/zTree-v3.5.02/js/jquery.ztree.all-3.5.js"></script>

    <style type="text/css">
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
            width: 120px;
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
            <li class="active">
                <strong>图书管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>图书管理</h5>
                    <div class="ibox-tools">
                        <a href="${ctx}/backend/ecommerce/product/sellOfferform.html">
                            <i class="fa fa-file-o"></i> 增加
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i> 操作
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${ctx}/backend/ecommerce/product/sellOffers.html">刷新</a>
                            </li>
                            <li>
                                <a id="toolbar_publish" href="javascript:void(0);">上架</a>
                            </li>
                            <li>
                                <a id="toolbar_unpublish" href="javascript:void(0);">下架</a>
                            </li>
                            <li>
                                <a id="toolbar_updatecategory" href="javascript:void(0);">批量分类</a>
                            </li>
                            <li>
                                <a id="toolbar_setting" href="javascript:void(0);">批量设置</a>
                            </li>
                            <li>
                                <a id="toolbar_delete" href="javascript:void(0);">删除</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row" style="min-width:980px;">
                        <div class="col-lg-2">
                            <div class="tabs-container">
                                <div class="tab-content">
                                    <div id="tab-1" class="tab-pane active">
                                        <div class="panel-body" style="overflow:auto; padding: 5px;">
                                            <ul id="treeDemo" class="ztree"></ul>
                                        </div>
                                    </div>
                                    <div id="tab-2" class="tab-pane">
                                        <div class="panel-body" style="overflow:auto; padding: 5px;">
                                            <ul id="treeDemo2" class="ztree"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-10 queryform">
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
                                        <div class="form-group ">
                                            <label>上架状态</label>
                                            <select name="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="1">已上架</option>
                                                <option value="0">未上架</option>
                                                <option value="online">在线销售</option>
                                                <option value="3rd">第三方销售</option>
                                                <option value="noprice">未设置价格</option>
                                                <option value="nostock">无库存</option>
                                            </select>
                                        </div>
                                        <div class="form-group " style="margin-left:20px;">
                                            <label>类型</label>
                                            <select name="mediaTpye" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="PAPER">纸质书</option>
                                                <option value="EBOOK">电子书</option>
                                            </select>
                                        </div>

                                        <div class="form-group" style="width:400px;margin:2px 2px 2px 20px;">
                                            <label class="pull-left" style="padding:5px 5px 5px 0">发布日期</label>
                                            <div class="pull-left" style="width: 160px;">
                                                <div class="input-group">
                                                   <span class="input-group-addon">
                                                       <i class="fa fa-calendar"></i>
                                                   </span>
                                                    <input type="text"
                                                         name="publishDateStart"
                                                         class="form-control datebox"
                                                         value=""
                                                         style="width:110px;" >
                                                </div>
                                            </div>
                                            <div class="pull-left" style="margin-left: -5px;margin-right: 5px;">
                                                <span style="height:30px;line-height: 30px;">~</span>
                                            </div>
                                            <div class="pull-left" style="width: 160px;">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </span>
                                                        <input type="text"
                                                             name="publishDateEnd"
                                                             class="form-control datebox"
                                                             value=""
                                                             style="width:110px;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2" style="display: block;font-size: 0">
                                        <button class="btn btn-primary btn-sm" style="width:50px;height:32px;border-radius:0" type="button" onclick="query();">查询
                                        </button>
                                        <button class="btn btn-primary btn-sm" style="height:32px;border-radius:0;border-left: 1px solid dimgray" type="button" onclick="toggleViewMore(this);">
                                            <i class="fa fa-caret-down"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <!--查询区域结束-->

                            <hr style="margin-bottom: 10px; margin-top: 5px;"/>

                            <div class="panel">
                                <div class="table-responsive">
                                    <div class="pull-right form-inline">
                                     <select class="form-control">
                                        <option>发布时间</option>
                                        <option>更新时间</option>
                                        <option>商品编码</option>
                                        <option>商品名称</option>
                                    </select>
                                        <a class="btn btn-default btn-sm form-control nomargin-bottom"><i class="fa fa-long-arrow-down"></i>逆序</a>
                                    </div>
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

<!-- 批量设置模态框（Modal） -->
<div class="modal fade" id="settingModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    批量设置图书属性
                </h4>
            </div>
            <div class="modal-body">
                <form id="settingForm" class="form-horizontal">
                    <div class="form-group"><label class="col-sm-2 control-label">在线销售</label>
                        <div class="col-sm-10"><label class="checkbox-inline">
                            <input type="radio" name="buyAble" value="1" > 是 </label> <label class="checkbox-inline">
                            <input type="radio" name="buyAble" value="0" > 否 </label></div>
                    </div>
                    <div class="form-group"><label class="col-sm-2 control-label">发布</label>
                        <div class="col-sm-10"><label class="checkbox-inline">
                            <input type="radio" name="publish" value="1"> 发布 </label> <label class="checkbox-inline">
                            <input type="radio" name="publish" value="0"> 下架 </label></div>
                    </div>
                    <div class="form-group"><label class="col-sm-2 control-label">售价</label>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-md-6">
                                    <select class="form-control m-b" id="priceType" name="priceType">
                                        <option value="fixed">固定价格</option>
                                        <option value="addOrDel">价格增减</option>
                                        <option value="scale">价格按比例增减</option>
                                    </select>
                                </div>
                                <div class="col-md-6"><input type="number" name="price" placeholder="" class="form-control"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group"><label class="col-sm-2 control-label">库存</label>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-md-6">
                                    <select class="form-control m-b" id="stockType" name="stockType">
                                        <option value="fixed">固定数量</option>
                                        <option value="addOrDel">增减数量</option>
                                    </select>
                                </div>
                                <div class="col-md-6"><input type="number" name="stock" placeholder="" class="form-control"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="batchSetting();">
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
    <div class="size-12">
        <span class="goods_property_name">编号</span> <span class="goods_property_value">{{spu}}</span>
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
    <div class="size-12">
        <span class="goods_property_name">更新</span> <span class="goods_property_value">{{updateDate}}</span>
    </div>
</script>

<script id="sellOfferTypeTemplate" type="text/html">
    <div style="margin-bottom: 10px;">
        {{if mediaType == 'EBOOK'}}
            <span class="label label-info">电子书</span>
        {{else}}
            <span class="label">纸质书</span>
        {{/if}}
    </div>
    {{if onlinePreviewable == '1'}}
    <div>
        <a class="text-success" title="预览">
            <i class="fa fa-eye"></i> 预览
            {{if filePreview == '1'}}
            <i class="fa fa-check"></i>
            {{/if}}
        </a>
    </div>
    {{else}}
    <div>
        <div title="预览">
            <i class="fa fa-eye-slash"></i> 预览
            {{if filePreview == '1'}}
            <i class="fa fa-check"></i>
            {{/if}}
        </div>
    </div>
    {{/if}}

    {{if onlineReadingAble == '1'}}
    <div>
        <a class="text-success" title="免费阅读">
            <i class="fa fa-link"></i> 免费阅读
        </a>
    </div>
    {{/if}}

    {{if eBookTypePdf == '1'}}
    <div>
        <a class="text-success" title="PDF">
            <i class="fa fa-file-pdf-o"></i> PDF
            {{if filePDF == '1'}}
            <i class="fa fa-check"></i>
            {{/if}}
        </a>
    </div>
    {{else if filePDF == '1'}}
    <div>
        <div>
            <i class="fa fa-file-pdf-o"></i> PDF
            <i class="fa fa-check"></i>
        </div>
    </div>
    {{/if}}

    {{if eBookTypeEpub == '1'}}
    <div>
        <a class="text-success" title="EPUB">
            <i class="fa fa-file-powerpoint-o"></i> EPUB
            {{if fileEPUB == '1'}}
            <i class="fa fa-check"></i>
            {{/if}}
        </a>
    </div>
    {{else if fileEPUB == '1'}}
    <div>
        <div>
            <i class="fa fa-file-powerpoint-o"></i> EPUB
            <i class="fa fa-check"></i>
        </div>
    </div>
    {{/if}}
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
            <div>
                {{publishDate}}
            </div>
        {{/if}}
    </div>
</script>


<script id="columnButtonsTemplate" type="text/html">
    <div>
        <a class='btn btn-info btn-xs' href="javascript:void(0);" onclick="$('#saleInfoModal').modal('show');">销售设置</a>
    </div>
</script>

<script id="checkedCategoryTemplate" type="text/html">
    <li id="checkedCategoryLi_{{id}}" class="col-sm-12">
        <div class="alert alert-warning alert-dismissable" style="margin-bottom: 10px; padding: 5px 35px 5px 10px;">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button" onclick="removeCheckedCategory('{{tid}}')">×</button>
            {{fullName}}
        </div>
    </li>
</script>

<script id="checkedCategorySearchTemplate" type="text/html">
    <div id="currentCheckedCategory_{{id}}" class="col-sm-12">
        <div class="alert alert-info alert-dismissable" style="margin-bottom: 10px; padding: 5px 35px 5px 10px;">
            <span>当前选中的销售分类:</span>
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button" onclick="removeCurrentCheckedCategory('{{tid}}')">×</button>
            {{fullName}}
        </div>
    </div>
</script>

<script type="text/javascript">
    var mainDataTable;
    var zTreeObj;
    var zTreeObj2;

    var productCategoryId = "";

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
                onClick: function(event, treeId, treeNode){
                    if(treeNode.id == productCategoryId){
                        return;
                    }
                    productCategoryId = treeNode.id;

                    if(productCategoryId){
                        $("#isCheckedCategoryMsg").hide();
                    }

                    const fullName = getNodeFullName(treeNode);
                    const html = template("checkedCategorySearchTemplate", {fullName:fullName,id:treeNode.id,tid:treeNode.tId});
                    $("#currentCheckedCategory").html(html);
                    mainDataTable.ajax.reload();
                }
            },
            async: {
                url: "${ctx}/backend/json/productCategories/ztree",
                otherParam:{
                    include:true,
                    depth:0,
                    open:1
                },
                enable: true,
                type: "post"
            }
        };


        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, []);

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
                {"data": "id","bSortable": false, title:"商品",width:'420px'},
                {"data": "categoryName","name":"categoryName","bSortable": false, title:"中图分类",width:'240px'},
                {"data": "mediaType", title:"类型","bSortable": false},
                {"data": "price", title:"价格","bSortable": false},
                {"data": "stockNum", title:"库存","bSortable": false},
                {"data": "id", title:"销售"},
                {"data": "publishFlag","bSortable": false, title:"状态"},
                {"data": "id","bSortable": false, title:"操作",width:"70px"},
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
                        var html = template("sellOfferTypeTemplate", row);

                        return html;
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
                },
                {
                    "render": function (data, type, row) {
                        return "<a class='btn btn-primary btn-xs' href=\"sellOfferform?id=" + row.id + "\">编辑</a>";

                    }, "targets": 8
                }
            ],
            "ajax": {
                url: "${ctx}/backend/ecommerce/product/sellOffer/items.json",
                type: "POST",
                dataType: "json",
                data: {
                    productCategoryId: function () {
                        return productCategoryId?productCategoryId:"";
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
                    }
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
        category = "";
        mainDataTable.ajax.reload();
    }

    function initToolBarActions() {

        // 删除按钮
        $("#toolbar_delete").bind("click", function () {
            deleteItems();
        });

        // 发布
        $("#toolbar_publish").bind("click", function () {
            publishItems();
        });

        // 取消发布
        $("#toolbar_unpublish").bind("click", function () {
            unpublishItems();
        });

        // 分类更新
        $("#toolbar_updatecategory").bind("click", function () {
            updatecategoryItems();
        });

        // 批量设置
        $("#toolbar_setting").bind("click", function () {
            settingItems();
        });

    }

    function deleteItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要删除的商品");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认删除所选商品？",
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
                            url: "${ctx}/backend/json/ecommerce/product/sellOffers/trash",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选商品已删除！");
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

    function unpublishItems() {
        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要取消发布的商品");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认取消发布所选商品？",
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
                            url: "${ctx}/backend/json/ecommerce/product/sellOffers/unpublish",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选商品已下架！");
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

    function publishItems() {
        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要上架的商品");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认上架所选商品？",
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
                            url: "${ctx}/backend/json/ecommerce/product/sellOffers/publish",
                            data: {
                                checkId: function () {
                                    return $("input[name='checkId']:checked").checkvalues();
                                }
                            },
                            success: function (data) {
                                dialogItself.close();

                                if (data && data.flag == "1") {
                                    mainDataTable.ajax.reload();
                                    toastSuccess("操作提示", "所选商品已上架！");
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

    function updatecategoryItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要更改分类的商品");
            return;
        }

        $('#myModal').modal('show');
    }

    //批量设置
    function settingItems() {
        var checkId = $("input[name='checkId']:checked").checkvalues();
        if(!checkId){
            toastError("操作提示", "请选择要批量操作的图书！");
            return;
        }

        $("#settingForm")[0].reset();
        $('#settingModal').modal('show');
    }

    function updateCategory() {
        var categoryId = $("#modalCategoryId[name='categoryId']").val();

        $.ajax({
            url: "${ctx}/backend/json/ecommerce/product/sellOffers/updateCategory",
            data: {
                checkId: function () {
                    return $("input[name='checkId']:checked").checkvalues();
                },
                categoryId: categoryId
            },
            success: function (data) {
                $('#myModal').modal('hide');
                if (data && data.flag == "1") {
                    mainDataTable.ajax.reload();
                    toastSuccess("操作提示", "所选商品分类已更改成功！");
                }
                else if (data && data.flag == "0") {
                    toastError("操作提示", "系统繁忙，请稍后再试！");
                }
                else {
                    toastError("操作提示", "系统繁忙，请稍后再试！");
                }
            }
        });
    }

    function getNodeFullName(treeNode){
        if(!treeNode.getParentNode()){
            return treeNode.name;
        }else{
            return getNodeFullName(treeNode.getParentNode()) + "-" + treeNode.name;
        }
    }
    //商品查询调教-取消当前选中的商品销售分类
    function removeCurrentCheckedCategory(tid){
        const treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        const treeNode = treeObj.getNodeByTId(tid);
        treeObj.cancelSelectedNode(treeNode);
        productCategoryId = "";
    }
    function toggleViewMore(currentObj) {

        const isHiden = $("#search_area").hasClass("search_view_more");
        if(isHiden){
            $("#search_area").removeClass("search_view_more");
            $(currentObj).find("i").attr("class","fa fa-caret-up");
        }else{
            $("#search_area").addClass("search_view_more");
            $(currentObj).find("i").attr("class","fa fa-caret-down");
        }
    }
    
    function batchSetting() {
        var checkId = $("input[name='checkId']:checked").checkvalues();
        if(!checkId){
            toastError("操作提示", "请选择要批量操作的图书！");
            return;
        }

        $.ajax({
            url: "${ctx}/backend/ecommerce/product/sellOffers/batchSetting.json",
            data: {
                checkId: function () {
                    return $("input[name='checkId']:checked").checkvalues();
                },
                buyAble:$("input:radio[name='buyAble']:checked").val(),
                publish:$("input:radio[name='publish']:checked").val(),
                priceType:$('#priceType').val(),
                price:$("input[name='price']").val(),
                stockType:$('#stockType').val(),
                stock:$("input[name='stock']").val()
            },
            success: function (data) {
                $('#myModal').modal('hide');
                if (data && data.flag == "1") {
                    $("#settingModal").modal("hide");
                    mainDataTable.ajax.reload();
                    toastSuccess("操作提示", "属性设置成功！");
                }
                else if (data && data.flag == "0") {
                    toastError("操作提示", "系统繁忙，请稍后再试！");
                }
                else {
                    toastError("操作提示", "系统繁忙，请稍后再试！");
                }
            }
        });
    }
    
</script>
