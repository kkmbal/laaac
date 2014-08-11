<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">
var opnFromLimit = ${opnFromLimit};

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
			"userId":"${userVo.userId}", 
			"psnOpnSeq" : seq, 
			"upPsnOpnSeq" : 0,
			"opnConts" : $("#textarea_comment_"+seq).val().replace(/\n/g,"<br/>"),
			"restep" : 0,
			"relevel" : 0
		};

		$.post("${ctx}/personal/insertReplyOpn?format=json", {data:JSON.stringify(json)}, function(data){
			if(data.error){
				alert(data.error);
				return;
			}
			
			listPsnOpn();
			$("#comment_reply_"+seq).remove();
		});		
}

function listPsnOpn(){
	var json = {
			"userId":"${userVo.userId}", 
			"opnFromLimit" : opnFromLimit
		};		
	
	$.post("${ctx}/personal/listPsnOpn?format=json", {data:JSON.stringify(json)}, function(data){
		if(data.error){
			alert(data.error);
			return;
		}
		$("#opnDiv div").remove();
		if(data.listPsnOpn){
			var json = $.parseJSON(JSON.stringify(data.listPsnOpn));
			for(var i=0;i<json.length;i++){
				$("#opnDiv").append(
						'<div class="comment_area">'
						+'<div class="comment_read" id="comment_read_'+json[i].psnOpnSeq+'">'
						+ (json[i].relevel > 0 ?'<div class="reply">&nbsp;</div>':'')
						+'	<div class="photo fl"><img src="${ctx}/'+json[i].userFilePath + json[i].userFileNm+'"></div>'
						+ (json[i].relevel == 0?'<div class="content fl" style="width:925px;">':'')
						+ (json[i].relevel > 0?'<div class="content fl" style="width:870px;">':'')
						+'		<ul>'
						+'			<li class="txt1"><span class="id"><a href="#">'+json[i].userNm+'</a></span><span class="t_line">l</span>'+json[i].updDttm
						+                 (json[i].relevel == 0?'<span class="t_line">l</span><a href="#" onclick="fnMakeReplyOpn(\''+json[i].psnOpnSeq+'\')">답글</a>':'')
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
		opnFromLimit = data.opnFromLimit;
	});	
	event.stopPropagation();
	event.preventDefault();
}


$(document).ready(function(){
	$("#order").change(function(){
		location.href = "${ctx}/personal/home?order="+$(this).val();
	});
	
	//의견등록
	$("#regOpn").click(function(){
		var json = {
			"userId":"${userVo.userId}", 
			"psnOpnSeq" : 0, 
			"upPsnOpnSeq" : 0,
			"opnConts" : $("#opnConts").val().replace(/\n/g,"<br/>"),
			"restep" : 0,
			"relevel" : 0
		};

		$.post("${ctx}/personal/insertOpn?format=json", {data:JSON.stringify(json)}, function(data){
			if(data.error){
				alert(data.error);
				return;
			}
			
			listPsnOpn();
			$("#opnConts").val("");
		});				
	});
	
	//의견취소
	$("#cancelOpn").click(function(){
		$("#opnConts").val("");
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
						<li class="sel"><a target="_top">개인홈</a></li>
						<li><a href="${ctx}/personal/info" target="_top">개인정보 관리</a></li>
						<li><a href="${ctx}/personal/scrap" target="_top">스크랩</a></li>
						<li><a href="${ctx}/personal/temporary" target="_top">임시저장</a></li>
<%-- 						<li><a href="${ctx}/personal/chat" target="_top">대화기록</a></li> --%>
						<li><a href="${ctx}/member/member_cancel" target="_top">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- tab_style01 - end -->
			</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	<!-- Profile - start -->
	<div class="profile">
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
			<colgroup>
				<col width="125">
				<col width="80">
				<col width="">
			</colgroup>
			<tr>
				<td rowspan="3" class="photobox"><img src="${ctx}/${userVo.userFilePath}${userVo.userFileNm}" class="photo"></td>
				<td class="txt01">국가</td>
				<td class="txt02">${userVo.nationNmDesc}</td>
			</tr>
			<tr>
				<td class="txt01">휴대전화</td>
				<td class="txt02">${userVo.mobile}</td>
			</tr>
			<tr>
				<td class="txt01">URL</td>
				<td class="txt02"><a href="#" target="_blank">${userVo.userUrl}</a></td>
			</tr>
		</table>
	</div>
	<!-- profile - end -->
	<div class="blank_height25"></div>
	<!-- title_1depth_st01/btn - start -->
	<div class="title_1depth_st01">
		<ul>
			<li class="title fl">등록한 컨텐츠</li>
			<li class="btn fr">
				<!-- start -->
				<div class="fl" style="padding-top:27px"><span class="t_num"><a href="#">${totalCnt}</a></span>&nbsp;<span class="t_num_txt">건</span>&nbsp;&nbsp;&nbsp;</div>
				<div class="fl">
					<select name="order" id="order" class="select" style="width:234px;">
					<option value="REG_DTTM" <c:if test="${order=='REG_DTTM'}">selected</c:if>>등록일순</option>
					<option value="NOTI_TITLE" <c:if test="${order=='NOTI_TITLE'}">selected</c:if>>제목순</option>
					<option value="NOTI_READ_CNT" <c:if test="${order=='NOTI_READ_CNT'}">selected</c:if>>클릭순</option>
					<option value="NOTI_OK_CNT" <c:if test="${order=='NOTI_OK_CNT'}">selected</c:if>>좋아요순</option>
					<option value="NOTI_NG_CNT" <c:if test="${order=='NOTI_NG_CNT'}">selected</c:if>>나빠요순</option>
					</select>
				</div>
				<!-- end -->
			</li>
		</ul>
	</div>
	<!-- title_1depth_st01/btn - end -->
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style01 - start -->
	<div class="cont_st01">
		<ul>
			<c:forEach var="result" items="${listUserContents}" end="3" varStatus="status">
			<li class="col">
				<!-- 0101 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/upload/contents/${result.apndFileNm}" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">${result.notiTitle}</a></span></div>
				<div class="scrap fl">
					<ul>
						<li class="scrap_btn"><a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle" title="스크랩"></a></li>
						<li class="scrap_num">${result.scrapCnt}</li>
					</ul>
				</div>
				<div class="gauge fr">
					<!-- chart_gauge03 - start -->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
							<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
							<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
						</tr>
					</table>
					<!-- chart_gauge03 - end -->
				</div>
				<!-- 0101 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			</c:forEach>
			<%--
			<li class="col">
				<!-- 0102 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0102.jpg" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
				<div class="scrap fl">
					<ul>
						<li class="scrap_btn"><a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle" title="스크랩"></a></li>
						<li class="scrap_num">12</li>
					</ul>
				</div>
				<div class="gauge fr">
					<!-- chart_gauge03 - start -->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
							<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
							<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
						</tr>
					</table>
					<!-- chart_gauge03 - end -->
				</div>
				<!-- 0102 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0103 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0103.jpg" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
				<div class="scrap fl">
					<ul>
						<li class="scrap_btn"><a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle" title="스크랩"></a></li>
						<li class="scrap_num">123</li>
					</ul>
				</div>
				<div class="gauge fr">
					<!-- chart_gauge03 - start -->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
							<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
							<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
						</tr>
					</table>
					<!-- chart_gauge03 - end -->
				</div>
				<!-- 0103 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0104 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0104.jpg" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
				<div class="scrap fl">
					<ul>
						<li class="scrap_btn"><a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle" title="스크랩"></a></li>
						<li class="scrap_num">1233</li>
					</ul>
				</div>
				<div class="gauge fr">
					<!-- chart_gauge03 - start -->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
							<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
							<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
						</tr>
					</table>
					<!-- chart_gauge03 - end -->
				</div>
				<!-- 0104 - end -->
			</li>
			--%>
		</ul>
	</div>
	<!-- ContentsBox_Style01 - end -->
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style01 - start -->
	<div class="cont_st01">
		<ul>
			<c:forEach var="result" items="${listUserContents}" begin="4" varStatus="status">
			<li class="col">
				<!-- 0101 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/upload/contents/${result.apndFileNm}" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">${result.notiTitle}</a></span></div>
				<div class="scrap fl">
					<ul>
						<li class="scrap_btn"><a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle" title="스크랩"></a></li>
						<li class="scrap_num">${result.scrapCnt}</li>
					</ul>
				</div>
				<div class="gauge fr">
					<!-- chart_gauge03 - start -->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
							<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
							<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
						</tr>
					</table>
					<!-- chart_gauge03 - end -->
				</div>
				<!-- 0101 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			</c:forEach>
			<%--
			<li class="col">
				<!-- 0102 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0102.jpg" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
				<div class="scrap fl">
					<ul>
						<li class="scrap_btn"><a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle" title="스크랩"></a></li>
						<li class="scrap_num">12</li>
					</ul>
				</div>
				<div class="gauge fr">
					<!-- chart_gauge03 - start -->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
							<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
							<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
						</tr>
					</table>
					<!-- chart_gauge03 - end -->
				</div>
				<!-- 0102 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0103 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0103.jpg" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
				<div class="scrap fl">
					<ul>
						<li class="scrap_btn"><a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle" title="스크랩"></a></li>
						<li class="scrap_num">123</li>
					</ul>
				</div>
				<div class="gauge fr">
					<!-- chart_gauge03 - start -->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
							<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
							<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
						</tr>
					</table>
					<!-- chart_gauge03 - end -->
				</div>
				<!-- 0103 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0104 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0104.jpg" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
				<div class="scrap fl">
					<ul>
						<li class="scrap_btn"><a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle" title="스크랩"></a></li>
						<li class="scrap_num">1233</li>
					</ul>
				</div>
				<div class="gauge fr">
					<!-- chart_gauge03 - start -->
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
							<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
							<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
						</tr>
					</table>
					<!-- chart_gauge03 - end -->
				</div>
				<!-- 0104 - end -->
			</li>
			--%>
		</ul>
	</div>
	<!-- ContentsBox_Style01 - end -->
	<div class="blank_height20"></div>
	<!-- Paging - start -->
	<div class="paging">
		  <k:paging name="${pageInfo}" action="personal/home" jsFunction="fn_link_page">
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
	<!-- div class="paging">
		<div class="btn fl"><input type="button" class="btni_first_inact" title="처음" onclick="" /><input type="button" class="btni_prev_inact" title="이전" onclick="" /></div>
		<div class="pagenum fl"><a href="#">1</a><a href="#">2</a><span class="iListNum">3</span><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a><a href="#">9</a><a href="#">10</a></div>
		<div class="btn fr"><input type="button" class="btni_next" title="다음" onclick="" /><input type="button" class="btni_last" title="끝" onclick="" /></div>
		<div class="cb"></div>
	</div -->
	<!-- Paging - end -->

	<div class="blank_height50"></div>

	<!-- Title_1depth/btn - start -->
	<div class="title_1depth">
		<ul>
			<li class="title fl">스폰서 사이트</li>
			<li class="btn fr"><input type="button" class="btnd_st02" value="사이트 등록" onclick="" /></li>
		</ul>
	</div>
	<!-- Title_1depth/btn - end -->
	<div class="blank_height30"></div>
	<!-- Sponsor_Site - start -->
	<div class="sponsor_site">
		<ul>		
			<li class="prev"><input type="button" class="btni_arr01_prev" title="이전보기" onclick="" /></li>
			<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_col05.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_col05.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_col05.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_col05.jpg" class="photo"></a></li>
			<li class="blank">&nbsp;</li>
			<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo_col05.jpg" class="photo"></a></li>
			<li class="next"><input type="button" class="btni_arr01_next" title="다음보기" onclick="" /></li>
		</ul>
	</div>
	<!-- Sponsor_Site - end -->

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
		<c:forEach var="result" items="${listPsnOpn}" varStatus="status">
		<div class="comment_area">
			<div class="comment_read" id="comment_read_${result.psnOpnSeq}">
				<c:if test="${result.relevel > 0}"><div class="reply">&nbsp;</div></c:if>
				<div class="photo fl"><img src="${ctx}/${result.userFilePath}${result.userFileNm}"></div>
				<c:if test="${result.relevel == 0}"><div class="content fl" style="width:925px;"></c:if>
				<c:if test="${result.relevel > 0}"><div class="content fl" style="width:870px;"></c:if>
					<ul>
						<li class="txt1"><span class="id"><a href="#">${result.userNm}</a></span><span class="t_line">l</span>${result.updDttm}
						<c:if test="${result.relevel == 0}"><span class="t_line">l</span><a href="#" onclick="fnMakeReplyOpn('${result.psnOpnSeq}')">답글</a></c:if>
						</li>
						<li>${result.opnConts}</li>
					</ul>
				</div>
				<div class="cb"></div>
			</div>		
		</div>
		</c:forEach>
	</div>
	
	<%--
	<!-- Comment01 - start -->
	<div class="comment_area">
		<!-- comment_read_set01 - start -->
		<div class="comment_read">
			<div class="photo fl"><img src="${ctx}/resources/images/test/photo_user06.jpg"></div>
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
			<div class="photo fl"><img src="${ctx}/resources/images/test/photo_user03.jpg"></div>
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
				<li class="photo"><img src="${ctx}/resources/images/test/photo_user01.jpg"></li>
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
			<div class="photo fl"><img src="${ctx}/resources/images/test/photo_user06.jpg"></div>
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
			<div class="photo fl"><img src="${ctx}/resources/images/test/photo_user01.jpg"></div>
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
			<div class="photo fl"><img src="${ctx}/resources/images/test/photo_user02.jpg"></div>
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
	--%>
	
	<div class="blank_height10"></div>
	<!-- Paging - start -->
	<div class="paging">
<!-- 		<div class="btn fl"><input type="button" class="btni_first_inact" title="처음" onclick="" /><input type="button" class="btni_prev_inact" title="이전" onclick="" /></div> -->
		<div class="pagenum fl"><a href="#" onclick="listPsnOpn();" style="padding-left:120px;">더보기</a></div>
<!-- 		<div class="btn fr"><input type="button" class="btni_next" title="다음" onclick="" /><input type="button" class="btni_last" title="끝" onclick="" /></div> -->
		<div class="cb"></div>
	</div>
	<!-- Paging - end -->


	<%-- 
	<!-- Comment_Write - start -->
	<div class="comment_write">
		<ul>
			<li class="photo"><img src="${ctx}/resources/images/test/photo_user01.jpg"></li>
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
			<div class="photo fl"><img src="${ctx}/resources/images/test/photo_user06.jpg"></div>
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
			<div class="photo fl"><img src="${ctx}/resources/images/test/photo_user03.jpg"></div>
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
				<li class="photo"><img src="${ctx}/resources/images/test/photo_user01.jpg"></li>
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
			<div class="photo fl"><img src="${ctx}/resources/images/test/photo_user06.jpg"></div>
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
			<div class="photo fl"><img src="${ctx}/resources/images/test/photo_user01.jpg"></div>
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
			<div class="photo fl"><img src="${ctx}/resources/images/test/photo_user02.jpg"></div>
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
	--%>
	

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