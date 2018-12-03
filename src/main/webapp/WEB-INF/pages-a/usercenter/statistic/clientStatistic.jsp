<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>客户统计</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myOrders"/>

    <style type="text/css">

    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#tab1" data-toggle="tab">员工推广统计</a></li>
                <li><a href="#tab2" data-toggle="tab">拓客推广统计</a></li>
            </ul>

            <div class="tab-content margin-top-20">
                <div class="tab-pane fade in active" id="tab1">
                    <div>
                        <div class="form-inline">
                            <select class="form-control"><option>2017年9月</option></select> 子公司 <select class="form-control"><option>金山河</option></select> 渠道 <select class="form-control"><option>微信裂变</option></select> <button class="btn btn-default">统计</button>
                        </div>
                    </div>

                    <div class="table-responsive margin-top-10">
                        <table class="table table-hover table-bordered table-striped">
                            <thead>
                            <tr>
                                <th rowspan="2">#</th>
                                <th rowspan="2">员工</th>
                                <th rowspan="2">手机号</th>
                                <th rowspan="2">渠道</th>
                                <th colspan="2">转发</th>
                                <th colspan="2">点击</th>
                                <th colspan="2">兑奖</th>
                                <th colspan="2">成交</th>
                                <th rowspan="2">小计</th>
                            </tr>
                            <tr>
                                <th>次数</th>
                                <th>提成</th>
                                <th>次数</th>
                                <th>提成</th>
                                <th>次数</th>
                                <th>提成</th>
                                <th>次数</th>
                                <th>提成</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    员工1
                                </td>
                                <td>15908723765</td>
                                <td>微信裂变</td>
                                <td>25</td>
                                <td>25</td>
                                <td>300</td>
                                <td>300</td>
                                <td>25</td>
                                <td>25</td>
                                <td>35</td>
                                <td>35</td>
                                <td>385</td>
                            </tr>
                            <tr>
                                <td>
                                    2
                                </td>
                                <td>
                                    员工2
                                </td>
                                <td>15908723765</td>
                                <td>微信裂变</td>
                                <td>25</td>
                                <td>25</td>
                                <td>300</td>
                                <td>300</td>
                                <td>25</td>
                                <td>25</td>
                                <td>35</td>
                                <td>35</td>
                                <td>385</td>
                            </tr>
                            <tr>
                                <td>
                                    3
                                </td>
                                <td>
                                    员工3
                                </td>
                                <td>15908723765</td>
                                <td>微信裂变</td>
                                <td>25</td>
                                <td>25</td>
                                <td>300</td>
                                <td>300</td>
                                <td>25</td>
                                <td>25</td>
                                <td>35</td>
                                <td>35</td>
                                <td>385</td>
                            </tr>
                            <tr>
                                <td>
                                    4
                                </td>
                                <td>
                                    员工4
                                </td>
                                <td>15908723765</td>
                                <td>微信裂变</td>
                                <td>25</td>
                                <td>25</td>
                                <td>300</td>
                                <td>300</td>
                                <td>25</td>
                                <td>25</td>
                                <td>35</td>
                                <td>35</td>
                                <td>385</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="tab-pane fade in" id="tab2">
                    <div>
                        <div class="form-inline">
                            <select class="form-control"><option>2017年9月</option></select> 渠道 <select class="form-control"><option>微信裂变</option></select> <button class="btn btn-default">统计</button>
                        </div>
                    </div>

                    <div class="table-responsive margin-top-10">
                        <table class="table table-hover table-bordered table-striped">
                            <thead>
                            <tr>
                                <th rowspan="2">#</th>
                                <th rowspan="2">拓客</th>
                                <th rowspan="2">手机号</th>
                                <th rowspan="2">渠道</th>
                                <th colspan="2">转发</th>
                                <th colspan="2">点击</th>
                                <th colspan="2">兑奖</th>
                                <th colspan="2">成交</th>
                                <th rowspan="2">小计</th>
                            </tr>
                            <tr>
                                <th>次数</th>
                                <th>提成</th>
                                <th>次数</th>
                                <th>提成</th>
                                <th>次数</th>
                                <th>提成</th>
                                <th>次数</th>
                                <th>提成</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    拓客1
                                </td>
                                <td>15908723765</td>
                                <td>微信裂变</td>
                                <td>25</td>
                                <td>25</td>
                                <td>300</td>
                                <td>300</td>
                                <td>25</td>
                                <td>25</td>
                                <td>35</td>
                                <td>35</td>
                                <td>385</td>
                            </tr>
                            <tr>
                                <td>
                                    2
                                </td>
                                <td>
                                    拓客2
                                </td>
                                <td>15908723765</td>
                                <td>微信裂变</td>
                                <td>25</td>
                                <td>25</td>
                                <td>300</td>
                                <td>300</td>
                                <td>25</td>
                                <td>25</td>
                                <td>35</td>
                                <td>35</td>
                                <td>385</td>
                            </tr>
                            <tr>
                                <td>
                                    3
                                </td>
                                <td>
                                    拓客3
                                </td>
                                <td>15908723765</td>
                                <td>微信裂变</td>
                                <td>25</td>
                                <td>25</td>
                                <td>300</td>
                                <td>300</td>
                                <td>25</td>
                                <td>25</td>
                                <td>35</td>
                                <td>35</td>
                                <td>385</td>
                            </tr>
                            <tr>
                                <td>
                                    4
                                </td>
                                <td>
                                    拓客4
                                </td>
                                <td>15908723765</td>
                                <td>微信裂变</td>
                                <td>25</td>
                                <td>25</td>
                                <td>300</td>
                                <td>300</td>
                                <td>25</td>
                                <td>25</td>
                                <td>35</td>
                                <td>35</td>
                                <td>385</td>
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
