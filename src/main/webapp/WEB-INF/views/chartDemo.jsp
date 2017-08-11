<%--
  Created by IntelliJ IDEA.
  User: zhangd
  Date: 2017/7/5
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
    String basePath = request.getScheme()+"://"+request.getServerName()
            +":"+request.getServerPort()+path+"/";
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
    pageContext.setAttribute("basePath",basePath);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>华信数据</title>
    <meta charset="utf-8">
    <!-- 引入 ECharts 文件 -->
    <script src="<%=basePath%>js/echarts.min.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        div{
            border-radius: 4px;
        }
        #top{
            width: 100%;
            height: 20%;
            margin: 0 0;
            background-color:#FFFFFF;
            border-radius: 5px;
        }
        #top ul{
            overflow: hidden
        }
        #top ul li{
            float: left;
            width: 16%;
            height:auto;
            list-style-type: none;
            margin-left:5px;
            -moz-border-radius: 15px;
            -webkit-border-radius: 15px;
            border-radius:8px;
        }
        #top ul li>h1{
            height: 30px;
            text-indent: 10px;
            line-height: 10px;
            color: white;
            font-weight: bold;
            font-size: 18px;
        }
        #top ul li>h2{
            height: 30px;
            text-indent: 10px;
            line-height: 10px;
            color: white;
            font-weight: bold;
            font-size: 30px;
            float: right;
        }
        #left{
            float: left;
        }
        #right{
            display: flex;
            justify-content: space-between;
            position: relative;
            margin-top: 50px;
            margin-left: 150px;
        }
        #circle{
            /*border:1px solid #f60;*/
            width:10px;
            height:10px;
            /*margin:0 auto;*/
            margin-left: 20px;
            -webkit-border-radius:50px;
            -moz-border-radius:50px;
            -o-border-radius:50px;
            border-radius:50px;
            background-color:#7BCAF3;
        }
        #circle2{
            /*border:1px solid #f60;*/
            width:100px;
            height:100px;
            margin:0 auto;
            -webkit-border-radius:50px;
            -moz-border-radius:50px;
            -o-border-radius:50px;
            border-radius:50px;
            background-color: #F6A1A6;
            z-index: 1;
        }
        #circle3{
            /*border:1px solid #f60;*/
            width: 120px;
            height:120px;
            margin:0 auto;
            -webkit-border-radius:60px;
            -moz-border-radius:60px;
            -o-border-radius:60px;
            border-radius:60px;
            background-color: #919AFF ;
            z-index: 3;
        }
        #circle4{
            /*border:1px solid #f60;*/
            width:100px;
            height:100px;
            margin:0 auto;
            -webkit-border-radius:50px;
            -moz-border-radius:50px;
            -o-border-radius:50px;
            border-radius:50px;
            background-color: #37B5FF;
            z-index: 2;
        }
    </style>

