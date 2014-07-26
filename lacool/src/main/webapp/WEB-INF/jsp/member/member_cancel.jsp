<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">

$(document).ready(function(){
	$("#btnSave").click(function(){
		if($("#chkDel").is(":checked")){
			window.open("${ctx}/member/member_cancel_pop01", "pop", "height=200,width=200,resizable=no,scrollbars=no");
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
						<li><a href="${ctx}/personal/scrap" target="_top">스크랩</a></li>
						<li><a href="${ctx}/personal/temporary" target="_top">임시저장</a></li>
<%-- 						<li><a href="${ctx}/personal/search" target="_top">대화기록</a></li> --%>
						<li class="sel"><a target="_top">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- tab_style01 - end -->
			</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	<div class="t_guide01"><img src="${ctx}/resources/images/icon/i_warn.gif" align="texttop"> <strong>아래의 회원탈퇴 안내를 반드시 확인하시기 바랍니다.</strong></div>
	<div class="blank_height5"></div>
	<!-- Grid_Table_Input - start -->
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_input">
		<colgroup>
			<col width="38">
			<col width="">
		</colgroup>
		<tr>
			<td class="right"><img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle">&nbsp;&nbsp;</td>
			<td class="left">회원탈퇴 후 사용하고 계신 사용자 이름<strong>(abcd)</strong>은 재가입 및 복구가 불가능합니다.</td>
		</tr>
		<tr>
			<td class="right"><img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle">&nbsp;&nbsp;</td>
			<td class="left">생성한 컨텐츠는 모두 삭제되며 복구할 수 없습니다.</td>
		</tr>
		<tr>
			<td class="right"><img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle">&nbsp;&nbsp;</td>
			<td class="left">회원의 컨텐츠에 속해 있는 타인의 게시글은 탈퇴 후에도 삭제할 수 없습니다.</td>
		</tr>
		<tr>
			<td class="right"><img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle">&nbsp;&nbsp;</td>
			<td class="left">회원께서 작성하신 게시글도 탈회 후 삭제할 수 없습니다.</td>
		</tr>
		<tr>
			<td class="left" colspan="2">&nbsp;&nbsp;&nbsp;<input type="checkbox" id="chkDel" hidefocus="true" class="check" value="Y"><strong>위의 사항을 모두 확인하였으며, 이에 동의합니다.</strong></td>
		</tr>
	</table>
	<!-- Grid_Table_Input - end -->
	
	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"></div>
		<div class="main"><input type="button" class="btnm" value="확인" id="btnSave" /><!-- <input type="button" class="btnm_cancel" value="취소" id="btnCancel" />  --></div>
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