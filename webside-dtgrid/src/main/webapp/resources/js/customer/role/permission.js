$(function() {
    $('#tree').jstree({
        "core" : {
            'data' : {
                "url" : sys.rootPath + "/resource/resourceTree.html?roleId="+$("#id").val(),
                "dataType" : "json"
            },
            "themes" : {
                "responsive" : true
            },
            "multiple" : true,
            "animation" : 200,
            "dblclick_toggle" : true,
            "expand_selected_onload" : true
        },
        "checkbox" : {
            "keep_selected_style" : true,
            "three_state" : false,
            "cascade" : "up"
        },
        "plugins" : ["checkbox"]
    });
});

var ids = [];

/**
 * 提交表单
 * 适用场景：form表单的提交，主要用在用户、角色、资源等表单的添加、修改等
 * @param {Object} commitUrl 表单提交地址
 * @param {Object} listUrl 表单提交成功后转向的列表页地址
 */
function commitPerm(commitUrl, listUrl) {
    ids = [];
    var tree = $('#tree').jstree();
    //获取所有选中节点id
    var selectedIds = tree.get_checked();
    //获取所有选中节点
    var selected = tree.get_checked(true);
    //遍历节点，获取选中节点的所有父节点
    for(var i = 0; i<selected.length; i++)
    {
        getParents(tree,selected[i]);
    }
    var index;
    $.ajax({
        type : "POST",
        url : sys.rootPath + commitUrl,
        data : {
            "roleId" : $("#id").val(),
            "resourceIds" : _.union(ids,selectedIds).join(',')
        },
        dataType : "json",
        beforeSend : function()
        {
            index = layer.load();
        },
        success : function(resultdata) {
             layer.close(index);
            if (resultdata.success) {
                layer.msg(resultdata.message,{icon:1});
                loadPage(listUrl + '?page=' + $("#pageNum").val() + '&rows=' + $("#pageSize").val() + '&sidx=' + $("#orderByColumn").val() + '&sord=' + $("#orderByType").val());
            } else {
                layer.msg(resultdata.message, {
                    icon : 5
                });
            }
        },
        error : function(errorMsg) {
            layer.close(index);
            layer.msg('服务器未响应,请稍后再试', {
                icon : 2
            });
        }
    });
}

/**
 * 递归遍历节点，获取该节点的所有父节点
 * @param {Object} treeObj  jstree对象
 * @param {Object} nodeObj  jstree node节点对象
 */
function getParents(treeObj,nodeObj)
{
    var parentId = treeObj.get_parent(nodeObj);
    if(parentId != "#")
    {
        ids.push(parentId);
        getParents(treeObj,treeObj.get_node(parentId));
    }
}
