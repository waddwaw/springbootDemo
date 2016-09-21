/**
 * Created by liqiang on 16/9/16.
 */


var callTel = new Array();

var  default_tel = null;

$(document).ready(function(){

    //初始化 本地配置信息

    var cTel = $.cookie('callTel');

    var json2 = JSON.parse(cTel);

    if(cTel!=null){
        for(var tel in json2){
            callTel.push(json2[tel]);
        }
    }

    default_tel = $.cookie('default_tel');

});

