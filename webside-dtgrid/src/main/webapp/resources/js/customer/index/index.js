$(function() {
    init();
    $("[nav-menu]").each(function() {
        $(this).bind("click", function() {
            var nav = $(this).attr("nav-menu");
            var sn = nav.split(",");
            if(sn[sn.length-1] == '/sirona' || sn[sn.length-1] == '/druid')
            {
                window.open(sys.rootPath + sn[sn.length - 1]);
            }else
            {
            
            var breadcrumb = '<li><i class="ace-icon fa fa-home home-icon"></i><a href="javascript:init();">首页</a></li>';
            for (var i = 0; i < sn.length - 1; i++) {
                breadcrumb += '<li class="active">' + sn[i] + '</li>';
            }
            
            //设置面包屑内容
            $(".breadcrumb").html(breadcrumb);
            //加载页面
            $(".page-content").load(sys.rootPath + sn[sn.length - 1]);
            //处理目录类型的点击事件
            $(this).parent("li").siblings().find("ul.nav-show").removeClass('nav-show').addClass('nav-hide').attr('style','display:none');
            //处理菜单类型的点击事件
            $(this).parent().parent().parent("li").siblings().find("ul.nav-show").removeClass('nav-show').addClass('nav-hide').attr('style','display:none');
            $("ul.nav-list").find("li.active").removeClass("active").removeClass('open');
            $(this).parent().addClass("active").parent().parent("li").addClass('active open');
            
            //清除用户信息菜单样式
            $(".user-menu").find('li').each(function() {
                $(this).removeClass('active');
            }); 
            
            }
            
        });
    });

    $("#ace-settings-navbar").click();
    $("#ace-settings-sidebar").click();
    //$("#ace-settings-breadcrumbs").click();
    $("html").niceScroll({
        cursorborderradius : "5px",
        cursorwidth:10
    });
    
    $(".user-menu").find('li').each(function() {
      $(this).bind('click', function() {
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
      });
    });
    
});

function init() {
    $(".page-content").load(sys.rootPath + "/welcome.jsp");
    $(".breadcrumb").html('<li><i class="ace-icon fa fa-home home-icon"></i><a href="javascript:init();">首页</a></li>');
}

//监听浏览器窗口大小变化
$(window).resize(function() {
    $("html").getNiceScroll().resize();
});



/**
 *加载非菜单展示页面
 * @param nav 待加载的资源URL
 */
function loadPage(nav) {
    //加载页面
    $(".page-content").load(sys.rootPath + nav);
}

/**
 * 新增
 * @param {Object} nav  提交url
 */
function addModel(nav) {
    //加载新增页面
    loadPage(nav);
}

/**
 * 编辑
 * @param {Object} nav  提交url
 */
function editModel(nav) {
    //当前页码
    var nowPage = grid.pager.nowPage;
    //获取每页显示的记录数(即: select框中的10,20,30)
    var pageSize = grid.pager.pageSize;
    //获取排序字段
    var columnId = grid.sortParameter.columnId;
    //获取排序方式 [0-不排序，1-正序，2-倒序]
    var sortType = grid.sortParameter.sortType;
    //获取选择的行
    var rows = grid.getCheckedRecords();
    if (rows.length == 1) {
        loadPage(nav + '?id=' + rows[0].id + "&page=" + nowPage + "&rows=" + pageSize + "&sidx=" + columnId + "&sord=" + sortType);
    } else {
        layer.msg("你没有选择行或选择了多行数据", {
            icon : 0
        });
    }
}

/**
 * 删除
 * @param {Object} nav  提交url
 * @param callback 主函数执行完毕后调用的回调函数名称
 */
function delModel(nav, callback) {
    var rows = grid.getCheckedRecords();
    if (rows.length == 1) {
        if(nav == '/user/deleteBatch.html')
        {
            if(rows[0].role.name == '超级管理员')
            {
                layer.msg('该用户为超级管理员,不能删除!',{icon:0});
                return false;
            }
        }
        if(nav == '/role/deleteBatch.html')
        {
            if(rows[0].name == '超级管理员')
            {
                layer.msg('该角色为基础角色,不能删除!',{icon:0});
                return false;
            }
        }
        layer.confirm('确认删除吗？', {icon:3,title:'删除提示'},function(index, layero) {
            var ids = [];
            /*
            $.each(rows, function(index, value) {
                ids.push(this.id);
            });
            */
           ids.push(rows[0].id);
            $.ajax({
                type : "POST",
                url : sys.rootPath + nav,
                data : {
                    "ids" : ids.join(',')
                },
                dataType : "json",
                success : function(resultdata) {
                    if (resultdata.success) {
                        layer.msg(resultdata.message,{icon:1});
                        if (callback) {
                            callback();
                        }
                    } else {
                        layer.msg(resultdata.message,{icon:5});
                    }
                },
                error : function(errorMsg) {
                    layer.msg('服务器未响应,请稍后再试',{icon:3});
                }
            });
            layer.close(index);
        });
    }else
    {
        layer.msg("你没有选择行或选择了多行数据",{icon:0});
    }
}

/**
 * 提交表单
 * 适用场景：form表单的提交，主要用在用户、角色、资源等表单的添加、修改等
 * @param {Object} commitUrl 表单提交地址
 * @param {Object} listUrl 表单提交成功后转向的列表页地址
 */
function commit(formId, commitUrl, jumpUrl) {
    //组装表单数据
    var index;
    var data = $("#"+ formId).serialize();
    if(undefined != $("#pageNum").val())
    {
        jumpUrl = jumpUrl + '?page=' + $("#pageNum").val() + '&rows=' + $("#pageSize").val() + '&sidx=' + $("#orderByColumn").val() + '&sord=' + $("#orderByType").val();
    }
    $.ajax({
        type : "POST",
        url : sys.rootPath + commitUrl,
        data : data,
        dataType : "json",
        beforeSend : function()
        {
            index = layer.load();
        },
        success : function(resultdata) {
            layer.close(index);
            if (resultdata.success) {
                layer.msg(resultdata.message,{icon:1});
                loadPage(jumpUrl);
            } else {
                layer.msg(resultdata.message,{icon:5});
            }
        },
        error : function(data, errorMsg) {
            layer.close(index);
            layer.msg(data.responseText ,{icon:2});
        }
    });
}

