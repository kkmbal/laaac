<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

	<script>
	function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}
	
	function MM_preloadImages() { //v3.0
	  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
	    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
	    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}
	
	function MM_findObj(n, d) { //v4.01
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	  if(!x && d.getElementById) x=d.getElementById(n); return x;
	}
	
	function MM_swapImage() { //v3.0
	  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	}
	
	function MM_showHideLayers() { //v6.0
	  var i,p,v,obj,args=MM_showHideLayers.arguments;
	  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
	    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
	    obj.visibility=v; }
	}
	
	
	function MM_findObj(n, d) { //v4.01
	
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	
	    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	
	  if(!x && d.getElementById) x=d.getElementById(n); return x;
	
	}
	
	
	function MM_showHideLayers() { //v6.0
	
	  var i,p,v,obj,args=MM_showHideLayers.arguments;
	
	  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
	
	    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
	
	    obj.visibility=v; }
	
	}
	
	function MM_findObj(n, d) { //v4.01
	
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	
	    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	
	  if(!x && d.getElementById) x=d.getElementById(n); return x;
	
	}
	
	function MM_swapImgRestore() { //v3.0
	
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	
	}
	
	function MM_swapImage() { //v3.0
	
	  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	
	   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	
	}
	
	function CgOver_01img(MenuNum){
		MenuNum.style.visibility = "visible";
	}
	
	function CgOut_01img(MenuNum){
		MenuNum.style.visibility = "hidden";
	}
	
	function CgOver_02img(MenuNum){
		MenuNum.style.visibility = "visible";
	}
	
	function CgOut_02img(MenuNum){
		MenuNum.style.visibility = "hidden";
	}
	function CgOver_03img(MenuNum){
		MenuNum.style.visibility = "visible";
	}
	
	function CgOut_03img(MenuNum){
		MenuNum.style.visibility = "hidden";
	}
	
	function CgOver_04img(MenuNum){
		MenuNum.style.visibility = "visible";
	}
	
	function CgOut_04img(MenuNum){
		MenuNum.style.visibility = "hidden";
	}
	function CgOver_05img(MenuNum){
		MenuNum.style.visibility = "visible";
	}
	
	function CgOut_05img(MenuNum){
		MenuNum.style.visibility = "hidden";
	}
	
	function CgOver_06img(MenuNum){
		MenuNum.style.visibility = "visible";
	}
	
	function CgOut_06img(MenuNum){
		MenuNum.style.visibility = "hidden";
	}
	function CgOver_07img(MenuNum){
		MenuNum.style.visibility = "visible";
	}
	
	function CgOut_07img(MenuNum){
		MenuNum.style.visibility = "hidden";
	}
	
	function CgOver_08img(MenuNum){
		MenuNum.style.visibility = "visible";
	}
	
	function CgOut_08img(MenuNum){
		MenuNum.style.visibility = "hidden";
	}
	function CgOver_09img(MenuNum){
		MenuNum.style.visibility = "visible";
	}
	
	function CgOut_09img(MenuNum){
		MenuNum.style.visibility = "hidden";
	}
	
	function CgOver_10img(MenuNum){
		MenuNum.style.visibility = "visible";
	}
	
	function CgOut_10img(MenuNum){
		MenuNum.style.visibility = "hidden";
	}
	</script>
</head>

<body>
<!--[if IE 8]><div class="wrapper ie8"><![endif]-->
<!--[if IE 9]><div class="wrapper ie9"><![endif]-->
<!--[if !IE]><div class="wrapper ienone"><![endif]-->


<!-- ***** WRAPPER - start ***** -->
<div id="wrap">


<!-- // GNB(header) - start // -->
<%@ include file="/WEB-INF/jsp/common/layout/gnb.jsp"%>
<!-- // GNB(header) - end // -->


