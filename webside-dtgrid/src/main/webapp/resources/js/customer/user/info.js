$(document).ready(function() {
    initButton();
    initBirthday();
    validateUserInfoForm();
});

/**
 *绑定按钮事件 
 */
function initButton()
{
    $("#btnEdit").click(function() {
       //按钮切换
        $(this).hide();
        $("#btnAdd").show();
        //表单切换
        $("#lableDiv").hide();
        $("#formDiv").show();
    });
}

/**
 *初始化日期控件 
 */
function initBirthday()
{
        $("#birthday").datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
        language: 'zh-CN',
        todayHighlight: true,
        clearBtn: true,
        immediateUpdates: true,
        clearDate: function()
        {
            $("#birthday").val('').datepicker('update');
        }
    });
}


function validateUserInfoForm()
{
    jQuery.validator.addMethod("phone", function (value, element) {
        return this.optional(element) || /^1[3|4|5|7|8]\d{9}$/.test(value);
    }, "请输入11位手机号码");
    
    $('#userInfoForm').validate({
        errorElement : 'div',
        errorClass : 'help-block',
        focusInvalid : false,
        ignore : "",
        rules : {
            userName : {
                required : true
            },
            "userInfo.sex" : {
                required : true
            },
            "userInfo.birthday" : {
                required : true
            },
            "userInfo.telephone" : {
                required : true,
                phone: 'required'
            },
            "userInfo.address" : {
                required : true
            }
        },
        messages : {
            userName : "请填写真实姓名",
            "userInfo.sex" : "请选择性别",
            "userInfo.birthday" : "请填写出生日期",
            "userInfo.telephone" : {
                required : "请填写手机号码",
                phone : "请填写11位手机号码"
            },
            "userInfo.address" : "请填写联系地址"
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
            commit('userInfoForm', '/user/edit.html', '/user/infoUI.html?id='+ $("#userInfoId").val());
        }
    });
}
