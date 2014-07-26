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
		$.post("${ctx}/member/memberDelete?format=json", {data:""}, function(data){
			if(data.error){
				alert(data.error);
				return;
			}
			location.href = "${ctx}/member/member_cancel_pop02";
		});
	});
	
	$("#btnCancel").click(function(){
		self.close();
	});
});
</script>
</head>

<body>
<!--[if IE 8]><div class="wrapper ie8"><![endif]-->
<!--[if IE 9]><div class="wrapper ie9"><![endif]-->
<!--[if !IE]><div class="wrapper ienone"><![endif]-->


<!-- // POPUP STYLE01 - start // -->
<div class="popup_st01" style="width:296px; height:176px;">


	<!-- Title/Btn_close - start -->
	<div class="popup_st01_title">
		<ul>
			<li class="btn fr"><input type="button" class="btni_close02" title="닫기"  onclick="javascript:self.close();" /></li>
		</ul>
	</div>
	<!-- Title/Btn_close - end -->

	<!-- 내용 들어가는 곳 - start -->
	<div class="popup_st01_contents">

		<!-- start -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
		  <tr>
		    <td class="popup_st01_contents_txt">회원탈퇴를 완료합니다.</td>
		  </tr>
		</table>
		<!-- end -->

	</div>
	<!-- 내용 들어가는 곳 - end -->

	<!-- Popup_Style01_Btn - start -->
	<div class="popup_st01_btn">
		<input type="button" class="btnm" value="확인" id="btnSave" /><input type="button" class="btnm_cancel" value="취소" id="btnCancel" />
	</div>
	<!-- Popup_Style01_Btn - end -->


</div>
<!-- // POPUP STYLE01 - end // -->


<!--[if IE]></div><![endif]-->
<!--[if !IE]></div><![endif]-->
</body>
</html>