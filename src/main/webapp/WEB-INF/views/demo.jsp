<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/tableJs/table.js"></script>
  <script type="text/javascript" src="js/icheck.js"></script>
  <%--<script type="text/javascript" src="js/tableJs/table-advanced.js"></script>--%>
  <%--<script type="text/javascript" src="js/tableJs/app.js"></script>--%>
  <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/mertronic/style-metronic.css" rel="stylesheet" type="text/css"/>
  <link href="css/mertronic/style.css" rel="stylesheet" type="text/css"/>
  <link href="css/iCheck/skins/all.css" rel="stylesheet" type="text/css"/>

</head>

<div class="portlet box green">
  <div class="portlet-title">
    <div class="caption">
      <i class="fa fa-globe"></i>数据录入增删改查
    </div>
  </div>
  <div class="portlet-body">
      <table id="extable" class="display cell-border" cellspacing="0" width="100%">
        <thead class="text-center">
        <tr>
          <th class="text-center"><input id="selectAll1" type="checkbox" value=""></th>
          <th class="text-center">id</th>
          <th class="text-center">name</th>
          <th class="text-center">sex</th>
          <th class="text-center">position</th>
          <th class="text-center">age</th>
          <th class="text-center">work_time</th>
          <th class="text-center">org</th>
          <%--<th class="text-center">operator</th>--%>
        </tr>
        </thead>
        <tbody class="text-center">
        </tbody>
        <%--<tfoot>--%>
        <%--<tr>--%>
          <%--<th style="padding-left: 10px;"><input id="selectAll2" type="checkbox" value=""></th>--%>
          <%--<th class="text-center">id</th>--%>
          <%--<th class="text-center">name</th>--%>
          <%--<th class="text-center">sex</th>--%>
          <%--<th class="text-center">position</th>--%>
          <%--<th class="text-center">age</th>--%>
          <%--<th class="text-center">work_time</th>--%>
          <%--<th class="text-center">org</th>--%>
          <%--<th class="text-center">operator</th>--%>
        <%--</tr>--%>
        <%--</tfoot>--%>
      </table>
    <!-- 按钮触发模态框 -->
    <button type="button" class="btn btn-info" id="initData" data-toggle="modal" data-target="#myModal">添加数据</button>
    <button type="button" class="btn btn-primary" id="edit" data-toggle="modal" data-target="#myModal">编辑选中行</button>
    <button type="button" id="delete" class="btn btn-danger">删除选中行</button>
    </div>
  </div>



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span--%>
                <%--aria-hidden="true">&times;</span></button>--%>
        <h4 class="modal-title" id="myModalLabel">新增</h4>
      </div>

      <div class="modal-body">
        <div class="form-group">
          <input type="hidden" class="form-control" id="id" placeholder="id">
        </div>
        <div class="form-group">
          <input type="text" class="form-control" id="name" placeholder="姓名">
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
          <select class="form-control" id="org">
            <option value="产品研发中心">产品研发中心</option>
            <option value="企发部">企发部</option>
            <option value="水务部">水务部</option>
            <option value="汽车事业部">汽车事业部</option>
            <option value="后勤部">后勤部</option>
          </select>
        </div>
      </div>
      <div class="modal-footer" style="margin-top: 15px;">
        <button type="button" class="btn btn-info" id="addOrEdit">保存数据</button>
      </div>
    </div>
  </div>
</div>
<script>

</script>
</html>
