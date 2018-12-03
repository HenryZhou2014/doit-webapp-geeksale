<%@ page language="java" errorPage="/error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/a/common/taglibs.jsp"%>
<%--会员登录页--%>
<head>
    <title>系统通知</title>
    <meta name="heading" content="<fmt:message key='webapp.name'/>"/>
    <meta name="user-center-menu" content="myNotifications"/>

    <style type="text/css">

    </style>
</head>

<!-- -->

<section>
    <div class="container">

        <!-- RIGHT -->
        <div class="col-lg-10 col-md-10 col-sm-9 col-lg-push-2 col-md-push-2 col-sm-push-3 margin-bottom-80">
            <ul class="nav nav-tabs nav-top-border">
                <li class="active"><a href="#info" data-toggle="tab">系统通知</a></li>
            </ul>

            <div class="tab-content margin-top-20">

                <!-- PERSONAL INFO TAB -->
                <div class="tab-pane fade in active" id="info">
                    <div class="ibox float-e-margins">

                        <div class="ibox-content">
                            <div class="feed-activity-list">

                                <div class="feed-element">
                                    <div>
                                        <small class="pull-right text-navy">1m ago</small>
                                        <strong>Monica Smith</strong>
                                        <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum</div>
                                        <small class="text-muted">Today 5:60 pm - 12.06.2014</small>
                                    </div>
                                </div>
                                <hr/>
                                <div class="feed-element">
                                    <div>
                                        <small class="pull-right">2m ago</small>
                                        <strong>Jogn Angel</strong>
                                        <div>There are many variations of passages of Lorem Ipsum available</div>
                                        <small class="text-muted">Today 2:23 pm - 11.06.2014</small>
                                    </div>
                                </div>
                                <hr/>

                                <div class="feed-element">
                                    <div>
                                        <small class="pull-right">5m ago</small>
                                        <strong>Jesica Ocean</strong>
                                        <div>Contrary to popular belief, Lorem Ipsum</div>
                                        <small class="text-muted">Today 1:00 pm - 08.06.2014</small>
                                    </div>
                                </div>
                                <hr/>

                                <div class="feed-element">
                                    <div>
                                        <small class="pull-right">5m ago</small>
                                        <strong>Monica Jackson</strong>
                                        <div>The generated Lorem Ipsum is therefore </div>
                                        <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                                    </div>
                                </div>
                                <hr/>


                                <div class="feed-element">
                                    <div>
                                        <small class="pull-right">5m ago</small>
                                        <strong>Anna Legend</strong>
                                        <div>All the Lorem Ipsum generators on the Internet tend to repeat </div>
                                        <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                                    </div>
                                </div>
                                <hr/>

                                <div class="feed-element">
                                    <div>
                                        <small class="pull-right">5m ago</small>
                                        <strong>Damian Nowak</strong>
                                        <div>The standard chunk of Lorem Ipsum used </div>
                                        <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                                    </div>
                                </div>
                                <hr/>

                                <div class="feed-element">
                                    <div>
                                        <small class="pull-right">5m ago</small>
                                        <strong>Gary Smith</strong>
                                        <div>200 Latin words, combined with a handful</div>
                                        <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                                    </div>
                                </div>
                                <hr/>

                            </div>
                        </div>
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

    $(document).ready(function(){

    });

</script>
