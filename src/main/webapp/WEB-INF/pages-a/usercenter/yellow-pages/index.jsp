<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>商户库</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myOrders"/>

    <style type="text/css">

    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <div class="pull-right">
                <button type="button" class="btn btn-success btn-sm"><i class="fa fa-user"></i> 我要入驻</button>
            </div>

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#tab1" data-toggle="tab">商户库</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="tab-pane fade in active" id="tab1">
                    <div>
                        <div class="form-inline">
                            <input type="text" class="form-control width-200"/> <button class="btn btn-default">查询</button>
                        </div>
                    </div>

                    <div class="table-responsive margin-top-10">
                        <table class="table table-hover table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>店铺名</th>
                                <th>联系电话</th>
                                <th>地址</th>
                                <th>行业</th>
                                <th>城市</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    <a class="text-info">丰裕家具展示中心</a>
                                </td>
                                <td>13875837638</td>
                                <td>长沙市浏阳市</td>
                                <td>家具</td>
                                <td>长沙</td>
                            </tr>
                            <tr>
                                <td>
                                    2
                                </td>
                                <td>
                                    <a class="text-info">北川里装饰建材市场</a>
                                </td>
                                <td>13548627602</td>
                                <td>马王堆陶瓷建材B栋8号</td>
                                <td>家具</td>
                                <td>长沙</td>
                            </tr>
                            <tr>
                                <td>
                                    3
                                </td>
                                <td>
                                    <a class="text-info">北盛兴旺灯饰城</a>
                                </td>
                                <td>13908497583</td>
                                <td>车站路342号</td>
                                <td>家具</td>
                                <td>长沙</td>
                            </tr>
                            <tr>
                                <td>
                                    4
                                </td>
                                <td>
                                    <a class="text-info">小李电动工具</a>
                                </td>
                                <td>13973152079
                                </td>
                                <td>集里路86号</td>
                                <td>家居建材</td>
                                <td>长沙</td>
                            </tr>
                            <tr>
                                <td>
                                    5
                                </td>
                                <td>
                                    <a class="text-info">织羽家居产业园</a>
                                </td>
                                <td>15874262050</td>
                                <td>湖南省长沙市浏阳市永忠村</td>
                                <td>家居建材</td>
                                <td>长沙</td>
                            </tr>
                            <tr>
                                <td>
                                    6
                                </td>
                                <td>
                                    <a class="text-info">樱花集成吊顶</a>
                                </td>
                                <td>13875837638</td>
                                <td>金沙北路570</td>
                                <td>五金</td>
                                <td>长沙</td>
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
