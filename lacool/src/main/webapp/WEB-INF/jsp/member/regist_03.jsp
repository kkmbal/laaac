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
			<li class="sel">회원 추가정보 입력</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->
	<!-- Contents_Title - start -->
	<div class="contents_title">
		<ul>
			<li class="title">회원 추가정보 입력</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	<div class="t_guide01"><img src="${ctx}/images/icon/i_warn.gif" align="texttop"> 컨텐츠를 등록하시려면 아래의 추가정보를 등록해 주십시오.&nbsp;&nbsp;&nbsp;<img src="${ctx}/images/icon/i_check.gif" align="absmiddle"> 표는 필수 입력 항목 입니다.</div>
	<div class="blank_height5"></div>
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
			<th class="right">국가&nbsp;<img src="${ctx}/images/icon/i_check.gif" align="absmiddle"></th>
			<td class="left"><select name="" class="select" style="width:360px;">
			<option value="">선택</option>
			<option value="" selected>대한민국</option>
			</select></td>
		</tr>
		<tr>
			<th class="right">생년월일&nbsp;<img src="${ctx}/images/icon/i_check.gif" align="absmiddle"></th>
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
			<th class="right">사용자 이미지&nbsp;<img src="${ctx}/images/icon/i_check.gif" align="absmiddle"></th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><div class="imgs_user"><img src="${ctx}/images/photo/imgs_user_input.gif" class="photo"></div></td>
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
		<div class="main"><input type="button" class="btnm" value="완료" onclick="" /><input type="button" class="btnm_cancel" value="취소" onclick="" /></div>
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