var tables;
var treeOrgId;
var nodeName;
$(function(){
    //初始化树
    $('#jstree_demo_div').jstree({
        "plugins" : [ "wholerow","types" ],
        'core' : {            //核心配置
            "themes" : {
                "responsive": false
            },
            "multiple" : false, //单选
            'data': {
                'url': '/example/getJsTreeAsy',
//          'url': '//www.jstree.com/fiddle/?lazy',
                'data': function (node) {
                    return {'id': node.id};
                }
            }
            //"themes": {"stripes": true}  //背景为条纹
        },
        "types" : {
            //"#" : {
            //    "max_children" : 1,
            //    "max_depth" : 4,
            //    "valid_children" : ["root"]
            //},
            //"root" : {
            //    "icon" : "images/tree_icon.png",
            //    "valid_children" : ["default"]
            //},
            //"file" : {
            //    "icon" : "glyphicon glyphicon-file",
            //    "valid_children" : []
            //}
            "default" : {
                "icon" : "images/originWater.png"
            },
            "file" : {
                "icon" : "images/originWater.png"
            }
        },
    });

    //$('#jstree_demo_div').bind('click.jstree', function(event) {
    //        console.log(event.target.id);
    //});

    $('#jstree_demo_div').on("changed.jstree", function (e, data) {
        console.log("The selected nodes are:");
        console.log(data.selected);
        treeOrgId = data.selected;
        //var nodeName = e.target.nodeName;
        nodeName = data.instance.get_node(data.selected[0]).text;
        //$('#org').val(nodeName);
        //$('#orgId').val(orgId);
        initDatatable(treeOrgId[0]);

    });

    //点击事件
    //$('#jstree_demo_div').bind("activate_node.jstree", function (obj, e) {
    //    // 处理代码
    //    // 获取当前节点
    //    var currentNode = e.node;
    //        treeOrgId = currentNode.id;
    //        //var nodeName = e.target.nodeName;
    //        nodeName = currentNode.text;
    //        //$('#org').val(nodeName);
    //        //$('#orgId').val(orgId);
    //        initDatatable(treeOrgId);
    //});

    //编辑按钮数据传递
    $('#sample_editable_1 tbody').on( 'click', 'button#editUser', function () {
        //前端获取该按钮所在tr的数据
        var nRow = $(this).parents('tr')[0];
        var a = $(this).parents('tr');
        var data = tables.fnGetData( nRow );

        $('#userId').val(data.id);
        $('#userName').val(data.name);
        $('#position').val(data.position);
        $('#age').val(data.age);
        $('#work_time').val(data.work_time);
        $('#org').val(data.org);
        $('#orgId').val(data.orgId);
        $('#myModalLabel').html("编辑");
        if(data.sex == "男"){
            $('#boy').iCheck('check');
        } else {
            $('#girl').iCheck('check');
        }
    });

    //保存员工信息
    $('#addOrEditUser').click( function () {
        var user={}
        user.id = $('#userId').val();
        user.name = $('#userName').val();
        user.sex = $("input[name='sex']:checked").val();
        user.position = $('#position').val();
        user.age = $('#age').val();
        user.work_time = $('#work_time').val();
        user.org = $('#org').val();
        user.orgId = $('#orgId').val();
        if(user.name != null && user.position != null && user.age != null
            && user.work_time != null && user.org!=null){
            $.ajax({
                type: "POST",
                url: "/example/addOrEdit",
                cache: false,
                dataType: 'json',
                data:user,
                success: function (data) {
                    if(data.state) {
                        if(user.id != null) {
                            alert("操作成功！");
                        }
                    } else {
                        alert("操作失败！");
                    }
                    $('#myModalForUser').modal('hide');
                    $("#sample_editable_1").dataTable().fnDraw(false);
                }
            });
        } else {
            alert("数据不能为空");
        }
    });

    //初始化icheck插件
    $('input').iCheck({
        labelHover : false,
        cursor : true,
        checkboxClass : 'icheckbox_square-blue',
        radioClass : 'iradio_square-blue',
        increaseArea : '10%'
    });
});

function initDatatable(orgId){
    tables = $('#sample_editable_1').DataTable({
        "bAutoWidth": true, //自适应宽度
        "aaSorting": [[0, "asc"]],
        "aLengthMenu": [10,20,30],
        "sPaginationType": "bootstrap",//除首页、上一页、下一页、末页四个按钮还有页数按钮
        "oLanguage": {
            "sProcessing": "正在加载中......",
            "sLengthMenu": "每页显示 _MENU_ 条记录",
            "sZeroRecords": "对不起，查询不到相关数据！",
            "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",//当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录
            "sInfoEmpty": "没找到数据",
            "sInfoFiltered": "(filtered from _MAX_ total records)",
            "sSearch": "根据姓名搜索",
            "oPaginate": {
                "sPrevious": "Prev",
                "sNext": "Next"
            }
        },
        "bDestroy":true, //Cannot reinitialise DataTable,解决重新加载表格内容问题
        "bProcessing": true,//显示加载过程
        "bServerSide": true,//开启服务器处理
        "bFilter": true,//开启搜索
        "bSort":  false,//关闭排序功能
        "sAjaxSource":"/example/orgUser?orgId="+orgId,
        "aoColumns": [
            //{
            //    "data": "id",
            //"createdCell": function (cell, cellData, rowData, row, col) {
            //    return $(cell).html("<input name='checkList' type='checkbox' value="+ cellData +">")
            //},
            //渲染checkBox
            //"render": function ( data, type, full, meta ) {
            //    return "<input name='checkList' type='checkbox' value="+ data +">";
            //}
            //},
            { "mDataProp": "id" },
            { "mDataProp": "name" },
            { "mDataProp": "sex" },
            { "mDataProp": "position" },
            { "mDataProp": "age"},
            { "mDataProp": "work_time"},
            { "mDataProp": "org"},
            {
                "mDataProp": "id",
                "mRender": function ( data, type, full, meta ) {
                    return "<button class='btn btn-primary' id='editUser' data-toggle='modal' data-target='#myModalForUser' "
                        +">编辑</button>"
                        +"<button class='btn btn-danger' onclick='deleteConfirm(" + data +")'>删除</button>";
                }
            }
        ]
        //"columnDefs": [
        //    {
        //        "data": null,
        //        "defaultContent": "<button class='btn btn-primary'>Edit</button>",
        //        "targets": -1
        //    }
        //]
    });
    jQuery('#sample_editable_1_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
    jQuery('#sample_editable_1_wrapper .dataTables_length select').addClass("form-control input-small"); // modify table per page dropdown
};

//弹出删除确认框
function deleteConfirm(id) {
    $('#deleteId').val(id);
    $('#deleteModal').modal('show');
}

//删除员工信息
function deleteUser() {
    var id = $('#deleteId').val();
    $.ajax({
        type: "POST",
        url: "/example/deleteById?id="+id,
        cache: false,
        dataType: 'json',

        success: function (data) {
            if(data.state) {
                tables.row( $(this).parents('tr') ).remove().draw( false );
            }
        }
    });
};

//初始化新增员工
function initAddUser() {
    if(treeOrgId == null || treeOrgId == '' || nodeName == null || nodeName == '') {
        alert('请选择所在部门！');
        return false;
    } else {
        $('#userId').val('');
        $('#userName').val('');
        $('#position').val('');
        $('#age').val('');
        $('#work_time').val('');
        $('#org').val(nodeName);
        $('#orgId').val(treeOrgId);
        $('#myModalLabel').html("新增");
        $('#boy').iCheck('check');
        $('#myModalForUser').modal('show');
    }
};



