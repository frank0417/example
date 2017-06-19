<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>登录系统</title>
    <link rel="stylesheet" href="css/loginStyle.css">

</head>

<body>
<h1>我的登录系统</h1>
<div class="container w3">
    <h2>现在登录</h2>
    <form action="link" method="post">
        <div class="username">
            <span class="username" style="height:19px">用户:</span>
            <input name="name" class="name" placeholder="" required="" type="text">
            <div class="clear"></div>
        </div>
        <div class="password-agileits">
            <span class="username" style="height:19px">密码:</span>
            <input name="password" class="password" placeholder="" required="" type="password">
            <div class="clear"></div>
        </div>
        <div class="rem-for-agile">
            <input name="remember" class="remember" type="checkbox">记住账号
            　　
            <%--<br>--%>
            <%--<a href="#">忘记了密码</a><br>--%>
        </div>
        <div class="login-w3">
            <input class="login" value="Login" type="submit">
        </div>
        <div class="clear"></div>
    </form>
</div>
<div class="footer-w3l">
    <p> ©2017 yangfan</p>
</div>

</body></html>
