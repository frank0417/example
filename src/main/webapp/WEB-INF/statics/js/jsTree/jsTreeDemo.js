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

    //初始化datatables
    initDatatable(1);

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

    //编辑按钮数据传递
    $('#extable tbody').on( 'click', 'button#editUser', function () {
        //前端获取该按钮所在tr的数据
        var data = tables.row( $(this).parents('tr') ).data();

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
                    $("#extable").dataTable().fnDraw(false);
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
    tables = $('#extable').DataTable({
        "bAutoWidth": true, //自适应宽度
        "aaSorting": [[0, "asc"]],
        "lengthMenu": [10,20,30],
        "pagingType": "full_numbers",//除首页、上一页、下一页、末页四个按钮还有页数按钮
        "language": {
            "processing": "正在加载中......",
            "lengthMenu": "每页显示 _MENU_ 条记录",
            "zeroRecords": "对不起，查询不到相关数据！",
            "info": "当前显示第 _PAGE_ 页，共 _PAGES_ 页, _TOTAL_ 条记录",//当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录
            "infoEmpty": "没找到数据",
            "infoFiltered": "(filtered from _MAX_ total records)",
            "search": "根据姓名搜索",
            "paginate": {
                "sFirst": "首页",
                "sPrevious": "上一页",
                "sNext": "下一页",
                "sLast": "末页"
            }
        },
        "destroy":true, //Cannot reinitialise DataTable,解决重新加载表格内容问题
        "processing": true,//显示加载过程
        "serverSide": true,//开启服务器处理
        "searchable": true,//开启搜索
        "ordering":  false,//关闭排序功能
        "ajax":{
            //    "ajax":"http://localhost:8080/example/js/Json.txt"
            //        //"dataSrc": "",
            "url":"/example/orgUser?orgId="+orgId
        },
        "columns": [
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
            { "data": "id" },
            { "data": "name" },
            { "data": "sex" },
            { "data": "position" },
            { "data": "age"},
            { "data": "work_time"},
            { "data": "org"},
            {
                "data": "id",
                "render": function ( data, type, full, meta ) {
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



