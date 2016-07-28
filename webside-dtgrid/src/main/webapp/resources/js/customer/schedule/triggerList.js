var dtGridColumns = [{
    id : 'triggerName',
    title : 'trigger名称',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs'
}, {
    id : 'triggerGroup',
    title : 'trigger组',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs'
}, {
    id : 'triggerStatus',
    title : '任务状态',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'xs',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if(value == 'NONE')
        {
            return '<span class="label label-sm label-pink arrowed arrowed-right">未知</span>';
        }else if (value=='NORMAL') 
        {
            return '<span class="label label-sm label-info arrowed arrowed-right">正常</span>';
        } else if(value == 'PAUSED')
        {
            return '<span class="label label-sm label-warning arrowed arrowed-right">已暂停</span>';
        }else if(value == 'COMPLETE')
        {
            return '<span class="label label-sm label-success arrowed arrowed-right">已完成</span>';
        }else if(value == 'ERROR')
        {
            return '<span class="label label-sm label-danger arrowed arrowed-right">异常</span>';
        }else if(value == 'BLOCKED')
        {
            return '<span class="label label-sm label-light arrowed arrowed-right">等待运行</span>';
        }else
        {
            return '<span class="label label-sm label-pink arrowed arrowed-right">未知</span>';
        }
    }
}, {
    id : 'cronExpression',
    title : 'cron表达式',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'nextFireTime',
    title : '下次触发时间',
    type : 'date',
    format : 'yyyy-MM-dd hh:mm:ss',
    otype : 'string',
    oformat : 'yyyy-MM-dd hh:mm:ss',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if (value == null) {
            return '';
        } else {
            return value;
        }
    }
}, {
    id : 'startDate',
    title : '执行开始时间',
    type : 'date',
    format : 'yyyy-MM-dd hh:mm:ss',
    otype : 'string',
    oformat : 'yyyy-MM-dd hh:mm:ss',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md|lg',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if (value == null) {
            return '';
        } else {
            return value;
        }
    }
}, {
    id : 'endDate',
    title : '执行结束时间',
    type : 'date',
    format : 'yyyy-MM-dd hh:mm:ss',
    otype : 'string',
    oformat : 'yyyy-MM-dd hh:mm:ss',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md|lg',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        if (value == null) {
            return '';
        } else {
            return value;
        }
    }
}];

//动态设置jqGrid的rowNum
var pageSize = $("#pageSize").val();
pageSize = pageSize == 0 || pageSize == "" ? sys.pageNum : pageSize;

var dtGridOption = {
    lang : 'zh-cn',
    ajaxLoad : true,
    loadAll : true,
    postParams : true,//是否传递参数,只在loadAll=true时有效
    isreload : true,//刷新时是否重新从服务器获取数据,只在loadAll=true时有效
    check : true,
    checkWidth :'37px',
    extraWidth : '37px',
    loadURL : sys.rootPath + '/scheduleJob/jobTriggerList.html',
    columns : dtGridColumns,
    gridContainer : 'dtGridContainer',
    toolbarContainer : 'dtGridToolBarContainer',
    tools : 'refresh',
    pageSize : pageSize,
    pageSizeLimit : [10, 20, 30]
};

var grid = $.fn.dlshouwen.grid.init(dtGridOption);
$(function() {
    grid.parameters = new Object();
    grid.parameters['jobName'] = $("#jobName").val();
    grid.parameters['jobGroup'] = $("#jobGroup").val();
    grid.load();
});

/**
 * 自定义查询
 * 这里不传入分页信息，防止删除记录后重新计算的页码比当前页码小而导致计算异常
 */
function customSearch() {
    grid.parameters = new Object();
    grid.parameters['jobName'] = $("#jobName").val();
    grid.parameters['jobGroup'] = $("#jobGroup").val();
    grid.load();
}
