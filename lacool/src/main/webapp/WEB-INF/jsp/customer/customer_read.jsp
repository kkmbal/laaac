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
	<!-- Grid_Table_READ - start -->
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_read" style="word-break:break-all;">
		<colgroup>
			<col width="8%">
			<col width="17%">
			<col width="8%">
			<col width="17%">
			<col width="8%">
			<col width="17%">
			<col width="8%">
			<col width="17%">
		</colgroup>
		<tr>
			<th class="headl">번호</th>
			<td class="headl">345,789</td>
			<th class="headl">조회수</th>
			<td class="headl">356,000</td>
			<th class="headl">작성자</th>
			<td class="headl">김동준</td>
			<th class="headl">등록일</th>
			<td class="headl">2014.05.15 15:30</td>
		</tr>
		<tr>
			<td class="title" colspan="8">1000년을 이어온 유산 팔만대장경</td>
		</tr>
		<tr>
			<td class="content" colspan="8">
			해인사 대장경판은 지금까지 잘 보관되고 있지만, 일본의 요구로 해인사에 보관되지 못하고 일본으로 보내졌을 뻔하였으며, 또한 화재나 전쟁으로 사라질 위험을 몇 차례 겪었다. 첫 번째 위기는 조선 초기에 있었다. [조선왕조실록]에 따르면 일본과 유구국 및 쓰시마가 고려 말부터 사신을 보내 팔만대장경을 요구하기 시작하다가 조선 초기에 이르러 각종 토산물을 바치면서 더욱 끈질기게 요구해왔다. 특히 세종 때에는 대장경판의 자체를 요구하기까지 하였다. [세종실록] 세종 5년(1423) 12월, 6년 정월, 2월, 12월, 7년 4월, 5월 등의 기록에는 일본 사신이 단식까지 하면서 완강하게 팔만대장경판을 요구하자 세종은 대장경판이 우리나라에 오직 한 벌 밖에 없으므로 줄 수 없다고 말하며, 팔만대장경판을 대신하여 범자(梵字)의 밀교대장경판, 주화엄경판 1질,금자(金字) [화엄경], [호국인왕경], [아미타경], [석가보] 등을 주어 가져가게 하였다. 세종 6년 1월 20일조 기사 등을 보면, 왜통사 윤인보와 그의 아우 윤인시 그리고 그의 집에 있는 왜노 3명이 대장경판을 약탈하려는 사건까지 일어난다.
			</td>
		</tr>
		<tr>
			<th class="file">첨부파일</th>
			<td class="file" colspan="7">
				<!-- gridt_file - start -->
				<table cellpadding="0" cellspacing="0" border="0" class="gridt_file">
					<tr>
						<td class="filel"><img src="${ctx}/images/icon/i_file.gif"></td>
						<td width="5" nowrap></td>
						<td class="filel"><span class="t_file"><a href="#">파일명.ppt</a></span></td>
						<td width="5" nowrap></td>
						<td class="filel"><span class="t_num_txt">(1.345 kb)</span></td>
					</tr>
				</table>
				<!-- gridt_file - end -->
			</td>
		</tr>
		<tr class="gridt_read_bg01" onmouseover="this.className='gridt_read_bg01_ov'" onmousedown="this.className='gridt_read_bg01_dn'" onmouseout="this.className='gridt_read_bg01_ot'">
			<td class="listprev" colspan="8">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td class="listtxt01">이전</td>
						<td class="gridt_blank" nowrap></td>
						<td><img src="${ctx}/images/icon/i_prev.gif"></td>
						<td width="25" nowrap></td>
						<td><a href="#">이전 글의 제목 들어가는 곳</a></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr class="gridt_read_bg01" onmouseover="this.className='gridt_read_bg01_ov'" onmousedown="this.className='gridt_read_bg01_dn'" onmouseout="this.className='gridt_read_bg01_ot'">
			<td class="listnext" colspan="8">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td class="listtxt01">다음</td>
						<td class="gridt_blank" nowrap></td>
						<td><img src="${ctx}/images/icon/i_next.gif"></td>
						<td width="25" nowrap></td>
						<td><a href="#">다음 글의 제목 들어가는 곳</a></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
	</table>
	<!-- Grid_Table_READ - end -->


	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"><input type="button" class="btns_st04_write" value="글쓰기" onclick="location.href='customer_write.html'" /><input type="button" class="btns_st04" value="답글 쓰기" onclick="location.href='customer_reply.html'" /><input type="button" class="btns" value="수정" onclick="location.href='customer_modify.html'" /><input type="button" class="btns" value="삭제" onclick="" /></div>
		<div class="main"><input type="button" class="btnm" value="목록" onclick="location.href='customer_list.html'" /><!-- <input type="button" class="btnm_cancel" value="목록" onclick="" /> --></div>
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