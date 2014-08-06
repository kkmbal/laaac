<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>


<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">

function fnNotiEvalCate(cateId){
	var data = {cateId:cateId};
	$.post("${ctx}/main/listNotiEval?format=json", {data:JSON.stringify(data)}, function(data){
		if(data.error){
			alert(data.error);
			return;
		}
		$("#mainGood").empty();
		$("#mainBad").empty();
		
		//GOOD
		if(data.listNotiEvalOkOfCate){
			var json = $.parseJSON(JSON.stringify(data.listNotiEvalOkOfCate));
			for(var i=0;i<json.length;i++){
				$("#mainGood").append(
						'<div class="col">'
						+'<span class="photo"><a href="#"><img src="${ctx}/resources/images/upload/'+json[i].apndFileNm+'" class="photo"></a></span>'
						+'<div class="content">'
						+'<ul>'
						+'<li class="title"><span class="t_ellipsis" style="width:150px;"><a href="#">'+json[i].notiTitle+'</a></span></li>'
						+'<li class="num"><a href="#">'+json[i].notiOkCnt+'</a></li>'
						+'<li class="icon"><img src="${ctx}/resources/images/icon/i_good_st01.gif"></li>'
						+'</ul>'
						+'</div>'
						+'</div>'
						+'<div class="blank">&nbsp;</div>'						
				);					
			}
		}
		//BAD
		if(data.listNotiEvalNgOfCate){
			var json = $.parseJSON(JSON.stringify(data.listNotiEvalNgOfCate));
			for(var i=0;i<json.length;i++){
				$("#mainBad").append(
						'<div class="col">'
						+'<span class="photo"><a href="#"><img src="${ctx}/resources/images/upload/'+json[i].apndFileNm+'" class="photo"></a></span>'
						+'<div class="content">'
						+'<ul>'
						+'<li class="title"><span class="t_ellipsis" style="width:150px;"><a href="#">'+json[i].notiTitle+'</a></span></li>'
						+'<li class="num"><a href="#">'+json[i].notiNgCnt+'</a></li>'
						+'<li class="icon"><img src="${ctx}/resources/images/icon/i_bad_st01.gif"></li>'
						+'</ul>'
						+'</div>'
						+'</div>'
						+'<div class="blank">&nbsp;</div>'						
				);					
			}
		}
	});		
		event.preventDefault();
		event.stopPropagation();
}



$(document).ready(function(){
	//대분류
	$.post("${ctx}/category/listMainCategory?format=json", {data:""}, function(data){
		if(data.error){
			alert(data.error);
			return;
		}
		if(data.listCategoryVo){
			var json = $.parseJSON(JSON.stringify(data.listCategoryVo));
			for(var i=0;i<json.length;i++){
				if(i > 9) break;
				//$("#cateEvalDiv ul").append('<li id="main_'+json[i].cateId+'"><a href="#"><div class="tl10">'+json[i].cateNm+'</div></a><ul></ul></li>');
				$("#cateEvalDiv ul").append('<li style="width:100px;"><a href="#" onclick="fnNotiEvalCate(\''+json[i].cateId+'\')" onMouseOver="document.tab_cate01.src=\'${ctx}/resources/images/main/tab_cate01-ov.gif\'" onMouseOut="document.tab_cate01.src=\'${ctx}/resources/images/main/tab_cate01.gif\'"><img src="${ctx}/resources/images/main/tab_cate01.gif" alt="" border="0" width="99" height="50" title="'+json[i].cateNm+'" name="tab_cate01"></a></li>');					
			}
			if(json.length > 0){
				fnNotiEvalCate(json[0].cateId);
			}
		}
	});	
});
</script>
</head>

