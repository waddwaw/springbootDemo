/**
 * Created by liqiang on 16/9/16.
 */
$("#submit").click(function() {
    var userName = $("#userName").val();
    $.ajax({
        type: "GET",
        url: getRootPath() + "/getStudents?name=" + userName,
        contentType: "application/x-www-form-urlencoded",
        success: function (success) {
            alert(JSON.stringify(success));
        },
        error: function (error) {
            alert(error);
        }
    });
})
$("#callback").click(function () {
    var fromTel = $("#fromTel").val();
    var toTel = $("#toTel").val();
    $.ajax({
        type: "GET",
        url: getRootPath() + "/callback?from=" + fromTel + "&to=" + toTel,
        contentType: "application/x-www-form-urlencoded",
        success: function (success) {
            alert(JSON.stringify(success));
        },
        error: function (error) {
            alert(error);
        }
    });
})