var iconLayer;
$(document).ready(function() {
    initSourceType();
    initSourceTree();
    initIcon();
    initType();
    validateResourceForm();
});

/**
 * 初始化资源类型下拉框
 */
function initSourceType() {
    $('#type').select2({
        language : "zh-CN",
        minimumResultsForSearch : Infinity
    });
}

/**
 *初始化资源树下拉框
 */
function initSourceTree() {
    $('#parentId').select2({
        placeholder : "请选择上级资源...",
        language : "zh-CN",
        minimumResultsForSearch : Infinity,
        templateResult : formatState,
        templateSelection : function(selection) {
            return $.trim(selection.text);
        }
    });
}

function formatState(state) {
    if (!state.id) {
        return state.text;
    }
    var $state = $('<span><i class="fa fa-file-text-o green"></i>&nbsp;&nbsp;' + state.text + '</span>');
    return $state;
}

/**
 *弹出资源图标选择页面 
 */
function initIcon()
{
    $("#icon").bind('focus', function(event) {
        iconLayer = layer.open({
            type : 2,
            scrollbar: false,
            content : sys.rootPath + '/resource/icon.html',
            area : 'auto',
            maxmin : true,
            shift : 4,
            title : '<i class="fa fa-cogs"></i>&nbsp;选择图标'
        });
        //弹出即全屏
        layer.full(iconLayer);
    });
}

/**
 *当资源类型为目录菜单时，隐藏菜单图标 
 */
function initType()
{
    $("#parentId").change(function() {
        var parentId = $.trim($(this).children('option:selected').val());
        if(parentId == null || parentId == '')
        {
            $("#iconDiv").show();
            $("#sourceUrlDiv").hide();
        }else
        {
            $("#iconDiv").hide();
            $("#sourceUrlDiv").show();
        }
    });
}

/**
 * 表单验证
 */
function validateResourceForm()
{    
    $('#resourceForm').validate({
        errorElement : 'div',
        errorClass : 'help-block',
        focusInvalid : false,
        ignore : "",
        rules : {
            parentId : {
                required : true
            },
            name : {
                required : true
            },
            sourceKey : {
                required : true
            },
            type : {
                required : true
            },
            sourceUrl : {
                required : function(){
                    //仅目录菜单不需要url
                    var parentId = $.trim($("#parentId").val());
                    if(parentId == null || parentId == "")
                    {
                        return false;
                    }else
                    {
                        return true;
                    }
                }
            },
            icon : {
                required : function(){
                    //仅目录菜单需要icon
                    var parentId = $.trim($("#parentId").val());
                    if(parentId == null || parentId == "")
                    {
                        return true;
                    }else
                    {
                        return false;
                    }
                }
            }
        },
        messages : {
            parentId : "请选择上级资源",
            name :  "请填写资源名称",
            sourceKey : "请填写资源标识",
            type : "请选择资源类型",
            sourceUrl : "请填写资源URL",
            icon :  "请选择菜单图标"
        },
        highlight : function(e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },
        success : function(e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
            $(e).remove();
        },
        errorPlacement : function(error, element) {
           if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                var controls = element.closest('div[class*="col-"]');
                if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
            }
            else if(element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            }
            else if(element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            }
            else error.insertAfter(element.parent());
        },
        submitHandler : function(form) {
            var resourceId = $("#resourceId").val();
            var url = "";
            if(resourceId != undefined)
            {
                url = '/resource/edit.html';
            }else
            {
                url = '/resource/add.html';
            }
            commit('resourceForm', url, '/resource/listUI.html');
        }
    });
}