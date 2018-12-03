<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>图书销售管理</title>
    <meta name="heading" content="<fmt:message key='articleList.heading'/>"/>
    <meta name="module-group" content="ecommerce-management"/>
    <meta name="module-subgroup" content="ecommerce-sale"/>
    <meta name="module" content="ecommerce-sale-management"/>

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
                <strong>图书销售管理</strong>
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
                            <div class="weight-600">图书销售管理</div>
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
                                <a id="toolbar_publish" href="javascript:void(0);">上架</a>
                            </li>
                            <li>
                                <a id="toolbar_unpublish" href="javascript:void(0);">下架</a>
                            </li>
                            <li>
                                <a id="toolbar_batch_update" href="javascript:void(0);" onclick="showBatchCategorySetting()">批量设置分类</a>
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

<!-- 分类属性设置模态框（Modal） -->
<div class="modal fade" id="categorySettingModal" tabindex="-1" role="dialog"
     aria-labelledby="categorySettingModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    商品销售分类
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-4">
                        <ul id="categorySettingTree" class="ztree" style="margin-top:0; width:100%; height: 400px; background: #fff;overflow-y: auto;"></ul>
                    </div>
                    <div class="col-lg-8">
                        <div class="row">
                            <ul id="checkedCategoryUl" class="list-inline list-unstyled col-sm-12" style="height:400px;overflow: scroll">

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div id="settingCategoryButtons" class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="setCategory();">
                    确定
                </button>
            </div>
            <div id="batchSettingCategoryButtons" class="modal-footer" style="display: none">
                <button type="button" class="btn btn-primary" onclick="batchSetCategory(true);">
                    批量添加
                </button>
                <button type="button" class="btn btn-primary" onclick="batchSetCategory(false);">
                    批量删除
                </button>
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 分类属性设置模态框结束（Modal） -->

<!-- 获奖属性设置模态框（Modal） -->
<div class="modal fade" id="winningSettingModal" tabindex="-1" role="dialog"
     aria-labelledby="winningSettingModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    获奖设置
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="ibox-content">
                        <form class="form-horizontal">
                            <div class="form-group"><label class="col-lg-2 control-label">获奖奖项</label>
                                <div class="col-lg-10"><input type="text" id="win_name"  class="form-control">
                                </div>
                            </div>
                            <div class="form-group"><label class="col-lg-2 control-label">获奖名次</label>
                                <div class="col-lg-10"><input type="text" id="win_no" class="form-control">
                                    <span class="help-block m-b-none">用于前台显示（置于图书图片右上角）如：畅销书一等奖</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="setWinning();">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 获奖属性设置模态框结束（Modal） -->

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
    {{/if}}
</script>

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
    <div class="size-12">
        <span class="goods_property_name">更新</span> <span class="goods_property_value">{{updateDate}}</span>
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
        <div>
            {{publishDate}}
        </div>
        {{/if}}
    </div>
</script>

<script id="columnSaleCategoryTemplate" type="text/html">
    <div>
        <a class='btn btn-info btn-xs' href="javascript:void(0);" onclick="showCategorySetting({{id}})">分类设置</a>
        <ul class="list-unstyled">
            {{each saleCategories as value i}}
            <li data-categoryId="{{id}}" title="{{value.fullTitle}}">{{value.title}}</li>
            {{/each}}
        </ul>
    </div>
</script>

