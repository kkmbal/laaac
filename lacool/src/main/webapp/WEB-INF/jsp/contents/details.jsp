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
	
<script type="text/javascript">
var fromLimit = ${fromLimit};

function fnMakeReplyOpn(seq){
	$("#comment_reply_"+seq).remove();
	$("#comment_read_"+seq).append(
			'<div class="comment_reply" id="comment_reply_'+seq+'">'
			+'<ul>'
			+'<li class="reply">&nbsp;</li>'
			+'<li class="photo"><img src="${ctx}/${userVo.userFilePath}${userVo.userFileNm}"></li>'
			+'<li class="input"><textarea name="textarea_comment_'+seq+'" id="textarea_comment_'+seq+'" class="textarea_comment" style="width:804px;"></textarea></li>'
			+'<li class="btn"><input type="button" class="btns_st06_cancel" value="취소" onclick="fnCancelReplyOpn(\''+seq+'\')" /><br /><input type="button" class="btns_st06" style="margin-top:3px;" value="등록" onclick="fnReplyOpn(\''+seq+'\')" /></li>'
			+'</ul>'
			+'</div>'			
	);
	event.stopPropagation();
	event.preventDefault();
}

function fnCancelReplyOpn(seq){
	$("#comment_reply_"+seq).remove();
}

function fnReplyOpn(seq){
	var json = {
			"notiId":"${contents.notiId}", 
			"notiOpnSeq" : seq, 
			"upNotiOpnSeq" : 0,
			"opnConts" : $("#textarea_comment_"+seq).val().replace(/\n/g,"<br/>"),
			"restep" : 0,
			"relevel" : 0
		};

		$.post("${ctx}/contents/insertReplyOpn?format=json", {data:JSON.stringify(json)}, function(data){
			if(data.error){
				alert(data.error);
				return;
			}
			
			listNotiOpn();
			$("#comment_reply_"+seq).remove();
		});		
}

