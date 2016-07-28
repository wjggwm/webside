var dtGridColumns = [{
    id : 'jobName',
    title : '任务名称',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header'
}, {
    id : 'jobGroup',
    title : '任务组',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'xs'
}, {
    id : 'jobClassName',
    title : '执行类',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs|md|lg'
}, {
    id : 'jobDesc',
    title : '任务描述',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    hideType : 'sm|xs'
}, {
    id : 'action',
    title : '操作',
    type : 'string',
    columnClass : 'text-center',
    headerClass : 'dlshouwen-grid-header',
    resolution : function(value, record, column, grid, dataNo, columnNo) {
        return '<a onclick="webside.form.schedule.getTrigger(\''+record.jobName+'\',\''+record.jobGroup+'\');" href="javascript:void(0);">查看trigger</a>';
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
    loadURL : sys.rootPath + '/scheduleJob/planningJobList.html',
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
    grid.parameters['timestamp'] = new Date().getTime();
    grid.load();  
});

/**
 * 重新加载表格
 */
function customSearch() {
    grid.parameters = new Object();
    grid.parameters['timestamp'] = new Date().getTime();
    grid.reload(true);
}