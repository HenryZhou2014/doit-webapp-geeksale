<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>业绩分配</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu-item-module" content="0250"/>

    <style type="text/css">

    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#tab1" data-toggle="tab">业绩分配</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="tab-pane fade in active" id="tab1">
                    <div>
                        <div class="form-inline">
                            子公司
                            <select class="form-control"><option>金山河</option></select>
                            业务
                            <select class="form-control"><option>微信裂变</option></select>
                            <button class="btn btn-default">创建</button>
                        </div>
                    </div>

                    <div class="table-responsive margin-top-10">
                        <table class="table table-hover table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>子公司</th>
                                <th>渠道</th>
                                <th>类型</th>
                                <th>转发提成</th>
                                <th>点击提成</th>
                                <th>兑奖提成</th>
                                <th>成交提成</th>
                                <th>有效时间</th>
                                <th>状态</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    金山河子公司1
                                </td>
                                <td>微信裂变</td>
                                <td>活动</td>
                                <td>0.5</td>
                                <td>1</td>
                                <td>1.5</td>
                                <td>5</td>
                                <td>2017-09-04~2017-09-05</td>
                                <td><i class="fa fa-check text-success"></i></td>
                            </tr>
                            <tr>
                                <td>
                                    2
                                </td>
                                <td>
                                    金山河子公司1
                                </td>
                                <td>微信裂变</td>
                                <td>活动</td>
                                <td>0.5</td>
                                <td>1</td>
                                <td>1.5</td>
                                <td>5</td>
                                <td>2017-09-01~2017-09-02</td>
                                <td><i class="fa fa-ban"></i></td>
                            </tr>
                            <tr>
                                <td>
                                    3
                                </td>
                                <td>
                                    金山河子公司2
                                </td>
                                <td>微信裂变</td>
                                <td>全局</td>
                                <td>0.5</td>
                                <td>1</td>
                                <td>1.5</td>
                                <td>5</td>
                                <td>-</td>
                                <td><i class="fa fa-check text-success"></i></td>
                            </tr>
                            <tr>
                                <td>
                                    4
                                </td>
                                <td>
                                    金山河子公司2
                                </td>
                                <td>微信裂变</td>
                                <td>全局</td>
                                <td>0.5</td>
                                <td>1</td>
                                <td>1.5</td>
                                <td>5</td>
                                <td>-</td>
                                <td><i class="fa fa-ban"></i></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
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