</head>
<body>
<div style="width: 100% ;background-color:#EEEEEE">
    <div id="top">
        <p style="text-align: left;font-size: 14px;color: #050e19;margin: auto 10px;line-height: 30px">KPI综合分析</p>
        <ul>
            <li style="background-color: #8693F3">
                <h1>泵站投资</h1>
                <h2>300万元</h2>
            </li>
            <li style="background-color: #54CAD4">
                <h1>雨水沟投资</h1>
                <h2>405万元</h2>
            </li>
            <li style="background-color: #FFA897">
                <h1>花园投资</h1>
                <h2>200万元</h2>
            </li>
            <li style="background-color: #AAB2FB">
                <h1>设备完好率</h1>
                <h2>+35%</h2>
            </li>
            <li style="background-color: #3DB8FE">
                <h1>设备故障率</h1>
                <h2>+7%</h2>
            </li>
            <li style="background-color: #52CDD5">
                <h1>设备运行率</h1>
                <h2>+22%</h2>
            </li>
        </ul>
    </div>
    <div style="width: 100%; height: 30%; margin-top: 10px;margin-bottom:10px;border-radius: 5px;">
        <div style="width: 33%;height:100%; float:left;margin-left: 10px;background-color: #FFFFFF">
            <p style="text-align: center;font-size: 16px;color: #050e19;line-height: 40px;border-bottom: 1px solid #eee;">成本分析</p>
            <div style="width:80%;margin: 0 auto;position:relative;top:40px;">
                <div>
                    <p  style="margin-bottom: 0px;float:left;">材料消耗费用</p>
                    <p  style="float: right;margin-bottom: 0px;">1200</p>
                    <div class="progress" style="height: 8px;margin-top: 20px;clear: both;">
                        <p class="progress-bar progress-bar-info" style="width: 30.5%;background-color: #8195EC"></p>
                    </div>
                </div>
                <div>
                    <p  style="margin-bottom: 0px;float:left;">设备维修费用</p>
                    <p  style="float: right;margin-bottom: 0px;">450</p>
                    <div class="progress" style="height: 8px;margin-top: 40px;clear: both;">
                        <p class="progress-bar progress-bar-info" style="width: 20.5%;background-color: #54C9D2"></p>
                    </div>
                </div>
                <div>
                    <p  style="margin-bottom: 0px;float:left;">设备维护费用</p>
                    <p  style="float: right;margin-bottom: 0px;">250</p>
                    <div class="progress" style="height: 8px;margin-top: 40px;clear: both;">
                        <p class="progress-bar progress-bar-info" style="width: 16.5%;background-color: #03AAEE"></p>
                    </div>
                </div>
            </div>
        </div>
        <div style="width: 33%;height:100%; float:left;margin-left:10px;background-color: #FFFFFF;">
            <div>
                <p style="text-align: center;font-size: 16px;color: #050e19;line-height: 40px;border-bottom: 1px solid #eee;">保养分析</p>
            </div>
            <div id="bxfx" style="width: 100%;height: 250px;margin: 0 0">
            </div>
        </div>
        <div style="width: 32%;height:100%; float:left;margin-left: 10px;background-color: #FFFFFF">
            <p style="text-align: center;font-size: 16px;color: #050e19;line-height: 40px;border-bottom: 1px solid #eee;">运行分析</p>
            <div id="left">
                <div id="circle" style="background-color: #F6A1A6"></div>
                <%--<P style="float:left;margin-right: 10px;">ZZ</P>--%>
                <div style="position: absolute;margin-left: 35px;margin-top: -18px;">设备维护时间</div>
                <div id="circle" style="margin-top: 10px;background-color: #8A97FF"></div>
                <%--<P style="float:left;margin-right: 10px;">ZZ</P>--%>
                <div style="position: absolute;margin-left: 35px;margin-top: -18px;">平均修复时间</div>
                <div id="circle" style="margin-top: 10px"></div>
                <%--<P style="float:left;margin-right: 10px;">ZZ</P>--%>
                <div style="position: absolute;margin-left: 35px;margin-top: -18px;">平均无故障时间</div>
            </div>
            <div id="right">
                <div id="circle2" style="position:absolute; left:30px; top:30px;">
                    <div style="text-align: center;margin-top: 20px;color: white">设备维护</div>
                    <div style="text-align: center;margin-top: 10px;color: white;font-size: larger">24</div>
                </div>
                <div id="circle3" style="position:absolute; left:120px; top:23px;">
                    <div style="text-align: center;margin-top: 28px;color:white;">平均修复</div>
                    <div style="text-align: center;margin-top: 10px;color: white;font-size: larger">2</div>
                </div>
                <div id="circle4" style="position:absolute; left:220px; top:30px;">
                    <div style="text-align: center;margin-top: 20px;color: white;">平均无故障</div>
                    <div style="text-align: center;margin-top: 10px;color: white;font-size: larger">22</div>
                </div>
            </div>
        </div>
    </div>
    <div style="width: 100%; height: 30px; margin-top: 10px ;background-color: #FFFFFF;border-radius: 5px">
        <p style="text-align: left;font-size: 14px;color: #050e19;margin: auto 10px;line-height: 30px">运行故障分析</p>
        <div id="yxgz" style="width: 100%; height: 350px;margin: 0 0">
        </div>
    </div>
</div>
<script type="text/javascript">
    // 运行故障
    var yxgz = echarts.init(document.getElementById('yxgz'));
    // 保养分析
    var bxfx = echarts.init(document.getElementById('bxfx'));
    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        legend: {
            data:['设备故障次数','设备维护次数','设备维护费用']
        },
        xAxis: [
            {
                type: 'category',
                data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
                axisPointer: {
                    type: 'shadow'
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '设备维护费用（元）',
                min: 0,
                max: 1000,
                interval: 200,
                axisLabel: {
                    formatter: '{value} '
                }
            },
            {
                type: 'value',
                name: '设备故障次数',
                min: 0,
                max: 50,
                interval: 10,
                axisLabel: {
                    formatter: '{value} '
                }
            }
        ],
        series: [
            {
                name:'设备故障次数',
                type:'bar',
                data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
            },
            {
                name:'设备维护次数',
                type:'bar',
                data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
            },
            {
                name:'设备维护费用',
                type:'line',
                yAxisIndex: 1,
                data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
            }
        ]
    };
    option2 = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            icon:'circle',
            width:'100px',
            x: 'left',
            data:['维护时及率','邮件营销','联盟广告'],
        },
        series: [
            {
                name:'访问来源',
                type:'pie',
                selectedMode: 'single',
                radius: [0, '30%'],

                label: {
                    normal: {
                        show:false,
                        position: 'inside'
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data:[
                    {value:335, name:'维护时及率', selected:true},
                    {value:234, name:'联盟广告'},
                ]
            },
            {
                name:'访问来源',
                type:'pie',
                radius: ['40%', '55%'],

                data:[
                    {value:335, name:'维护时及率'},
                    {value:234, name:'联盟广告'},
                    {value:310, name:'邮件营销'},

                ]
            }
        ]
    };
    //运行故障
    yxgz.setOption(option);
    //保养分析
    bxfx.setOption(option2);
</script>
</body>
</html>
