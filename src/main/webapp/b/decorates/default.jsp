<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/b/common/taglibs.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <%@ include file="/b/common/meta.jsp" %>
    <title><decorator:title/> | <fmt:message key="webapp.name"/></title>

    <%--<link href="${ctx}/a/resource/styles/simplicity-cumtp/essentials.css" rel="stylesheet">--%>
    <link href="${ctx}/resource/common/styles/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/resource/common/styles/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/resource/common/scripts/bootstrapvalidator-0.53/dist/css/bootstrapValidator.min.css" rel="stylesheet">
    <link href="${ctx}/resource/common/scripts/bootstrap3-dialog-master/dist/css/bootstrap-dialog.min.css" rel="stylesheet">
    <link href="${ctx}/resource/common/styles/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <link href="${ctx}/resource/common/styles/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${ctx}/resource/common/styles/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ctx}/resource/common/styles/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="${ctx}/resource/common/scripts/jquery-ui-1.12.0.custom/jquery-ui.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="${ctx}/resource/common/styles/plugins/toastr/toastr.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="${ctx}/resource/common/scripts/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="${ctx}/resource/common/styles/animate.css" rel="stylesheet">
    <link href="${ctx}/resource/common/styles/style.css" rel="stylesheet">
    <link href="${ctx}/b/resource/common/styles/tools.css" rel="stylesheet">

    <link href="${ctx}/resource/common/styles/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="${ctx}/resource/common/scripts/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

    <link href="${ctx}/resource/common/styles/flexstyle.css" rel="stylesheet">


    <script src="${ctx}/resource/common/scripts/jquery-2.1.1.js"></script>
    <script src="${ctx}/resource/common/scripts/jquery.json-2.4.js"></script>
    <script src="${ctx}/resource/common/scripts/artTemplate/template.js"/>
    <script src="${ctx}/resource/common/scripts/jquery-ui-1.12.0.custom/jquery-ui.js"></script>

    <decorator:head/>

</head>
<body class="fixed-nav pace-done">
<div id="wrapper">
    <jsp:include page="/b/common/menu.jsp"/>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-fixed-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i>
                    </a>
                    <%--<form role="search" class="navbar-form-custom" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="Search for something..." class="form-control"
                                   name="top-search" id="top-search">
                        </div>
                    </form>--%>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bookmark"> 快捷</i>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="${ctx}/backend/account/accountform">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 客户开户
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="${ctx}/backend/agentaccount/accountform">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 代理开户
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="${ctx}/backend/oemagentaccount/accountform">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> OEM代理开户
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="${ctx}/backend/account/accountform">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> 开户审核
                                        <span class="pull-right text-muted small">15</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a7.jpg">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46h ago</small>
                                        <strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>.
                                        <br>
                                        <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">5h ago</small>
                                        <strong>Chris Johnatan Overtunk</strong> started following <strong>Monica
                                        Smith</strong>. <br>
                                        <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/profile.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right">23h ago</small>
                                        <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                                        <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="mailbox.html">
                                        <i class="fa fa-envelope"></i> <strong>Read All Messages</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> You have 16 messages
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small">12 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="grid_options.html">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="notifications.html">
                                        <strong>See All Alerts</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="${ctx}/backend/logout.html">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>
                </ul>

            </nav>
        </div>

        <div>
            <jsp:include page="/b/common/messages.jsp"/>

            <decorator:body/>
        </div>

    </div>
</div>
<%--<jsp:include page="/b/common/header.jsp"/>--%>

<%--<div>
    <div id="leftMenuBlock">
        <jsp:include page="/b/common/menu.jsp"/>
    </div>
    <div id="contentPanel">
        <decorator:body/>
    </div>
</div>--%>

<%--<jsp:include page="/b/common/footer.jsp"/>--%>

<!-- Mainly scripts -->
<script src="${ctx}/resource/common/scripts/bootstrap.min.js"></script>
<script src="${ctx}/resource/common/scripts/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/resource/common/scripts/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/resource/common/scripts/bootstrapvalidator-0.53/dist/js/bootstrapValidator.js"></script>
<script src="${ctx}/resource/common/scripts/bootstrap3-dialog-master/dist/js/bootstrap-dialog.min.js"></script>

<script src="${ctx}/resource/common/scripts/plugins/dataTables/datatables.min.js"></script>
<script src="${ctx}/resource/common/scripts/plugins/jeditable/jquery.jeditable.js"></script>

<!-- Custom and plugin javascript -->
<script src="${ctx}/resource/common/scripts/inspinia.js"></script>
<script src="${ctx}/resource/common/scripts/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<%--<script src="${ctx}/resource/common/scripts/plugins/jquery-ui/jquery-ui.min.js"></script>--%>

<!-- GITTER -->
<script src="${ctx}/resource/common/scripts/plugins/gritter/jquery.gritter.min.js"></script>

<!-- Sparkline -->
<script src="${ctx}/resource/common/scripts/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="${ctx}/resource/common/scripts/demo/sparkline-demo.js"></script>

<!-- ChartJS-->
<script src="${ctx}/resource/common/scripts/plugins/chartJs/Chart.min.js"></script>

<!-- Toastr -->
<script src="${ctx}/resource/common/scripts/plugins/toastr/toastr.min.js"></script>

<script src="${ctx}/resource/common/scripts/plugins/iCheck/icheck.min.js"></script>
<script src="${ctx}/resource/common/scripts/plugins/touchspin/jquery.bootstrap-touchspin.min.js"></script>

<!-- Data picker -->
<script src="${ctx}/resource/common/scripts/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="${ctx}/resource/common/scripts/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">

    $(document).ready(function(){
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": true,
            "preventDuplicates": false,
            "positionClass": "toast-top-center",
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "7000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
    });

    function toastSuccess(title, message){

        var $toast = toastr["success"](message, title);
    }

    function toastError(title, message){

        var $toast = toastr["error"](message, title);
    }

    function toastWarning(title, message){

        var $toast = toastr["warning"](message, title);
    }

    function toastInfo(title, message){

        var $toast = toastr["info"](message, title);
    }
</script>
</body>
</html>
