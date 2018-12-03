<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>

<head>
    <title>图书展示管理</title>
    <meta name="heading" content="<fmt:message key='articleList.heading'/>"/>
    <meta name="module-group" content="ecommerce-management"/>
    <meta name="module-subgroup" content="ecommerce-sale"/>
    <meta name="module" content="ecommerce-presentation-management"/>

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
                <strong>图书展示管理</strong>
            </li>
        </ol>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <div class="weight-600">图书展示管理</div>
                </div>
                <div class="ibox-content">
                    <div class="row" style="min-width:980px;">
                        <div class="col-lg-2">
                            <div class="tabs-container">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#tab-1">销售目录</a></li>
                                </ul>
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
                                <div class="alert alert-warning" id="isCheckedCategoryMsg">
                                    进行排序操作前必须选中一个销售分类，请在左边销售目录下选择一个分类
                                </div>
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
        <ul class="list-unstyled">
            {{each saleCategories as value i}}
            <li data-categoryId="{{id}}" title="{{value.fullTitle}}">{{value.title}}</li>
            {{/each}}
        </ul>
    </div>
</script>

<script id="columnButtonsTemplate" type="text/html">
    <div>
        <button class="btn btn-default btn-circle" type="button" onclick="sort({{id}},'up')">
            <i class="fa fa-long-arrow-up icon-center"></i>
        </button>
        <button class="btn btn-default btn-circle" type="button" onclick="sort({{id}},'down')">
            <i class="fa fa-long-arrow-down icon-center"></i>
        </button>
        <br />
        {{if !isTop }}
        <div>
            <a class="btn btn-sm btn-primary btn-rounded" href="javascript:void(0)" onclick="sortTop({{id}})">置顶</a>
        </div>
        {{/if}}
        {{if !isBottom }}
        <div>
            <a class="btn btn-sm btn-primary btn-rounded" href="javascript:void(0)" onclick="sortBottom({{id}})">置底</a>
        </div>
        {{/if}}
    </div>
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

    var goodSaleCategory = "";
    var goodSaleCategory_temp = "";

    $(document).ready(function () {

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
            "order": [[9, "desc"]],
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
                {"data": "seqNo","visible": false,"name" : "seqNo"},
                {"data": "isTop","visible": false,"name" : "isTop"},
                {"data": "isBottom","visible": false,"name" : "isBottom"}
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
                        var html = template("columnButtonsTemplate", row);
                        return html;
                    }, "targets": 8
                }
            ],
            "ajax": {
                url: "${ctx}/backend/json/ecommerce/product/sellOfferPresentationManagement",
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
    });

    function query() {
        //goodSaleCategory = "";
        mainDataTable.ajax.reload();
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

    //商品显示排序
    function sort(id,dir) {
        const currentRow = mainDataTable.row('#'+id);
        const currentRowNode = $(currentRow.node());

        var willChangeId;

        if(dir == "up"){
            willChangeId = $(currentRowNode).prev().attr("id");
            console.log($(currentRow.node()).prev().attr("id"));
        }else{
            willChangeId = $(currentRowNode).next().attr("id");
            console.log($(currentRow.node()).next().attr("id"));
        }

        if(!willChangeId){
            return;
        }

        seqNoExchange(id,willChangeId);

    }

    function seqNoExchange(id1, id2) {
        $.ajax({
            url: "${ctx}/backend/json/ecommerce/sellOfferSortByCategory",
            data: {
                id1: id1,
                id2: id2,
                cid: goodSaleCategory
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

    function sortTop(id) {
        sortTopOrBottom(id,"top");
    }

    function sortBottom(id) {
        sortTopOrBottom(id,"bottom");
    }

    function sortTopOrBottom(id,topOrBottom) {
        $.ajax({
            url: "${ctx}/backend/json/ecommerce/sellOfferSortTopOrBottomByCategory",
            data: {
                sid: id,
                cid: goodSaleCategory,
                dir: topOrBottom
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    mainDataTable.ajax.reload();
                } else {
                    toastError("操作提示", "置顶或置底失败");
                }
            }
        });
    }
</script>
