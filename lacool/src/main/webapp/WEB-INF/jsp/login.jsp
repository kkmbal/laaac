<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>


<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	$("#email, #pwd").click(function(){
		$(this).val("");
		if($(this).attr("id")=="pwd"){
			$(this).attr("type", "password");
		}		
	});
	
	$("#btnGo").click(function(){
		if($("#email").val() == "" || $("#pwd").val() == "" || $("#email").val() == "이메일" || $("#pwd").val() == "비밀번호"){
			alert("이메일이나 비밀번호를 입력하세요.");
			return;
		}		
		var data = {email:"", pwd:""};
		data.email = $("#email").val();
		data.pwd = $("#pwd").val();
		$.post("${ctx}/member/doLogin?format=json", {data:JSON.stringify(data)}, function(data){
			if(data.result){
				alert(data.result);
				return;
			}
			opener.location.href = "${ctx}/index.jsp";
			self.close();
		});	
	});
	
	$("#btnReg").click(function(){
		opener.location.href = "${ctx}/member/regist_01";
		self.close();
	});
});
</script>
</head>

<body>
<!--[if IE 8]><div class="wrapper ie8"><![endif]-->
<!--[if IE 9]><div class="wrapper ie9"><![endif]-->
<!--[if !IE]><div class="wrapper ienone"><![endif]-->


<!-- // POPUP - start // -->
<div class="popup" style="width:550px; height:;">


	<!-- Title/Btn_close - start -->
	<div class="popup_title">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr>
				<td class="title">Login</td>
				<td class="btn"><input type="button" class="btni_close02" title="닫기"  onclick="javascript:self.close();" /></td>
			</tr>
		</table>
	</div>
	<!-- Title/Btn_close - end -->

	<!-- 내용 들어가는 곳(스크롤 포함) - start -->
	<div class="popup_contents" style="width:; height:; overflow-x:hidden; overflow-y:auto;"> <!-- height:617px; -->


		<!-- == 중앙정렬 == - start -->
		<div align="center">
	
		<!-- Contents_Title - start -->
		<div class="contents_title">
			<ul>
				<li class="title_pop" style="width:500px; text-align:left;"><img src="${ctx}/resources/images/common/logo001.gif" align="bottom">에 오신 것을 환영합니다.</li>
			</ul>
		</div>
		<!-- Contents_Title - end -->
		<!-- Grid_Table_Input - start -->
		<table cellpadding="0" cellspacing="0" border="0" width="500" class="gridt_input" style="border-top:0px solid #f0f0f0;">
			<tr>
				<td class="left_st01"><input name="email" id="email" type="text" class="input" style="width:480px;" value="이메일"></td>
			</tr>
			<tr>
				<td class="left_st01"><input name="pwd" id="pwd" type="text" class="input" style="width:480px;" value="비밀번호"></td>
			</tr>
			<tr>
				<td class="left_st01">
					<!-- start -->
					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<tr>
							<td align="left" width="100%"><input type="checkbox" name="type" hidefocus="true" class="check" value="A" checked>이메일 저장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="type" hidefocus="true" class="check" value="B">비밀번호 저장</td>
							<td align="right" nowrap><input type="button" class="btnd_st01" value="회원가입" id="btnReg" />&nbsp;<input type="button" class="btnd_st01" value="비밀번호 찾기" onclick="" /></td>
						</tr>
					</table>
					<!-- end -->
				</td>
			</tr>
		</table>
		<!-- Grid_Table_Input - end -->
		<div class="blank_height5"></div>
		<!-- Btn_Form(Main) - start -->
		<div align="center"><input type="button" class="btnm_st01" value="로그인" style="width:500px;" id="btnGo" /></div>
		<!-- Btn_Form(Main) - end -->
	
		</div>
		<!-- == 중앙정렬 == - end -->


	</div>
	<!-- 내용 들어가는 곳(스크롤 포함) - end -->

	<!-- Popup_Btn - start -->
	<div class="popup_btn">
		<!-- <input type="button" class="btnm" value="확인" onclick="" /> --> <input type="button" class="btnm_cancel" value="취소"   onclick="javascript:self.close();" />
	</div>
	<!-- Popup_Btn - end -->


</div>
<!-- // POPUP - end // -->


<!--[if IE]></div><![endif]-->
<!--[if !IE]></div><![endif]-->
</body>
</html>