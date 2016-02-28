$(function() {
    validateForm();
}); 

/**
 *表单验证 
 */
function validateForm()
{
    $('#userInfo').validate({
        errorElement : 'div',
        errorClass : 'help-block',
        focusInvalid : false,
        ignore : "",
        rules : {
            password : {
                required : true,
                minlength : 6
            },
            repassword : {
                required : true,
                minlength : 6,
                equalTo : "#password"
            }
        },
        messages : {
            password : {
                required : "请填写密码",
                minlength : "密码长度不能少于6个字符"
            },
            repassword : {
                required : "请再次填写密码",
                minlength : "密码长度不能少于6个字符",
                equalTo : "两次填写密码不一致，请重新填写"
            }
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
            commit('userInfo', '/user/password.html', '/logout.html');
        },
        invalidHandler : function(form) {
        }
    });
}
