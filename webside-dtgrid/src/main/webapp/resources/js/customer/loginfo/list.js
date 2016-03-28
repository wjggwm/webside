var dtGridColumns = [{
    id : 'id',
    title : '编号',
    type : 'number',
    columnClass : 'text-center',
    headerStyle:'background:#00a2ca;color:white;'
}, {
    id : 'userId',
    title : '用户ID',
    type : 'string',
    columnClass : 'text-center',
    headerStyle:'background:#00a2ca;color:white;'
}, {
    id : 'accountName',
    title : '账户名称',
    type : 'string',
    columnClass : 'text-center',
    headerStyle:'background:#00a2ca;color:white;'
}, {
    id : 'operation',
    title : '操作',
    type : 'string',
    columnClass : 'text-center',
    headerStyle:'background:#00a2ca;color:white;',
    hideType : 'xs'
}, {
    id : 'createTime',
    title : '操作时间',
    type : 'date',
    format : 'yyyy-MM-dd hh:mm:ss',
    otype:'string', 
    oformat:'yyyy-MM-dd hh:mm:ss',
    columnClass : 'text-center',
    headerStyle:'background:#00a2ca;color:white;',
    hideType : 'sm|xs'
}, {
    id : 'content',
    title : '操作内容',
    type : 'string',
    columnClass : 'text-center',
    headerStyle:'background:#00a2ca;color:white;',
    hideType : 'sm|xs|md|lg'
}];
var dtGridOption = {
    lang : 'zh-cn',
    ajaxLoad : true,
    loadURL : sys.rootPath + '/logInfo/list.html',
    columns : dtGridColumns,
    gridContainer : 'dtGridContainer',
    toolbarContainer : 'dtGridToolBarContainer',
    tools : '',
    pageSize : 10,
    pageSizeLimit : [10, 20, 30]
};
var grid = $.fn.DtGrid.init(dtGridOption);
$(function() {
    grid.load();
    $("#btnSearch").click(customSearch);
    
    //注册回车键事件
    document.onkeypress = function(e){
    var ev = document.all ? window.event : e;
        if(ev.keyCode==13) {
            customSearch();
        }
    };
    
});

//自定义查询
function customSearch() {
    grid.parameters = new Object();
    grid.parameters['accountName'] = $("#searchKey").val();
    grid.refresh(true);
}
