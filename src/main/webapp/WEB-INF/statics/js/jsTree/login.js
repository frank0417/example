/**
 * Created by YFYFYF on 2017/6/18.
 */
function login() {
    var username = $("#username").val();
    var password = $("#password").val();
    $.ajax({
        type:"post",
        dataType:"json",
        url:"/example/login",
        data:{
            username:username,
            password:password
        },
        success:function(data) {
            if(data.state) {
                    location.href = "metronicDemo";
//                window.open("metronicDemo");
            } else {
                alert(data.msg);
                return false;
            }
        }
    });
//        $.post("/example/login",
//                { username: username, password: password }, function (data) {
//                    if(data.state) {
//                    location.href = "metronicDemo";
//                } else {
//                    alert(data.msg);
//                    return false;
//                }
//        });
}