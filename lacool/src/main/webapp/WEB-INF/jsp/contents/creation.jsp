<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>
</head>

<body onLoad="javascript:MenuOn(0105);">
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
			<li class="sel">컨텐츠 등록</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->
	<!-- Contents_Title - start -->
	<div class="contents_title">
		<ul>
			<li class="title">컨텐츠 등록</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	<div class="t_guide01"><img src="${ctx}/images/icon/i_warn.gif" align="texttop"> 이미지나 동영상 등의 게시물이 저작권을 포함하여 타인의 권리를 침해하거나 명예를 훼손하는 경우 이용약관 및 관련 법률에 의하여 제재를 받을 수 있습니다.</div>
	<div class="blank_height5"></div>
	<!-- Grid_Table_Input - start -->
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_input">
		<colgroup>
			<col width="160">
			<col width="">
		</colgroup>
		<tr>
			<th class="right">카테고리</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><select name="" class="select" style="width:200px;">
						<option value="">선택</option>
						<option value="" selected>1차</option>
						</select></td>
						<td class="gridt_blank" nowrap></td>
						<td><select name="" class="select" style="width:200px;">
						<option value="">선택</option>
						<option value="" selected>2차</option>
						</select></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">제목</th>
			<td class="left"><input name="" type="text" class="input" style="width:820px;" value="제목을 30자 이내로 입력하세요."></td>
		</tr>
		<tr>
			<th class="right">종류</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><input type="radio" name="type" hidefocus="true" class="radio" value="AA" checked>이미지</td>
						<td width="30" nowrap></td>
						<td><input type="radio" name="type" hidefocus="true" class="radio" value="BB">동영상</td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">이미지</th>
			<td class="left">
				<!-- 대표이미지 - start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><img src="${ctx}/images/icon/i_check.gif" align="absmiddle"> <strong>대표 이미지 등록 (필수)</strong></td>
					</tr>
				</table>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="200" valign="top"><div class="imgs_main01_input"><a href="#" target="_top" onMouseOver="document.main01.src='${ctx}/images/photo/imgs_main01_input-ov.gif'" onMouseOut="document.main01.src='${ctx}/images/photo/imgs_main01_input.gif'"><img src="${ctx}/images/photo/imgs_main01_input.gif" class="photo" name="main01"></a></div></td>
						<td width="45"></td>
						<td width="290" valign="top"><div class="imgs_main02_input"><a href="#" target="_top" onMouseOver="document.main02.src='${ctx}/images/photo/imgs_main02_input-ov.gif'" onMouseOut="document.main02.src='${ctx}/images/photo/imgs_main02_input.gif'"><img src="${ctx}/images/photo/imgs_main02_input.gif" class="photo" name="main02"></a></div></td>
						<td width="45"></td>
						<td width="240" valign="top"><div class="imgs_main03_input"><a href="#" target="_top" onMouseOver="document.main03.src='${ctx}/images/photo/imgs_main03_input-ov.gif'" onMouseOut="document.main03.src='${ctx}/images/photo/imgs_main03_input.gif'"><img src="${ctx}/images/photo/imgs_main03_input.gif" class="photo" name="main03"></a></div></td>
					</tr>
				</table>
				<!-- 대표이미지 - end -->
				<!-- 서브이미지 - start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td>서브 이미지 등록 (10개까지 등록 가능합니다.)</td>
					</tr>
				</table>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative"><img src="${ctx}/images/test/imgs_sub01.jpg" class="photo">
								<!-- del - start -->
								<div style="position:absolute; left:0px; top:0px;" nowrap><input type="button" class="btni_del02" title="삭제" onclick="" /></div>
								<!-- del - end -->
							</div>
						</td>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative"><img src="${ctx}/images/test/imgs_sub02.jpg" class="photo">
								<!-- del - start -->
								<div style="position:absolute; left:0px; top:0px;" nowrap><input type="button" class="btni_del02" title="삭제" onclick="" /></div>
								<!-- del - end -->
							</div>
						<td width="30"></td>
						<td width="140" valign="top"><div class="imgs_sub_input"><a href="#" target="_top" onMouseOver="document.sub.src='${ctx}/images/photo/imgs_sub_input-ov.gif'" onMouseOut="document.sub.src='${ctx}/images/photo/imgs_sub_input.gif'"><img src="${ctx}/images/photo/imgs_sub_input.gif" class="photo" name="sub"></a></div></td>
						<td width="30"></td>
						<td width="140" valign="top"><div class="imgs_sub_input"></div></td>
						<td width="30"></td>
						<td width="140" valign="top"><div class="imgs_sub_input"></div></td>
					</tr>
					<tr>
						<td width="140" valign="top"><div class="imgs_sub_input"></div></td>
						<td width="30"></td>
						<td width="140" valign="top"><div class="imgs_sub_input"></div></td>
						<td width="30"></td>
						<td width="140" valign="top"><div class="imgs_sub_input"></div></td>
						<td width="30"></td>
						<td width="140" valign="top"><div class="imgs_sub_input"></div></td>
						<td width="30"></td>
						<td width="140" valign="top"><div class="imgs_sub_input"></div></td>
					</tr>
				</table>
				<!-- 서브이미지 - end -->
				<!-- 설명 - start -->
				<div class="imgs_txt">
					<ul>
						<li>이미지는 JPG/PNG/GIF 형식만 등록 가능합니다.</li>
					</ul>
				</div>
				<div class="blank_height15"></div>
				<!-- 설명 - end -->
			</td>
		</tr>
		<tr>
			<th class="right">동영상</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><div class="input_textbox_inact">http://</div></td>
						<td><div style="position:relative; left:-2px; top:0px;"><input name="" type="text" class="input_inact" style="width:671px;" value=""></div></td>
						<td class="gridt_blank" nowrap></td>
						<td><input type="button" class="btnd" value="미리보기" onclick="" /></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">관련URL</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><div class="input_textbox">http://</div></td>
						<td><div style="position:relative; left:-2px; top:0px;"><input name="" type="text" class="input" style="width:763px;" value=""></div></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">설명</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td><textarea name="" class="textarea" style="width:820px; height:140px;">게시물에 대한 설명을 입력하세요.</textarea></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right"></th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><input type="checkbox" name="type" hidefocus="true" class="check" value="A" checked>페이스북 동시 등록</td>
						<td width="30" nowrap></td>
						<td><input type="checkbox" name="type" hidefocus="true" class="check" value="B">관련 외부 글 공개</td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
	</table>
	<!-- Grid_Table_Input - end -->
	
	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"><input type="button" class="btns" value="미리보기" onclick="" /><input type="button" class="btns" value="임시저장" onclick="" /></div>
		<div class="main"><input type="button" class="btnm" value="완료" onclick="window.open('creation_pop.html','win','toolbar=no,directories=no,menubar=no,scrollbars=no,resizable=no,status=no,location=no,copyhistory=no,width=300,height=180,top=200,left=200')" /><input type="button" class="btnm_cancel" value="취소" onclick="" /></div>
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