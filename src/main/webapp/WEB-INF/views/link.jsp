<%--
  Created by IntelliJ IDEA.
  User: yangfan
  Date: 2017/6/15
  Time: 11:41
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>demo导航</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
        button {
            margin: 10px;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center">demo导航</h2>
    <div style="text-align: center">
        <button class="btn btn-info" id="DT" onclick="window.open('demo')">Datatables</button>
        <button class="btn btn-primary" id="DTJsTree" onclick="window.open('jsTree')">Datatables+jsTree</button>
        <button class="btn btn-success" id="baiduMap" onclick="window.open('baiduMap')">BaiduMap</button>
    </div>

</body>
</html>
