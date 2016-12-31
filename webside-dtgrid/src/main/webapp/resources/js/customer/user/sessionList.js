var dtGridColumns = [{
    id : 'accountName',
    title : '账户名',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'roleName',
    title : '所属角色',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'xs',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if (/*typeof(value) == "undefined" ||*/ "" == value || null == value) {
            return '未指定';
        } else {
            return value;
        }
    }
}, {
    id : 'sessionStatus',
    title : '状态',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if (value == true) {
            return '<span class="label label-sm label-success arrowed arrowed-righ">在线</span>';
        } else {
            return '<span class="label label-sm label-warning arrowed arrowed-righ">离线</span>';
        }
    }
}, {
    id : 'lastAccess',
    title : '登录时间',
    type : 'date',
    format : 'yyyy-MM-dd hh:mm:ss',
    otype : 'string',
    oformat : 'yyyy-MM-dd hh:mm:ss',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs'
}];

//动态设置jqGrid的rowNum
var pageSize = $("#pageSize").val();
pageSize = pageSize == 0 || pageSize == "" ? sys.pageNum : pageSize;

var dtGridOption = {
    lang : 'zh-cn',
    check : true,
    checkWidth :'37px',
    extraWidth : '37px',
    ajaxLoad : true,
    loadAll : true,
    loadURL : sys.rootPath + '/session/list.html',
    columns : dtGridColumns,
    gridContainer : 'dtGridContainer',
    toolbarContainer : 'dtGridToolBarContainer',
    tools : 'refresh',
    exportFileName : '用户信息',
    pageSize : pageSize,
    pageSizeLimit : [10, 20, 30]
};

var grid = $.fn.dlshouwen.grid.init(dtGridOption);
$(function() {  
    grid.load();   
});


/**
 *踢出
 */
function kickout() {
    var rows = grid.getCheckedRecords();
    if (rows.length == 1) {
        var index;
        $.ajax({
            type : "POST",
            url : sys.rootPath + '/session/kickout.html',
            data : {
                "ids" : rows[0].sessionId
            },
            dataType : "json",
            beforeSend : function()
            {
                index = layer.load();
            },
            success : function(resultdata) {
                layer.close(index);
                if (resultdata.success) {
                    layer.msg(resultdata.message, {
                        icon : 1
                    });
                    webside.common.loadPage('/session/listUI.html');
                } else {
                    layer.msg(resultdata.message, {
                        icon : 5
                    });
                }
            },
            error : function(data, errorMsg) {
                layer.close(index);
                layer.msg(data.responseText, {icon : 2});
            }
        });
    } else {
        layer.msg("你没有选择行或选择了多行数据", {
            icon : 0
        });
    }
}

/**
 *查看详情
 */
function sessionInfo() {
    var rows = grid.getCheckedRecords();
    if (rows.length == 1) {
    	webside.common.loadPage('/session/info.html?sessionId='+rows[0].sessionId);
    } else {
        layer.msg("你没有选择行或选择了多行数据", {
            icon : 0
        });
    }
}

