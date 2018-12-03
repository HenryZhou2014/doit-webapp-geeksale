<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<head>
    <title>图书列表</title>
    <meta name="heading" content="图书列表"/>
    <meta name="column-name" content="books"/>

    <link href="${ctx}/a/resource/styles/simplicity-cumtp/layout-shop.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">

    </style>
</head>
<div class="weui-flex weui-flex__item flex_column backend-color" style="height: 100%">
    <div class="weui-flex front-color" style="height:44px">
        <%--<div class="weui-flex" style="width:80px"></div>--%>
        <div class="weui-flex weui-flex__item justify_center align_center">
            ${title}
        </div>
        <%--<div class="weui-flex" style="width:80px"></div>--%>
    </div>

    <div class="weui-flex weui-flex__item" style="height: 100%;">
        <div id="main_area" class="weui-flex__item scroll-y">
            <section class="padding-0 noborder">
                <div class="container margin-top-15">
                    <div class="row">
                        <div class="col-lg-12">
                            <ul id="booksUL" class="shop-item-list row list-inline nomargin front-color">

                            </ul>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </div>
</div>

<script id="bookTemplate" type="text/html">
    {{each bookList as book i}}
    <li class="col-xs-6">
        <div class="shop-item">
            <div class="thumbnail noborder nopadding ">
                <!-- product image(s) -->
                <a class="shop-item-image" href="${ctx}/mall/item-{{book.id}}.html">
                    <img class="img-responsive"
                         src="{{book.imageUrl}}" alt=""/>
                </a>
                <!-- /product image(s) -->
            </div>
            <div class="shop-item-summary">
                <div class="shop-item-name">{{book.title}}</div>
                <!-- price -->
                <div class="shop-item-price">
                    {{book.price}}元
                </div>
                <!-- /price -->
            </div>
        </div>
    </li>
    {{/each}}
</script>

<script id="loadMoreTemplate" type="text/html">
    <div class="weui-flex weui-flex__item flex-column justify_center align_center" style="height:100%">
        <div class="weui-loadmore">
            <i class="weui-loading"></i>
            <span class="weui-loadmore__tips">正在加载</span>
        </div>
    </div>
</script>

<script id="noDataTemplate" type="text/html">
    <div class="weui-flex weui-flex__item flex-column justify_center align_center" style="height:100%">
        <div class="weui-loadmore weui-loadmore_line">
            <span class="weui-loadmore__tips">暂无数据</span>
        </div>
    </div>
</script>


<script type="text/javascript">

    var page = 1;
    var totalPage = 0;
    //initiating jQuery
    $(document).ready(function () { //enabling stickUp on the '.navbar-wrapper' class
        getBookList("${type}",${categoryId});
    });

    function getBookList(type,categoryId) {
        if(categoryId == "all"){
            return;
        }
        $.ajax({
            url: "${ctx}/wx/mall/list.json",
            data: {
                type:type,
                categoryId: categoryId,
                page:page
            },
            dataType: "json",
            success: function (data) {
                if (data.flag == "1") {
                    page = data.page;
                    totalPage = data.totalPage;

                    if(data.bookList.length == 0){
                        if(page == 1){
                            const html = template("noDataTemplate", data);
                            $("#booksUL").html(html);
                        }
                    }else{
                        const html = template("bookTemplate", data);
                        $("#booksUL").append(html);
                    }
                } else {
                    //toastError("操作提示", data.msg);
                }
            }
        });
    }

</script>
