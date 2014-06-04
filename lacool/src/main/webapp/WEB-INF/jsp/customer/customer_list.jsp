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
	<!-- Grid_Table_Search - start -->
	<div class="gridt_search_box">
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_search">
		<tr>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><select name="" class="select" style="width:150px;">
						<option value="">선택</option>
						<option value="" selected>제목</option>
						<option value="">작성자</option>
						<option value="">내용</option>
						</select></td>
						<td class="gridt_blank" nowrap></td>
						<td><input name="" type="text" class="input" style="width:480px;" value=""></td>
						<td class="gridt_blank" nowrap></td>
						<td nowrap><input type="button" class="btn_search" value="검색" onclick="" /></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
	</table>
	</div>
	<!-- Grid_Table_Search - end -->
	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"><input type="button" class="btns_st04_write" value="글쓰기" onclick="location.href='customer_write.html'" /></div>
		<div class="main"><!-- <input type="button" class="btnm" value="완료" onclick="" /><input type="button" class="btnm_cancel" value="취소" onclick="" /> --></div>
		<div class="cb"></div>
	</div>
	<!-- Btn_Form(Sub/Main) - end -->
	<div class="blank_height10"></div>
	<!-- Grid_Table_List - start -->
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_list" style="word-break:break-all;">
		<colgroup>
			<col width="70">
			<col width="">
			<col width="120">
			<col width="120">
			<col width="150">
		</colgroup>
		<tr>
			<th class="center">No</th>
			<th class="center">제목</th>
			<th class="center">작성자</th>
			<th class="center">조회수</th>
			<th class="center end">등록일</th>
		</tr>
		<tr class="gridt_list_point01">
			<td class="center">100</td>
			<td class="left"><img src="${ctx}/resources/images/icon/i-notice.gif" align="absbottom"> <a href="customer_read.html" target="_top"><strong>관리자가 작성한 게시물 / 신규 게시물 / 읽지 않은 게시물</strong></a></td>
			<td class="center">관리자</td>
			<td class="right">234</td>
			<td class="center end">2014.04.01 12:34:44</td>
		</tr>
		<tr class="gridt_list_point01">
			<td class="center">99</td>
			<td class="left"><a href="#"><strong>신규 게시물 / 읽지 않은 게시물</strong></a></td>
			<td class="center">작성자</td>
			<td class="right">23</td>
			<td class="center end">2014.04.01 12:34:44</td>
		</tr>
		<tr class="gridt_list_bg01" onmouseover="this.className='gridt_list_bg01_ov'" onmousedown="this.className='gridt_list_bg01_dn'" onmouseout="this.className='gridt_list_bg01_ot'">
			<td class="center">98</td>
			<td class="left"><a href="#"><strong>읽지 않은 게시물</strong></a></td>
			<td class="center">관리자</td>
			<td class="right">1560</td>
			<td class="center end">2014.04.01 12:34:44</td>
		</tr>
		<tr class="gridt_list_bg01" onmouseover="this.className='gridt_list_bg01_ov'" onmousedown="this.className='gridt_list_bg01_dn'" onmouseout="this.className='gridt_list_bg01_ot'">
			<td class="center">97</td>
			<td class="left"><a href="#">제목</a></td>
			<td class="center">작성자</td>
			<td class="right">2580</td>
			<td class="center end">2014.04.01</td>
		</tr>
		<tr class="gridt_list_bg01" onmouseover="this.className='gridt_list_bg01_ov'" onmousedown="this.className='gridt_list_bg01_dn'" onmouseout="this.className='gridt_list_bg01_ot'">
			<td class="center">96</td>
			<td class="left"><img src="${ctx}/resources/images/icon/i_lock.gif" align="absmiddle">&nbsp;비밀글</td>
			<td class="center">관리자</td>
			<td class="right">50</td>
			<td class="center end">2014.04.01</td>
		</tr>
		<tr class="gridt_list_bg01" onmouseover="this.className='gridt_list_bg01_ov'" onmousedown="this.className='gridt_list_bg01_dn'" onmouseout="this.className='gridt_list_bg01_ot'">
			<td class="center">95</td>
			<td class="left"><a href="#">제목</a></td>
			<td class="center">작성자</td>
			<td class="right">234</td>
			<td class="center end">2014.04.01</td>
		</tr>
		<tr class="gridt_list_bg01" onmouseover="this.className='gridt_list_bg01_ov'" onmousedown="this.className='gridt_list_bg01_dn'" onmouseout="this.className='gridt_list_bg01_ot'">
			<td class="center">94</td>
			<td class="left"><img src="${ctx}/resources/images/icon/i_reply.gif" align="absmiddle">&nbsp;<a href="#">[답글]관리자가의 답글</a></td>
			<td class="center">관리자</td>
			<td class="right">23</td>
			<td class="center end">2014.04.01</td>
		</tr>
		<tr class="gridt_list_bg01" onmouseover="this.className='gridt_list_bg01_ov'" onmousedown="this.className='gridt_list_bg01_dn'" onmouseout="this.className='gridt_list_bg01_ot'">
			<td class="center">93</td>
			<td class="left"><img src="${ctx}/resources/images/icon/i_reply_no.gif" align="absmiddle">&nbsp;<img src="${ctx}/resources/images/icon/i_reply.gif" align="absmiddle">&nbsp;<a href="#">[답글]관리자의 답글에 다시 작성자가 답글을 쓸 경우</a></td>
			<td class="center">작성자</td>
			<td class="right">1560</td>
			<td class="center end">2014.04.01</td>
		</tr>
		<tr class="gridt_list_bg01" onmouseover="this.className='gridt_list_bg01_ov'" onmousedown="this.className='gridt_list_bg01_dn'" onmouseout="this.className='gridt_list_bg01_ot'">
			<td class="center">92</td>
			<td class="left"><img src="${ctx}/resources/images/icon/i_lock.gif" align="absmiddle">&nbsp;<a href="#">비밀글</a></td>
			<td class="center">관리자</td>
			<td class="right">2580</td>
			<td class="center end">2014.04.01</td>
		</tr>
		<tr class="gridt_list_bg01" onmouseover="this.className='gridt_list_bg01_ov'" onmousedown="this.className='gridt_list_bg01_dn'" onmouseout="this.className='gridt_list_bg01_ot'">
			<td class="center">91</td>
			<td class="left"><img src="${ctx}/resources/images/icon/i_reply.gif" align="absmiddle">&nbsp;<img src="${ctx}/resources/images/icon/i_lock.gif" align="absmiddle">&nbsp;<a href="#">[답글]비밀글</a></td>
			<td class="center">작성자</td>
			<td class="right">50</td>
			<td class="center end">2014.04.01</td>
		</tr>
	</table>
	<!-- Grid_Table_List - end -->

	<div class="blank_height20"></div>

	<!-- Paging - start -->
	<div class="paging">
		<div class="btn fl"><input type="button" class="btni_first_inact" title="처음" onclick="" /><input type="button" class="btni_prev_inact" title="이전" onclick="" /></div>
		<div class="pagenum fl"><span class="iListNum">1</span><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a><a href="#">9</a><a href="#">10</a></div>
		<div class="btn fr"><input type="button" class="btni_next" title="다음" onclick="" /><input type="button" class="btni_last" title="끝" onclick="" /></div>
		<div class="cb"></div>
	</div>
	<!-- Paging - end -->


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