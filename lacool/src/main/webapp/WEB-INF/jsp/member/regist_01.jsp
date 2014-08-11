<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	$("#userNm, #email, #pwd, #pwd2").click(function(){
		$(this).val("");
		if($(this).attr("id")=="pwd" || $(this).attr("id")=="pwd2"){
			$(this).attr("type", "password");
		}
	});
	
	$("#dup").click(function(){
		var data = {email:""};
		data.email = $("#email").val();
		$.post("${ctx}/member/userExist?format=json", {data:JSON.stringify(data)}, function(data){
			if(data.user == null){
				alert("사용할 수 있는 이메일 입니다.");
				$("#chkEmail").val("Y");
			}else{
				alert("사용할 수 없는 이메일 입니다.");
				$("#chkEmail").val("N");
			}
		});
	});
	$("#go").click(function(){
		if($("#userNm").val() == "" || $("#userNm").val() == "사용자 이름"){
			alert("사용자 이름을 입력하세요.");
			return;
		}
		if($("#email").val() == "" || $("#email").val() == "이메일"){
			alert("이메일을 입력하세요.");
			return;
		}
		if(!$("#email").val().isMail()){
			alert("이메일 형식이 올바르지 않습니다.");
			return;
		}

		if($("#chkEmail").val() != "Y"){
			alert("이메일 중복확인을 하세요.");
			return;
		}
		if($("#pwd").val() == "" || $("#pwd2").val() == "" || $("#pwd").val() == "비밀번호 (6자 이상 영문/숫자 혼합)" || $("#pwd2").val() == "비밀번호 확인"){
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		if(!$("#pwd").val().isPwd()){
			alert("비밀번호가 올바르지 않습니다.");
			return;
		}
		
		if($("#pwd").val() != $("#pwd2").val()){
			alert("비밀번호를 확인하세요.");
			return;
		}
		
		if (!$("#chkEqual").is(":checked")){
			alert('회원 약관에 동의해야 합니다.');
			return;
		}
		var data = {userNm:"", email:"", pwd:""};
		data.userNm = $("#userNm").val();
		data.email = $("#email").val();
		data.pwd = $("#pwd").val();
		$.post("${ctx}/member/userReg?format=json", {data:JSON.stringify(data)}, function(data){
			if(data.error){
				alert(data.error);
				return;
			}
			location.href = "${ctx}/member/regist_02";
		});
	});
	
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
			<li><a href="home.html">홈</a></li>
			<li>&nbsp;>&nbsp;</li>
			<li class="sel">회원가입</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->

	<!-- == 중앙정렬 == - start -->
	<div align="center">

	<!-- Contents_Title - start -->
	<div class="contents_title">
		<ul>
			<li class="title">회원가입</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height20"></div>
	<!-- Grid_Table_Input - start -->
	<table cellpadding="0" cellspacing="0" border="0" width="500" class="gridt_input" style="border-top:0px solid #f0f0f0;">
		<tr>
			<td class="left_st01"><input name="userNm" id="userNm" type="text" class="input" style="width:480px;" value="사용자 이름" maxlength="16"></td>
		</tr>
		<tr>
			<td class="left_st01">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><input name="email" id="email" type="text" class="input" style="width:390px;" value="이메일" maxlength="80"></td>
						<td class="gridt_blank" nowrap></td>
						<td><input type="button" class="btnd" value="중복확인" id="dup" /></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<td class="left_st01"><input name="pwd" id="pwd" type="text" class="input" style="width:480px;" value="비밀번호" maxlength="30"> (6자 이상 영문/숫자 혼합)</td>
		</tr>
		<tr>
			<td class="left_st01"><input name="pwd2" id="pwd2" type="text" class="input" style="width:480px;" value="비밀번호 확인" maxlength="30"></td>
		</tr>
		<tr>
			<td class="left_st01">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td align="left" width="100%"><input type="checkbox" name="chkEqual" id="chkEqual" hidefocus="true" class="check" value="A">회원 약관에 동의함</td>
						<td align="right"><input type="button" class="btnd_st01" value="회원 약관 보기" onclick="" /></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
	</table>
	<!-- Grid_Table_Input - end -->
	<div class="blank_height5"></div>
	<!-- Btn_Form(Main) - start -->
	<div align="center"><input type="button" class="btnm_st01" value="완료" style="width:500px;" id="go" name="go" /></div>
	<!-- Btn_Form(Main) - end -->

	<!-- Btn_Form(Sub/Main) - start -->
	<!-- div class="btn_form" style="width:500px;">
		<div class="sub"><input type="button" class="btns" value="로그인" onclick="" /><input type="button" class="btns" value="비밀번호 찾기" onclick="" /></div>
		<div class="main"></div>
		<div class="cb"></div>
	</div -->
	<!-- Btn_Form(Sub/Main) - end -->

	</div>
	<!-- == 중앙정렬 == - end -->

</div>
<!-- contents-end -->
</div>
<!-- //  CONTAINER(sidebar+contents) - end // -->

<form name="frm" id="frm">
<input type="hidden" name="chkEmail" id="chkEmail">
</form>


<!-- // FOOTER - start // -->
<%@ include file="/WEB-INF/jsp/common/layout/footer.jsp"%>
<!-- // FOOTER - end // -->


</div>
<!-- ***** WRAPPER - end ***** -->


<!--[if IE]></div><![endif]-->
<!--[if !IE]></div><![endif]-->
</body>
</html>