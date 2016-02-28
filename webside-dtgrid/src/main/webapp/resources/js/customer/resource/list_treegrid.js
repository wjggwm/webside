$(function() {
    var grid_selector = "#grid-table";
    var pager_selector = "#grid-pager";

    $(grid_selector).jqGrid({
        treeGrid : true,
        styleUI : sys.gridStyle,
        mtype : "POST",
        datatype : "json",
        treedatatype : "json",
        caption : "资源列表",
        postData : {"name":""}, //发送额外的参数
        url : sys.rootPath + '/resource/list.html',
        height : 'auto',
        hoverrows : true,
        scrollrows : true,
        gridview : true,
        ExpandColumn : "name",
        ExpandColClick : true,
        shrinkToFit : true,
        forceFit : true,
        treeGridModel: 'adjacency', //treeGrid模式，跟json元数据有关,可选adjacency(邻接模型)、nested(嵌套集合模型)
        colModel : [{
            lable : "ID",
            name : "id",
            key : true,
            hidden : true
       },{
            label : '资源名称',
            name : 'name',
            sortable:false,
            width : 150
        }, {
            label : '资源标识',
            name : 'sourceKey',
            sortable:false,
            width : 90
        }, {
            label : '资源类型',
            name : 'type',
            sortable:false,
            width : 50,
            formatter : function(cellvalue, options, rowObject)
            {
                if(cellvalue==0)
                {
                    return "目录";
                }else if(cellvalue == 1)
                {
                    return "菜单";
                }else
                {
                    return "按钮";
                }
            }
        }, {
            label : '资源url',
            name : 'sourceUrl',
            sortable:false,
            width : 200
        }, {
            label : '层级',
            name : 'level',
            width : 30,
            sortable:false,
            hidden : true
        }, {
            label : '描述',
            name : 'description',
            width : 150,
            sortable:false
        }, {
            label : '添加时间',
            name : 'createTime',
            sortable:false,
            width : 100,
            formatter : 'date',
            formatoptions: {newformat:'Y-m-d'}
        }, 
        {
            label : '操作',
            width : 80,
            fixed : true,
            sortable:false,
            resize : false,
            formatter : 'actions',
            formatoptions : {
                keys : true,
                delbutton : true,
                delOptions : {
                    recreateForm : true,
                    beforeShowForm : beforeDeleteCallback
                },
                editformbutton : true,
                editOptions : {
                    recreateForm : true,
                    beforeShowForm : beforeEditCallback
                }
            }
        }],
        //设置为null将不发送到服务器
        prmNames : {
            search : null,
            nd : null,
            sidx : null,
            sord : null
        },
        jsonReader : {
            id : "id",
            root : "root",
            page : "page",
            total : "total",
            records : "records",
            repeatitems: false
        },
        treeReader:{
            level_field: "level",
            parent_id_field: "parentId",
            leaf_field: "isLeaf",
            expanded_field: "isExpanded",
            loaded: "loaded",
            icon_field: "icon"
        },
        loadComplete : function() {
            var table = this;
            setTimeout(function() {
                enableTooltips(table);
            }, 0);
        }
    });
    
    
    var parent_column = $(grid_selector).closest('[class*="col-"]');
    //resize to fit page size
    $(window).on('resize.jqGrid', function() {
        $(grid_selector).jqGrid('setGridWidth', parent_column.width());
    });

    //resize on sidebar collapse/expand
    $(document).on('settings.ace.jqGrid', function(ev, event_name, collapsed) {
        if (event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed') {
            //setTimeout is for webkit only to give time for DOM changes and then redraw!!!
            setTimeout(function() {
                $(grid_selector).jqGrid('setGridWidth', parent_column.width());
            }, 0);
        }
    });
    
    $(window).triggerHandler('resize.jqGrid');
    //trigger window resize to make the grid get the correct size

    function beforeDeleteCallback(e) {
        var form = $(e[0]);
        if (form.data('styled'))
            return false;

        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />');
        //添加自己删除代码

        form.data('styled', true);
    }

    function beforeEditCallback(e) {
        var form = $(e[0]);
        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />');
        //添加自己编辑代码

    }

    $(grid_selector).closest(".ui-jqgrid-bdiv").css({ 'overflow-x' : 'hidden' });

    function enableTooltips(table) {
        $('.navtable .ui-pg-button').tooltip({
            container : 'body'
        });
        $(table).find('.ui-pg-div').tooltip({
            container : 'body'
        });
    }

    $(document).one('ajaxloadstart.page', function(e) {
        $.jgrid.gridDestroy(grid_selector);
        $('.ui-jqdialog').remove();
    });
}); 