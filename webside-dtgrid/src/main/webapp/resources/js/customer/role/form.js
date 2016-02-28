$(function() {
    validateRoleForm();
}); 

/**
 *表单验证 
 */
function validateRoleForm()
{
    $('#roleForm').validate({
        errorElement : 'div',
        errorClass : 'help-block',
        focusInvalid : false,
        ignore : "",
        rules : {
            name : {
                required : true
            },
            key : {
                required : true
            }
        },
        messages : {
            name :  "请填写角色名称",
            key : "请填写角色标识"
        },
        highlight : function(e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },
        success : function(e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
            $(e).remove();
        },
        errorPlacement : function(error, element) {
            error.insertAfter(element.parent());
        },
        submitHandler : function(form) {
            var roleId = $("#roleId").val();
            var url = "";
            if(roleId != undefined)
            {
                url = '/role/edit.html';
            }else
            {
                url = '/role/add.html';
            }
            commit('roleForm', url, '/role/listUI.html');
        }
    });
}
