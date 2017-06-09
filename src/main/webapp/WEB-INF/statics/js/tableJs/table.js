$(document).ready(function() {
    $('#extable').dataTable({
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
        "processing": true,//显示加载过程
        "serverSide": true,//开启服务器处理
        "searchable": true,//开启搜索
        "ordering":  false,//关闭排序功能
        "ajax":{
    //    "ajax":"http://localhost:8080/example/js/Json.txt"
    //        //"dataSrc": "",
            "url":"/example/findAll"
        },
        "columns": [
            {
                "data": "id",
                //"createdCell": function (cell, cellData, rowData, row, col) {
                //    return $(cell).html("<input name='checkList' type='checkbox' value="+ cellData +">")
                //},
                "render": function ( data, type, full, meta ) {
                    return "<input name='checkList' type='checkbox' value="+ data +">";
                }
            },
            { "data": "id" },
            { "data": "name" },
            { "data": "sex" },
            { "data": "position" },
            { "data": "age"},
            { "data": "work_time"},
            { "data": "org"},
            //{ "data": "operator"}
        ],
        //"columnDefs": [
        //    {
        //        "data": null,
        //        "defaultContent": "<button class='btn btn-primary'>Edit</button>",
        //        "targets": -1
        //    }
        //]
    });

    //实现选中操作
    $('#extable tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).find("input[type=checkbox]").prop("checked", false);
            $(this).removeClass('selected');
        }
        else {
            $(this).addClass('selected');
            $(this).find("input[type=checkbox]").prop("checked", true);
        }
    } );

    //按钮全选
    $('#selectAll1').on('ifChanged', function(event){
        if ($(this).prop("checked")) {
            $("input[name='checkList']").prop("checked", true);
            $("tr").addClass('selected');
        } else {
            $("input[name='checkList']").prop("checked", false);
            $("tr").removeClass('selected');
        }
    });

    //实现删除
    $('#delete').click( function () {
        ////直接从td里获取id
        //var i = 0;
        //var deleList = new Array();
        //table.$('tr.selected').each(function() {
        //    deleList[i] = $(this).find("td:eq(1)").text();
        //    i++;
        //});

        //从checkbox里获取value
        var i = 0;
        var deleList = new Array();
        $('input[type=checkbox]:checked').each(
            function() {
                deleList[i] = $(this).val();
                i++;
            }
        );
        if(id == null || id == '') {
            alert("请选择删除对象！");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/example/deleteById?deleList="+deleList.toString(),
            cache: false,
            dataType: 'json',

            success: function (data) {
                if(data.state) {
                    table.row('.selected').remove().draw( false );
                }
            }
        });
    } );

    var table = $('#extable').dataTable();
    $('#edit').click( function () {
        var selectedTr = table.$('tr.selected');
        var id = selectedTr.find("td:eq(1)").text();
        if(selectedTr.length > 1) {
            alert("只能选择一个对象！");
            return false;
        }
        if(id == null || id == '') {
            alert("请选择编辑的对象！");
            return false;
        }
        var name = selectedTr.find("td:eq(2)").text();
        var sex = selectedTr.find("td:eq(3)").text();
        var position = selectedTr.find("td:eq(4)").text();
        var age = selectedTr.find("td:eq(5)").text();
        var work_time = selectedTr.find("td:eq(6)").text();
        var org = selectedTr.find("td:eq(7)").text();

        $('#id').val(id);
        $('#name').val(name);
        $('#position').val(position);
        $('#age').val(age);
        $('#work_time').val(work_time);
        $('#org').val(org);
        $('#myModalLabel').html("编辑");
        if(sex == "男"){
            $('#boy').iCheck('check');
        } else {
            $('#girl').iCheck('check');
        }

    } );

    $('#initData').click( function () {

        $('#id').val('');
        $('#name').val('');
        $('#position').val('');
        $('#age').val('');
        $('#work_time').val('');
        $('#org').val('产品研发中心');
        $('#myModalLabel').html("新增");
        $('#boy').iCheck('check');

    } );

    $('#addOrEdit').click( function () {
        var user={}
        user.id = $('#id').val();
        user.name = $('#name').val();
        user.sex = $("input[name='sex']:checked").val();
        user.position = $('#position').val();
        user.age = $('#age').val();
        user.work_time = $('#work_time').val();
        user.org = $('#org').val();
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
                    $('#myModal').modal('hide');
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
} );





//function myFunction() {
//    $.ajax({
//        type: "post",
//        dataType: "html",
//        url: 'http://localhost:8080/example/findAll',
//        success: function (data) {
//            if (data != "") {
//                $("#div").html(data);
//            }
//        }
//    });
//}