function listNotiOpn(){
	var json = {
			"notiId":"${contents.notiId}", 
			"fromLimit" : fromLimit
		};		
	
	$.post("${ctx}/contents/listNotiOpn?format=json", {data:JSON.stringify(json)}, function(data){
		if(data.error){
			alert(data.error);
			return;
		}
		$("#opnDiv div").remove();
		if(data.listNotiOpn){
			var json = $.parseJSON(JSON.stringify(data.listNotiOpn));
			for(var i=0;i<json.length;i++){
				$("#opnDiv").append(
						'<div class="comment_area">'
						+'<div class="comment_read" id="comment_read_'+json[i].notiOpnSeq+'">'
						+ (json[i].relevel > 0 ?'<div class="reply">&nbsp;</div>':'')
						+'	<div class="photo fl"><img src="${ctx}/'+json[i].userFilePath + json[i].userFileNm+'"></div>'
						+ (json[i].relevel == 0?'<div class="content fl" style="width:925px;">':'')
						+ (json[i].relevel > 0?'<div class="content fl" style="width:870px;">':'')
						+'		<ul>'
						+'			<li class="txt1"><span class="id"><a href="#">'+json[i].userNm+'</a></span><span class="t_line">l</span>'+json[i].updDttm
						+                 (json[i].relevel == 0?'<span class="t_line">l</span><a href="#" onclick="fnMakeReplyOpn(\''+json[i].notiOpnSeq+'\')">답글</a>':'')
						+'          </li>'
						+'			<li>'+json[i].opnConts+'</li>'
						+'		</ul>'
						+'	</div>'
						+'	<div class="cb"></div>'
						+'</div>'
						+'</div>'					
				);						
			}
		}	
		fromLimit = data.fromLimit;
	});	
	event.stopPropagation();
	event.preventDefault();
}

	$(document).ready(function(){
		//scrap등록
		$("#regScrap").click(function(){
			var json = {"notiId":"${contents.notiId}"};
			$.post("${ctx}/contents/insertScrap?format=json", {data:JSON.stringify(json)}, function(data){
				if(data.error){
					alert(data.error);
					return;
				}else{
					alert("등록되었습니다.");
				}
				if(data.scrapCnt){
					$("#scrapCnt").html(data.scrapCnt);
				}
			});				
		});
		
		//찬성/반대등록
		$("#evalOk, #evalNg").click(function(){
			var json = {"notiId":"${contents.notiId}", "notiEvalDiv" : "", "delYn":"N"};
			var id = $(this).attr("id");
			if(id == 'evalOk'){
				json.notiEvalDiv = "001";
			}else{
				json.notiEvalDiv = "002";
			}
			$.post("${ctx}/contents/insertEval?format=json", {data:JSON.stringify(json)}, function(data){
				if(data.error){
					alert(data.error);
					return;
				}else{
					alert("등록되었습니다.");
				}
			});				
		});
		
		//의견등록
		$("#regOpn").click(function(){
			var json = {
				"notiId":"${contents.notiId}", 
				"notiOpnSeq" : 0, 
				"upNotiOpnSeq" : 0,
				"opnConts" : $("#opnConts").val().replace(/\n/g,"<br/>"),
				"restep" : 0,
				"relevel" : 0
			};

			$.post("${ctx}/contents/insertOpn?format=json", {data:JSON.stringify(json)}, function(data){
				if(data.error){
					alert(data.error);
					return;
				}
				
				listNotiOpn();
				$("#opnConts").val("");
			});				
		});
		
		//의견취소
		$("#cancelOpn").click(function(){
			$("#opnConts").val("");
		});
		
		//gauge
		$("#progress_ng").progressbar({color:'#A1A1A1',float:'right'}).progress(${contents.ngCntRatio});
	    $("#progress_ok").progressbar({color:'#FF3399',float:'left'}).progress(${contents.okCntRatio}); 
	});
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
	<div class="view_title">${contents.notiTitle}</div>
	<!-- View_Title - end -->
	<!-- View_Img_Main - start -->
	<div class="view_img_box">
		<div class="view_img_main"><img src="${ctx}/resources/images/upload/contents/${firstFileVo.apndFileNm}" width="980" height="430"></div>
	</div>
	<!-- View_Img_Main - end -->
	<div class="blank_height10"></div>
	<!-- View_Img_Sub - start -->
	<div class="view_img_sub">
		<ul>
		    <c:forEach var="result" items="${fileVo}" varStatus="status">
			<li style="position:relative"><a href="#" onMouseOver="CgOver_01img(view_img_sub${status.count});" onMouseOut="CgOut_01img(view_img_sub${status.count});"><img src="${ctx}/resources/images/upload/contents/${result.apndFileNm}" class="photo"></a>
				<!-- view_img_sub01 - start -->
				<div class="view_img_sub_sel" style="position:absolute; left:0px; top:-253px; z-index:100; visibility: hidden;" id="view_img_sub${status.count}" onMouseOver="CgOver_01img(view_img_sub${status.count});OverStay();" onMouseOut="CgOut_01img(view_img_sub01);" nowrap><img src="${ctx}/resources/images/upload/contents/${result.apndFileNm}" class="photo"></div>
				<!-- view_img_sub01 - start -->
			</li>
			<li class="blank">&nbsp;</li>
			</c:forEach>
		</ul>
	</div>
	<!-- View_Img_Sub - end -->
	<div class="blank_height20"></div>
	<!-- 콘텐트 설명 - start -->
	<div class="view_detail_url"><img src="${ctx}/resources/images/icon/i_url.gif" align="absmiddle">&nbsp;<a href="#" target="_blank">${contents.notiUrl}</a></div>
	<div class="view_detail" style="overflow-x:hidden; overflow-y:auto; line-height: 1.6em;">
	${contents.notiConts}
	</div>
	<!-- 콘텐트 설명 - end -->
	<div class="fr"><input type="button" class="btns_st05" value="삭제" onclick="" /></div>
	<div class="blank_height30 cb"></div>
	<!-- scrapped_from - start -->
	<div class="scrap_from_area">
		<div class="scrap_from fl">
			<ul>
				<li class="photo"><a href="#"><img src="${ctx}/${contents.userFilePath}${contents.userFileNm}"></a></li>
				<li class="name"><a href="#">${contents.userNm}</a><span class="t_line" style="font-weight:normal;">l</span></li>
				<li class="btn"><input type="button" class="btnd_scrap" value="스크랩" id="regScrap" /></li>
				<li class="num"><a href="#" class="scrap_num"><span id="scrapCnt">${scrapCnt}</span></a>&nbsp;&nbsp;</li>
				<li class="btn"><input type="button" class="btni_sns" title="SNS" onclick="" /></li>
			</ul>
		</div>
		<div class="scrap_gauge fr">
			<ul>
				<li class="btn"><input type="button" class="btni_bad" title="비공감" id="evalNg" /></li>
				<li class="gauge">
					<!-- chart_gauge02 - start -->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
