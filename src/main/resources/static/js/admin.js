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

var callTel = new Array();

$(document).ready(function(){

    //初始化 本地配置信息

    var cTel = $.cookie('callTel');

    var json2 = JSON.parse(cTel);

    if(cTel!=null){
        for(var tel in json2){
            callTel.push(json2[tel]);
        }
    }



});

