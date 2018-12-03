<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>我的素材</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myOrders"/>

    <style type="text/css">
        .uppercase .delete-article, .uppercase .contibute-article {
            position: relative;
            float: right;
            margin-right: 5px;
        }

        #info .timeline .timeline-item {
            position: relative;
            min-height: 90px;
            display: block;
            margin-bottom: 50px;
        }

        table {
            display: table;
            border-collapse: collapse;
            border-spacing: 2px;
            border-color: grey;
        }
        tbody {
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit;
        }

        .order-tb {
            width: 100%;
        }

        .order-tb .tooltip2 {
            position: relative;
            width: 100px;
            margin: 0 auto;
            z-index: 2;
            cursor: pointer;
        }

        .order-tb .consignee {
            color: #333;
        }

        .order-tb .consignee .txt {
            display: inline-block;
            white-space: nowrap;
            overflow: hidden;
            max-width: 72px;
            text-overflow: ellipsis;
            vertical-align: middle;
        }

        .order-tb .sep-row {
            height: 20px;
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
        }

        .order-tb .sep-row td {
            border: 0;
        }

        .order-tb .tr-th {
            background: #f5f5f5;
            height: 31px;
            line-height: 31px;
            color: #aaa;
            overflow: hidden;
        }
        tr {
            display: table-row;
            vertical-align: inherit;
            border-color: inherit;
        }

        thead {
            display: table-header-group;
            vertical-align: middle;
            border-color: inherit;
        }

        .order-tb thead th {
            height: 32px;
            line-height: 32px;
            text-align: center;
            background: #f5f5f5;
            color: #666;
            font-weight: 400;
        }

        .order-tb .ordertime-cont {
            position: relative;
            float: left;
            z-index: 10;
            width: 138px;
            cursor: pointer;
        }

        .order-tb .order-detail-txt {
            display: inline-block;
            vertical-align: middle;
        }
        .ac {
            text-align: center;
        }

        .order-tb .ordertime-cont .time-txt {
            position: relative;
            height: 30px;
            line-height: 30px;
            text-align: left;
            padding-left: 20px;
            padding-right: 12px;
            border: 1px solid #f5f5f5;
        }

        .order-tb .ordertime-cont .time-list {
            position: absolute;
            left: 0;
            top: 30px;
            z-index: 2;
            display: none;
            width: 136px;
            background: #fff;
            border: 1px solid #f5f5f5;
            border-top: 0;
        }

        .order-tb .ordertime-cont .time-list li {
            height: 30px;
            line-height: 30px;
            text-align: left;
        }
        li {
            list-style: none;
        }
        .order-tb .deal-state-cont {
            position: relative;
            z-index: 10;
            width: 98px;
            cursor: pointer;
        }

        .order-tb .deal-state-cont .state-txt {
            position: relative;
            height: 30px;
            line-height: 30px;
            text-align: left;
            padding-left: 20px;
            padding-right: 12px;
            border: 1px solid #f5f5f5;
        }

        .order-tb .deal-state-cont .state-list {
            position: absolute;
            left: 0;
            top: 30px;
            z-index: 2;
            display: none;
            width: 96px;
            background: #fff;
            border: 1px solid #f5f5f5;
            border-top: 0;
        }

        .order-tb .deal-state-cont .state-txt b {
            position: absolute;
            width: 7px;
            height: 4px;
            right: 18px;
            top: 13px;
            overflow: hidden;
            vertical-align: middle;
            background: url(//misc.360buyimg.com/user/myjd-2015/css/i/order-icon20150916.png) -37px -207px no-repeat;
        }

        .order-tb .tr-bd {
            text-align: center;
            vertical-align: top;
        }

        .order-tb .tr-th td {
            border-bottom-color: #f5f5f5;
        }

        .order-tb tbody td {
            border: 1px solid #e5e5e5;
            padding: 14px 0;

        }

        .order-tb .goods-number {
            float: left;
            width: 70px;
            text-align: left;
            color: #aaa;
            overflow: hidden;
        }

        .order-tb .goods-repair {
            width: 104px;
            float: right;
            text-align: center;
        }

        .order-tb .tr-bd td {
            padding: 14px 0;
        }

        .order-tb .tr-th .order-shop {
            width: 178px;
        }
        .order-tb .tr-th span {
            float: left;
            height: 18px;
            line-height: 18px;
            padding: 2px 0 0;
            _display: inline;
        }
        .order-tb .tr-th .gap {
            width: 14px;
        }
        .order-tb .tr-th .dealtime {
            margin-right: 30px;
            _margin-right: 15px;
        }
        .order-tb .tr-th .number {
            width: 226px;
            overflow:hidden;
        }


        .order-tb .goods-item {
            display: inline-block;
            display: block;
            float: left;
            width: 340px;
            margin-right: 50px;
        }
        .order-tb .goods-item .p-img {
            float: left;
            width: 60px;
            height: 60px;
            border: 1px solid #efefef;
            margin: 0 14px;
            _display: inline;
        }
        .order-tb .goods-item .p-msg {
            float: left;
            width: 240px;
        }
        .order-tb .goods-item .p-name {
            height: 36px;
            line-height: 18px;
            overflow: hidden;
            color: #333;
            text-align: left;
        }
        .order-tb .goods-item .p-name a {
            color: #333;
        }
        .order-tb .goods-item .p-extra {
            color: #aaa;
            text-align: left;
        }
        .order-tb .goods-item .o-info {
            text-align: left;
            color: #aaa;
        }
        .order-tb .goods-item .o-match, .order-tb .goods-item .o-similar {
            display: inline-block;
            vertical-align: top;
            cursor: pointer;
        }
        .order-tb .goods-item .o-match em, .order-tb .goods-item .o-similar em {
            display: inline-block;
            vertical-align: top;
        }
        .order-tb .goods-item .o-match, .order-tb .goods-item .o-similar {
            display: inline-block;
            vertical-align: top;
            cursor: pointer;
        }

        .btn-outline {
            color:red;
            background-color: transparent;
            transition: all .5s;
        }

        a.order-cancel:hover{
            color: red;
        }
    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#tab1" data-toggle="tab">文字素材</a></li>
                <li><a href="#tab2" data-toggle="tab">图片素材</a></li>
                <li><a href="#tab3" data-toggle="tab">图文素材</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="tab-pane fade in active" id="tab1">

                </div>
                <div class="tab-pane fade" id="tab2">
                </div>
                <div class="tab-pane fade" id="tab3">
                </div>
            </div>
        </div>
        <!-- LEFT -->
        <div class="col-lg-2 col-md-2 col-sm-3 col-lg-pull-10 col-md-pull-10 col-sm-pull-7">
            <jsp:include page="/app/usercenter/userCenterMenu"/>
        </div>
    </div>
</section>


<script type="text/javascript">

    $(document).ready(function () {

    });

</script>
