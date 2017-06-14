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
  <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/jsTree/jsTreeDemo.js"></script>
  <script type="text/javascript" src="js/icheck.js"></script>

  <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/bootstrap.min.css.map" rel="stylesheet" type="text/css">
  <link href="css/style.min.css" rel="stylesheet" type="text/css">
  <link href="css/iCheck/skins/all.css" rel="stylesheet" type="text/css"/>
</head>
<body>
  <div class="col-md-12">
    <ul class="page-breadcrumb breadcrumb" style="height: 50px">
      <li style="top: 12px;position: absolute;font-size: 18px;">部门员工管理</li>
      <li class="btn-group" style="right: 15px;position: absolute;" >
        <button onclick="initAddUser()" class="btn btn-info">添加员工</button>
        <%--<button id="edit" class="btn btn-primary" data-toggle="modal" data-target="#myModalForOrg">编辑</button>--%>
        <%--<button id="delete" class="btn btn-danger">删除</button>--%>
      </li>
    </ul>
    <%--<span style="margin-left:15px" >部门管理</span>--%>
    <%--<div style="margin-left: 300px;display:inline;">--%>
      <%--<button id="add" class="btn btn-info" data-toggle="modal" data-target="#myModal">添加</button>--%>
      <%--<button id="edit" class="btn btn-primary" data-toggle="modal" data-target="#myModal">编辑</button>--%>
      <%--<button id="delete" class="btn btn-danger">删除</button>--%>
    <%--</div>--%>
  </div>

  <div class="">
    <div class="col-md-3" style="border-right: 1px solid #DBDBDB;height: 500px;">
      <!--jsTree -->
      <div id="jstree_demo_div" style="width: 30%;"></div>
    </div>

    <div class="col-md-9">
      <table id="extable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
        <thead class="text-center">
        <tr>
          <th class="text-center">id</th>
          <th class="text-center">name</th>
          <th class="text-center">sex</th>
          <th class="text-center">position</th>
          <th class="text-center">age</th>
          <th class="text-center">work_time</th>
          <th class="text-center">org</th>
          <th class="text-center">operator</th>
        </tr>
        </thead>
        <tbody class="text-center">
        </tbody>
      </table>
    </div>
  </div>

  <!-- Modal员工 -->
  <div class="modal fade" id="myModalForUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span--%>
          <%--aria-hidden="true">&times;</span></button>--%>
          <h4 class="modal-title" id="myModalLabel">新增</h4>
        </div>

        <div class="modal-body">
          <div class="form-group">
            <input type="hidden" class="form-control" id="userId" placeholder="id">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="userName" placeholder="姓名">
          </div>
          <div class="form-group">
            <input type="radio" class="radio" id="boy" name="sex" value="1" style="display: inline-block;"/>
            <span>帅哥</span>

            <input type="radio" class="radio" id="girl" name="sex" value="0" style="display: inline-block;"/>
            <span>靓妹</span>

          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="position" placeholder="职位">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="age" placeholder="年龄">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="work_time" placeholder="工龄">
          </div>
          <%--<div class="form-group">--%>
          <%--<input type="text" class="form-control" id="org" placeholder="部门">--%>
          <%--</div>--%>
          <div class="form-group">
            <input type="text" disabled="disabled" class="form-control" id="org">
            <input type="hidden" id="orgId" value="">
          </div>
        </div>
        <div class="modal-footer" style="margin-top: 15px;">
          <button type="button" class="btn btn-info" id="addOrEditUser">保存数据</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 信息删除确认 -->
  <div class="modal fade" id="deleteModal">
    <div class="modal-dialog" style="width: 300px;">
      <div class="modal-content message_align">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
          <h4 class="modal-title">提示信息</h4>
        </div>
        <div class="modal-body">
          <p>您确认要删除吗？</p>
        </div>
        <div class="modal-footer">
          <input type="hidden" id="deleteId"/>
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <a  onclick="deleteUser()" class="btn btn-primary" data-dismiss="modal">确定</a>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->


  <script type="text/javascript">

  </script>
</body>
</html>

