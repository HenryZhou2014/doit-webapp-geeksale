/**
 * Created by mushan on 2016-01-23.
 */

$(document).ready(function () {
    $(".button-login").bind("click", function () {
        var data = $("#loginForm").serializeArray();
        $.ajax({
            url: "/ajaxLoginProcess",
            data: data,
            dataType: "json",
            type: "POST",
            success: function (data) {
                if (data.flag == 1) {
                    $('#logonModal').modal('hide');
                    var href = $(".button-login").attr("data-url");
                    if (! href || href == ""){
                        location.reload();
                    }
                    else{
                        location.href = href;
                    }
                } else if (data.flag == "0") {
                    if ($(".login-hint").hasClass("hidden")) {
                        $(".login-hint").removeClass("hidden")
                    }
                }

            }
        });
    });

});

function logon() {
    $('#logonModal').modal('show');
}