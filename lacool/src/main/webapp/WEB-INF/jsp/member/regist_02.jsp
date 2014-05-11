<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>
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
			<li class="title" style="width:500px; text-align:left;">lalalacool 회원가입이 완료되었습니다.</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height20"></div>
	<div class="t_guide01" style="width:500px; text-align:left;"><img src="${ctx}/images/icon/i_warn.gif" align="texttop"> 서비스 이용을 위해 로그인해 주십시오.</div>
	<div class="blank_height5"></div>
	<!-- Grid_Table_Input - start -->
	<table cellpadding="0" cellspacing="0" border="0" width="500" class="gridt_input" style="border-top:0px solid #f0f0f0;">
		<tr>
			<td class="left_st01"><input name="" type="text" class="input" style="width:480px;" value="이메일"></td>
		</tr>
		<tr>
			<td class="left_st01"><input name="" type="text" class="input" style="width:480px;" value="비밀번호"></td>
		</tr>
		<tr>
			<td class="left_st01">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td align="left" width="100%"><input type="checkbox" name="type" hidefocus="true" class="check" value="A" checked>이메일 저장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="type" hidefocus="true" class="check" value="B">비밀번호 저장</td>
						<td align="right"><input type="button" class="btnd_st01" value="비밀번호 찾기" onclick="" /></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
	</table>
	<!-- Grid_Table_Input - end -->
	<div class="blank_height5"></div>
	<!-- Btn_Form(Main) - start -->
	<div align="center"><input type="button" class="btnm_st01" value="로그인" style="width:500px;" onclick="" /></div>
	<!-- Btn_Form(Main) - end -->

	</div>
	<!-- == 중앙정렬 == - end -->


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