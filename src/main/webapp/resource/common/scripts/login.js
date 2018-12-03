if (getCookie("username") != null) {
    $("j_username").value = getCookie("username");
    $("j_password").focus();
} else {
    $("j_username").focus();
}


function saveUsername(theForm) {
    var expires = new Date();
    expires.setTime(expires.getTime() + 24 * 30 * 60 * 60 * 1000); // sets it for approx 30 days.
    setCookie("username", theForm.j_username.value, expires, "<c:url value=" / "/>");
}

function validateForm(form) {
    return validateRequired(form);
}

