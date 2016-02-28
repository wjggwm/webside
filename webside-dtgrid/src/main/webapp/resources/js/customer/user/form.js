$(function() {
    initRole();
    validateUserForm();
});

/**
 * 初始化资源类型下拉框
 */
function initRole() {
    $('#roleId').select2({
        placeholder : "请选择角色...",
        language : "zh-CN",
        minimumResultsForSearch : Infinity
    });
}

/**
 * 表单验证
 */
function validateUserForm()
{    
    $('#userForm').validate({
        errorElement : 'div',
        errorClass : 'help-block',
        focusInvalid : false,
        ignore : "",
        rules : {
            accountName : {
                required : true,
                email : true,
                remote: { //更新时不验证
                  param: {
                    url: sys.rootPath + '/user/validateAccountName.html',
                    cache :false
                  },
                  depends: function() {
                    return typeof($("#userId").val()) == "undefined";
                  }
                }
            },
            password : {
                required : true,
                minlength : 6
            },
            repassword : {
                required : true,
                minlength : 6,
                equalTo : "#password"
            },
            userName : {
                required : true
            },
            "role.id" : {
                required : true
            }
        },
        messages : {
            accountName : {
                required : "请填写邮箱",
                email : "请填写正确的邮箱",
                remote : "该邮箱已注册,请使用其他邮箱"
            },
            password : {
                required : "请填写密码",
                minlength : "密码长度不能少于6个字符"
            },
            repassword : {
                required : "请再次填写密码",
                minlength : "密码长度不能少于6个字符",
                equalTo : "两次填写密码不一致，请重新填写"
            },
            userName : "请填写真实姓名",
            "role.id" : "请选择角色"
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
            var userId = $("#userId").val();
            var url = "";
            if(userId != undefined)
            {
                url = '/user/edit.html';
            }else
            {
                url = '/user/add.html';
            }
            commit('userForm', url, '/user/listUI.html');
        }
    });
}
