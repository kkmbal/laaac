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
			<li class="sel">고객센터</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->
	<!-- Contents_Title - start -->
	<div class="contents_title">
		<ul>
			<li class="title">고객센터</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	<div class="t_guide01"><img src="${ctx}/images/icon/i_warn.gif" align="texttop"> 게시판 게시기준에 맞지 않는 부적절한 게시물은 사전 안내 없이 관리자가 삭제합니다.</div>
	<div class="blank_height5"></div>
	<!-- Grid_Table_Input - start -->
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_input">
		<colgroup>
			<col width="100">
			<col width="">
		</colgroup>
		<tr>
			<th class="left">제목</th>
			<td class="left"><input name="" type="text" class="input" style="width:870px;" value="제목을 30자 이내로 입력하세요."></td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td width="100%">김동준</td>
						<td align="right" style="padding-right:30px;" nowrap><input type="checkbox" name="type" hidefocus="true" class="check" value="A">비밀글</td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<td class="center" colspan="2"><textarea name="" class="textarea" style="width:960px; height:250px;">내용을 입력하세요.</textarea></td>
		</tr>
		<tr>
			<th class="left">파일첨부</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><input name="" type="text" class="input" style="width:230px;" value=""></td>
						<td class="gridt_blank" nowrap></td>
						<td><input type="button" class="btnd" value="파일찾기" onclick="" /></td>
						<td class="gridt_blank" nowrap></td>
						<td><span class="t_num_txt">파일 0개 이하, 000MB 이하</span>&nbsp;<span class="t_num_txt">/</span>&nbsp;<span class="t_num">345MB</span></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
	</table>
	<!-- Grid_Table_Input - end -->

	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"><!-- <input type="button" class="btns" value="글쓰기" onclick="" /> --></div>
		<div class="main"><input type="button" class="btnm" value="등록" onclick="" /><input type="button" class="btnm_cancel" value="목록" onclick="location.href='customer_list.html'" /></div>
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