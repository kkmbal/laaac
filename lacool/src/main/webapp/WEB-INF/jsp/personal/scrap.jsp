<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">

$(document).ready(function(){
	$("#btnAllChk").click(function(){
		$("input[id^=scrapChk]").each(function(){
			$(this).attr("checked", true);
			$(this).prop("checked", true);
		});
	});
	
	$("#btnChkCancel").click(function(){
		$("input[id^=scrapChk]").each(function(){
			$(this).attr("checked", false);
		});
	});
	
	$("#btnDelete").click(function(){
		var delObject = {notiIdList : []};
		
		$("input[id^=scrapChk]:checked").each(function(){
			//alert($(this).val());
			//$("#li_"+$(this).val()).remove();
			var obj = {notiId : ""};
			obj.notiId = $(this).val();
			delObject.notiIdList.push(obj);
		});
		
			console.log(delObject);
		if(delObject.notiIdList.length > 0){
			if(!confirm("삭제하시겠습니까?")){
				return;
			}
			$.post("${ctx}/personal/deleteScrap?format=json", {data:JSON.stringify(delObject)}, function(data){
				if(data.error){
					alert(data.error);
					return;
				}
				location.href = "${ctx}/personal/scrap";
			});
		}
		
	});
});
</script>
</head>

<body onLoad="javascript:MenuOn(0102);">
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
			<li><a href="home.html">홈</a></li>
			<li>&nbsp;>&nbsp;</li>
			<li class="sel">개인홈</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->
	<!-- Contents_Title - start -->
	<div class="contents_title">
		<ul>
			<li class="title fl">${userVo.userNm} <span class="sub">님의 개인홈</span></li>
			<li class="tab_area fr">
				<!-- tab_style01 - start -->
				<div class="tab_st01">
					<ul>
						<li><a href="${ctx}/personal/home" target="_top">개인홈</a></li>
						<li><a href="${ctx}/personal/info" target="_top">개인정보 관리</a></li>
						<li class="sel"><a target="_top">스크랩</a></li>
						<li><a href="${ctx}/personal/temporary" target="_top">임시저장</a></li>
<%-- 						<li><a href="${ctx}/personal/search" target="_top">대화기록</a></li> --%>
						<li><a href="${ctx}/member/member_cancel" target="_top">회원탈퇴</a></li>						
						
					</ul>
				</div>
				<!-- tab_style01 - end -->
			</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	<!-- title_1depth/btn - start -->
	<div class="title_1depth">
		<ul>
			<li class="title fl">스크랩한 컨텐츠</li>
			<li class="num fr"><span class="t_num"><a href="#">${totalCnt}</a></span>&nbsp;<span class="t_num_txt">건</span></li>
		</ul>
	</div>
	<!-- title_1depth/btn - end -->
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style02 - start -->
	<div class="cont_st02">
		<ul>
			<c:forEach var="result" items="${listScrap}" end="3" varStatus="status">
			<li class="col" id="li_${result.notiId}">
				<!-- 0101 - start -->
				<div class="checkbox"><input type="checkbox" id="scrapChk_${result.notiId}" hidefocus="true" class="check" value="${result.notiId}"></div>
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/upload/contents/${result.apndFileNm}" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/${result.userFilePath}${result.userFileNm}" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">${result.notiTitle}</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
<%-- 										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td> --%>
										<td width="131" height="20" align="center" valign="middle">
											<span id="progress_ng_1_${status.count}"></span><span id="progress_ok_1_${status.count}"></span>
											<script type="text/javascript">
												$("#progress_ng_1_${status.count}").progressbar({width:'60px',height:'1px',color:'#A1A1A1',float:'right'}).progress(${result.ngCntRatio});
										    	$("#progress_ok_1_${status.count}").progressbar({width:'60px',height:'1px',color:'#FF3399',float:'left'}).progress(${result.okCntRatio}); 									
											</script>
										</td>										
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<!-- end -->
						</li>
					</ul>
				</div>
				<!-- 0101 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			</c:forEach>
			
		</ul>
	</div>
	<!-- ContentsBox_Style02 - end -->
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style02 - start -->
	<div class="cont_st02">
		<ul>
			<c:forEach var="result" items="${listScrap}" begin="4" varStatus="status">
			<li class="col" id="li_${result.notiId}">
				<!-- 0101 - start -->
				<div class="checkbox"><input type="checkbox" id="scrapChk_${result.notiId}" hidefocus="true" class="check" value="${result.notiId}"></div>
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/upload/contents/${result.apndFileNm}" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/${result.userFilePath}${result.userFileNm}" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">${result.notiTitle}</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
<%-- 										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td> --%>
										<td width="131" height="20" align="center" valign="middle">
											<span id="progress_ng_2_${status.count}"></span><span id="progress_ok_2_${status.count}"></span>
											<script type="text/javascript">
												$("#progress_ng_2_${status.count}").progressbar({width:'60px',height:'1px',color:'#A1A1A1',float:'right'}).progress(${result.ngCntRatio});
										    	$("#progress_ok_2_${status.count}").progressbar({width:'60px',height:'1px',color:'#FF3399',float:'left'}).progress(${result.okCntRatio}); 									
											</script>
										</td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<!-- end -->
						</li>
					</ul>
				</div>
				<!-- 0101 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			</c:forEach>
			
		</ul>
	</div>
	<!-- ContentsBox_Style02 - end -->
	<div class="blank_height20"></div>
	<div class="paging">
		  <k:paging name="${pageInfo}" action="personal/scrap" jsFunction="fn_link_page">
		    <div class="btn fl">
		  	<k:get property="firstPage"/><k:get property="prevPageGroup"/>
		  	</div>
		  	<div class="pagenum fl">
		  	<k:get property="paging"/>
		  	</div>
		  	<div class="btn fr">
		  	<k:get property="nextPageGroup"/><k:get property="lastPage"/>
		  	</div>
		  </k:paging>
		<div class="cb"></div>
	</div>	
	
	
	<%--
	<!-- Paging - start -->
	<div class="paging">
		<div class="btn fl"><input type="button" class="btni_first" title="처음" onclick="" /><input type="button" class="btni_prev" title="이전" onclick="" /></div>
		<div class="pagenum fl"><a href="#">1</a><a href="#">2</a><span class="iListNum">3</span><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a><a href="#">9</a><a href="#">10</a></div>
		<div class="btn fr"><input type="button" class="btni_next" title="다음" onclick="" /><input type="button" class="btni_last" title="끝" onclick="" /></div>
		<div class="cb"></div>
	</div>
	<!-- Paging - end -->
    --%>
    
	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"><input type="button" class="btns" value="전체 선택" id="btnAllChk" /><input type="button" class="btns" value="선택 해제" id="btnChkCancel" /></div>
		<div class="main"><input type="button" class="btnm" value="선택 삭제" id="btnDelete" /></div>
		<div class="cb"></div>
	</div>
	<!-- Btn_Form(Sub/Main) - end -->


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