<script id="columnButtonsTemplate" type="text/html">
    <div>
        <a class='btn btn-info btn-xs' href="javascript:void(0);" onclick="$('#saleInfoModal').modal('show');">销售设置</a><br />
        {{if goodSaleCategory==174}}
        <a class='btn btn-info btn-xs' href="javascript:void(0);" onclick="winningSetting({{id}})">获奖设置</a>
        {{/if}}
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
                {"data": "id","bSortable": false, title:"操作",width:"70px"},
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
                        if(goodSaleCategory){
                            row.goodSaleCategory = goodSaleCategory;
                        }
                        var html = template("columnButtonsTemplate", row);
                        return html;
                    }, "targets": 8
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
                    }
                }
            }
        });

        $('.dataTables-example tbody').on('click', 'tr', function (e) {

            $(this).toggleClass('selected');
            var checkbox = $(this).find("input[name='checkId']").first();

            $(checkbox).prop("checked", $(this).hasClass('selected'));
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
                    if(treeNode.id == goodSaleCategory){
                        return;
                    }
                    goodSaleCategory = treeNode.id;
                    goodSaleCategory_temp = treeNode.id;

                    if(goodSaleCategory){
                        $("#isCheckedCategoryMsg").hide();
                    }

                    const fullName = getNodeFullName(treeNode);
                    const html = template("checkedCategorySearchTemplate", {fullName:fullName,id:treeNode.id,tid:treeNode.tId});
                    $("#currentCheckedCategory").html(html);

                    mainDataTable.ajax.reload();
                }
            },
            async: {
                url: "${ctx}/backend/json/goodsSaleCategories/ztree",
                otherParam: {
                    root: "root",
                    include:true,
                    depth:0,
                    open:1
                },
                enable: true,
                type: "post"
            }
        };

        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, []);

        const categoryModalSetting = {
            check: {
                enable: true,
                chkStyle: "checkbox",
                chkboxType : {"Y": "null", "N": "null"},
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
                onCheck: onCheckCategory
            },
            async: {
                url: "${ctx}/backend/json/goodsSaleCategories/ztree",
                otherParam:{
                    include:true,
                    depth:0,
                    open:2
                },
                enable: true,
                type: "post"
            }

        };

        $.fn.zTree.init($("#categorySettingTree"), categoryModalSetting, []);

    });

    function query() {
        goodSaleCategory = "";
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
    }

    function deleteItems() {

        var selectedNum = $("input[name='checkId']:checked").length;
        if (selectedNum == 0) {
            toastWarning("提示", "请选择要删除的文章");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认删除所选文章？",
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
                                    toastSuccess("操作提示", "所选文章已删除！");
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
            toastWarning("提示", "请选择要取消发布的文章");
            return;
        }

        BootstrapDialog.show({
            title: "操作确认",
            draggable: true,
            size: BootstrapDialog.SIZE_NORMAL,
            message: "确认取消发布所选文章？",
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


    var sid;
    function showCategorySetting(id) {
        $("#batchSettingCategoryButtons").hide();
        $("#settingCategoryButtons").show();

        sid = id;
        $('#categorySettingModal').modal('show');

        const treeObj = $.fn.zTree.getZTreeObj("categorySettingTree");
        treeObj.checkAllNodes(false);
        $("#checkedCategoryUl").html("");

        $.ajax({
            url: "${ctx}/backend/json/goodsSaleCategories/initCategoryBySellOffer",
            data: {sid:id},
            success: function (data) {
                if (data && data.flag == "1" && data.goodSaleCategory) {
                    var treeArray = treeObj.transformToArray(treeObj.getNodes());
                    console.log(data.goodSaleCategory);
                    $.map(treeArray, function(treeNode, index) {
                        $.map(data.goodSaleCategory,function(id,index){
                            if(id == treeNode.id){
                                treeObj.checkNode(treeNode,true,true);
                                const fullName = getNodeFullName(treeNode);
                                const html = template("checkedCategoryTemplate", {fullName:fullName,id:treeNode.id,tid:treeNode.tId});
                                $("#checkedCategoryUl").append(html);
                            }
                        });
                    });
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
    //设置商品分类
    function setCategory() {
        const checkedTree = $.fn.zTree.getZTreeObj("categorySettingTree");
        const checkedTreeArray = checkedTree.getCheckedNodes(true);

        var array = $.map(checkedTreeArray, function(a, index) {
            return a.id;
        });

        if(!array){
            array = [];
        }

        $.ajax({
            url:"${ctx}/backend/json/goodsSaleCategories/addCategoryBySellOffer",
            dataType:'json',
            data:{cids:array,sid:sid},
            traditional: true,
            success:function(data) {
                if(data.flag == '1'){
                    $('#categorySettingModal').modal('hide');
                    var html = template("columnSaleCategoryTemplate", data);
                    var cellDom = mainDataTable.cell('#'+data.id,'categoryName:name').node();
                    $(cellDom).html(html);
                }else{
                    toastError("操作失败","更新图书分类信息未能成功，请重新操作！")
                }
            },
            error:function (e) {
                alert("操作失败！");
            }
        });
    }

    //商品分类设置-选中商品销售分类
    function onCheckCategory(event, treeId, treeNode) {
        console.log(treeNode);
        const tid = treeNode.tId;
        if(treeNode.checked){
            const fullName = getNodeFullName(treeNode);
            const html = template("checkedCategoryTemplate", {fullName:fullName,id:treeNode.id,tid:tid});
            $("#checkedCategoryUl").append(html);
        }else{
            $("#checkedCategoryLi_" + treeNode.id).remove();
        }
    }

    function getNodeFullName(treeNode){
        if(!treeNode.getParentNode()){
            return treeNode.name;
        }else{
            return getNodeFullName(treeNode.getParentNode()) + "-" + treeNode.name;
        }
    }
    //商品分类设置-去除商品销售分类
    function removeCheckedCategory(tid) {
        const treeObj = $.fn.zTree.getZTreeObj("categorySettingTree");
        console.log(tid);
        const treeNode = treeObj.getNodeByTId(tid);
        console.log(treeNode);
        treeObj.checkNode(treeNode, false, true);
    }

    //商品查询调教-取消当前选中的商品销售分类
    function removeCurrentCheckedCategory(tid){
        const treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        const treeNode = treeObj.getNodeByTId(tid);
        treeObj.cancelSelectedNode(treeNode);
        goodSaleCategory = "";
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


    var batchSettingSellOfferIds;
    //显示批量设置销售分类的modal
    function showBatchCategorySetting() {
        batchSettingSellOfferIds = $("input[name='checkId']:checked").checkvalues();

        if(!batchSettingSellOfferIds){
            toastError("批量操作分类","您当前未选中需要的图书，请选中至少一本图书，才能批量添加或删除图书的销售分类！");
            return;
        }


        $("#settingCategoryButtons").hide();
        $("#batchSettingCategoryButtons").show();

        const treeObj = $.fn.zTree.getZTreeObj("categorySettingTree");
        treeObj.checkAllNodes(false);
        $("#checkedCategoryUl").html("");

        $('#categorySettingModal').modal('show');
    }

    //批量设置销售分类
    function batchSetCategory(isAdd) {

        const checkedTree = $.fn.zTree.getZTreeObj("categorySettingTree");
        const checkedTreeArray = checkedTree.getCheckedNodes(true);

        const array = $.map(checkedTreeArray, function(a, index) {
            return a.id;
        });

        if(!array||array.length<=0){
            toastError("批量操作分类","您当前未选中任何分类！");
            return;
        }
        console.log("选中的分类id：");
        console.log(array);

        var url = "${ctx}/backend/json/goodsSaleCategories/addCategoriesAndSellOffers";
        if(!isAdd){
            url = "${ctx}/backend/json/goodsSaleCategories/delCategoriesAndSellOffers";
        }

        $.ajax({
            url:url,
            dataType:'json',
            data:{cids:array,sids:batchSettingSellOfferIds},
            traditional: true,
            success:function(data) {
                if(data.flag == '1'){
                    $('#categorySettingModal').modal('hide');
                    mainDataTable.ajax.reload();
                }else{
                    toastError("操作失败","更新图书分类信息未能成功，请重新操作！")
                }
            },
            error:function (e) {
                toastError("操作失败","更新图书分类信息未能成功，请重新操作！")
            }
        });
    }


    var sellOfferId;
    //获奖设置按钮点击事件
    function winningSetting(id) {
        $("#win_name").val("");
        $("#win_no").val("");

        sellOfferId = id;
        $.ajax({
            url:"${ctx}/backend/json/ecommerce/product/sellOffers/winningInfo",
            dataType:'json',
            data:{id:sellOfferId},
            traditional: true,
            success:function(data) {
                if(data.flag == '1'){
                    if(data.win_name){
                        $("#win_name").val(data.win_name);
                    }
                    if(data.win_no){
                        $("#win_no").val(data.win_no);
                    }
                }else{
                    toastError("操作失败","获取获奖信息失败，请重新操作！")
                }
            },
            error:function (e) {
                alert("操作失败！");
            }
        });

        $('#winningSettingModal').modal('show');
    }

    //获奖设置
    function setWinning() {
        const win_name = $("#win_name").val();
        const win_no = $("#win_no").val();

        if(!win_name||!win_no||!sellOfferId){
            toastError("操作失败","奖项和获奖名次不能为空，请重新操作！");
            return;
        }

        $.ajax({
            url:"${ctx}/backend/json/ecommerce/product/sellOffers/winningSetting",
            dataType:'json',
            data:{id:sellOfferId,win_name:win_name,win_no:win_no},
            traditional: true,
            success:function(data) {
                if(data.flag == '1'){
                    $('#winningSettingModal').modal('hide');

                }else{
                    toastError("操作失败","获奖设置未能成功，请重新操作！")
                }
            },
            error:function (e) {
                alert("操作失败！");
            }
        });
    }

</script>