<body onLoad="javascript:MenuOn(0101);">
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

	<div class="blank_height25"></div>
	<!-- Main_Latest - start -->
	<div class="main_latest">
		<ul>
			<li class="photo"><span class="photo"><a href="#"><img src="${ctx}/resources/images/upload/${recentNotiInfo.apndFileNm}" width="85" height="60"></a></span></li>
			<li class="txt">
			<span class="id"><a href="#">${recentNotiInfo.userNm}</a></span><span class="t_line">l</span><span class="date">${recentNotiInfo.regDttm}</spin> <br />
			<span class="t_ellipsis" style="width:858px;"><a href="#"><strong>[${recentNotiInfo.notiTitle}]</strong> ${recentNotiInfo.notiConts}</a></span>
			</li>
			<li class="btn"><input type="button" class="btni_more" title="더보기" onclick="location.href='new_contents.html'" /></li>
		</ul>
	</div>
	<!-- Main_Latest - end -->
	<div class="blank_height25"></div>
	<!-- Title_1depth/btn - start -->
	<div class="title_1depth">
		<ul>
			<li class="title fl">Hot Issues</li>
			<li class="btn fr"><input type="button" class="btni_more" title="더보기" onclick="" /></li>
		</ul>
	</div>
	<!-- Title_1depth/btn - end -->
	<div class="blank_height20"></div>
	<!-- Main_Hot Issues 01 - start -->
	<div class="main_issues">
		<c:forEach var="result" items="${listHotIssue}" end="2" varStatus="status">
		<div class="col">
			<span class="photo"><a href="${ctx}/contents/getContentsDetail?notiId=${result.notiId}" target="_top"><img src="${ctx}/resources/images/upload/${result.apndFileNm}" class="photo"></a></span>
			<span class="title t_ellipsis" style="width:320px;"><a href="#">${result.notiTitle}</a></span>
			<span class="graph">
				<!-- chart_gauge01 - start -->
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td width="71" height="71" align="center" valign="top">
							<div id="ok_graph${result.notiId}" data-percent="50"></div>
							<!-- 
							<div class="chart_gauge01_good" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_good.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">88</span><span class="t_graph_unit01">%</span></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_good_icon.gif"></div>
							</div>
							-->
						</td>
						<td width="10"></td>
						<td width="71" height="71" align="center" valign="top">
							<div id="ng_graph${result.notiId}" data-percent="50"></div>
							<!-- 
							<div class="chart_gauge01_bad" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_bad.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">40</span><span class="t_graph_unit01">%</span><br></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_bad_icon.gif"></div>
							</div>
							 -->
						</td>
					</tr>
				</table>
				<!-- chart_gauge01 - end -->
			</span>
		</div>
		<div class="blank">&nbsp;</div>
		<script>drawCircle('ok_graph${result.notiId}', ['#ffe1ff', '#ff0080']); drawCircle('ng_graph${result.notiId}', ['#f0f0f0', '#8e8e8e']);</script>
		</c:forEach>
		<%-- 
		<div class="col">
			<span class="photo"><a href="상세보기.html" target="_self"><img src="${ctx}/resources/images/test/photo_issues.jpg" class="photo"></a></span>
			<span class="title t_ellipsis" style="width:320px;"><a href="#">대구 국제섬유박람회 프리뷰 인 대구</a></span>
			<span class="graph">
				<!-- chart_gauge01 - start -->
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td width="71" height="71" align="center" valign="top">
							<div class="chart_gauge01_good" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_good.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">50</span><span class="t_graph_unit01">%</span></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_good_icon.gif"></div>
							</div>
						</td>
						<td width="10"></td>
						<td width="71" height="71" align="center" valign="top">
							<div class="chart_gauge01_bad" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_bad.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">50</span><span class="t_graph_unit01">%</span><br></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_bad_icon.gif"></div>
							</div>
						</td>
					</tr>
				</table>
				<!-- chart_gauge01 - end -->
			</span>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<span class="photo"><a href="상세보기.html" target="_self"><img src="${ctx}/resources/images/test/photo_issues.jpg" class="photo"></a></span>
			<span class="title t_ellipsis" style="width:320px;"><a href="#">[EXCO] 2014 대구 국제섬유박람회 프리뷰 인 대구</a></span>
			<span class="graph">
				<!-- chart_gauge01 - start -->
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td width="71" height="71" align="center" valign="top">
							<div class="chart_gauge01_good" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_good.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">25</span><span class="t_graph_unit01">%</span></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_good_icon.gif"></div>
							</div>
						</td>
						<td width="10"></td>
						<td width="71" height="71" align="center" valign="top">
							<div class="chart_gauge01_bad" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_bad.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">75</span><span class="t_graph_unit01">%</span><br></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_bad_icon.gif"></div>
							</div>
						</td>
					</tr>
				</table>
				<!-- chart_gauge01 - end -->
			</span>
		</div>
		--%>
	</div>
	<!-- Main_Hot Issues 01 - end -->
	<div class="blank_height20 cb"></div>
	<!-- Main_Hot Issues 02 - start -->
	<div class="main_issues">
		<c:forEach var="result" items="${listHotIssue}" begin="3" varStatus="status">
		<div class="col">
			<span class="photo"><a href="${ctx}/contents/getContentsDetail?notiId=${result.notiId}" target="_self"><img src="${ctx}/resources/images/upload/${result.apndFileNm}" class="photo"></a></span>
			<span class="title t_ellipsis" style="width:320px;"><a href="#">${result.notiTitle}</a></span>
			<span class="graph">
				<!-- chart_gauge01 - start -->
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td width="71" height="71" align="center" valign="top">
							<div class="chart_gauge01_good" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_good.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">88</span><span class="t_graph_unit01">%</span></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_good_icon.gif"></div>
							</div>
						</td>
						<td width="10"></td>
						<td width="71" height="71" align="center" valign="top">
							<div class="chart_gauge01_bad" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_bad.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">40</span><span class="t_graph_unit01">%</span><br></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_bad_icon.gif"></div>
							</div>
						</td>
					</tr>
				</table>
				<!-- chart_gauge01 - end -->
			</span>
		</div>
		<div class="blank">&nbsp;</div>
		</c:forEach>
		<%--
		<div class="col">
			<span class="photo"><a href="#" target="_top"><img src="${ctx}/resources/images/test/photo_issues.jpg" class="photo"></a></span>
			<span class="title t_ellipsis" style="width:320px;"><a href="#">대구 국제섬유박람회 프리뷰 인 대구</a></span>
			<span class="graph">
				<!-- chart_gauge01 - start -->
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td width="71" height="71" align="center" valign="top">
							<div class="chart_gauge01_good" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_good.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">50</span><span class="t_graph_unit01">%</span></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_good_icon.gif"></div>
							</div>
						</td>
						<td width="10"></td>
						<td width="71" height="71" align="center" valign="top">
							<div class="chart_gauge01_bad" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_bad.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">50</span><span class="t_graph_unit01">%</span><br></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_bad_icon.gif"></div>
							</div>
						</td>
					</tr>
				</table>
				<!-- chart_gauge01 - end -->
			</span>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<span class="photo"><a href="상세보기.html" target="_self"><img src="${ctx}/resources/images/test/photo_issues.jpg" class="photo"></a></span>
			<span class="title t_ellipsis" style="width:320px;"><a href="#">[EXCO] 2014 대구 국제섬유박람회 프리뷰 인 대구</a></span>
			<span class="graph">
				<!-- chart_gauge01 - start -->
				<table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td width="71" height="71" align="center" valign="top">
							<div class="chart_gauge01_good" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_good.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">25</span><span class="t_graph_unit01">%</span></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_good_icon.gif"></div>
							</div>
						</td>
						<td width="10"></td>
						<td width="71" height="71" align="center" valign="top">
							<div class="chart_gauge01_bad" style="background:url(${ctx}/resources/images/dashboard/ct_gauge01_bad.gif) no-repeat;" align="center">
								<div class="txt"><span class="t_graph_num01">75</span><span class="t_graph_unit01">%</span><br></div>
								<div class="icon"><img src="${ctx}/resources/images/dashboard/ct_gauge01_bad_icon.gif"></div>
							</div>
						</td>
					</tr>
				</table>
				<!-- chart_gauge01 - end -->
			</span>
		</div>
		--%>
	</div>
	<!-- Main_Hot Issues 02 - end -->
	<div class="blank_height50 cb"></div>
	<!-- Main_Tab_category - start -->
	<div class="tab_cate" id="cateEvalDiv">
		<ul>
		<%--
			<li style="width:100px;"><a href="#" onMouseOver="document.tab_cate01.src='${ctx}/resources/images/main/tab_cate01-ov.gif'" onMouseOut="document.tab_cate01.src='${ctx}/resources/images/main/tab_cate01.gif'"><img src="${ctx}/resources/images/main/tab_cate01.gif" alt="" border="0" width="99" height="50" title="맛있는 음식" name="tab_cate01"></a></li>
			<li style="width:100px;"><a href="#" onMouseOver="document.tab_cate02.src='${ctx}/resources/images/main/tab_cate02-ov.gif'" onMouseOut="document.tab_cate02.src='${ctx}/resources/images/main/tab_cate02.gif'"><img src="${ctx}/resources/images/main/tab_cate02.gif" alt="" border="0" width="99" height="50" title="근사한 이벤트" name="tab_cate02"></a></li>
			<li style="width:100px;"><a href="#" onMouseOver="document.tab_cate03.src='${ctx}/resources/images/main/tab_cate03-ov.gif'" onMouseOut="document.tab_cate03.src='${ctx}/resources/images/main/tab_cate03.gif'"><img src="${ctx}/resources/images/main/tab_cate03.gif" alt="" border="0" width="99" height="50" title="좋은 물건" name="tab_cate03"></a></li>
			<li style="width:100px;"><a href="#" onMouseOver="document.tab_cate04.src='${ctx}/resources/images/main/tab_cate04-ov.gif'" onMouseOut="document.tab_cate04.src='${ctx}/resources/images/main/tab_cate04.gif'"><img src="${ctx}/resources/images/main/tab_cate04.gif" alt="" border="0" width="99" height="50" title="우리동네 가게" name="tab_cate04"></a></li>
			<li style="width:100px;" class="select"><a href="#"><img src="${ctx}/resources/images/main/tab_cate05-ov.gif" title="멋진 경치"></a></a></li>
			<li style="width:100px;"><a href="#" onMouseOver="document.tab_cate06.src='${ctx}/resources/images/main/tab_cate06-ov.gif'" onMouseOut="document.tab_cate06.src='${ctx}/resources/images/main/tab_cate06.gif'"><img src="${ctx}/resources/images/main/tab_cate06.gif" alt="" border="0" width="99" height="50" title="즐거운 쇼핑" name="tab_cate06"></a></li>
			<li style="width:100px;"><a href="#" onMouseOver="document.tab_cate07.src='${ctx}/resources/images/main/tab_cate07-ov.gif'" onMouseOut="document.tab_cate07.src='${ctx}/resources/images/main/tab_cate07.gif'"><img src="${ctx}/resources/images/main/tab_cate07.gif" alt="" border="0" width="99" height="50" title="아름다운 사람" name="tab_cate07"></a></li>
			<li style="width:100px;"><a href="#" onMouseOver="document.tab_cate08.src='${ctx}/resources/images/main/tab_cate08-ov.gif'" onMouseOut="document.tab_cate08.src='${ctx}/resources/images/main/tab_cate08.gif'"><img src="${ctx}/resources/images/main/tab_cate08.gif" alt="" border="0" width="99" height="50" title="신나는 여행" name="tab_cate08"></a></li>
			<li style="width:100px;"><a href="#" onMouseOver="document.tab_cate09.src='${ctx}/resources/images/main/tab_cate09-ov.gif'" onMouseOut="document.tab_cate09.src='${ctx}/resources/images/main/tab_cate09.gif'"><img src="${ctx}/resources/images/main/tab_cate09.gif" alt="" border="0" width="99" height="50" title="Cool Korea" name="tab_cate09"></a></li>
			<li style="width:100px;" class="end"><a href="#" onMouseOver="document.tab_cate10.src='${ctx}/resources/images/main/tab_cate10-ov.gif'" onMouseOut="document.tab_cate10.src='${ctx}/resources/images/main/tab_cate10.gif'"><img src="${ctx}/resources/images/main/tab_cate10.gif" alt="" border="0" width="99" height="50" title="나쁜 사기" name="tab_cate10"></a></li>
		--%>
		</ul>
	</div>
	<!-- Main_Tab_category - end -->
	<div class="blank_height30"></div>
	<!-- Main_Good gauge/btn - start -->
	<div class="title_gauge">
		<ul>
			<li class="gauge fl">
				<!-- chart_zoom - start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><input type="button" class="btni_bad01" title="나빠요" onclick="" /></td>
						<td width="325" height="24">
							<div style="background: #ffffff url(${ctx}/resources/images/dashboard/ct_zoom_good_bg.gif) repeat-x top left; widtd:325px; height:24px;">
								<a href="#"><img src="${ctx}/resources/images/dashboard/ct_zoom_+50.gif"></a>
							</div>
						</td>
						<td><input type="button" class="btni_good01" title="좋아요" onclick="" /></td>
					</tr>
				</table>
				<!-- chart_zoom - end -->
			<li class="btn fr"><span class="t_num"><a href="#">98</a></span>&nbsp;<span class="t_num_txt">건</span>&nbsp;&nbsp;<input type="button" class="btni_more" title="더보기" onclick="" /></li>
		</ul>
	</div>
	<!-- Main_Good gauge/btn - end -->
	<div class="blank_height10"></div>
	<!-- Main_Good - start -->
	<div class="main_good" id="mainGood">
		<%--
		<div class="col">
			<span class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_good.jpg" class="photo"></a></span>
			<div class="content">
				<ul>
					<li class="title"><span class="t_ellipsis" style="width:150px;"><a href="#">대구 국제섬유박람회 프리뷰 인 대구</a></span></li>
					<li class="num"><a href="#">120</a></li>
					<li class="icon"><img src="${ctx}/resources/images/icon/i_good_st01.gif"></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<span class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_good.jpg" class="photo"></a></span>
			<div class="content">
				<ul>
					<li class="title"><span class="t_ellipsis" style="width:150px;"><a href="#">대구 국제섬유박람회 프리뷰 인 대구</a></span></li>
					<li class="num"><a href="#">120</a></li>
					<li class="icon"><img src="${ctx}/resources/images/icon/i_good_st01.gif"></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<span class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_good.jpg" class="photo"></a></span>
			<div class="content">
				<ul>
					<li class="title"><span class="t_ellipsis" style="width:150px;"><a href="#">대구 국제섬유박람회 프리뷰 인 대구</a></span></li>
					<li class="num"><a href="#">120</a></li>
					<li class="icon"><img src="${ctx}/resources/images/icon/i_good_st01.gif"></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<span class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_good.jpg" class="photo"></a></span>
			<div class="content">
				<ul>
					<li class="title"><span class="t_ellipsis" style="width:150px;"><a href="#">대구 국제섬유박람회 프리뷰 인 대구</a></span></li>
					<li class="num"><a href="#">120</a></li>
					<li class="icon"><img src="${ctx}/resources/images/icon/i_good_st01.gif"></li>
				</ul>
			</div>
		</div>
		--%>
	</div>
	<!-- Main_Good - end -->
	<div class="blank_height30 cb"></div>
	<!-- Main_Bad gauge/btn - start -->
	<div class="title_gauge">
		<ul>
			<li class="gauge fl">
				<!-- chart_zoom - start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><input type="button" class="btni_bad01" title="나빠요" onclick="" /></td>
						<td width="325" height="24">
							<div style="background: #ffffff url(${ctx}/resources/images/dashboard/ct_zoom_bad_bg.gif) repeat-x top left; widtd:325px; height:24px;">
								<a href="#"><img src="${ctx}/resources/images/dashboard/ct_zoom_-50.gif"></a>
							</div>
						</td>
						<td><input type="button" class="btni_good01" title="좋아요" onclick="" /></td>
					</tr>
				</table>
				<!-- chart_zoom - end -->
			</li>
			<li class="btn fr"><span class="t_num_bad"><a href="#">98</a></span>&nbsp;<span class="t_num_txt">건</span>&nbsp;&nbsp;<input type="button" class="btni_more" title="더보기" onclick="" /></li>
		</ul>
	</div>
	<!-- Main_Bad gauge/btn - end -->
	<div class="blank_height10"></div>
	<!-- Main_Bad - start -->
	<div class="main_bad" id="mainBad">
		<%--
		<div class="col">
			<span class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_bad.jpg" class="photo"></a></span>
			<div class="content">
				<ul>
					<li class="title"><span class="t_ellipsis" style="width:150px;"><a href="#">대구 국제섬유박람회 프리뷰 인 대구</a></span></li>
					<li class="num"><a href="#">120</a></li>
					<li class="icon"><img src="${ctx}/resources/images/icon/i_bad_st01.gif"></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<span class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_bad.jpg" class="photo"></a></span>
			<div class="content">
				<ul>
					<li class="title"><span class="t_ellipsis" style="width:150px;"><a href="#">대구 국제섬유박람회 프리뷰 인 대구</a></span></li>
					<li class="num"><a href="#">120</a></li>
					<li class="icon"><img src="${ctx}/resources/images/icon/i_bad_st01.gif"></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<span class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_bad.jpg" class="photo"></a></span>
			<div class="content">
				<ul>
					<li class="title"><span class="t_ellipsis" style="width:150px;"><a href="#">대구 국제섬유박람회 프리뷰 인 대구</a></span></li>
					<li class="num"><a href="#">120</a></li>
					<li class="icon"><img src="${ctx}/resources/images/icon/i_bad_st01.gif"></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<span class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_bad.jpg" class="photo"></a></span>
			<div class="content">
				<ul>
					<li class="title"><span class="t_ellipsis" style="width:150px;"><a href="#">대구 국제섬유박람회 프리뷰 인 대구</a></span></li>
					<li class="num"><a href="#">120</a></li>
					<li class="icon"><img src="${ctx}/resources/images/icon/i_bad_st01.gif"></li>
				</ul>
			</div>
		</div>
		--%>
	</div>
	<!-- Main_Bad - end -->
	<div class="blank_height50 cb"></div>
	<!-- Title_1depth/btn - start -->
	<div class="title_1depth">
		<ul>
			<li class="title fl">Best 이건 어때요?</li>
			<li class="btn fr"><span class="t_num">1</span><span class="t_num_txt">/</span><span class="t_num_txt">2</span>&nbsp;&nbsp;<input type="button" class="btni_more" title="더보기" onclick="" /></li>
		</ul>
	</div>
	<!-- Title_1depth/btn - end -->
	<div class="blank_height30"></div>
	<!-- Best - start -->
	<div class="con_best">
		<div class="prev"><input type="button" class="btni_arr01_prev" title="이전보기" onclick="" /></div>
		<c:forEach var="result" items="${listNotiEvalOkInfo}" varStatus="status">
		<div class="col">
			<div class="con_best_li" style="position:relative;">
				<!-- icon best -->
				<div style="position:absolute; left:0px; top:0px; width:52px; height:51px; z-index:10000;"><img src="${ctx}/resources/images/icon/i_best.png"></div>
				<!-- icon best -->
				<ul>
					<li class="photo"><a href="${ctx}/contents/getContentsDetail?notiId=${result.notiId}"><img src="${ctx}/resources/images/upload/${result.apndFileNm}" class="photo"></a></li>
					<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">${result.notiTitle}</a></span></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		</c:forEach>
		<%--
		<div class="col">
			<div class="con_best_li">
				<ul>
					<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_best.jpg" class="photo"></a></li>
					<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">[전국] TGIF 세트할인권 0원!</a></span></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<div class="con_best_li">
				<ul>
					<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_best.jpg" class="photo"></a></li>
					<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">[전국] TGIF 세트할인권 0원!</a></span></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<div class="con_best_li">
				<ul>
					<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_best.jpg" class="photo"></a></li>
					<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">[전국] TGIF 세트할인권 0원!</a></span></li>
				</ul>
			</div>
		</div>
		<div class="blank">&nbsp;</div>
		<div class="col">
			<div class="con_best_li">
				<ul>
					<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_best.jpg" class="photo"></a></li>
					<li class="title"><span class="t_ellipsis" style="width:165px;"><a href="#">[전국] TGIF 세트할인권 0원!</a></span></li>
				</ul>
			</div>
		</div>
		--%>
		<div class="next"><input type="button" class="btni_arr01_next" title="다음보기" onclick="" /></div>
	</div>
	<!-- Best - end -->

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