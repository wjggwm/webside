/**
 * 背景循环
 * @param {Object} $
 */
(function ($) {
    $.fn.extend({
        backgroundSlider: function (options) {
            var $settings = $.extend({}, defaluts, options); //使用jQuery.extend 覆盖插件默认参数
            var $this = $(this); //获取当前dom 的 jQuery对象，这里的this是当前的dom
			var $img_num = $this.children('img').length;//图片个数
			var $img_show=1;
			switch($settings.direction){
				case 'in':
					$("#backgroundSlider img").css({width:"120%",height:"120%",top:"-10%",left:"-10%"});
					$("#backgroundSlider img[name='1']").css({display:"block"})
					.animate({width:"100%",height:"100%",top:"0",left:"0"},$settings.speed-1000);
					setInterval(function(){
						$("#backgroundSlider img[name='"+$img_show+"']").fadeOut(100);
						$img_show++;$img_show=$img_show>$img_num?'1':$img_show;
						$("#backgroundSlider img[name='"+$img_show+"']").css({width:"120%",height:"120%",top:"-10%",left:"-10%"}).fadeIn(1000)
						.animate({width:"100%",height:"100%",top:"0",left:"0"},$settings.speed-1000);
					},$settings.speed);
				break;
				case 'out':
					$("#backgroundSlider img[name='1']").css({display:"block"})
					.animate({width:"120%",height:"120%",top:"-10%",left:"-10%"},$settings.speed-1000);
					setInterval(function(){
						$("#backgroundSlider img[name='"+$img_show+"']").fadeOut(100);
						$img_show++;$img_show=$img_show>$img_num?'1':$img_show;
						$("#backgroundSlider img[name='"+$img_show+"']").css({width:"100%",height:"100%",top:"0%",left:"0%"}).fadeIn(1000)
						.animate({width:"120%",height:"120%",top:"-10%",left:"-10%"},$settings.speed-1000);
					},$settings.speed);
				break;
				case 'slide':
					$("#backgroundSlider img[name='1']").css({display:"block"});
					setInterval(function(){
						$("#backgroundSlider img[name='"+$img_show+"']").fadeOut($settings.speed);
						$img_show++;$img_show=$img_show>$img_num?'1':$img_show;
						$("#backgroundSlider img[name='"+$img_show+"']").fadeIn($settings.speed);
					},$settings.speed);
				break;
			}
			return this;
        }
    });
    //默认参数
    var defaluts = {
        direction: 'in', //场景动画类型：【in】:拉近;【out】:拉远;【slide】:幻灯片
        speed: 3000	//切换速度
    };
})(window.jQuery);