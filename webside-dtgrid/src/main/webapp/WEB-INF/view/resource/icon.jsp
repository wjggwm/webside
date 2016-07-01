<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-cn" xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="${ctx }/resources/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx }/resources/fonts/fontawesome/font-awesome.min.css" media="all"/>
<!--[if !IE]><!-->
<script type="text/javascript"
	src="${ctx}/resources/js/jquery/jquery-2.1.4.min.js"></script>
<!--<![endif]-->
<!--[if IE]>
	<script type="text/javascript" src="${ctx}/resources/js/jquery/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript"
	src="${ctx}/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
<link rel="stylesheet" href="${ctx }/resources/css/customer/webside-icon.min.css" />
<script type="text/javascript">
$(function() {
	$("li").each(function() {
        $(this).bind('click', function(e) {
            var icon = $(this).find("i").attr("class").replace('fa-3x', '');
            parent.$("#icon").val(icon);
            parent.$("#iconShow").removeClass().addClass(icon + ' fa-2x green iconShow tooltip-success');
            //先得到当前iframe层的索引
            var index = parent.layer.getFrameIndex(window.name);
            //再执行关闭
            parent.layer.close(index);
        });
    });
	$("html").niceScroll({
        cursorborderradius : "5px",
        cursorwidth:10,
        autohidemode:false
    });
});
</script>
</head>
<body class="no-skin">
	<div class="container">
		<div class="row">
			<div class="col-md-12" role="main">
				<section id="web-application">
				<h2 class="page-header">网络应用图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">

						<li><i class="fa fa-3x fa-adjust"></i> <span
							class="fa-icons-class"> adjust </span></li>

						<li><i class="fa fa-3x fa-anchor"></i> <span
							class="fa-icons-class"> anchor </span></li>

						<li><i class="fa fa-3x fa-archive"></i> <span
							class="fa-icons-class"> archive </span></li>

						<li><i class="fa fa-3x fa-area-chart"></i> <span
							class="fa-icons-class"> area-chart </span></li>

						<li><i class="fa fa-3x fa-arrows"></i> <span
							class="fa-icons-class"> arrows </span></li>

						<li><i class="fa fa-3x fa-arrows-h"></i> <span
							class="fa-icons-class"> arrows-h </span></li>

						<li><i class="fa fa-3x fa-arrows-v"></i> <span
							class="fa-icons-class"> arrows-v </span></li>

						<li><i class="fa fa-3x fa-asterisk"></i> <span
							class="fa-icons-class"> asterisk </span></li>

						<li><i class="fa fa-3x fa-at"></i> <span
							class="fa-icons-class"> at </span></li>

						<li><i class="fa fa-3x fa-automobile"></i> <span
							class="fa-icons-class"> automobile <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-balance-scale"></i> <span
							class="fa-icons-class"> balance-scale </span></li>

						<li><i class="fa fa-3x fa-ban"></i> <span
							class="fa-icons-class"> ban </span></li>

						<li><i class="fa fa-3x fa-bank"></i> <span
							class="fa-icons-class"> bank <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-bar-chart"></i> <span
							class="fa-icons-class"> bar-chart </span></li>

						<li><i class="fa fa-3x fa-bar-chart-o"></i> <span
							class="fa-icons-class"> bar-chart-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-barcode"></i> <span
							class="fa-icons-class"> barcode </span></li>

						<li><i class="fa fa-3x fa-bars"></i> <span
							class="fa-icons-class"> bars </span></li>

						<li><i class="fa fa-3x fa-battery-0"></i> <span
							class="fa-icons-class"> battery-0 <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-battery-1"></i> <span
							class="fa-icons-class"> battery-1 <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-battery-2"></i> <span
							class="fa-icons-class"> battery-2 <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-battery-3"></i> <span
							class="fa-icons-class"> battery-3 <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-battery-4"></i> <span
							class="fa-icons-class"> battery-4 <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-battery-empty"></i> <span
							class="fa-icons-class"> battery-empty </span></li>

						<li><i class="fa fa-3x fa-battery-full"></i> <span
							class="fa-icons-class"> battery-full </span></li>

						<li><i class="fa fa-3x fa-battery-half"></i> <span
							class="fa-icons-class"> battery-half </span></li>

						<li><i class="fa fa-3x fa-battery-quarter"></i> <span
							class="fa-icons-class"> battery-quarter </span></li>

						<li><i class="fa fa-3x fa-battery-three-quarters"></i> <span
							class="fa-icons-class"> battery-three-quarters </span></li>

						<li><i class="fa fa-3x fa-bed"></i> <span
							class="fa-icons-class"> bed </span></li>

						<li><i class="fa fa-3x fa-beer"></i> <span
							class="fa-icons-class"> beer </span></li>

						<li><i class="fa fa-3x fa-bell"></i> <span
							class="fa-icons-class"> bell </span></li>

						<li><i class="fa fa-3x fa-bell-o"></i> <span
							class="fa-icons-class"> bell-o </span></li>

						<li><i class="fa fa-3x fa-bell-slash"></i> <span
							class="fa-icons-class"> bell-slash </span></li>

						<li><i class="fa fa-3x fa-bell-slash-o"></i> <span
							class="fa-icons-class"> bell-slash-o </span></li>

						<li><i class="fa fa-3x fa-bicycle"></i> <span
							class="fa-icons-class"> bicycle </span></li>

						<li><i class="fa fa-3x fa-binoculars"></i> <span
							class="fa-icons-class"> binoculars </span></li>

						<li><i class="fa fa-3x fa-birthday-cake"></i> <span
							class="fa-icons-class"> birthday-cake </span></li>

						<li><i class="fa fa-3x fa-bluetooth"></i> <span
							class="fa-icons-class"> bluetooth </span></li>

						<li><i class="fa fa-3x fa-bluetooth-b"></i> <span
							class="fa-icons-class"> bluetooth-b </span></li>

						<li><i class="fa fa-3x fa-bolt"></i> <span
							class="fa-icons-class"> bolt </span></li>

						<li><i class="fa fa-3x fa-bomb"></i> <span
							class="fa-icons-class"> bomb </span></li>

						<li><i class="fa fa-3x fa-book"></i> <span
							class="fa-icons-class"> book </span></li>

						<li><i class="fa fa-3x fa-bookmark"></i> <span
							class="fa-icons-class"> bookmark </span></li>

						<li><i class="fa fa-3x fa-bookmark-o"></i> <span
							class="fa-icons-class"> bookmark-o </span></li>

						<li><i class="fa fa-3x fa-briefcase"></i> <span
							class="fa-icons-class"> briefcase </span></li>

						<li><i class="fa fa-3x fa-bug"></i> <span
							class="fa-icons-class"> bug </span></li>

						<li><i class="fa fa-3x fa-building"></i> <span
							class="fa-icons-class"> building </span></li>

						<li><i class="fa fa-3x fa-building-o"></i> <span
							class="fa-icons-class"> building-o </span></li>

						<li><i class="fa fa-3x fa-bullhorn"></i> <span
							class="fa-icons-class"> bullhorn </span></li>

						<li><i class="fa fa-3x fa-bullseye"></i> <span
							class="fa-icons-class"> bullseye </span></li>

						<li><i class="fa fa-3x fa-bus"></i> <span
							class="fa-icons-class"> bus </span></li>

						<li><i class="fa fa-3x fa-cab"></i> <span
							class="fa-icons-class"> cab <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-calculator"></i> <span
							class="fa-icons-class"> calculator </span></li>

						<li><i class="fa fa-3x fa-calendar"></i> <span
							class="fa-icons-class"> calendar </span></li>

						<li><i class="fa fa-3x fa-calendar-check-o"></i> <span
							class="fa-icons-class"> calendar-check-o </span></li>

						<li><i class="fa fa-3x fa-calendar-minus-o"></i> <span
							class="fa-icons-class"> calendar-minus-o </span></li>

						<li><i class="fa fa-3x fa-calendar-o"></i> <span
							class="fa-icons-class"> calendar-o </span></li>

						<li><i class="fa fa-3x fa-calendar-plus-o"></i> <span
							class="fa-icons-class"> calendar-plus-o </span></li>

						<li><i class="fa fa-3x fa-calendar-times-o"></i> <span
							class="fa-icons-class"> calendar-times-o </span></li>

						<li><i class="fa fa-3x fa-camera"></i> <span
							class="fa-icons-class"> camera </span></li>

						<li><i class="fa fa-3x fa-camera-retro"></i> <span
							class="fa-icons-class"> camera-retro </span></li>

						<li><i class="fa fa-3x fa-car"></i> <span
							class="fa-icons-class"> car </span></li>

						<li><i class="fa fa-3x fa-caret-square-o-down"></i> <span
							class="fa-icons-class"> caret-square-o-down </span></li>

						<li><i class="fa fa-3x fa-caret-square-o-left"></i> <span
							class="fa-icons-class"> caret-square-o-left </span></li>

						<li><i class="fa fa-3x fa-caret-square-o-right"></i> <span
							class="fa-icons-class"> caret-square-o-right </span></li>

						<li><i class="fa fa-3x fa-caret-square-o-up"></i> <span
							class="fa-icons-class"> caret-square-o-up </span></li>

						<li><i class="fa fa-3x fa-cart-arrow-down"></i> <span
							class="fa-icons-class"> cart-arrow-down </span></li>

						<li><i class="fa fa-3x fa-cart-plus"></i> <span
							class="fa-icons-class"> cart-plus </span></li>

						<li><i class="fa fa-3x fa-cc"></i> <span
							class="fa-icons-class"> cc </span></li>

						<li><i class="fa fa-3x fa-certificate"></i> <span
							class="fa-icons-class"> certificate </span></li>

						<li><i class="fa fa-3x fa-check"></i> <span
							class="fa-icons-class"> check </span></li>

						<li><i class="fa fa-3x fa-check-circle"></i> <span
							class="fa-icons-class"> check-circle </span></li>

						<li><i class="fa fa-3x fa-check-circle-o"></i> <span
							class="fa-icons-class"> check-circle-o </span></li>

						<li><i class="fa fa-3x fa-check-square"></i> <span
							class="fa-icons-class"> check-square </span></li>

						<li><i class="fa fa-3x fa-check-square-o"></i> <span
							class="fa-icons-class"> check-square-o </span></li>

						<li><i class="fa fa-3x fa-child"></i> <span
							class="fa-icons-class"> child </span></li>

						<li><i class="fa fa-3x fa-circle"></i> <span
							class="fa-icons-class"> circle </span></li>

						<li><i class="fa fa-3x fa-circle-o"></i> <span
							class="fa-icons-class"> circle-o </span></li>

						<li><i class="fa fa-3x fa-circle-o-notch"></i> <span
							class="fa-icons-class"> circle-o-notch </span></li>

						<li><i class="fa fa-3x fa-circle-thin"></i> <span
							class="fa-icons-class"> circle-thin </span></li>

						<li><i class="fa fa-3x fa-clock-o"></i> <span
							class="fa-icons-class"> clock-o </span></li>

						<li><i class="fa fa-3x fa-clone"></i> <span
							class="fa-icons-class"> clone </span></li>

						<li><i class="fa fa-3x fa-close"></i> <span
							class="fa-icons-class"> close <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-cloud"></i> <span
							class="fa-icons-class"> cloud </span></li>

						<li><i class="fa fa-3x fa-cloud-download"></i> <span
							class="fa-icons-class"> cloud-download </span></li>

						<li><i class="fa fa-3x fa-cloud-upload"></i> <span
							class="fa-icons-class"> cloud-upload </span></li>

						<li><i class="fa fa-3x fa-code"></i> <span
							class="fa-icons-class"> code </span></li>

						<li><i class="fa fa-3x fa-code-fork"></i> <span
							class="fa-icons-class"> code-fork </span></li>

						<li><i class="fa fa-3x fa-coffee"></i> <span
							class="fa-icons-class"> coffee </span></li>

						<li><i class="fa fa-3x fa-cog"></i> <span
							class="fa-icons-class"> cog </span></li>

						<li><i class="fa fa-3x fa-cogs"></i> <span
							class="fa-icons-class"> cogs </span></li>

						<li><i class="fa fa-3x fa-comment"></i> <span
							class="fa-icons-class"> comment </span></li>

						<li><i class="fa fa-3x fa-comment-o"></i> <span
							class="fa-icons-class"> comment-o </span></li>

						<li><i class="fa fa-3x fa-commenting"></i> <span
							class="fa-icons-class"> commenting </span></li>

						<li><i class="fa fa-3x fa-commenting-o"></i> <span
							class="fa-icons-class"> commenting-o </span></li>

						<li><i class="fa fa-3x fa-comments"></i> <span
							class="fa-icons-class"> comments </span></li>

						<li><i class="fa fa-3x fa-comments-o"></i> <span
							class="fa-icons-class"> comments-o </span></li>

						<li><i class="fa fa-3x fa-compass"></i> <span
							class="fa-icons-class"> compass </span></li>

						<li><i class="fa fa-3x fa-copyright"></i> <span
							class="fa-icons-class"> copyright </span></li>

						<li><i class="fa fa-3x fa-creative-commons"></i> <span
							class="fa-icons-class"> creative-commons </span></li>

						<li><i class="fa fa-3x fa-credit-card"></i> <span
							class="fa-icons-class"> credit-card </span></li>

						<li><i class="fa fa-3x fa-credit-card-alt"></i> <span
							class="fa-icons-class"> credit-card-alt </span></li>

						<li><i class="fa fa-3x fa-crop"></i> <span
							class="fa-icons-class"> crop </span></li>

						<li><i class="fa fa-3x fa-crosshairs"></i> <span
							class="fa-icons-class"> crosshairs </span></li>

						<li><i class="fa fa-3x fa-cube"></i> <span
							class="fa-icons-class"> cube </span></li>

						<li><i class="fa fa-3x fa-cubes"></i> <span
							class="fa-icons-class"> cubes </span></li>

						<li><i class="fa fa-3x fa-cutlery"></i> <span
							class="fa-icons-class"> cutlery </span></li>

						<li><i class="fa fa-3x fa-dashboard"></i> <span
							class="fa-icons-class"> dashboard <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-database"></i> <span
							class="fa-icons-class"> database </span></li>

						<li><i class="fa fa-3x fa-desktop"></i> <span
							class="fa-icons-class"> desktop </span></li>

						<li><i class="fa fa-3x fa-diamond"></i> <span
							class="fa-icons-class"> diamond </span></li>

						<li><i class="fa fa-3x fa-dot-circle-o"></i> <span
							class="fa-icons-class"> dot-circle-o </span></li>

						<li><i class="fa fa-3x fa-download"></i> <span
							class="fa-icons-class"> download </span></li>

						<li><i class="fa fa-3x fa-edit"></i> <span
							class="fa-icons-class"> edit <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-ellipsis-h"></i> <span
							class="fa-icons-class"> ellipsis-h </span></li>

						<li><i class="fa fa-3x fa-ellipsis-v"></i> <span
							class="fa-icons-class"> ellipsis-v </span></li>

						<li><i class="fa fa-3x fa-envelope"></i> <span
							class="fa-icons-class"> envelope </span></li>

						<li><i class="fa fa-3x fa-envelope-o"></i> <span
							class="fa-icons-class"> envelope-o </span></li>

						<li><i class="fa fa-3x fa-envelope-square"></i> <span
							class="fa-icons-class"> envelope-square </span></li>

						<li><i class="fa fa-3x fa-eraser"></i> <span
							class="fa-icons-class"> eraser </span></li>

						<li><i class="fa fa-3x fa-exchange"></i> <span
							class="fa-icons-class"> exchange </span></li>

						<li><i class="fa fa-3x fa-exclamation"></i> <span
							class="fa-icons-class"> exclamation </span></li>

						<li><i class="fa fa-3x fa-exclamation-circle"></i> <span
							class="fa-icons-class"> exclamation-circle </span></li>

						<li><i class="fa fa-3x fa-exclamation-triangle"></i> <span
							class="fa-icons-class"> exclamation-triangle </span></li>

						<li><i class="fa fa-3x fa-external-link"></i> <span
							class="fa-icons-class"> external-link </span></li>

						<li><i class="fa fa-3x fa-external-link-square"></i> <span
							class="fa-icons-class"> external-link-square </span></li>

						<li><i class="fa fa-3x fa-eye"></i> <span
							class="fa-icons-class"> eye </span></li>

						<li><i class="fa fa-3x fa-eye-slash"></i> <span
							class="fa-icons-class"> eye-slash </span></li>

						<li><i class="fa fa-3x fa-eyedropper"></i> <span
							class="fa-icons-class"> eyedropper </span></li>

						<li><i class="fa fa-3x fa-fax"></i> <span
							class="fa-icons-class"> fax </span></li>

						<li><i class="fa fa-3x fa-feed"></i> <span
							class="fa-icons-class"> feed <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-female"></i> <span
							class="fa-icons-class"> female </span></li>

						<li><i class="fa fa-3x fa-fighter-jet"></i> <span
							class="fa-icons-class"> fighter-jet </span></li>

						<li><i class="fa fa-3x fa-file-archive-o"></i> <span
							class="fa-icons-class"> file-archive-o </span></li>

						<li><i class="fa fa-3x fa-file-audio-o"></i> <span
							class="fa-icons-class"> file-audio-o </span></li>

						<li><i class="fa fa-3x fa-file-code-o"></i> <span
							class="fa-icons-class"> file-code-o </span></li>

						<li><i class="fa fa-3x fa-file-excel-o"></i> <span
							class="fa-icons-class"> file-excel-o </span></li>

						<li><i class="fa fa-3x fa-file-image-o"></i> <span
							class="fa-icons-class"> file-image-o </span></li>

						<li><i class="fa fa-3x fa-file-movie-o"></i> <span
							class="fa-icons-class"> file-movie-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-file-pdf-o"></i> <span
							class="fa-icons-class"> file-pdf-o </span></li>

						<li><i class="fa fa-3x fa-file-photo-o"></i> <span
							class="fa-icons-class"> file-photo-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-file-picture-o"></i> <span
							class="fa-icons-class"> file-picture-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-file-powerpoint-o"></i> <span
							class="fa-icons-class"> file-powerpoint-o </span></li>

						<li><i class="fa fa-3x fa-file-sound-o"></i> <span
							class="fa-icons-class"> file-sound-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-file-video-o"></i> <span
							class="fa-icons-class"> file-video-o </span></li>

						<li><i class="fa fa-3x fa-file-word-o"></i> <span
							class="fa-icons-class"> file-word-o </span></li>

						<li><i class="fa fa-3x fa-file-zip-o"></i> <span
							class="fa-icons-class"> file-zip-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-film"></i> <span
							class="fa-icons-class"> film </span></li>

						<li><i class="fa fa-3x fa-filter"></i> <span
							class="fa-icons-class"> filter </span></li>

						<li><i class="fa fa-3x fa-fire"></i> <span
							class="fa-icons-class"> fire </span></li>

						<li><i class="fa fa-3x fa-fire-extinguisher"></i> <span
							class="fa-icons-class"> fire-extinguisher </span></li>

						<li><i class="fa fa-3x fa-flag"></i> <span
							class="fa-icons-class"> flag </span></li>

						<li><i class="fa fa-3x fa-flag-checkered"></i> <span
							class="fa-icons-class"> flag-checkered </span></li>

						<li><i class="fa fa-3x fa-flag-o"></i> <span
							class="fa-icons-class"> flag-o </span></li>

						<li><i class="fa fa-3x fa-flash"></i> <span
							class="fa-icons-class"> flash <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-flask"></i> <span
							class="fa-icons-class"> flask </span></li>

						<li><i class="fa fa-3x fa-folder"></i> <span
							class="fa-icons-class"> folder </span></li>

						<li><i class="fa fa-3x fa-folder-o"></i> <span
							class="fa-icons-class"> folder-o </span></li>

						<li><i class="fa fa-3x fa-folder-open"></i> <span
							class="fa-icons-class"> folder-open </span></li>

						<li><i class="fa fa-3x fa-folder-open-o"></i> <span
							class="fa-icons-class"> folder-open-o </span></li>

						<li><i class="fa fa-3x fa-frown-o"></i> <span
							class="fa-icons-class"> frown-o </span></li>

						<li><i class="fa fa-3x fa-futbol-o"></i> <span
							class="fa-icons-class"> futbol-o </span></li>

						<li><i class="fa fa-3x fa-gamepad"></i> <span
							class="fa-icons-class"> gamepad </span></li>

						<li><i class="fa fa-3x fa-gavel"></i> <span
							class="fa-icons-class"> gavel </span></li>

						<li><i class="fa fa-3x fa-gear"></i> <span
							class="fa-icons-class"> gear <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-gears"></i> <span
							class="fa-icons-class"> gears <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-gift"></i> <span
							class="fa-icons-class"> gift </span></li>

						<li><i class="fa fa-3x fa-glass"></i> <span
							class="fa-icons-class"> glass </span></li>

						<li><i class="fa fa-3x fa-globe"></i> <span
							class="fa-icons-class"> globe </span></li>

						<li><i class="fa fa-3x fa-graduation-cap"></i> <span
							class="fa-icons-class"> graduation-cap </span></li>

						<li><i class="fa fa-3x fa-group"></i> <span
							class="fa-icons-class"> group <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-hand-grab-o"></i> <span
							class="fa-icons-class"> hand-grab-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-hand-lizard-o"></i> <span
							class="fa-icons-class"> hand-lizard-o </span></li>

						<li><i class="fa fa-3x fa-hand-paper-o"></i> <span
							class="fa-icons-class"> hand-paper-o </span></li>

						<li><i class="fa fa-3x fa-hand-peace-o"></i> <span
							class="fa-icons-class"> hand-peace-o </span></li>

						<li><i class="fa fa-3x fa-hand-pointer-o"></i> <span
							class="fa-icons-class"> hand-pointer-o </span></li>

						<li><i class="fa fa-3x fa-hand-rock-o"></i> <span
							class="fa-icons-class"> hand-rock-o </span></li>

						<li><i class="fa fa-3x fa-hand-scissors-o"></i> <span
							class="fa-icons-class"> hand-scissors-o </span></li>

						<li><i class="fa fa-3x fa-hand-spock-o"></i> <span
							class="fa-icons-class"> hand-spock-o </span></li>

						<li><i class="fa fa-3x fa-hand-stop-o"></i> <span
							class="fa-icons-class"> hand-stop-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-hashtag"></i> <span
							class="fa-icons-class"> hashtag </span></li>

						<li><i class="fa fa-3x fa-hdd-o"></i> <span
							class="fa-icons-class"> hdd-o </span></li>

						<li><i class="fa fa-3x fa-headphones"></i> <span
							class="fa-icons-class"> headphones </span></li>

						<li><i class="fa fa-3x fa-heart"></i> <span
							class="fa-icons-class"> heart </span></li>

						<li><i class="fa fa-3x fa-heart-o"></i> <span
							class="fa-icons-class"> heart-o </span></li>

						<li><i class="fa fa-3x fa-heartbeat"></i> <span
							class="fa-icons-class"> heartbeat </span></li>

						<li><i class="fa fa-3x fa-history"></i> <span
							class="fa-icons-class"> history </span></li>

						<li><i class="fa fa-3x fa-home"></i> <span
							class="fa-icons-class"> home </span></li>

						<li><i class="fa fa-3x fa-hotel"></i> <span
							class="fa-icons-class"> hotel <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-hourglass"></i> <span
							class="fa-icons-class"> hourglass </span></li>

						<li><i class="fa fa-3x fa-hourglass-1"></i> <span
							class="fa-icons-class"> hourglass-1 <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-hourglass-2"></i> <span
							class="fa-icons-class"> hourglass-2 <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-hourglass-3"></i> <span
							class="fa-icons-class"> hourglass-3 <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-hourglass-end"></i> <span
							class="fa-icons-class"> hourglass-end </span></li>

						<li><i class="fa fa-3x fa-hourglass-half"></i> <span
							class="fa-icons-class"> hourglass-half </span></li>

						<li><i class="fa fa-3x fa-hourglass-o"></i> <span
							class="fa-icons-class"> hourglass-o </span></li>

						<li><i class="fa fa-3x fa-hourglass-start"></i> <span
							class="fa-icons-class"> hourglass-start </span></li>

						<li><i class="fa fa-3x fa-i-cursor"></i> <span
							class="fa-icons-class"> i-cursor </span></li>

						<li><i class="fa fa-3x fa-image"></i> <span
							class="fa-icons-class"> image <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-inbox"></i> <span
							class="fa-icons-class"> inbox </span></li>

						<li><i class="fa fa-3x fa-industry"></i> <span
							class="fa-icons-class"> industry </span></li>

						<li><i class="fa fa-3x fa-info"></i> <span
							class="fa-icons-class"> info </span></li>

						<li><i class="fa fa-3x fa-info-circle"></i> <span
							class="fa-icons-class"> info-circle </span></li>

						<li><i class="fa fa-3x fa-institution"></i> <span
							class="fa-icons-class"> institution <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-key"></i> <span
							class="fa-icons-class"> key </span></li>

						<li><i class="fa fa-3x fa-keyboard-o"></i> <span
							class="fa-icons-class"> keyboard-o </span></li>

						<li><i class="fa fa-3x fa-language"></i> <span
							class="fa-icons-class"> language </span></li>

						<li><i class="fa fa-3x fa-laptop"></i> <span
							class="fa-icons-class"> laptop </span></li>

						<li><i class="fa fa-3x fa-leaf"></i> <span
							class="fa-icons-class"> leaf </span></li>

						<li><i class="fa fa-3x fa-legal"></i> <span
							class="fa-icons-class"> legal <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-lemon-o"></i> <span
							class="fa-icons-class"> lemon-o </span></li>

						<li><i class="fa fa-3x fa-level-down"></i> <span
							class="fa-icons-class"> level-down </span></li>

						<li><i class="fa fa-3x fa-level-up"></i> <span
							class="fa-icons-class"> level-up </span></li>

						<li><i class="fa fa-3x fa-life-bouy"></i> <span
							class="fa-icons-class"> life-bouy <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-life-buoy"></i> <span
							class="fa-icons-class"> life-buoy <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-life-ring"></i> <span
							class="fa-icons-class"> life-ring </span></li>

						<li><i class="fa fa-3x fa-life-saver"></i> <span
							class="fa-icons-class"> life-saver <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-lightbulb-o"></i> <span
							class="fa-icons-class"> lightbulb-o </span></li>

						<li><i class="fa fa-3x fa-line-chart"></i> <span
							class="fa-icons-class"> line-chart </span></li>

						<li><i class="fa fa-3x fa-location-arrow"></i> <span
							class="fa-icons-class"> location-arrow </span></li>

						<li><i class="fa fa-3x fa-lock"></i> <span
							class="fa-icons-class"> lock </span></li>

						<li><i class="fa fa-3x fa-magic"></i> <span
							class="fa-icons-class"> magic </span></li>

						<li><i class="fa fa-3x fa-magnet"></i> <span
							class="fa-icons-class"> magnet </span></li>

						<li><i class="fa fa-3x fa-mail-forward"></i> <span
							class="fa-icons-class"> mail-forward <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-mail-reply"></i> <span
							class="fa-icons-class"> mail-reply <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-mail-reply-all"></i> <span
							class="fa-icons-class"> mail-reply-all <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-male"></i> <span
							class="fa-icons-class"> male </span></li>

						<li><i class="fa fa-3x fa-map"></i> <span
							class="fa-icons-class"> map </span></li>

						<li><i class="fa fa-3x fa-map-marker"></i> <span
							class="fa-icons-class"> map-marker </span></li>

						<li><i class="fa fa-3x fa-map-o"></i> <span
							class="fa-icons-class"> map-o </span></li>

						<li><i class="fa fa-3x fa-map-pin"></i> <span
							class="fa-icons-class"> map-pin </span></li>

						<li><i class="fa fa-3x fa-map-signs"></i> <span
							class="fa-icons-class"> map-signs </span></li>

						<li><i class="fa fa-3x fa-meh-o"></i> <span
							class="fa-icons-class"> meh-o </span></li>

						<li><i class="fa fa-3x fa-microphone"></i> <span
							class="fa-icons-class"> microphone </span></li>

						<li><i class="fa fa-3x fa-microphone-slash"></i> <span
							class="fa-icons-class"> microphone-slash </span></li>

						<li><i class="fa fa-3x fa-minus"></i> <span
							class="fa-icons-class"> minus </span></li>

						<li><i class="fa fa-3x fa-minus-circle"></i> <span
							class="fa-icons-class"> minus-circle </span></li>

						<li><i class="fa fa-3x fa-minus-square"></i> <span
							class="fa-icons-class"> minus-square </span></li>

						<li><i class="fa fa-3x fa-minus-square-o"></i> <span
							class="fa-icons-class"> minus-square-o </span></li>

						<li><i class="fa fa-3x fa-mobile"></i> <span
							class="fa-icons-class"> mobile </span></li>

						<li><i class="fa fa-3x fa-mobile-phone"></i> <span
							class="fa-icons-class"> mobile-phone <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-money"></i> <span
							class="fa-icons-class"> money </span></li>

						<li><i class="fa fa-3x fa-moon-o"></i> <span
							class="fa-icons-class"> moon-o </span></li>

						<li><i class="fa fa-3x fa-mortar-board"></i> <span
							class="fa-icons-class"> mortar-board <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-motorcycle"></i> <span
							class="fa-icons-class"> motorcycle </span></li>

						<li><i class="fa fa-3x fa-mouse-pointer"></i> <span
							class="fa-icons-class"> mouse-pointer </span></li>

						<li><i class="fa fa-3x fa-music"></i> <span
							class="fa-icons-class"> music </span></li>

						<li><i class="fa fa-3x fa-navicon"></i> <span
							class="fa-icons-class"> navicon <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-newspaper-o"></i> <span
							class="fa-icons-class"> newspaper-o </span></li>

						<li><i class="fa fa-3x fa-object-group"></i> <span
							class="fa-icons-class"> object-group </span></li>

						<li><i class="fa fa-3x fa-object-ungroup"></i> <span
							class="fa-icons-class"> object-ungroup </span></li>

						<li><i class="fa fa-3x fa-paint-brush"></i> <span
							class="fa-icons-class"> paint-brush </span></li>

						<li><i class="fa fa-3x fa-paper-plane"></i> <span
							class="fa-icons-class"> paper-plane </span></li>

						<li><i class="fa fa-3x fa-paper-plane-o"></i> <span
							class="fa-icons-class"> paper-plane-o </span></li>

						<li><i class="fa fa-3x fa-paw"></i> <span
							class="fa-icons-class"> paw </span></li>

						<li><i class="fa fa-3x fa-pencil"></i> <span
							class="fa-icons-class"> pencil </span></li>

						<li><i class="fa fa-3x fa-pencil-square"></i> <span
							class="fa-icons-class"> pencil-square </span></li>

						<li><i class="fa fa-3x fa-pencil-square-o"></i> <span
							class="fa-icons-class"> pencil-square-o </span></li>

						<li><i class="fa fa-3x fa-percent"></i> <span
							class="fa-icons-class"> percent </span></li>

						<li><i class="fa fa-3x fa-phone"></i> <span
							class="fa-icons-class"> phone </span></li>

						<li><i class="fa fa-3x fa-phone-square"></i> <span
							class="fa-icons-class"> phone-square </span></li>

						<li><i class="fa fa-3x fa-photo"></i> <span
							class="fa-icons-class"> photo <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-picture-o"></i> <span
							class="fa-icons-class"> picture-o </span></li>

						<li><i class="fa fa-3x fa-pie-chart"></i> <span
							class="fa-icons-class"> pie-chart </span></li>

						<li><i class="fa fa-3x fa-plane"></i> <span
							class="fa-icons-class"> plane </span></li>

						<li><i class="fa fa-3x fa-plug"></i> <span
							class="fa-icons-class"> plug </span></li>

						<li><i class="fa fa-3x fa-plus"></i> <span
							class="fa-icons-class"> plus </span></li>

						<li><i class="fa fa-3x fa-plus-circle"></i> <span
							class="fa-icons-class"> plus-circle </span></li>

						<li><i class="fa fa-3x fa-plus-square"></i> <span
							class="fa-icons-class"> plus-square </span></li>

						<li><i class="fa fa-3x fa-plus-square-o"></i> <span
							class="fa-icons-class"> plus-square-o </span></li>

						<li><i class="fa fa-3x fa-power-off"></i> <span
							class="fa-icons-class"> power-off </span></li>

						<li><i class="fa fa-3x fa-print"></i> <span
							class="fa-icons-class"> print </span></li>

						<li><i class="fa fa-3x fa-puzzle-piece"></i> <span
							class="fa-icons-class"> puzzle-piece </span></li>

						<li><i class="fa fa-3x fa-qrcode"></i> <span
							class="fa-icons-class"> qrcode </span></li>

						<li><i class="fa fa-3x fa-question"></i> <span
							class="fa-icons-class"> question </span></li>

						<li><i class="fa fa-3x fa-question-circle"></i> <span
							class="fa-icons-class"> question-circle </span></li>

						<li><i class="fa fa-3x fa-quote-left"></i> <span
							class="fa-icons-class"> quote-left </span></li>

						<li><i class="fa fa-3x fa-quote-right"></i> <span
							class="fa-icons-class"> quote-right </span></li>

						<li><i class="fa fa-3x fa-random"></i> <span
							class="fa-icons-class"> random </span></li>

						<li><i class="fa fa-3x fa-recycle"></i> <span
							class="fa-icons-class"> recycle </span></li>

						<li><i class="fa fa-3x fa-refresh"></i> <span
							class="fa-icons-class"> refresh </span></li>

						<li><i class="fa fa-3x fa-registered"></i> <span
							class="fa-icons-class"> registered </span></li>

						<li><i class="fa fa-3x fa-remove"></i> <span
							class="fa-icons-class"> remove <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-reorder"></i> <span
							class="fa-icons-class"> reorder <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-reply"></i> <span
							class="fa-icons-class"> reply </span></li>

						<li><i class="fa fa-3x fa-reply-all"></i> <span
							class="fa-icons-class"> reply-all </span></li>

						<li><i class="fa fa-3x fa-retweet"></i> <span
							class="fa-icons-class"> retweet </span></li>

						<li><i class="fa fa-3x fa-road"></i> <span
							class="fa-icons-class"> road </span></li>

						<li><i class="fa fa-3x fa-rocket"></i> <span
							class="fa-icons-class"> rocket </span></li>

						<li><i class="fa fa-3x fa-rss"></i> <span
							class="fa-icons-class"> rss </span></li>

						<li><i class="fa fa-3x fa-rss-square"></i> <span
							class="fa-icons-class"> rss-square </span></li>

						<li><i class="fa fa-3x fa-search"></i> <span
							class="fa-icons-class"> search </span></li>

						<li><i class="fa fa-3x fa-search-minus"></i> <span
							class="fa-icons-class"> search-minus </span></li>

						<li><i class="fa fa-3x fa-search-plus"></i> <span
							class="fa-icons-class"> search-plus </span></li>

						<li><i class="fa fa-3x fa-send"></i> <span
							class="fa-icons-class"> send <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-send-o"></i> <span
							class="fa-icons-class"> send-o <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-server"></i> <span
							class="fa-icons-class"> server </span></li>

						<li><i class="fa fa-3x fa-share"></i> <span
							class="fa-icons-class"> share </span></li>

						<li><i class="fa fa-3x fa-share-alt"></i> <span
							class="fa-icons-class"> share-alt </span></li>

						<li><i class="fa fa-3x fa-share-alt-square"></i> <span
							class="fa-icons-class"> share-alt-square </span></li>

						<li><i class="fa fa-3x fa-share-square"></i> <span
							class="fa-icons-class"> share-square </span></li>

						<li><i class="fa fa-3x fa-share-square-o"></i> <span
							class="fa-icons-class"> share-square-o </span></li>

						<li><i class="fa fa-3x fa-shield"></i> <span
							class="fa-icons-class"> shield </span></li>

						<li><i class="fa fa-3x fa-ship"></i> <span
							class="fa-icons-class"> ship </span></li>

						<li><i class="fa fa-3x fa-shopping-bag"></i> <span
							class="fa-icons-class"> shopping-bag </span></li>

						<li><i class="fa fa-3x fa-shopping-basket"></i> <span
							class="fa-icons-class"> shopping-basket </span></li>

						<li><i class="fa fa-3x fa-shopping-cart"></i> <span
							class="fa-icons-class"> shopping-cart </span></li>

						<li><i class="fa fa-3x fa-sign-in"></i> <span
							class="fa-icons-class"> sign-in </span></li>

						<li><i class="fa fa-3x fa-sign-out"></i> <span
							class="fa-icons-class"> sign-out </span></li>

						<li><i class="fa fa-3x fa-signal"></i> <span
							class="fa-icons-class"> signal </span></li>

						<li><i class="fa fa-3x fa-sitemap"></i> <span
							class="fa-icons-class"> sitemap </span></li>

						<li><i class="fa fa-3x fa-sliders"></i> <span
							class="fa-icons-class"> sliders </span></li>

						<li><i class="fa fa-3x fa-smile-o"></i> <span
							class="fa-icons-class"> smile-o </span></li>

						<li><i class="fa fa-3x fa-soccer-ball-o"></i> <span
							class="fa-icons-class"> soccer-ball-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-sort"></i> <span
							class="fa-icons-class"> sort </span></li>

						<li><i class="fa fa-3x fa-sort-alpha-asc"></i> <span
							class="fa-icons-class"> sort-alpha-asc </span></li>

						<li><i class="fa fa-3x fa-sort-alpha-desc"></i> <span
							class="fa-icons-class"> sort-alpha-desc </span></li>

						<li><i class="fa fa-3x fa-sort-amount-asc"></i> <span
							class="fa-icons-class"> sort-amount-asc </span></li>

						<li><i class="fa fa-3x fa-sort-amount-desc"></i> <span
							class="fa-icons-class"> sort-amount-desc </span></li>

						<li><i class="fa fa-3x fa-sort-asc"></i> <span
							class="fa-icons-class"> sort-asc </span></li>

						<li><i class="fa fa-3x fa-sort-desc"></i> <span
							class="fa-icons-class"> sort-desc </span></li>

						<li><i class="fa fa-3x fa-sort-down"></i> <span
							class="fa-icons-class"> sort-down <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-sort-numeric-asc"></i> <span
							class="fa-icons-class"> sort-numeric-asc </span></li>

						<li><i class="fa fa-3x fa-sort-numeric-desc"></i> <span
							class="fa-icons-class"> sort-numeric-desc </span></li>

						<li><i class="fa fa-3x fa-sort-up"></i> <span
							class="fa-icons-class"> sort-up <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-space-shuttle"></i> <span
							class="fa-icons-class"> space-shuttle </span></li>

						<li><i class="fa fa-3x fa-spinner"></i> <span
							class="fa-icons-class"> spinner </span></li>

						<li><i class="fa fa-3x fa-spoon"></i> <span
							class="fa-icons-class"> spoon </span></li>

						<li><i class="fa fa-3x fa-square"></i> <span
							class="fa-icons-class"> square </span></li>

						<li><i class="fa fa-3x fa-square-o"></i> <span
							class="fa-icons-class"> square-o </span></li>

						<li><i class="fa fa-3x fa-star"></i> <span
							class="fa-icons-class"> star </span></li>

						<li><i class="fa fa-3x fa-star-half"></i> <span
							class="fa-icons-class"> star-half </span></li>

						<li><i class="fa fa-3x fa-star-half-empty"></i> <span
							class="fa-icons-class"> star-half-empty <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-star-half-full"></i> <span
							class="fa-icons-class"> star-half-full <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-star-half-o"></i> <span
							class="fa-icons-class"> star-half-o </span></li>

						<li><i class="fa fa-3x fa-star-o"></i> <span
							class="fa-icons-class"> star-o </span></li>

						<li><i class="fa fa-3x fa-sticky-note"></i> <span
							class="fa-icons-class"> sticky-note </span></li>

						<li><i class="fa fa-3x fa-sticky-note-o"></i> <span
							class="fa-icons-class"> sticky-note-o </span></li>

						<li><i class="fa fa-3x fa-street-view"></i> <span
							class="fa-icons-class"> street-view </span></li>

						<li><i class="fa fa-3x fa-suitcase"></i> <span
							class="fa-icons-class"> suitcase </span></li>

						<li><i class="fa fa-3x fa-sun-o"></i> <span
							class="fa-icons-class"> sun-o </span></li>

						<li><i class="fa fa-3x fa-support"></i> <span
							class="fa-icons-class"> support <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-tablet"></i> <span
							class="fa-icons-class"> tablet </span></li>

						<li><i class="fa fa-3x fa-tachometer"></i> <span
							class="fa-icons-class"> tachometer </span></li>

						<li><i class="fa fa-3x fa-tag"></i> <span
							class="fa-icons-class"> tag </span></li>

						<li><i class="fa fa-3x fa-tags"></i> <span
							class="fa-icons-class"> tags </span></li>

						<li><i class="fa fa-3x fa-tasks"></i> <span
							class="fa-icons-class"> tasks </span></li>

						<li><i class="fa fa-3x fa-taxi"></i> <span
							class="fa-icons-class"> taxi </span></li>

						<li><i class="fa fa-3x fa-television"></i> <span
							class="fa-icons-class"> television </span></li>

						<li><i class="fa fa-3x fa-terminal"></i> <span
							class="fa-icons-class"> terminal </span></li>

						<li><i class="fa fa-3x fa-thumb-tack"></i> <span
							class="fa-icons-class"> thumb-tack </span></li>

						<li><i class="fa fa-3x fa-thumbs-down"></i> <span
							class="fa-icons-class"> thumbs-down </span></li>

						<li><i class="fa fa-3x fa-thumbs-o-down"></i> <span
							class="fa-icons-class"> thumbs-o-down </span></li>

						<li><i class="fa fa-3x fa-thumbs-o-up"></i> <span
							class="fa-icons-class"> thumbs-o-up </span></li>

						<li><i class="fa fa-3x fa-thumbs-up"></i> <span
							class="fa-icons-class"> thumbs-up </span></li>

						<li><i class="fa fa-3x fa-ticket"></i> <span
							class="fa-icons-class"> ticket </span></li>

						<li><i class="fa fa-3x fa-times"></i> <span
							class="fa-icons-class"> times </span></li>

						<li><i class="fa fa-3x fa-times-circle"></i> <span
							class="fa-icons-class"> times-circle </span></li>

						<li><i class="fa fa-3x fa-times-circle-o"></i> <span
							class="fa-icons-class"> times-circle-o </span></li>

						<li><i class="fa fa-3x fa-tint"></i> <span
							class="fa-icons-class"> tint </span></li>

						<li><i class="fa fa-3x fa-toggle-down"></i> <span
							class="fa-icons-class"> toggle-down <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-toggle-left"></i> <span
							class="fa-icons-class"> toggle-left <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-toggle-off"></i> <span
							class="fa-icons-class"> toggle-off </span></li>

						<li><i class="fa fa-3x fa-toggle-on"></i> <span
							class="fa-icons-class"> toggle-on </span></li>

						<li><i class="fa fa-3x fa-toggle-right"></i> <span
							class="fa-icons-class"> toggle-right <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-toggle-up"></i> <span
							class="fa-icons-class"> toggle-up <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-trademark"></i> <span
							class="fa-icons-class"> trademark </span></li>

						<li><i class="fa fa-3x fa-trash"></i> <span
							class="fa-icons-class"> trash </span></li>

						<li><i class="fa fa-3x fa-trash-o"></i> <span
							class="fa-icons-class"> trash-o </span></li>

						<li><i class="fa fa-3x fa-tree"></i> <span
							class="fa-icons-class"> tree </span></li>

						<li><i class="fa fa-3x fa-trophy"></i> <span
							class="fa-icons-class"> trophy </span></li>

						<li><i class="fa fa-3x fa-truck"></i> <span
							class="fa-icons-class"> truck </span></li>

						<li><i class="fa fa-3x fa-tty"></i> <span
							class="fa-icons-class"> tty </span></li>

						<li><i class="fa fa-3x fa-tv"></i> <span
							class="fa-icons-class"> tv <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-umbrella"></i> <span
							class="fa-icons-class"> umbrella </span></li>

						<li><i class="fa fa-3x fa-university"></i> <span
							class="fa-icons-class"> university </span></li>

						<li><i class="fa fa-3x fa-unlock"></i> <span
							class="fa-icons-class"> unlock </span></li>

						<li><i class="fa fa-3x fa-unlock-alt"></i> <span
							class="fa-icons-class"> unlock-alt </span></li>

						<li><i class="fa fa-3x fa-unsorted"></i> <span
							class="fa-icons-class"> unsorted <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-upload"></i> <span
							class="fa-icons-class"> upload </span></li>

						<li><i class="fa fa-3x fa-user"></i> <span
							class="fa-icons-class"> user </span></li>

						<li><i class="fa fa-3x fa-user-plus"></i> <span
							class="fa-icons-class"> user-plus </span></li>

						<li><i class="fa fa-3x fa-user-secret"></i> <span
							class="fa-icons-class"> user-secret </span></li>

						<li><i class="fa fa-3x fa-user-times"></i> <span
							class="fa-icons-class"> user-times </span></li>

						<li><i class="fa fa-3x fa-users"></i> <span
							class="fa-icons-class"> users </span></li>

						<li><i class="fa fa-3x fa-video-camera"></i> <span
							class="fa-icons-class"> video-camera </span></li>

						<li><i class="fa fa-3x fa-volume-down"></i> <span
							class="fa-icons-class"> volume-down </span></li>

						<li><i class="fa fa-3x fa-volume-off"></i> <span
							class="fa-icons-class"> volume-off </span></li>

						<li><i class="fa fa-3x fa-volume-up"></i> <span
							class="fa-icons-class"> volume-up </span></li>

						<li><i class="fa fa-3x fa-warning"></i> <span
							class="fa-icons-class"> warning <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-wheelchair"></i> <span
							class="fa-icons-class"> wheelchair </span></li>

						<li><i class="fa fa-3x fa-wifi"></i> <span
							class="fa-icons-class"> wifi </span></li>

						<li><i class="fa fa-3x fa-wrench"></i> <span
							class="fa-icons-class"> wrench </span></li>

					</ul>
				</div>
				</section>

				<section id="hand">
				<h2 class="page-header">手型图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-hand-grab-o"></i> <span
							class="fa-icons-class"> hand-grab-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-hand-lizard-o"></i> <span
							class="fa-icons-class"> hand-lizard-o </span></li>

						<li><i class="fa fa-3x fa-hand-o-down"></i> <span
							class="fa-icons-class"> hand-o-down </span></li>

						<li><i class="fa fa-3x fa-hand-o-left"></i> <span
							class="fa-icons-class"> hand-o-left </span></li>

						<li><i class="fa fa-3x fa-hand-o-right"></i> <span
							class="fa-icons-class"> hand-o-right </span></li>

						<li><i class="fa fa-3x fa-hand-o-up"></i> <span
							class="fa-icons-class"> hand-o-up </span></li>

						<li><i class="fa fa-3x fa-hand-paper-o"></i> <span
							class="fa-icons-class"> hand-paper-o </span></li>

						<li><i class="fa fa-3x fa-hand-peace-o"></i> <span
							class="fa-icons-class"> hand-peace-o </span></li>

						<li><i class="fa fa-3x fa-hand-pointer-o"></i> <span
							class="fa-icons-class"> hand-pointer-o </span></li>

						<li><i class="fa fa-3x fa-hand-rock-o"></i> <span
							class="fa-icons-class"> hand-rock-o </span></li>

						<li><i class="fa fa-3x fa-hand-scissors-o"></i> <span
							class="fa-icons-class"> hand-scissors-o </span></li>

						<li><i class="fa fa-3x fa-hand-spock-o"></i> <span
							class="fa-icons-class"> hand-spock-o </span></li>

						<li><i class="fa fa-3x fa-hand-stop-o"></i> <span
							class="fa-icons-class"> hand-stop-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-thumbs-down"></i> <span
							class="fa-icons-class"> thumbs-down </span></li>

						<li><i class="fa fa-3x fa-thumbs-o-down"></i> <span
							class="fa-icons-class"> thumbs-o-down </span></li>

						<li><i class="fa fa-3x fa-thumbs-o-up"></i> <span
							class="fa-icons-class"> thumbs-o-up </span></li>

						<li><i class="fa fa-3x fa-thumbs-up"></i> <span
							class="fa-icons-class"> thumbs-up </span></li>

					</ul>
				</div>
				</section>

				<section id="transportation">
				<h2 class="page-header">交通图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-ambulance"></i> <span
							class="fa-icons-class"> ambulance </span></li>

						<li><i class="fa fa-3x fa-automobile"></i> <span
							class="fa-icons-class"> automobile <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-bicycle"></i> <span
							class="fa-icons-class"> bicycle </span></li>

						<li><i class="fa fa-3x fa-bus"></i> <span
							class="fa-icons-class"> bus </span></li>

						<li><i class="fa fa-3x fa-cab"></i> <span
							class="fa-icons-class"> cab <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-car"></i> <span
							class="fa-icons-class"> car </span></li>

						<li><i class="fa fa-3x fa-fighter-jet"></i> <span
							class="fa-icons-class"> fighter-jet </span></li>

						<li><i class="fa fa-3x fa-motorcycle"></i> <span
							class="fa-icons-class"> motorcycle </span></li>

						<li><i class="fa fa-3x fa-plane"></i> <span
							class="fa-icons-class"> plane </span></li>

						<li><i class="fa fa-3x fa-rocket"></i> <span
							class="fa-icons-class"> rocket </span></li>

						<li><i class="fa fa-3x fa-ship"></i> <span
							class="fa-icons-class"> ship </span></li>

						<li><i class="fa fa-3x fa-space-shuttle"></i> <span
							class="fa-icons-class"> space-shuttle </span></li>

						<li><i class="fa fa-3x fa-subway"></i> <span
							class="fa-icons-class"> subway </span></li>

						<li><i class="fa fa-3x fa-taxi"></i> <span
							class="fa-icons-class"> taxi </span></li>

						<li><i class="fa fa-3x fa-train"></i> <span
							class="fa-icons-class"> train </span></li>

						<li><i class="fa fa-3x fa-truck"></i> <span
							class="fa-icons-class"> truck </span></li>

						<li><i class="fa fa-3x fa-wheelchair"></i> <span
							class="fa-icons-class"> wheelchair </span></li>

					</ul>
				</div>
				</section>

				<section id="gender">
				<h2 class="page-header">性别图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">

						<li><i class="fa fa-3x fa-genderless"></i> <span
							class="fa-icons-class"> genderless </span></li>

						<li><i class="fa fa-3x fa-intersex"></i> <span
							class="fa-icons-class"> intersex <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-mars"></i> <span
							class="fa-icons-class"> mars </span></li>

						<li><i class="fa fa-3x fa-mars-double"></i> <span
							class="fa-icons-class"> mars-double </span></li>

						<li><i class="fa fa-3x fa-mars-stroke"></i> <span
							class="fa-icons-class"> mars-stroke </span></li>

						<li><i class="fa fa-3x fa-mars-stroke-h"></i> <span
							class="fa-icons-class"> mars-stroke-h </span></li>

						<li><i class="fa fa-3x fa-mars-stroke-v"></i> <span
							class="fa-icons-class"> mars-stroke-v </span></li>

						<li><i class="fa fa-3x fa-mercury"></i> <span
							class="fa-icons-class"> mercury </span></li>

						<li><i class="fa fa-3x fa-neuter"></i> <span
							class="fa-icons-class"> neuter </span></li>

						<li><i class="fa fa-3x fa-transgender"></i> <span
							class="fa-icons-class"> transgender </span></li>

						<li><i class="fa fa-3x fa-transgender-alt"></i> <span
							class="fa-icons-class"> transgender-alt </span></li>

						<li><i class="fa fa-3x fa-venus"></i> <span
							class="fa-icons-class"> venus </span></li>

						<li><i class="fa fa-3x fa-venus-double"></i> <span
							class="fa-icons-class"> venus-double </span></li>

						<li><i class="fa fa-3x fa-venus-mars"></i> <span
							class="fa-icons-class"> venus-mars </span></li>

					</ul>
				</div>
				</section>

				<section id="file-type">
				<h2 class="page-header">文件图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-file"></i> <span
							class="fa-icons-class"> file </span></li>

						<li><i class="fa fa-3x fa-file-archive-o"></i> <span
							class="fa-icons-class"> file-archive-o </span></li>

						<li><i class="fa fa-3x fa-file-audio-o"></i> <span
							class="fa-icons-class"> file-audio-o </span></li>

						<li><i class="fa fa-3x fa-file-code-o"></i> <span
							class="fa-icons-class"> file-code-o </span></li>

						<li><i class="fa fa-3x fa-file-excel-o"></i> <span
							class="fa-icons-class"> file-excel-o </span></li>

						<li><i class="fa fa-3x fa-file-image-o"></i> <span
							class="fa-icons-class"> file-image-o </span></li>

						<li><i class="fa fa-3x fa-file-movie-o"></i> <span
							class="fa-icons-class"> file-movie-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-file-o"></i> <span
							class="fa-icons-class"> file-o </span></li>

						<li><i class="fa fa-3x fa-file-pdf-o"></i> <span
							class="fa-icons-class"> file-pdf-o </span></li>

						<li><i class="fa fa-3x fa-file-photo-o"></i> <span
							class="fa-icons-class"> file-photo-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-file-picture-o"></i> <span
							class="fa-icons-class"> file-picture-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-file-powerpoint-o"></i> <span
							class="fa-icons-class"> file-powerpoint-o </span></li>

						<li><i class="fa fa-3x fa-file-sound-o"></i> <span
							class="fa-icons-class"> file-sound-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-file-text"></i> <span
							class="fa-icons-class"> file-text </span></li>

						<li><i class="fa fa-3x fa-file-text-o"></i> <span
							class="fa-icons-class"> file-text-o </span></li>

						<li><i class="fa fa-3x fa-file-video-o"></i> <span
							class="fa-icons-class"> file-video-o </span></li>

						<li><i class="fa fa-3x fa-file-word-o"></i> <span
							class="fa-icons-class"> file-word-o </span></li>

						<li><i class="fa fa-3x fa-file-zip-o"></i> <span
							class="fa-icons-class"> file-zip-o <span
								class="text-muted">(alias)</span>
						</span></li>

					</ul>
				</div>
				</section>

				<section id="form-control">
				<h2 class="page-header">表单图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-check-square"></i> <span
							class="fa-icons-class"> check-square </span></li>

						<li><i class="fa fa-3x fa-check-square-o"></i> <span
							class="fa-icons-class"> check-square-o </span></li>

						<li><i class="fa fa-3x fa-circle"></i> <span
							class="fa-icons-class"> circle </span></li>

						<li><i class="fa fa-3x fa-circle-o"></i> <span
							class="fa-icons-class"> circle-o </span></li>

						<li><i class="fa fa-3x fa-dot-circle-o"></i> <span
							class="fa-icons-class"> dot-circle-o </span></li>

						<li><i class="fa fa-3x fa-minus-square"></i> <span
							class="fa-icons-class"> minus-square </span></li>

						<li><i class="fa fa-3x fa-minus-square-o"></i> <span
							class="fa-icons-class"> minus-square-o </span></li>

						<li><i class="fa fa-3x fa-plus-square"></i> <span
							class="fa-icons-class"> plus-square </span></li>

						<li><i class="fa fa-3x fa-plus-square-o"></i> <span
							class="fa-icons-class"> plus-square-o </span></li>

						<li><i class="fa fa-3x fa-square"></i> <span
							class="fa-icons-class"> square </span></li>

						<li><i class="fa fa-3x fa-square-o"></i> <span
							class="fa-icons-class"> square-o </span></li>

					</ul>
				</div>
				</section>

				<section id="payment">
				<h2 class="page-header">支付图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-cc-amex"></i> <span
							class="fa-icons-class"> cc-amex </span></li>

						<li><i class="fa fa-3x fa-cc-diners-club"></i> <span
							class="fa-icons-class"> cc-diners-club </span></li>

						<li><i class="fa fa-3x fa-cc-discover"></i> <span
							class="fa-icons-class"> cc-discover </span></li>

						<li><i class="fa fa-3x fa-cc-jcb"></i> <span
							class="fa-icons-class"> cc-jcb </span></li>

						<li><i class="fa fa-3x fa-cc-mastercard"></i> <span
							class="fa-icons-class"> cc-mastercard </span></li>

						<li><i class="fa fa-3x fa-cc-paypal"></i> <span
							class="fa-icons-class"> cc-paypal </span></li>

						<li><i class="fa fa-3x fa-cc-stripe"></i> <span
							class="fa-icons-class"> cc-stripe </span></li>

						<li><i class="fa fa-3x fa-cc-visa"></i> <span
							class="fa-icons-class"> cc-visa </span></li>

						<li><i class="fa fa-3x fa-credit-card"></i> <span
							class="fa-icons-class"> credit-card </span></li>

						<li><i class="fa fa-3x fa-credit-card-alt"></i> <span
							class="fa-icons-class"> credit-card-alt </span></li>

						<li><i class="fa fa-3x fa-google-wallet"></i> <span
							class="fa-icons-class"> google-wallet </span></li>

						<li><i class="fa fa-3x fa-paypal"></i> <span
							class="fa-icons-class"> paypal </span></li>

					</ul>
				</div>
				</section>

				<section id="chart">
				<h2 class="page-header">图表图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-area-chart"></i> <span
							class="fa-icons-class"> area-chart </span></li>

						<li><i class="fa fa-3x fa-bar-chart"></i> <span
							class="fa-icons-class"> bar-chart </span></li>

						<li><i class="fa fa-3x fa-bar-chart-o"></i> <span
							class="fa-icons-class"> bar-chart-o <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-line-chart"></i> <span
							class="fa-icons-class"> line-chart </span></li>

						<li><i class="fa fa-3x fa-pie-chart"></i> <span
							class="fa-icons-class"> pie-chart </span></li>

					</ul>
				</div>
				</section>

				<section id="currency">
				<h2 class="page-header">货币图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-bitcoin"></i> <span
							class="fa-icons-class"> bitcoin <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-btc"></i> <span
							class="fa-icons-class"> btc </span></li>

						<li><i class="fa fa-3x fa-cny"></i> <span
							class="fa-icons-class"> cny <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-dollar"></i> <span
							class="fa-icons-class"> dollar <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-eur"></i> <span
							class="fa-icons-class"> eur </span></li>

						<li><i class="fa fa-3x fa-euro"></i> <span
							class="fa-icons-class"> euro <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-gbp"></i> <span
							class="fa-icons-class"> gbp </span></li>

						<li><i class="fa fa-3x fa-gg"></i> <span
							class="fa-icons-class"> gg </span></li>

						<li><i class="fa fa-3x fa-gg-circle"></i> <span
							class="fa-icons-class"> gg-circle </span></li>

						<li><i class="fa fa-3x fa-ils"></i> <span
							class="fa-icons-class"> ils </span></li>

						<li><i class="fa fa-3x fa-inr"></i> <span
							class="fa-icons-class"> inr </span></li>

						<li><i class="fa fa-3x fa-jpy"></i> <span
							class="fa-icons-class"> jpy </span></li>

						<li><i class="fa fa-3x fa-krw"></i> <span
							class="fa-icons-class"> krw </span></li>

						<li><i class="fa fa-3x fa-money"></i> <span
							class="fa-icons-class"> money </span></li>

						<li><i class="fa fa-3x fa-rmb"></i> <span
							class="fa-icons-class"> rmb <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-rouble"></i> <span
							class="fa-icons-class"> rouble <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-rub"></i> <span
							class="fa-icons-class"> rub </span></li>

						<li><i class="fa fa-3x fa-ruble"></i> <span
							class="fa-icons-class"> ruble <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-rupee"></i> <span
							class="fa-icons-class"> rupee <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-shekel"></i> <span
							class="fa-icons-class"> shekel <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-sheqel"></i> <span
							class="fa-icons-class"> sheqel <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-try"></i> <span
							class="fa-icons-class"> try </span></li>

						<li><i class="fa fa-3x fa-turkish-lira"></i> <span
							class="fa-icons-class"> turkish-lira <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-usd"></i> <span
							class="fa-icons-class"> usd </span></li>

						<li><i class="fa fa-3x fa-won"></i> <span
							class="fa-icons-class"> won <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-yen"></i> <span
							class="fa-icons-class"> yen <span class="text-muted">(alias)</span>
						</span></li>

					</ul>
				</div>
				</section>

				<section id="text-editor">
				<h2 class="page-header">文本编辑图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-align-center"></i> <span
							class="fa-icons-class"> align-center </span></li>

						<li><i class="fa fa-3x fa-align-justify"></i> <span
							class="fa-icons-class"> align-justify </span></li>

						<li><i class="fa fa-3x fa-align-left"></i> <span
							class="fa-icons-class"> align-left </span></li>

						<li><i class="fa fa-3x fa-align-right"></i> <span
							class="fa-icons-class"> align-right </span></li>

						<li><i class="fa fa-3x fa-bold"></i> <span
							class="fa-icons-class"> bold </span></li>

						<li><i class="fa fa-3x fa-chain"></i> <span
							class="fa-icons-class"> chain <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-chain-broken"></i> <span
							class="fa-icons-class"> chain-broken </span></li>

						<li><i class="fa fa-3x fa-clipboard"></i> <span
							class="fa-icons-class"> clipboard </span></li>

						<li><i class="fa fa-3x fa-columns"></i> <span
							class="fa-icons-class"> columns </span></li>

						<li><i class="fa fa-3x fa-copy"></i> <span
							class="fa-icons-class"> copy <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-cut"></i> <span
							class="fa-icons-class"> cut <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-dedent"></i> <span
							class="fa-icons-class"> dedent <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-eraser"></i> <span
							class="fa-icons-class"> eraser </span></li>

						<li><i class="fa fa-3x fa-file"></i> <span
							class="fa-icons-class"> file </span></li>

						<li><i class="fa fa-3x fa-file-o"></i> <span
							class="fa-icons-class"> file-o </span></li>

						<li><i class="fa fa-3x fa-file-text"></i> <span
							class="fa-icons-class"> file-text </span></li>

						<li><i class="fa fa-3x fa-file-text-o"></i> <span
							class="fa-icons-class"> file-text-o </span></li>

						<li><i class="fa fa-3x fa-files-o"></i> <span
							class="fa-icons-class"> files-o </span></li>

						<li><i class="fa fa-3x fa-floppy-o"></i> <span
							class="fa-icons-class"> floppy-o </span></li>

						<li><i class="fa fa-3x fa-font"></i> <span
							class="fa-icons-class"> font </span></li>

						<li><i class="fa fa-3x fa-header"></i> <span
							class="fa-icons-class"> header </span></li>

						<li><i class="fa fa-3x fa-indent"></i> <span
							class="fa-icons-class"> indent </span></li>

						<li><i class="fa fa-3x fa-italic"></i> <span
							class="fa-icons-class"> italic </span></li>

						<li><i class="fa fa-3x fa-link"></i> <span
							class="fa-icons-class"> link </span></li>

						<li><i class="fa fa-3x fa-list"></i> <span
							class="fa-icons-class"> list </span></li>

						<li><i class="fa fa-3x fa-list-alt"></i> <span
							class="fa-icons-class"> list-alt </span></li>

						<li><i class="fa fa-3x fa-list-ol"></i> <span
							class="fa-icons-class"> list-ol </span></li>

						<li><i class="fa fa-3x fa-list-ul"></i> <span
							class="fa-icons-class"> list-ul </span></li>

						<li><i class="fa fa-3x fa-outdent"></i> <span
							class="fa-icons-class"> outdent </span></li>

						<li><i class="fa fa-3x fa-paperclip"></i> <span
							class="fa-icons-class"> paperclip </span></li>

						<li><i class="fa fa-3x fa-paragraph"></i> <span
							class="fa-icons-class"> paragraph </span></li>

						<li><i class="fa fa-3x fa-paste"></i> <span
							class="fa-icons-class"> paste <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-repeat"></i> <span
							class="fa-icons-class"> repeat </span></li>

						<li><i class="fa fa-3x fa-rotate-left"></i> <span
							class="fa-icons-class"> rotate-left <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-rotate-right"></i> <span
							class="fa-icons-class"> rotate-right <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-save"></i> <span
							class="fa-icons-class"> save <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-scissors"></i> <span
							class="fa-icons-class"> scissors </span></li>

						<li><i class="fa fa-3x fa-strikethrough"></i> <span
							class="fa-icons-class"> strikethrough </span></li>

						<li><i class="fa fa-3x fa-subscript"></i> <span
							class="fa-icons-class"> subscript </span></li>

						<li><i class="fa fa-3x fa-superscript"></i> <span
							class="fa-icons-class"> superscript </span></li>

						<li><i class="fa fa-3x fa-table"></i> <span
							class="fa-icons-class"> table </span></li>

						<li><i class="fa fa-3x fa-text-height"></i> <span
							class="fa-icons-class"> text-height </span></li>

						<li><i class="fa fa-3x fa-text-width"></i> <span
							class="fa-icons-class"> text-width </span></li>

						<li><i class="fa fa-3x fa-th"></i> <span
							class="fa-icons-class"> th </span></li>

						<li><i class="fa fa-3x fa-th-large"></i> <span
							class="fa-icons-class"> th-large </span></li>

						<li><i class="fa fa-3x fa-th-list"></i> <span
							class="fa-icons-class"> th-list </span></li>

						<li><i class="fa fa-3x fa-underline"></i> <span
							class="fa-icons-class"> underline </span></li>

						<li><i class="fa fa-3x fa-undo"></i> <span
							class="fa-icons-class"> undo </span></li>

						<li><i class="fa fa-3x fa-unlink"></i> <span
							class="fa-icons-class"> unlink <span class="text-muted">(alias)</span>
						</span></li>

					</ul>
				</div>
				</section>

				<section id="directional">
				<h2 class="page-header">方位图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-angle-double-down"></i> <span
							class="fa-icons-class"> angle-double-down </span></li>

						<li><i class="fa fa-3x fa-angle-double-left"></i> <span
							class="fa-icons-class"> angle-double-left </span></li>

						<li><i class="fa fa-3x fa-angle-double-right"></i> <span
							class="fa-icons-class"> angle-double-right </span></li>

						<li><i class="fa fa-3x fa-angle-double-up"></i> <span
							class="fa-icons-class"> angle-double-up </span></li>

						<li><i class="fa fa-3x fa-angle-down"></i> <span
							class="fa-icons-class"> angle-down </span></li>

						<li><i class="fa fa-3x fa-angle-left"></i> <span
							class="fa-icons-class"> angle-left </span></li>

						<li><i class="fa fa-3x fa-angle-right"></i> <span
							class="fa-icons-class"> angle-right </span></li>

						<li><i class="fa fa-3x fa-angle-up"></i> <span
							class="fa-icons-class"> angle-up </span></li>

						<li><i class="fa fa-3x fa-arrow-circle-down"></i> <span
							class="fa-icons-class"> arrow-circle-down </span></li>

						<li><i class="fa fa-3x fa-arrow-circle-left"></i> <span
							class="fa-icons-class"> arrow-circle-left </span></li>

						<li><i class="fa fa-3x fa-arrow-circle-o-down"></i> <span
							class="fa-icons-class"> arrow-circle-o-down </span></li>

						<li><i class="fa fa-3x fa-arrow-circle-o-left"></i> <span
							class="fa-icons-class"> arrow-circle-o-left </span></li>

						<li><i class="fa fa-3x fa-arrow-circle-o-right"></i> <span
							class="fa-icons-class"> arrow-circle-o-right </span></li>

						<li><i class="fa fa-3x fa-arrow-circle-o-up"></i> <span
							class="fa-icons-class"> arrow-circle-o-up </span></li>

						<li><i class="fa fa-3x fa-arrow-circle-right"></i> <span
							class="fa-icons-class"> arrow-circle-right </span></li>

						<li><i class="fa fa-3x fa-arrow-circle-up"></i> <span
							class="fa-icons-class"> arrow-circle-up </span></li>

						<li><i class="fa fa-3x fa-arrow-down"></i> <span
							class="fa-icons-class"> arrow-down </span></li>

						<li><i class="fa fa-3x fa-arrow-left"></i> <span
							class="fa-icons-class"> arrow-left </span></li>

						<li><i class="fa fa-3x fa-arrow-right"></i> <span
							class="fa-icons-class"> arrow-right </span></li>

						<li><i class="fa fa-3x fa-arrow-up"></i> <span
							class="fa-icons-class"> arrow-up </span></li>

						<li><i class="fa fa-3x fa-arrows"></i> <span
							class="fa-icons-class"> arrows </span></li>

						<li><i class="fa fa-3x fa-arrows-alt"></i> <span
							class="fa-icons-class"> arrows-alt </span></li>

						<li><i class="fa fa-3x fa-arrows-h"></i> <span
							class="fa-icons-class"> arrows-h </span></li>

						<li><i class="fa fa-3x fa-arrows-v"></i> <span
							class="fa-icons-class"> arrows-v </span></li>

						<li><i class="fa fa-3x fa-caret-down"></i> <span
							class="fa-icons-class"> caret-down </span></li>

						<li><i class="fa fa-3x fa-caret-left"></i> <span
							class="fa-icons-class"> caret-left </span></li>

						<li><i class="fa fa-3x fa-caret-right"></i> <span
							class="fa-icons-class"> caret-right </span></li>

						<li><i class="fa fa-3x fa-caret-square-o-down"></i> <span
							class="fa-icons-class"> caret-square-o-down </span></li>

						<li><i class="fa fa-3x fa-caret-square-o-left"></i> <span
							class="fa-icons-class"> caret-square-o-left </span></li>

						<li><i class="fa fa-3x fa-caret-square-o-right"></i> <span
							class="fa-icons-class"> caret-square-o-right </span></li>

						<li><i class="fa fa-3x fa-caret-square-o-up"></i> <span
							class="fa-icons-class"> caret-square-o-up </span></li>

						<li><i class="fa fa-3x fa-caret-up"></i> <span
							class="fa-icons-class"> caret-up </span></li>

						<li><i class="fa fa-3x fa-chevron-circle-down"></i> <span
							class="fa-icons-class"> chevron-circle-down </span></li>

						<li><i class="fa fa-3x fa-chevron-circle-left"></i> <span
							class="fa-icons-class"> chevron-circle-left </span></li>

						<li><i class="fa fa-3x fa-chevron-circle-right"></i> <span
							class="fa-icons-class"> chevron-circle-right </span></li>

						<li><i class="fa fa-3x fa-chevron-circle-up"></i> <span
							class="fa-icons-class"> chevron-circle-up </span></li>

						<li><i class="fa fa-3x fa-chevron-down"></i> <span
							class="fa-icons-class"> chevron-down </span></li>

						<li><i class="fa fa-3x fa-chevron-left"></i> <span
							class="fa-icons-class"> chevron-left </span></li>

						<li><i class="fa fa-3x fa-chevron-right"></i> <span
							class="fa-icons-class"> chevron-right </span></li>

						<li><i class="fa fa-3x fa-chevron-up"></i> <span
							class="fa-icons-class"> chevron-up </span></li>

						<li><i class="fa fa-3x fa-exchange"></i> <span
							class="fa-icons-class"> exchange </span></li>

						<li><i class="fa fa-3x fa-hand-o-down"></i> <span
							class="fa-icons-class"> hand-o-down </span></li>

						<li><i class="fa fa-3x fa-hand-o-left"></i> <span
							class="fa-icons-class"> hand-o-left </span></li>

						<li><i class="fa fa-3x fa-hand-o-right"></i> <span
							class="fa-icons-class"> hand-o-right </span></li>

						<li><i class="fa fa-3x fa-hand-o-up"></i> <span
							class="fa-icons-class"> hand-o-up </span></li>

						<li><i class="fa fa-3x fa-long-arrow-down"></i> <span
							class="fa-icons-class"> long-arrow-down </span></li>

						<li><i class="fa fa-3x fa-long-arrow-left"></i> <span
							class="fa-icons-class"> long-arrow-left </span></li>

						<li><i class="fa fa-3x fa-long-arrow-right"></i> <span
							class="fa-icons-class"> long-arrow-right </span></li>

						<li><i class="fa fa-3x fa-long-arrow-up"></i> <span
							class="fa-icons-class"> long-arrow-up </span></li>

						<li><i class="fa fa-3x fa-toggle-down"></i> <span
							class="fa-icons-class"> toggle-down <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-toggle-left"></i> <span
							class="fa-icons-class"> toggle-left <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-toggle-right"></i> <span
							class="fa-icons-class"> toggle-right <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-toggle-up"></i> <span
							class="fa-icons-class"> toggle-up <span class="text-muted">(alias)</span>
						</span></li>

					</ul>
				</div>
				</section>

				<section id="video-player">
				<h2 class="page-header">播放器图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-arrows-alt"></i> <span
							class="fa-icons-class"> arrows-alt </span></li>

						<li><i class="fa fa-3x fa-backward"></i> <span
							class="fa-icons-class"> backward </span></li>

						<li><i class="fa fa-3x fa-compress"></i> <span
							class="fa-icons-class"> compress </span></li>

						<li><i class="fa fa-3x fa-eject"></i> <span
							class="fa-icons-class"> eject </span></li>

						<li><i class="fa fa-3x fa-expand"></i> <span
							class="fa-icons-class"> expand </span></li>

						<li><i class="fa fa-3x fa-fast-backward"></i> <span
							class="fa-icons-class"> fast-backward </span></li>

						<li><i class="fa fa-3x fa-fast-forward"></i> <span
							class="fa-icons-class"> fast-forward </span></li>

						<li><i class="fa fa-3x fa-forward"></i> <span
							class="fa-icons-class"> forward </span></li>

						<li><i class="fa fa-3x fa-pause"></i> <span
							class="fa-icons-class"> pause </span></li>

						<li><i class="fa fa-3x fa-pause-circle"></i> <span
							class="fa-icons-class"> pause-circle </span></li>

						<li><i class="fa fa-3x fa-pause-circle-o"></i> <span
							class="fa-icons-class"> pause-circle-o </span></li>

						<li><i class="fa fa-3x fa-play"></i> <span
							class="fa-icons-class"> play </span></li>

						<li><i class="fa fa-3x fa-play-circle"></i> <span
							class="fa-icons-class"> play-circle </span></li>

						<li><i class="fa fa-3x fa-play-circle-o"></i> <span
							class="fa-icons-class"> play-circle-o </span></li>

						<li><i class="fa fa-3x fa-random"></i> <span
							class="fa-icons-class"> random </span></li>

						<li><i class="fa fa-3x fa-step-backward"></i> <span
							class="fa-icons-class"> step-backward </span></li>

						<li><i class="fa fa-3x fa-step-forward"></i> <span
							class="fa-icons-class"> step-forward </span></li>

						<li><i class="fa fa-3x fa-stop"></i> <span
							class="fa-icons-class"> stop </span></li>

						<li><i class="fa fa-3x fa-stop-circle"></i> <span
							class="fa-icons-class"> stop-circle </span></li>

						<li><i class="fa fa-3x fa-stop-circle-o"></i> <span
							class="fa-icons-class"> stop-circle-o </span></li>

						<li><i class="fa fa-3x fa-youtube-play"></i> <span
							class="fa-icons-class"> youtube-play </span></li>

					</ul>
				</div>
				</section>

				<section id="brand">
				<h2 class="page-header">Logo图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-500px"></i> <span
							class="fa-icons-class"> 500px </span></li>

						<li><i class="fa fa-3x fa-adn"></i> <span
							class="fa-icons-class"> adn </span></li>

						<li><i class="fa fa-3x fa-amazon"></i> <span
							class="fa-icons-class"> amazon </span></li>

						<li><i class="fa fa-3x fa-android"></i> <span
							class="fa-icons-class"> android </span></li>

						<li><i class="fa fa-3x fa-angellist"></i> <span
							class="fa-icons-class"> angellist </span></li>

						<li><i class="fa fa-3x fa-apple"></i> <span
							class="fa-icons-class"> apple </span></li>

						<li><i class="fa fa-3x fa-behance"></i> <span
							class="fa-icons-class"> behance </span></li>

						<li><i class="fa fa-3x fa-behance-square"></i> <span
							class="fa-icons-class"> behance-square </span></li>

						<li><i class="fa fa-3x fa-bitbucket"></i> <span
							class="fa-icons-class"> bitbucket </span></li>

						<li><i class="fa fa-3x fa-bitbucket-square"></i> <span
							class="fa-icons-class"> bitbucket-square </span></li>

						<li><i class="fa fa-3x fa-bitcoin"></i> <span
							class="fa-icons-class"> bitcoin <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-black-tie"></i> <span
							class="fa-icons-class"> black-tie </span></li>

						<li><i class="fa fa-3x fa-bluetooth"></i> <span
							class="fa-icons-class"> bluetooth </span></li>

						<li><i class="fa fa-3x fa-bluetooth-b"></i> <span
							class="fa-icons-class"> bluetooth-b </span></li>

						<li><i class="fa fa-3x fa-btc"></i> <span
							class="fa-icons-class"> btc </span></li>

						<li><i class="fa fa-3x fa-buysellads"></i> <span
							class="fa-icons-class"> buysellads </span></li>

						<li><i class="fa fa-3x fa-cc-amex"></i> <span
							class="fa-icons-class"> cc-amex </span></li>

						<li><i class="fa fa-3x fa-cc-diners-club"></i> <span
							class="fa-icons-class"> cc-diners-club </span></li>

						<li><i class="fa fa-3x fa-cc-discover"></i> <span
							class="fa-icons-class"> cc-discover </span></li>

						<li><i class="fa fa-3x fa-cc-jcb"></i> <span
							class="fa-icons-class"> cc-jcb </span></li>

						<li><i class="fa fa-3x fa-cc-mastercard"></i> <span
							class="fa-icons-class"> cc-mastercard </span></li>

						<li><i class="fa fa-3x fa-cc-paypal"></i> <span
							class="fa-icons-class"> cc-paypal </span></li>

						<li><i class="fa fa-3x fa-cc-stripe"></i> <span
							class="fa-icons-class"> cc-stripe </span></li>

						<li><i class="fa fa-3x fa-cc-visa"></i> <span
							class="fa-icons-class"> cc-visa </span></li>

						<li><i class="fa fa-3x fa-chrome"></i> <span
							class="fa-icons-class"> chrome </span></li>

						<li><i class="fa fa-3x fa-codepen"></i> <span
							class="fa-icons-class"> codepen </span></li>

						<li><i class="fa fa-3x fa-codiepie"></i> <span
							class="fa-icons-class"> codiepie </span></li>

						<li><i class="fa fa-3x fa-connectdevelop"></i> <span
							class="fa-icons-class"> connectdevelop </span></li>

						<li><i class="fa fa-3x fa-contao"></i> <span
							class="fa-icons-class"> contao </span></li>

						<li><i class="fa fa-3x fa-css3"></i> <span
							class="fa-icons-class"> css3 </span></li>

						<li><i class="fa fa-3x fa-dashcube"></i> <span
							class="fa-icons-class"> dashcube </span></li>

						<li><i class="fa fa-3x fa-delicious"></i> <span
							class="fa-icons-class"> delicious </span></li>

						<li><i class="fa fa-3x fa-deviantart"></i> <span
							class="fa-icons-class"> deviantart </span></li>

						<li><i class="fa fa-3x fa-digg"></i> <span
							class="fa-icons-class"> digg </span></li>

						<li><i class="fa fa-3x fa-dribbble"></i> <span
							class="fa-icons-class"> dribbble </span></li>

						<li><i class="fa fa-3x fa-dropbox"></i> <span
							class="fa-icons-class"> dropbox </span></li>

						<li><i class="fa fa-3x fa-drupal"></i> <span
							class="fa-icons-class"> drupal </span></li>

						<li><i class="fa fa-3x fa-edge"></i> <span
							class="fa-icons-class"> edge </span></li>

						<li><i class="fa fa-3x fa-empire"></i> <span
							class="fa-icons-class"> empire </span></li>

						<li><i class="fa fa-3x fa-expeditedssl"></i> <span
							class="fa-icons-class"> expeditedssl </span></li>

						<li><i class="fa fa-3x fa-facebook"></i> <span
							class="fa-icons-class"> facebook </span></li>

						<li><i class="fa fa-3x fa-facebook-f"></i> <span
							class="fa-icons-class"> facebook-f <span
								class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-facebook-official"></i> <span
							class="fa-icons-class"> facebook-official </span></li>

						<li><i class="fa fa-3x fa-facebook-square"></i> <span
							class="fa-icons-class"> facebook-square </span></li>

						<li><i class="fa fa-3x fa-firefox"></i> <span
							class="fa-icons-class"> firefox </span></li>

						<li><i class="fa fa-3x fa-flickr"></i> <span
							class="fa-icons-class"> flickr </span></li>

						<li><i class="fa fa-3x fa-fonticons"></i> <span
							class="fa-icons-class"> fonticons </span></li>

						<li><i class="fa fa-3x fa-fort-awesome"></i> <span
							class="fa-icons-class"> fort-awesome </span></li>

						<li><i class="fa fa-3x fa-forumbee"></i> <span
							class="fa-icons-class"> forumbee </span></li>

						<li><i class="fa fa-3x fa-foursquare"></i> <span
							class="fa-icons-class"> foursquare </span></li>

						<li><i class="fa fa-3x fa-ge"></i> <span
							class="fa-icons-class"> ge <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-get-pocket"></i> <span
							class="fa-icons-class"> get-pocket </span></li>

						<li><i class="fa fa-3x fa-gg"></i> <span
							class="fa-icons-class"> gg </span></li>

						<li><i class="fa fa-3x fa-gg-circle"></i> <span
							class="fa-icons-class"> gg-circle </span></li>

						<li><i class="fa fa-3x fa-git"></i> <span
							class="fa-icons-class"> git </span></li>

						<li><i class="fa fa-3x fa-git-square"></i> <span
							class="fa-icons-class"> git-square </span></li>

						<li><i class="fa fa-3x fa-github"></i> <span
							class="fa-icons-class"> github </span></li>

						<li><i class="fa fa-3x fa-github-alt"></i> <span
							class="fa-icons-class"> github-alt </span></li>

						<li><i class="fa fa-3x fa-github-square"></i> <span
							class="fa-icons-class"> github-square </span></li>

						<li><i class="fa fa-3x fa-gittip"></i> <span
							class="fa-icons-class"> gittip <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-google"></i> <span
							class="fa-icons-class"> google </span></li>

						<li><i class="fa fa-3x fa-google-plus"></i> <span
							class="fa-icons-class"> google-plus </span></li>

						<li><i class="fa fa-3x fa-google-plus-square"></i> <span
							class="fa-icons-class"> google-plus-square </span></li>

						<li><i class="fa fa-3x fa-google-wallet"></i> <span
							class="fa-icons-class"> google-wallet </span></li>

						<li><i class="fa fa-3x fa-gratipay"></i> <span
							class="fa-icons-class"> gratipay </span></li>

						<li><i class="fa fa-3x fa-hacker-news"></i> <span
							class="fa-icons-class"> hacker-news </span></li>

						<li><i class="fa fa-3x fa-houzz"></i> <span
							class="fa-icons-class"> houzz </span></li>

						<li><i class="fa fa-3x fa-html5"></i> <span
							class="fa-icons-class"> html5 </span></li>

						<li><i class="fa fa-3x fa-instagram"></i> <span
							class="fa-icons-class"> instagram </span></li>

						<li><i class="fa fa-3x fa-internet-explorer"></i> <span
							class="fa-icons-class"> internet-explorer </span></li>

						<li><i class="fa fa-3x fa-ioxhost"></i> <span
							class="fa-icons-class"> ioxhost </span></li>

						<li><i class="fa fa-3x fa-joomla"></i> <span
							class="fa-icons-class"> joomla </span></li>

						<li><i class="fa fa-3x fa-jsfiddle"></i> <span
							class="fa-icons-class"> jsfiddle </span></li>

						<li><i class="fa fa-3x fa-lastfm"></i> <span
							class="fa-icons-class"> lastfm </span></li>

						<li><i class="fa fa-3x fa-lastfm-square"></i> <span
							class="fa-icons-class"> lastfm-square </span></li>

						<li><i class="fa fa-3x fa-leanpub"></i> <span
							class="fa-icons-class"> leanpub </span></li>

						<li><i class="fa fa-3x fa-linkedin"></i> <span
							class="fa-icons-class"> linkedin </span></li>

						<li><i class="fa fa-3x fa-linkedin-square"></i> <span
							class="fa-icons-class"> linkedin-square </span></li>

						<li><i class="fa fa-3x fa-linux"></i> <span
							class="fa-icons-class"> linux </span></li>

						<li><i class="fa fa-3x fa-maxcdn"></i> <span
							class="fa-icons-class"> maxcdn </span></li>

						<li><i class="fa fa-3x fa-meanpath"></i> <span
							class="fa-icons-class"> meanpath </span></li>

						<li><i class="fa fa-3x fa-medium"></i> <span
							class="fa-icons-class"> medium </span></li>

						<li><i class="fa fa-3x fa-mixcloud"></i> <span
							class="fa-icons-class"> mixcloud </span></li>

						<li><i class="fa fa-3x fa-modx"></i> <span
							class="fa-icons-class"> modx </span></li>

						<li><i class="fa fa-3x fa-odnoklassniki"></i> <span
							class="fa-icons-class"> odnoklassniki </span></li>

						<li><i class="fa fa-3x fa-odnoklassniki-square"></i> <span
							class="fa-icons-class"> odnoklassniki-square </span></li>

						<li><i class="fa fa-3x fa-opencart"></i> <span
							class="fa-icons-class"> opencart </span></li>

						<li><i class="fa fa-3x fa-openid"></i> <span
							class="fa-icons-class"> openid </span></li>

						<li><i class="fa fa-3x fa-opera"></i> <span
							class="fa-icons-class"> opera </span></li>

						<li><i class="fa fa-3x fa-optin-monster"></i> <span
							class="fa-icons-class"> optin-monster </span></li>

						<li><i class="fa fa-3x fa-pagelines"></i> <span
							class="fa-icons-class"> pagelines </span></li>

						<li><i class="fa fa-3x fa-paypal"></i> <span
							class="fa-icons-class"> paypal </span></li>

						<li><i class="fa fa-3x fa-pied-piper"></i> <span
							class="fa-icons-class"> pied-piper </span></li>

						<li><i class="fa fa-3x fa-pied-piper-alt"></i> <span
							class="fa-icons-class"> pied-piper-alt </span></li>

						<li><i class="fa fa-3x fa-pinterest"></i> <span
							class="fa-icons-class"> pinterest </span></li>

						<li><i class="fa fa-3x fa-pinterest-p"></i> <span
							class="fa-icons-class"> pinterest-p </span></li>

						<li><i class="fa fa-3x fa-pinterest-square"></i> <span
							class="fa-icons-class"> pinterest-square </span></li>

						<li><i class="fa fa-3x fa-product-hunt"></i> <span
							class="fa-icons-class"> product-hunt </span></li>

						<li><i class="fa fa-3x fa-qq"></i> <span
							class="fa-icons-class"> qq </span></li>

						<li><i class="fa fa-3x fa-ra"></i> <span
							class="fa-icons-class"> ra <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-rebel"></i> <span
							class="fa-icons-class"> rebel </span></li>

						<li><i class="fa fa-3x fa-reddit"></i> <span
							class="fa-icons-class"> reddit </span></li>

						<li><i class="fa fa-3x fa-reddit-alien"></i> <span
							class="fa-icons-class"> reddit-alien </span></li>

						<li><i class="fa fa-3x fa-reddit-square"></i> <span
							class="fa-icons-class"> reddit-square </span></li>

						<li><i class="fa fa-3x fa-renren"></i> <span
							class="fa-icons-class"> renren </span></li>

						<li><i class="fa fa-3x fa-safari"></i> <span
							class="fa-icons-class"> safari </span></li>

						<li><i class="fa fa-3x fa-scribd"></i> <span
							class="fa-icons-class"> scribd </span></li>

						<li><i class="fa fa-3x fa-sellsy"></i> <span
							class="fa-icons-class"> sellsy </span></li>

						<li><i class="fa fa-3x fa-share-alt"></i> <span
							class="fa-icons-class"> share-alt </span></li>

						<li><i class="fa fa-3x fa-share-alt-square"></i> <span
							class="fa-icons-class"> share-alt-square </span></li>

						<li><i class="fa fa-3x fa-shirtsinbulk"></i> <span
							class="fa-icons-class"> shirtsinbulk </span></li>

						<li><i class="fa fa-3x fa-simplybuilt"></i> <span
							class="fa-icons-class"> simplybuilt </span></li>

						<li><i class="fa fa-3x fa-skyatlas"></i> <span
							class="fa-icons-class"> skyatlas </span></li>

						<li><i class="fa fa-3x fa-skype"></i> <span
							class="fa-icons-class"> skype </span></li>

						<li><i class="fa fa-3x fa-slack"></i> <span
							class="fa-icons-class"> slack </span></li>

						<li><i class="fa fa-3x fa-slideshare"></i> <span
							class="fa-icons-class"> slideshare </span></li>

						<li><i class="fa fa-3x fa-soundcloud"></i> <span
							class="fa-icons-class"> soundcloud </span></li>

						<li><i class="fa fa-3x fa-spotify"></i> <span
							class="fa-icons-class"> spotify </span></li>

						<li><i class="fa fa-3x fa-stack-exchange"></i> <span
							class="fa-icons-class"> stack-exchange </span></li>

						<li><i class="fa fa-3x fa-stack-overflow"></i> <span
							class="fa-icons-class"> stack-overflow </span></li>

						<li><i class="fa fa-3x fa-steam"></i> <span
							class="fa-icons-class"> steam </span></li>

						<li><i class="fa fa-3x fa-steam-square"></i> <span
							class="fa-icons-class"> steam-square </span></li>

						<li><i class="fa fa-3x fa-stumbleupon"></i> <span
							class="fa-icons-class"> stumbleupon </span></li>

						<li><i class="fa fa-3x fa-stumbleupon-circle"></i> <span
							class="fa-icons-class"> stumbleupon-circle </span></li>

						<li><i class="fa fa-3x fa-tencent-weibo"></i> <span
							class="fa-icons-class"> tencent-weibo </span></li>

						<li><i class="fa fa-3x fa-trello"></i> <span
							class="fa-icons-class"> trello </span></li>

						<li><i class="fa fa-3x fa-tripadvisor"></i> <span
							class="fa-icons-class"> tripadvisor </span></li>

						<li><i class="fa fa-3x fa-tumblr"></i> <span
							class="fa-icons-class"> tumblr </span></li>

						<li><i class="fa fa-3x fa-tumblr-square"></i> <span
							class="fa-icons-class"> tumblr-square </span></li>

						<li><i class="fa fa-3x fa-twitch"></i> <span
							class="fa-icons-class"> twitch </span></li>

						<li><i class="fa fa-3x fa-twitter"></i> <span
							class="fa-icons-class"> twitter </span></li>

						<li><i class="fa fa-3x fa-twitter-square"></i> <span
							class="fa-icons-class"> twitter-square </span></li>

						<li><i class="fa fa-3x fa-usb"></i> <span
							class="fa-icons-class"> usb </span></li>

						<li><i class="fa fa-3x fa-viacoin"></i> <span
							class="fa-icons-class"> viacoin </span></li>

						<li><i class="fa fa-3x fa-vimeo"></i> <span
							class="fa-icons-class"> vimeo </span></li>

						<li><i class="fa fa-3x fa-vimeo-square"></i> <span
							class="fa-icons-class"> vimeo-square </span></li>

						<li><i class="fa fa-3x fa-vine"></i> <span
							class="fa-icons-class"> vine </span></li>

						<li><i class="fa fa-3x fa-vk"></i> <span
							class="fa-icons-class"> vk </span></li>

						<li><i class="fa fa-3x fa-wechat"></i> <span
							class="fa-icons-class"> wechat <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-weibo"></i> <span
							class="fa-icons-class"> weibo </span></li>

						<li><i class="fa fa-3x fa-weixin"></i> <span
							class="fa-icons-class"> weixin </span></li>

						<li><i class="fa fa-3x fa-whatsapp"></i> <span
							class="fa-icons-class"> whatsapp </span></li>

						<li><i class="fa fa-3x fa-wikipedia-w"></i> <span
							class="fa-icons-class"> wikipedia-w </span></li>

						<li><i class="fa fa-3x fa-windows"></i> <span
							class="fa-icons-class"> windows </span></li>

						<li><i class="fa fa-3x fa-wordpress"></i> <span
							class="fa-icons-class"> wordpress </span></li>

						<li><i class="fa fa-3x fa-xing"></i> <span
							class="fa-icons-class"> xing </span></li>

						<li><i class="fa fa-3x fa-xing-square"></i> <span
							class="fa-icons-class"> xing-square </span></li>

						<li><i class="fa fa-3x fa-y-combinator"></i> <span
							class="fa-icons-class"> y-combinator </span></li>

						<li><i class="fa fa-3x fa-y-combinator-square"></i> <span
							class="fa-icons-class"> y-combinator-square </span></li>

						<li><i class="fa fa-3x fa-yahoo"></i> <span
							class="fa-icons-class"> yahoo </span></li>

						<li><i class="fa fa-3x fa-yc"></i> <span
							class="fa-icons-class"> yc <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-yc-square"></i> <span
							class="fa-icons-class"> yc-square <span class="text-muted">(alias)</span>
						</span></li>

						<li><i class="fa fa-3x fa-yelp"></i> <span
							class="fa-icons-class"> yelp </span></li>

						<li><i class="fa fa-3x fa-youtube"></i> <span
							class="fa-icons-class"> youtube </span></li>

						<li><i class="fa fa-3x fa-youtube-play"></i> <span
							class="fa-icons-class"> youtube-play </span></li>

						<li><i class="fa fa-3x fa-youtube-square"></i> <span
							class="fa-icons-class"> youtube-square </span></li>

					</ul>
				</div>
				</section>

				<section id="medical">
				<h2 class="page-header">医学图标</h2>
				<div class="fa-icons">
					<ul class="fa-icons-list">
						<li><i class="fa fa-3x fa-ambulance"></i> <span
							class="fa-icons-class"> ambulance </span></li>

						<li><i class="fa fa-3x fa-h-square"></i> <span
							class="fa-icons-class"> h-square </span></li>

						<li><i class="fa fa-3x fa-heart"></i> <span
							class="fa-icons-class"> heart </span></li>

						<li><i class="fa fa-3x fa-heart-o"></i> <span
							class="fa-icons-class"> heart-o </span></li>

						<li><i class="fa fa-3x fa-heartbeat"></i> <span
							class="fa-icons-class"> heartbeat </span></li>

						<li><i class="fa fa-3x fa-hospital-o"></i> <span
							class="fa-icons-class"> hospital-o </span></li>

						<li><i class="fa fa-3x fa-medkit"></i> <span
							class="fa-icons-class"> medkit </span></li>

						<li><i class="fa fa-3x fa-plus-square"></i> <span
							class="fa-icons-class"> plus-square </span></li>

						<li><i class="fa fa-3x fa-stethoscope"></i> <span
							class="fa-icons-class"> stethoscope </span></li>

						<li><i class="fa fa-3x fa-user-md"></i> <span
							class="fa-icons-class"> user-md </span></li>

						<li><i class="fa fa-3x fa-wheelchair"></i> <span
							class="fa-icons-class"> wheelchair </span></li>

					</ul>
				</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>