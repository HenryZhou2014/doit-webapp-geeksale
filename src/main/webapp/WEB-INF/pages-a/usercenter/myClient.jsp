<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp" %>
<%--会员登录页--%>
<head>
    <title>客户管理</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="menu-item-module" content="0230"/>

    <style type="text/css">

    </style>
</head>

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">

            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#tab1" data-toggle="tab">客户管理</a></li>
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
                                <th>手机号</th>
                                <th>姓名</th>
                                <th>来源</th>
                                <th>登记时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    1
                                </td>
                                <td>
                                    13787652345
                                </td>
                                <td>伍福</td>
                                <td>拓客</td>
                                <td>2017-09-28</td>
                            </tr>
                            <tr>
                                <td>
                                    2
                                </td>
                                <td>
                                    13787652345
                                </td>
                                <td>长沙尚一贸易公司</td>
                                <td>李沙</td>
                                <td>2017-09-28</td>
                            </tr>
                            <tr>
                                <td>
                                    3
                                </td>
                                <td>
                                    13787652345
                                </td>
                                <td>红星美凯龙</td>
                                <td>拓客</td>
                                <td>2017-09-28</td>
                            </tr>
                            <tr>
                                <td>
                                    4
                                </td>
                                <td>
                                    13787652345
                                </td>
                                <td>长沙尚一贸易公司</td>
                                <td>推广</td>
                                <td>2017-09-28</td>
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
