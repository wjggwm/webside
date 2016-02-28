$(function() {
    $("li").each(function() {
        $(this).bind('click', function(e) {
            var icon = $(this).find("i").attr("class").replace('fa-3x', '');
            parent.$("#icon").val(icon);
            parent.$("#iconShow").removeClass().addClass(icon + ' fa-2x green iconShow');
            //先得到当前iframe层的索引
            var index = parent.layer.getFrameIndex(window.name);
            //再执行关闭
            parent.layer.close(index);
        });
    });

    //页面滚动条美化
    $("html").niceScroll({
        cursorborderradius : "5px",
        cursorwidth:10,
        autohidemode:false
    });
});

//监听浏览器窗口大小变化
$(window).resize(function() {
    $("html").getNiceScroll().resize();
});
