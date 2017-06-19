<%--
  Created by IntelliJ IDEA.
  User: yangfan
  Date: 2017/6/15
  Time: 14:26
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #allmap{width:100%;height:100%;}
        p{margin-left:5px; font-size:14px;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=GBrnGKaob09D9GLUx6WYEhlQ1uaqtAPS"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <title>百度地图-点聚合</title>
</head>
<body>
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom("武汉");
    map.enableScrollWheelZoom();//开启鼠标滚轮缩放功能。

    //设置地图中标记
    var markers = new Array();

    var data = [{ "mapy": "30.510169", "mapx": "114.430439", "addr": "<p style='font-size: 16px;color: #CC5522;'>武汉华信数据系统有限公司</p>" +
                "<p>地址：东湖高新技术开发区光谷大道3号未来之光3栋6楼</p>  <p>电话：(027)87775236,4008865237</p>" },
                { "mapy": "30.635161", "mapx": "114.387258", "addr": "<p style='font-size: 16px;color: #CC5522;'>江南春城</p>  " +
                "<p>地址：和平大道与建三路交汇处(青山国税局旁边)</p>" },
                { "mapy": "30.521242", "mapx": "114.397564", "addr": "<p style='font-size: 16px;color: #CC5522;'>武汉邮电科学研究院</p>" +
                "<p>地址：邮科院路烽火科技大厦4/11～15层</p>  <p>电话：(027)87691199</p>" }
    ];

    //循环添加点击事件
    $.each(data, function(i, item) {
        var point = new BMap.Point(item.mapx, item.mapy);//创建坐标点
        var marker = new BMap.Marker(point);//绘制坐标点
        var content = item.addr;
        addClickHandler(content, marker); //添加点击事件

        markers.push(marker);//将需要添加聚合效果的点添加到markers中

    });

    //添加聚合效果
    var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});

    var opts = {
        width : 250, // 信息窗口宽度
        height: 80, // 信息窗口高度
//        title : "信息窗口" , // 信息窗口标题
        enableMessage:true//设置允许信息窗发送短息
    };

    //点击事件
    function addClickHandler(content,marker){
        marker.addEventListener("click",function(e){
            openInfo(content,e)}
        );
    }

    function openInfo(content,e){
        var p = e.target;
        var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
        var infoWindow = new BMap.InfoWindow(content,opts); // 创建信息窗口对象
        map.openInfoWindow(infoWindow,point); //开启信息窗口
    }

</script>
