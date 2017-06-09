<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/2
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jsTree/jstree.min.js"></script>
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <%--<script type="text/javascript" src="js/jsTree/jsTreeDemo.js"></script>--%>
  <link href="css/style.min.css" rel="stylesheet" type="text/css">
</head>
<body>
  <%--<div id="buttons">--%>
    <%--<button id="add" class="btn btn-info">添加</button>--%>
    <%--<button id="edit" class="btn btn-primary">编辑</button>--%>
    <%--<button id="delete" class="btn btn-danger">删除</button>--%>
  <%--</div>--%>
  <div id="jstree_demo_div" style="width: 40%;"></div>
  <script type="text/javascript">
    //ajax 请求数据
    //  $('#jstree_demo_div').jstree({
    //    'core' : {
    //      'data': {
    //        'url': '/example/getJsTree',
    //        'data': function (node) {
    //          return {'id': node.id};
    //        }
    //      },
    //      "themes": {"stripes": true},  //背景为条纹
    //    }
    //  });

    var ay_mssys =
            [
              {
                "id": "1",
                "text": "民事案由(2008版)",
                "state": {
                  "opened": true,          //展示第一个层级下面的node
                  "disabled": true         //该根节点不可点击
                },
                "children":
                        [
                          {
                            "id": "2",
                            "text": "人格权纠纷",
                            "children":
                                    [
                                      {
                                        "id": "3",
                                        "text": "人格权纠纷",
                                        "children": [
                                          {
                                            "id": "4",
                                            "text": "生命权、健康权、身体权纠纷",
                                            "children":
                                                    [
                                                      {
                                                        "id": "5",
                                                        "text": "道路交通事故人身损害赔偿纠纷"
                                                      }
                                                    ]
                                          }
                                        ]
                                      }
                                    ]
                          }
                        ]
              }
            ]
    $('#jstree_demo_div').jstree({
      'core' : {
//        'data': ay_mssys,
        'data': {
          'url': '/example/getJsTree',
//          'url': '//www.jstree.com/fiddle/?lazy',
          'data': function (node) {
            return {'id': node.id};
          }
        },
        "themes": {"stripes": true}  //背景为条纹
      },
      "types" : {
        "#" : {
          "max_children" : 1,
          "max_depth" : 4,
          "valid_children" : ["root"]
        },
        "root" : {
          "icon" : "/static/3.3.4/assets/images/tree_icon.png",
          "valid_children" : ["default"]
        },
        "default" : {
          "valid_children" : ["default","file"]
        },
        "file" : {
          "icon" : "glyphicon glyphicon-file",
          "valid_children" : []
        }
      }
//      "checkbox" : {
//        "keep_selected_style" : false
//      },
//      "plugins" : [ "checkbox" ]
    });


  </script>
</body>
</html>