<!-- // CONTAINER(sidebar+contents) - start // -->
<div id="container">
<!-- contents-start -->
<div id="contents">

	<!-- Local_Navi - start -->
	<div class="local_navi">
		<ul>
			<li><a href="#">홈</a></li>
			<li>&nbsp;>&nbsp;</li></li>
			<li><a href="#">카테고리 1</a></li>
			<li>&nbsp;>&nbsp;</li>
			<li class="sel">카테고리 2</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->
	<!-- View_Title - start -->
	<div class="view_title">[DUNKIN' EVENT] 2월 매주 수요일 글레이즈드 3+3개 3,300원!</div>
	<!-- View_Title - end -->
	<!-- View_Img_Main - start -->
	<div class="view_img_box">
		<div class="view_img_main"><img src="${ctx}/images/test/photo_view_img_main.jpg"></div>
	</div>
	<!-- View_Img_Main - end -->
	<div class="blank_height10"></div>
	<!-- View_Img_Sub - start -->
	<div class="view_img_sub">
		<ul>
			<li style="position:relative"><a href="#" onMouseOver="CgOver_01img(view_img_sub01);" onMouseOut="CgOut_01img(view_img_sub01);"><img src="${ctx}/images/test/photo_view_img_sub01.jpg" class="photo"></a>
				<!-- view_img_sub01 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:0px; top:-253px; z-index:100; visibility: hidden;" id="view_img_sub01" onMouseOver="CgOver_01img(view_img_sub01);OverStay();" onMouseOut="CgOut_01img(view_img_sub01);" nowrap><img src="${ctx}/images/test/photo_view_img_sub_zoom01.jpg" class="photo"></div>
				<!-- view_img_sub01 - start -->
			</li>
			<li class="blank">&nbsp;</li>
			<li style="position:relative"><a href="#" onMouseOver="CgOver_02img(view_img_sub02);" onMouseOut="CgOut_02img(view_img_sub02);"><img src="${ctx}/images/test/photo_view_img_sub02.jpg" class="photo"></a>
				<!-- view_img_sub02 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:-80px; top:-253px; z-index:1000; visibility: hidden;" id="view_img_sub02" onMouseOver="CgOver_02img(view_img_sub02);OverStay();" onMouseOut="CgOut_02img(view_img_sub02);" nowrap><img src="${ctx}/images/test/photo_view_img_sub_zoom02.jpg" class="photo"></div>
				<!-- view_img_sub02 - start -->
			</li>
			<li class="blank">&nbsp;</li>
			<li style="position:relative"><a href="#" onMouseOver="CgOver_01img(view_img_sub03);" onMouseOut="CgOut_01img(view_img_sub03);"><img src="${ctx}/images/test/photo_view_img_sub01.jpg" class="photo"></a>
				<!-- view_img_sub03 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:-80px; top:-253px; z-index:100; visibility: hidden;" id="view_img_sub03" onMouseOver="CgOver_01img(view_img_sub03);OverStay();" onMouseOut="CgOut_01img(view_img_sub03);" nowrap><img src="${ctx}/images/test/photo_view_img_sub_zoom01.jpg" class="photo"></div>
				<!-- view_img_sub03 - start -->
			</li>
			<li class="blank">&nbsp;</li>
			<li style="position:relative"><a href="#" onMouseOver="CgOver_02img(view_img_sub04);" onMouseOut="CgOut_02img(view_img_sub04);"><img src="${ctx}/images/test/photo_view_img_sub02.jpg" class="photo"></a>
				<!-- view_img_sub04 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:-80px; top:-253px; z-index:1000; visibility: hidden;" id="view_img_sub04" onMouseOver="CgOver_02img(view_img_sub04);OverStay();" onMouseOut="CgOut_02img(view_img_sub04);" nowrap><img src="${ctx}/images/test/photo_view_img_sub_zoom02.jpg" class="photo"></div>
				<!-- view_img_sub04 - start -->
			</li>
			<li class="blank">&nbsp;</li>
			<li style="position:relative"><a href="#" onMouseOver="CgOver_01img(view_img_sub05);" onMouseOut="CgOut_01img(view_img_sub05);"><img src="${ctx}/images/test/photo_view_img_sub01.jpg" class="photo"></a>
				<!-- view_img_sub05 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:-80px; top:-253px; z-index:100; visibility: hidden;" id="view_img_sub05" onMouseOver="CgOver_01img(view_img_sub05);OverStay();" onMouseOut="CgOut_01img(view_img_sub05);" nowrap><img src="${ctx}/images/test/photo_view_img_sub_zoom01.jpg" class="photo"></div>
				<!-- view_img_sub05 - start -->
			</li>
			<li class="blank">&nbsp;</li>
			<li style="position:relative"><a href="#" onMouseOver="CgOver_02img(view_img_sub06);" onMouseOut="CgOut_02img(view_img_sub06);"><img src="${ctx}/images/test/photo_view_img_sub02.jpg" class="photo"></a>
				<!-- view_img_sub06 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:-80px; top:-253px; z-index:1000; visibility: hidden;" id="view_img_sub06" onMouseOver="CgOver_02img(view_img_sub06);OverStay();" onMouseOut="CgOut_02img(view_img_sub06);" nowrap><img src="${ctx}/images/test/photo_view_img_sub_zoom02.jpg" class="photo"></div>
				<!-- view_img_sub06 - start -->
			</li>
			<li class="blank">&nbsp;</li>
			<li style="position:relative"><a href="#" onMouseOver="CgOver_01img(view_img_sub07);" onMouseOut="CgOut_01img(view_img_sub07);"><img src="${ctx}/images/test/photo_view_img_sub01.jpg" class="photo"></a>
				<!-- view_img_sub07 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:-80px; top:-253px; z-index:100; visibility: hidden;" id="view_img_sub07" onMouseOver="CgOver_01img(view_img_sub07);OverStay();" onMouseOut="CgOut_01img(view_img_sub07);" nowrap><img src="${ctx}/images/test/photo_view_img_sub_zoom01.jpg" class="photo"></div>
				<!-- view_img_sub07 - start -->
			</li>
			<li class="blank">&nbsp;</li>
			<li style="position:relative"><a href="#" onMouseOver="CgOver_02img(view_img_sub08);" onMouseOut="CgOut_02img(view_img_sub08);"><img src="${ctx}/images/test/photo_view_img_sub02.jpg" class="photo"></a>
				<!-- view_img_sub08 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:-80px; top:-253px; z-index:1000; visibility: hidden;" id="view_img_sub08" onMouseOver="CgOver_02img(view_img_sub08);OverStay();" onMouseOut="CgOut_02img(view_img_sub08);" nowrap><img src="${ctx}/images/test/photo_view_img_sub_zoom02.jpg" class="photo"></div>
				<!-- view_img_sub08 - start -->
			</li>
			<li class="blank">&nbsp;</li>
			<li style="position:relative"><a href="#" onMouseOver="CgOver_01img(view_img_sub09);" onMouseOut="CgOut_01img(view_img_sub09);"><img src="${ctx}/images/test/photo_view_img_sub01.jpg" class="photo"></a>
				<!-- view_img_sub09 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:-80px; top:-253px; z-index:100; visibility: hidden;" id="view_img_sub09" onMouseOver="CgOver_01img(view_img_sub09);OverStay();" onMouseOut="CgOut_01img(view_img_sub09);" nowrap><img src="${ctx}/images/test/photo_view_img_sub_zoom01.jpg" class="photo"></div>
				<!-- view_img_sub09 - start -->
			</li>
			<li class="blank">&nbsp;</li>
			<li style="position:relative"><a href="#" onMouseOver="CgOver_02img(view_img_sub10);" onMouseOut="CgOut_02img(view_img_sub10);"><img src="${ctx}/images/test/photo_view_img_sub02.jpg" class="photo"></a>
				<!-- view_img_sub10 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:-161px; top:-253px; z-index:1000; visibility: hidden;" id="view_img_sub10" onMouseOver="CgOver_02img(view_img_sub10);OverStay();" onMouseOut="CgOut_02img(view_img_sub10);" nowrap><img src="${ctx}/images/test/photo_view_img_sub_zoom02.jpg" class="photo"></div>
				<!-- view_img_sub10 - start -->
			</li>
		</ul>
	</div>
	<!-- View_Img_Sub - end -->
	<div class="blank_height20"></div>
	<!-- 콘텐트 설명 - start -->
	<div class="view_detail_url"><img src="${ctx}/images/icon/i_url.gif" align="absmiddle">&nbsp;<a href="#" target="_blank">www.google.com</a></div>
	<div class="view_detail" style="overflow-x:hidden; overflow-y:auto; line-height: 1.6em;">
	<strong>FUNFUN한 던킨 이벤트</strong><br>
	레드벨벳 도넛 100만개 돌파기념~ 2월 매주 수요일 글레이즈드 3+3개(글레이즈드3 + 레드벨벳 글레이즈드3) 3,300원!<br>
	- 기간 : 14.01.28~14.02.26<br>
	- 당일 한정수량 판매 / 1인 4팩 한정판매<br>
	- 매장 찾기<br>
	- 행사 제외매장 보기<br>
	※ 해피포인트 적립불가  l  일부매장제외  l  해당제품에 한하며 타 제품으로 교환불가  l  모바일쿠폰 사용가능  l  타 행사/타 쿠폰 중복 사용 불가
	</div>
	<!-- 콘텐트 설명 - end -->
	<div class="fr"><input type="button" class="btns_st05" value="삭제" onclick="" /></div>
	<div class="blank_height30 cb"></div>
	<!-- scrapped_from - start -->
	<div class="scrap_from_area">
		<div class="scrap_from fl">
			<ul>
				<li class="photo"><a href="#"><img src="${ctx}/images/test/photo_user02.jpg"></a></li>
				<li class="name"><a href="#">등록자명</a><span class="t_line" style="font-weight:normal;">l</span></li>
				<li class="btn"><input type="button" class="btnd_scrap" value="스크랩" onclick="" /></li>
				<li class="num"><a href="#" class="scrap_num"><span>150</span></a>&nbsp;&nbsp;</li>
				<li class="btn"><input type="button" class="btni_sns" title="SNS" onclick="" /></li>
			</ul>
		</div>
		<div class="scrap_gauge fr">
			<ul>
				<li class="btn"><input type="button" class="btni_bad" title="비공감" onclick="" /></li>
				<li class="gauge">
					<!-- chart_gauge02 - start -->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td width="315" height="24" align="center" valign="middle"><img src="${ctx}/images/test/ct_gauge_st02.gif" align="absmiddle"></td>
						</tr>
					</table>
					<!-- chart_gauge02 - end -->
				</li>
				<li class="btn"><input type="button" class="btni_good" title="공감" onclick="" /></li>
			</ul>
		</div>
	</div>
	<!-- scrapped_from - end -->
	<div class="blank_height20"></div>
	<!-- scrapped_by - start -->
	<div class="scrap_by_area">
		<div class="scrap_me fl">
			<ul>
				<li class="photo"><a href="#"><img src="${ctx}/images/test/photo_user01.jpg"></a></li>
				<li class="name"><a href="#">사용자명</a></li>		
			</ul>
		</div>
		<div class="scrap_by fr">
			<ul>
				<li class="prev"><input type="button" class="btni_arr02_prev" title="이전보기" onclick="" /></li>
				<li class="select" style="position:relative;"><a href="#"><img src="${ctx}/images/test/photo_user03.jpg" class="photo"></a>
				<!-- icon sel -->
				<div style="position:absolute; left:0px; top:40px; width:45px; height:6px; z-index:10000;"><img src="${ctx}/images/icon/i_scrap_sel.gif"></div>
				<!-- icon sel -->
				</li>
				<li class="blank">&nbsp;</li>
				<li><a href="#"><img src="${ctx}/images/test/photo_user04.jpg" class="photo"></a></li>
				<li class="blank">&nbsp;</li>
				<li><a href="#"><img src="${ctx}/images/test/photo_user05.jpg" class="photo"></a></li>
				<li class="blank">&nbsp;</li>
				<li><a href="#"><img src="${ctx}/images/test/photo_user06.jpg" class="photo"></a></li>
				<li class="blank">&nbsp;</li>
				<li><a href="#"><img src="${ctx}/images/test/photo_user07.jpg" class="photo"></a></li>
				<li class="blank">&nbsp;</li>
				<li><a href="#"><img src="${ctx}/images/test/photo_user08.jpg" class="photo"></a></li>
				<li class="blank">&nbsp;</li>
				<li><a href="#"><img src="${ctx}/images/test/photo_user09.jpg" class="photo"></a></li>
				<li class="blank">&nbsp;</li>
				<li><a href="#"><img src="${ctx}/images/test/photo_user10.jpg" class="photo"></a></li>
				<li class="blank">&nbsp;</li>
				<li><a href="#"><img src="${ctx}/images/test/photo_user11.jpg" class="photo"></a></li>
				<li class="blank">&nbsp;</li>
				<li><a href="#"><img src="${ctx}/images/test/photo_user02.jpg" class="photo"></a></li>
				<li class="next"><input type="button" class="btni_arr02_next" title="다음보기" onclick="" /></li>
			</ul>
		</div>
	</div>
	<!-- scrapped_by - end -->
	<div class="blank_height10"></div>
	<!-- scrapped_by_view - start -->
	<div class="scrap_by_view">
		<ul>
			<li><a href="#"><img src="${ctx}/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/images/test/photo_scrap_view.jpg" class="photo"></a></li>
		</ul>
	</div>
	<!-- scrap_by_view - end -->
	<div class="blank_height50"></div>
	<!-- Good and Bad - start -->
	<div class="good_bad">
		<div class="link_good fl">
			<!-- link_good_gauge - start -->
			<div class="gauge">
				<ul>
					<li class="chart">
						<!-- chart_gauge01 - start -->
						<table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td width="71" height="71" align="center" valign="top">
									<div class="chart_gauge01_good" style="background:url(${ctx}/images/dashboard/ct_gauge01_good.gif) no-repeat;" align="center">
										<div class="txt"><span class="t_graph_num01">88</span><span class="t_graph_unit01">%</span></div>
										<div class="icon"><img src="${ctx}/images/dashboard/ct_gauge01_good_icon.gif"></div>
									</div>
								</td>
							</tr>
						</table>
						<!-- chart_gauge01 - end -->
					</li>
					<li class="line">&nbsp;</li>
				</ul>
			</div>
			<!-- link_good_gauge - end -->
			<div class="blank_height15"></div>
			<!-- link_set01 - start -->
			<div class="link_set">
				<ul class="link_content01">
					<li class="title"><span class="t_ellipsis fl" style="width:360px;"><a href="#">카카오톡 <em class="search">이벤트 오늘은</em> 아웃백아웃백아웃백아웃백!(오지치즈무료)</a></span></li>
					<li class="date">2014.02.03</li>
					<li class="btn"><input type="button" class="btni_sns01" title="SNS" onclick="" /></li>
				</ul>
				<ul class="link_content02">
					<li><span><a href="#">진행되었던 <em class="search">이벤트</em>와 <em class="search">오늘의 이벤트</em>가 나와있는 란이에요 ㅋㅋ지나간 <em class="search">이벤트</em> 내용은 뭔지 알 수가 없더라구요~ 제가 기억나는건 토니모리는 젤아이라이너 무료!롯데월드...</a></span></li>
				</ul>
				<ul class="link_content03">
					<li class="txt01"><span class="t_ellipsis fl" style="width:220px;"><a href="#">blog.naver.com/loefielihue4830/559328988</a></span></li>
					<li><span class="t_line">l</span></li>
					<li><a href="#">즐기자 20대 청춘</a></li>
					<li><span class="t_line">l</span></li>
					<li><a href="#">블로그 내 검색</a></li>
				</ul>
			</div>
			<!-- link_set01 - end -->
			<!-- link_set02 - start -->
			<div class="link_set">
				<ul class="link_content01">
					<li class="title"><span><a href="#"><em class="search">오늘의 이벤트</em> 당첨후기 입니다 ^^*</a></span></li>
					<li class="date">5일전</li>
					<li class="btn" style="position:relative;"><input type="button" class="btni_sns01" title="SNS" onclick="" />
						<!-- Sns_area - start -->
						<div style="position:absolute; left:0px; top:19px; width:109px; height:28px; z-index:10000;">
							<ul class="sns_area">
								<li class="btn"><input type="button" class="btni_sns_face" title="facebook" onclick="" /></li>
								<li class="btn"><input type="button" class="btni_sns_twit" title="twitter" onclick="" /></li>
								<li class="btn"><input type="button" class="btni_sns_mail" title="mail" onclick="" /></li>
								<li class="btn"><input type="button" class="btni_sns_kakao" title="kakaotalk" onclick="" /></li>
							</ul>
						</div>
						<!-- Sns_area - end -->
					</li>
				</ul>
				<ul class="link_content02">
					<li><span><a href="#">짠 <em class="search">오늘의 이벤트</em>는 어떤분들이 선물 잘 받았다고 후기를 남겨주셨을까요~~! 자 먼저 
덧글 달아주신분들부터~~!! (4차원girl님: 감사해요~~~ 에이미초코매장이 멀어서...</a></span></li>
				</ul>
				<ul class="link_content03">
					<li class="txt01"><span><a href="#">blog.naver.com/oasispics/130115</a></span></li>
					<li><span class="t_line">l</span></li>
					<li><a href="#">오아시스픽쳐스</a></li>
					<li><span class="t_line">l</span></li>
					<li><a href="#">블로그 내 검색</a></li>
				</ul>
			</div>
			<!-- link_set02 - end -->
		</div>
		<div class="link_bad fr">
			<!-- link_bad_gauge - start -->
			<div class="gauge">
				<ul>
					<li class="chart">
						<!-- chart_gauge01 - start -->
						<table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td width="71" height="71" align="center" valign="top">
									<div class="chart_gauge01_bad" style="background:url(${ctx}/images/dashboard/ct_gauge01_bad.gif) no-repeat;" align="center">
										<div class="txt"><span class="t_graph_num01">40</span><span class="t_graph_unit01">%</span><br></div>
										<div class="icon"><img src="${ctx}/images/dashboard/ct_gauge01_bad_icon.gif"></div>
									</div>
								</td>
							</tr>
						</table>
						<!-- chart_gauge01 - end -->
					</li>
					<li class="line">&nbsp;</li>
				</ul>
			</div>
			<!-- link_bad_gauge - end -->
			<div class="blank_height15"></div>
			<!-- link_set01 - start -->
			<div class="link_set">
				<ul class="link_content01">
					<li class="title"><span class="t_ellipsis fl" style="width:360px;"><a href="#">카카오톡 <em class="search">이벤트 오늘은</em> 아웃백아웃백아웃백아웃백!(오지치즈무료)</a></span></li>
					<li class="date">2014.02.03</li>
					<li class="btn"><input type="button" class="btni_sns01" title="SNS" onclick="" /></li>
				</ul>
				<ul class="link_content02">
					<li><span><a href="#">진행되었던 <em class="search">이벤트</em>와 <em class="search">오늘의 이벤트</em>가 나와있는 란이에요 ㅋㅋ지나간 <em class="search">이벤트</em> 내용은 뭔지 알 수가 없더라구요~ 제가 기억나는건 토니모리는 젤아이라이너 무료!롯데월드...</a></span></li>
				</ul>
				<ul class="link_content03">
					<li class="txt01"><span class="t_ellipsis fl" style="width:220px;"><a href="#">blog.naver.com/loefielihue4830/559328988</a></span></li>
					<li><span class="t_line">l</span></li>
					<li><a href="#">즐기자 20대 청춘</a></li>
					<li><span class="t_line">l</span></li>
					<li><a href="#">블로그 내 검색</a></li>
				</ul>
			</div>
			<!-- link_set01 - end -->
			<!-- link_set02 - start -->
			<div class="link_set">
				<ul class="link_content01">
					<li class="title"><span><a href="#"><em class="search">오늘의 이벤트</em> 당첨후기 입니다 ^^*</a></span></li>
					<li class="date">5일전</li>
					<li class="btn"><input type="button" class="btni_sns01" title="SNS" onclick="" /></li>
				</ul>
				<ul class="link_content02">
					<li><span><a href="#">짠 <em class="search">오늘의 이벤트</em>는 어떤분들이 선물 잘 받았다고 후기를 남겨주셨을까요~~! 자 먼저 
덧글 달아주신분들부터~~!! (4차원girl님: 감사해요~~~ 에이미초코매장이 멀어서...</a></span></li>
				</ul>
				<ul class="link_content03">
					<li class="txt01"><span><a href="#">blog.naver.com/oasispics/130115</a></span></li>
					<li><span class="t_line">l</span></li>
					<li><a href="#">오아시스픽쳐스</a></li>
					<li><span class="t_line">l</span></li>
					<li><a href="#">블로그 내 검색</a></li>
				</ul>
			</div>
			<!-- link_set02 - end -->
		</div>
	</div>	
	<div class="cb"></div>
	<!-- Good and Bad - end -->
	<div class="blank_height30"></div>
	<!-- Title_1depth/btn - start -->
	<div class="title_1depth">
		<ul>
			<li class="title fl">이건 어때요?</li>
			<li class="btn fr"><span class="t_num">1</span><span class="t_num_txt">/</span><span class="t_num_txt">2</span>&nbsp;&nbsp;<input type="button" class="btni_more" title="더보기" onclick="" /></li>
		</ul>
	</div>
	<!-- Title_1depth/btn - end -->
	<div class="blank_height30"></div>
	<!-- Best - start -->
	<div class="con_best">
		<div class="prev"><input type="button" class="btni_arr01_prev" title="이전보기" onclick="" /></div>
		<div class="col">
			<div class="con_best_li">
				<ul>
					<li class="photo"><a href="#"><img src="${ctx}/images/test/photo_best.jpg" class="photo"></a></li>
					<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">[전국] TGIF 세트세트세트 할인권 0원!</a></span></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<div class="con_best_li">
				<ul>
					<li class="photo"><a href="#"><img src="${ctx}/images/test/photo_best.jpg" class="photo"></a></li>
					<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">[전국] TGIF 세트할인권 0원!</a></span></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<div class="con_best_li">
				<ul>
					<li class="photo"><a href="#"><img src="${ctx}/images/test/photo_best.jpg" class="photo"></a></li>
					<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">[전국] TGIF 세트할인권 0원!</a></span></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<div class="con_best_li">
				<ul>
					<li class="photo"><a href="#"><img src="${ctx}/images/test/photo_best.jpg" class="photo"></a></li>
					<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">[전국] TGIF 세트할인권 0원!</a></span></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<div class="con_best_li">
				<ul>
					<li class="photo"><a href="#"><img src="${ctx}/images/test/photo_best.jpg" class="photo"></a></li>
					<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">[전국] TGIF 세트할인권 0원!</a></span></li>
				</ul>
			</div>
		</div>
		<div class="next"><input type="button" class="btni_arr01_next" title="다음보기" onclick="" /></div>
	</div>
	<!-- Best - end -->
	<div class="blank_height50"></div>
	<!-- Comment_Write - start -->
	<div class="comment_write">
		<ul>
			<li class="photo"><img src="${ctx}/images/test/photo_user01.jpg"></li>
			<li class="input"><textarea name="" class="textarea_comment" style="width:858px;"></textarea></li>
			<li class="btn"><input type="button" class="btns_st06_cancel" value="취소" onclick="" /><br /><input type="button" class="btns_st06" style="margin-top:3px;" value="등록" onclick="" /></li>
		</ul>
	</div>
	<!-- Comment_Write - end -->
	<div class="blank_height5"></div>
	<!-- Comment01 - start -->
	<div class="comment_area">
		<!-- comment_read_set01 - start -->
		<div class="comment_read">
			<div class="photo fl"><img src="${ctx}/images/test/photo_user06.jpg"></div>
			<div class="content fl" style="width:925px;">
				<ul>
					<li class="txt1"><span class="id"><a href="#">덩이의 행복이야기</a></span><span class="t_line">l</span>2013-10-20 10:15:00<span class="t_line">l</span><a href="#">답글</a></li>
					<li>던킨도너츠 이벤트 정보까지 함께 드릴께요! 해피 수요일 글레이즈드 3+3 행사 하더라고요. 2월 매주 수요일 2월 5일, 12일, 19일, 26일에는 레드벨벳 도넛 100만개 돌파기념
으로 레드벨벳 3개 구매시 글레이즈드 드려요</li>
				</ul>
			</div>
			<div class="cb"></div>
		</div>
		<!-- comment_read_set01 - end -->
		<!-- comment_read_set02 - start -->
		<div class="comment_read">
			<div class="reply">&nbsp;</div>
			<div class="photo fl"><img src="${ctx}/images/test/photo_user03.jpg"></div>
			<div class="content fl" style="width:870px;">
				<ul>
					<li class="txt1"><span class="id"><a href="#">추억한페이지</a></span><span class="t_line">l</span>2013-10-20 10:15:00<span class="t_line">l</span><a href="#">답글</a></li>
					<li>내나름대로 서프라이즈라고 준비했던 던킨이벤트ㅋㅋ결과는 완전 대성공이였다지요~~~</li>
				</ul>
			</div>
			<div class="cb"></div>
		</div>
		<!-- comment_read_set02 - end -->
		<!-- comment_comment_reply - start -->
		<div class="comment_reply">
			<ul>
				<li class="reply">&nbsp;</li>
				<li class="photo"><img src="${ctx}/images/test/photo_user01.jpg"></li>
				<li class="input"><textarea name="" class="textarea_comment" style="width:804px;"></textarea></li>
				<li class="btn"><input type="button" class="btns_st06_cancel" value="취소" onclick="" /><br /><input type="button" class="btns_st06" style="margin-top:3px;" value="등록" onclick="" /></li>
			</ul>
		</div>
		<!-- comment_comment_reply - end -->
	</div>
	<!-- Comment01 - end -->
	<!-- Comment02 - start -->
	<div class="comment_area">
		<!-- comment_read_set01 - start -->
		<div class="comment_read">
			<div class="photo fl"><img src="${ctx}/images/test/photo_user06.jpg"></div>
			<div class="content fl" style="width:925px;">
				<ul>
					<li class="txt1"><span class="id"><a href="#">덩이의 행복이야기</a></span><span class="t_line">l</span>2013-10-20 10:15:00<span class="t_line">l</span><a href="#">답글</a></li>
					<li>던킨도너츠 이벤트 정보까지 함께 드릴께요! 해피 수요일 글레이즈드 3+3 행사 하더라고요. 2월 매주 수요일 2월 5일, 12일, 19일, 26일에는 레드벨벳 도넛 100만개 돌파기념
으로 레드벨벳 3개 구매시 글레이즈드 드려요</li>
				</ul>
			</div>
			<div class="cb"></div>
		</div>
		<!-- comment_read_set01 - end -->
		<!-- comment_read_set02 - start -->
		<div class="comment_read">
			<div class="reply">&nbsp;</div>
			<div class="photo fl"><img src="${ctx}/images/test/photo_user01.jpg"></div>
			<div class="content fl" style="width:870px;">
				<ul>
					<li class="txt1"><span class="id"><a href="#">김동준</a></span><span class="t_line">l</span>2013-10-20 10:15:00<span class="t_line">l</span><a href="#">답글</a><span class="t_line">l</span><a href="#">삭제</a></li>
					<li>내나름대로 서프라이즈라고 준비했던 던킨이벤트ㅋㅋ결과는 완전 대성공이였다지요~~~</li>
				</ul>
			</div>
			<div class="cb"></div>
		</div>
		<!-- comment_read_set02 - end -->
		<!-- comment_read_set03 - start -->
		<div class="comment_read">
			<div class="reply">&nbsp;</div>
			<div class="photo fl"><img src="${ctx}/images/test/photo_user02.jpg"></div>
			<div class="content fl" style="width:870px;">
				<ul>
					<li class="txt1"><span class="id"><a href="#">워터케어</a></span><span class="t_line">l</span>2013-10-20 10:15:00<span class="t_line">l</span><a href="#">답글</a></li>
					<li>던킨도너츠 2월 이벤트 던킨도너츠 2월 이벤트 평소에도 도너츠를 좋아하는데 2월 한달간 매주 수요일에 3 + 3 도너츠를 3,300원에 구매할 수 있다는 정보!!던킨도너츠 2월 이벤트 던킨도너츠 2월 이벤트 평소에도 도너츠를 좋아하는데 2월 한달간 매주 수요일에 3 + 3 도너츠를 3,300원에 구매할 수 있다는 정보!!던킨도너츠 2월 이벤트 던킨도너츠 2월 이벤트 평소에도 도너츠를 좋아하는데 2월 한달간 매주 수요일에 3 + 3 도너츠를 3,300원에 구매할 수 있다는 정보!!</li>
				</ul>
			</div>
			<div class="cb"></div>
		</div>
		<!-- comment_read_set03 - end -->
	</div>
	<!-- Comment02 - end -->
	<div class="blank_height10"></div>
	<!-- Paging - start -->
	<div class="paging">
		<div class="btn fl"><input type="button" class="btni_first_inact" title="처음" onclick="" /><input type="button" class="btni_prev_inact" title="이전" onclick="" /></div>
		<div class="pagenum fl"><a href="#">1</a><a href="#">2</a><span class="iListNum">3</span><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a><a href="#">9</a><a href="#">10</a></div>
		<div class="btn fr"><input type="button" class="btni_next" title="다음" onclick="" /><input type="button" class="btni_last" title="끝" onclick="" /></div>
		<div class="cb"></div>
	</div>
	<!-- Paging - end -->


</div>
<!-- contents-end -->
</div>
<!-- //  CONTAINER(sidebar+contents) - end // -->


<!-- // FOOTER - start // -->
<%@ include file="/WEB-INF/jsp/common/layout/footer.jsp"%>
<!-- // FOOTER - end // -->


</div>
<!-- ***** WRAPPER - end ***** -->


<!--[if IE]></div><![endif]-->
<!--[if !IE]></div><![endif]-->
</body>
</html>