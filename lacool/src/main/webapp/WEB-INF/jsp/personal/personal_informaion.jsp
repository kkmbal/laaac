<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>
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
			<li class="title fl">김동준 <span class="sub">님의 개인홈</span></li>
			<li class="tab_area fr">
				<!-- tab_style01 - start -->
				<div class="tab_st01">
					<ul>
						<li><a href="personal_home.html" target="_top">개인홈</a></li>
						<li class="sel"><a href="personal_informaion.html" target="_top">개인정보 관리</a></li>
						<li><a href="scrap.html" target="_top">스크랩</a></li>
						<li><a href="temporary.html" target="_top">임시저장</a></li>
						<li><a href="chat.html" target="_top">대화기록</a></li>
						<li><a href="member_cancel.html" target="_top">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- tab_style01 - end -->
			</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	<!-- Grid_Table_Input - start -->
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_input">
		<colgroup>
			<col width="160">
			<col width="">
		</colgroup>
		<tr>
			<th class="right">사용자 이름</th>
			<td class="left"><input name="" type="text" class="input_inact" style="width:340px;" value="김동준"></td>
		</tr>
		<tr>
			<th class="right">휴대전화</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><input name="" type="text" class="input" style="width:340px;" value=""></td>
						<td class="gridt_blank" nowrap></td>
						<td><span class="gridt_txt01">- 없이 입력</span></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">국가&nbsp;<img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"></th>
			<td class="left"><select name="" class="select" style="width:360px;">
			<option value="">선택</option>
			<option value="" selected>대한민국</option>
			</select></td>
		</tr>
		<tr>
			<th class="right">생년월일&nbsp;<img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"></th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><select name="" class="select" style="width:96px;">
						<option value="">선택</option>
						<option value="" selected>1999</option>
						</select></td>
						<td class="gridt_blank" nowrap></td>
						<td>년</td>
						<td width="30"></td>
						<td><select name="" class="select" style="width:78px;">
						<option value="">선택</option>
						<option value="" selected>12</option>
						</select></td>
						<td class="gridt_blank" nowrap></td>
						<td>월</td>
						<td width="30"></td>
						<td><select name="" class="select" style="width:78px;">
						<option value="">선택</option>
						<option value="" selected>24</option>
						</select></td>
						<td class="gridt_blank" nowrap></td>
						<td>일</td>
						<td width="60"></td>
						<td><input type="radio" name="type" hidefocus="true" class="radio" value="AA" checked>여성</td>
						<td width="30" nowrap></td>
						<td><input type="radio" name="type" hidefocus="true" class="radio" value="BB">남성</td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">URL</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><div class="input_textbox">http://</div></td>
						<td><div style="position:relative; left:-2px; top:0px;"><input name="" type="text" class="input" style="width:761px;" value="블로그 / 카페 등 사용자의 주요 사이트URL 입력"></div></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">페이스북 계정</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><div class="input_textbox">http://facebook.com/</div></td>
						<td><div style="position:relative; left:-2px; top:0px;"><input name="" type="text" class="input" style="width:661px;" value=""></div></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">메일 수신</th>
			<td class="left"><input type="checkbox" name="type" hidefocus="true" class="check" value="A" checked>Lalalacool의 뉴스레터</td>
		</tr>
		<tr>
			<th class="right">사용자 이미지&nbsp;<img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"></th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><div class="imgs_user"><img src="${ctx}/resources/images/photo/imgs_user_input.gif" class="photo"></div></td>
						<td class="gridt_blank" nowrap></td>
						<td>
							<div style="vertical-align:top; height:100px;">
								<input name="" type="text" class="input" style="width:230px;" value=""><br>
								<div class="blank_height5"></div>
								<span class="t_num_txt">400KB이하</span>&nbsp;<span class="t_num_txt">/</span>&nbsp;<span class="t_num">315KB</span>
							</div>
						</td>
						<td class="gridt_blank" nowrap></td>
						<td><div style="vertical-align:top; height:100px;"><input type="button" class="btnd" value="파일찾기" onclick="" /></div></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
	</table>
	<!-- Grid_Table_Input - end -->
	
	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"></div>
		<div class="main"><input type="button" class="btnm" value="수정" onclick="" /><input type="button" class="btnm_cancel" value="취소" onclick="" /></div>
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