<%-- 							<td width="315" height="24" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st02.gif" align="absmiddle"></td> --%>
							<td width="315" height="24" align="center" valign="middle"><span id="progress_ng"></span><span id="progress_ok"></span></td>
						</tr>
					</table>
					<!-- chart_gauge02 - end -->
				</li>
				<li class="btn"><input type="button" class="btni_good" title="공감" id="evalOk" /></li>
			</ul>
		</div>
	</div>
	<!-- scrapped_from - end -->
	<div class="blank_height20"></div>
	<!-- scrapped_by - start -->
	<div class="scrap_by_area">
		<div class="scrap_me fl">
			<ul>
				<li class="photo"><a href="#"><img src="${ctx}/${userVo.userFilePath}${userVo.userFileNm}" class="photo"></a></li>
				<li class="name"><a href="#">${userVo.userNm}</a></li>		
			</ul>
		</div>
		<div class="scrap_by fr">
			<ul>
				<li class="prev"><input type="button" class="btni_arr02_prev" title="이전보기" onclick="" /></li>
				<c:forEach var="result" items="${scrapList}" varStatus="status">
					<li class="blank">&nbsp;</li>
					<li><a href="#"><img src="${ctx}/resources/${result.userFilePath}${result.userFilePath}" class="photo"></a></li>
				</c:forEach>
				<li class="next"><input type="button" class="btni_arr02_next" title="다음보기" onclick="" /></li>
			</ul>
		</div>
	</div>
	<!-- scrapped_by - end -->
	<div class="blank_height10"></div>
	<!-- scrapped_by_view - start -->
	<div class="scrap_by_view">
		<ul>
			<li><a href="#"><img src="${ctx}/resources/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/resources/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/resources/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/resources/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/resources/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/resources/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/resources/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/resources/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/resources/images/test/photo_scrap_view.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li><a href="#"><img src="${ctx}/resources/images/test/photo_scrap_view.jpg" class="photo"></a></li>
		</ul>
	</div>
	<!-- scrap_by_view - end -->
	<div class="blank_height50"></div>
	<%--
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
									<div class="chart_gauge01_good" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_good.gif) no-repeat;" align="center">
										<div class="txt"><span class="t_graph_num01">88</span><span class="t_graph_unit01">%</span></div>
										<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_good_icon.gif"></div>
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
									<div class="chart_gauge01_bad" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_bad.gif) no-repeat;" align="center">
										<div class="txt"><span class="t_graph_num01">40</span><span class="t_graph_unit01">%</span><br></div>
										<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_bad_icon.gif"></div>
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
	--%>
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
		<c:forEach var="result" items="${notiEvalOfCate}" varStatus="status">
			<div class="col">
				<div class="con_best_li">
					<ul>
						<li class="photo"><a href="#"><img src="${ctx}/resources/images/upload/contents/${result.apndFileNm}" class="photo"></a></li>
						<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">${result.notiTitle}</a></span></li>
					</ul>
				</div>
			</div>
			<div class="blank">&nbsp;</div>
		</c:forEach>
		<div class="next"><input type="button" class="btni_arr01_next" title="다음보기" onclick="" /></div>
	</div>
	<!-- Best - end -->
	<div class="blank_height50"></div>
	<!-- Comment_Write - start -->
	<div class="comment_write">
		<ul>
			<li class="photo"><img src="${ctx}/${userVo.userFilePath}${userVo.userFileNm}"></li>
			<li class="input"><textarea name="opnConts" id="opnConts" class="textarea_comment" style="width:858px;"></textarea></li>
			<li class="btn"><input type="button" class="btns_st06_cancel" value="취소" id="cancelOpn" /><br /><input type="button" class="btns_st06" style="margin-top:3px;" value="등록" id="regOpn" /></li>
		</ul>
	</div>
	<!-- Comment_Write - end -->
	<div class="blank_height5"></div>
	
	<div id="opnDiv">
		<c:forEach var="result" items="${listNotiOpn}" varStatus="status">
		<div class="comment_area">
			<div class="comment_read" id="comment_read_${result.notiOpnSeq}">
				<c:if test="${result.relevel > 0}"><div class="reply">&nbsp;</div></c:if>
				<div class="photo fl"><img src="${ctx}/${result.userFilePath}${result.userFileNm}"></div>
				<c:if test="${result.relevel == 0}"><div class="content fl" style="width:925px;"></c:if>
				<c:if test="${result.relevel > 0}"><div class="content fl" style="width:870px;"></c:if>
					<ul>
						<li class="txt1"><span class="id"><a href="#">${result.userNm}</a></span><span class="t_line">l</span>${result.updDttm}
						<c:if test="${result.relevel == 0}"><span class="t_line">l</span><a href="#" onclick="fnMakeReplyOpn('${result.notiOpnSeq}')">답글</a></c:if>
						</li>
						<li>${result.opnConts}</li>
					</ul>
				</div>
				<div class="cb"></div>
			</div>		
		</div>
		</c:forEach>
	</div>
	
	<div class="blank_height10"></div>
	<!-- Paging - start -->
	<div class="paging">
		<div class="pagenum fl"><a href="#" onclick="listNotiOpn();" style="padding-left:120px;">더보기</a></div>
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