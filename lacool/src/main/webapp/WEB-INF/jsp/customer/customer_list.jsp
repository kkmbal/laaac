<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>


<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">

function fnGetBoardView(notiId, notiSeq){
	location.href = "${ctx}/customer/read?notiId="+notiId+"&notiSeq="+notiSeq;
}

$(document).ready(function(){
	$("#btnCustomerSearch").click(function(){	
		frm.submit();
	});
	$("#btnWrite").click(function(){	
		location.href = "${ctx}/customer/customer_write";
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
				<form name="frm" id="frm" method="get" action="${ctx}/customer/list">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><select name="searchKeyword" id="searchKeyword" class="select" style="width:150px;">
						<option value="">선택</option>
						<option value="TITLE" <c:if test="${searchKeyword == 'TITLE'}">selected</c:if>>제목</option>
						<option value="NAME"  <c:if test="${searchKeyword == 'NAME'}">selected</c:if>>작성자</option>
						<option value="CONTENT"  <c:if test="${searchKeyword == 'CONTENT'}">selected</c:if>>내용</option>
						</select></td>
						<td class="gridt_blank" nowrap></td>
						<td><input name="searchValue" id="searchValue" type="text" class="input" style="width:480px;" value="${searchValue}"></td>
						<td class="gridt_blank" nowrap></td>
						<td nowrap><input type="button" class="btn_search" value="검색" id="btnCustomerSearch"  /></td>
					</tr>
				</table>
				</form>
				<!-- end -->
			</td>
		</tr>
	</table>
	</div>
	<!-- Grid_Table_Search - end -->
	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"><input type="button" class="btns_st04_write" value="글쓰기" id="btnWrite" /></div>
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
<!-- 		<tr class="gridt_list_point01"> -->
<!-- 			<td class="center">100</td> -->
<%-- 			<td class="left"><img src="${ctx}/resources/images/icon/i-notice.gif" align="absbottom"> <a href="customer_read.html" target="_top"><strong>관리자가 작성한 게시물 / 신규 게시물 / 읽지 않은 게시물</strong></a></td> --%>
<!-- 			<td class="center">관리자</td> -->
<!-- 			<td class="right">234</td> -->
<!-- 			<td class="center end">2014.04.01 12:34:44</td> -->
<!-- 		</tr> -->
<!-- 		<tr class="gridt_list_point01"> -->
<!-- 			<td class="center">99</td> -->
<!-- 			<td class="left"><a href="#"><strong>신규 게시물 / 읽지 않은 게시물</strong></a></td> -->
<!-- 			<td class="center">작성자</td> -->
<!-- 			<td class="right">23</td> -->
<!-- 			<td class="center end">2014.04.01 12:34:44</td> -->
<!-- 		</tr> -->
		
<!-- 		<tr class="gridt_list_bg01" onmouseover="this.className='gridt_list_bg01_ov'" onmousedown="this.className='gridt_list_bg01_dn'" onmouseout="this.className='gridt_list_bg01_ot'"> -->
<!-- 			<td class="center">98</td> -->
<!-- 			<td class="left"><a href="#"><strong>읽지 않은 게시물</strong></a></td> -->
<!-- 			<td class="center">관리자</td> -->
<!-- 			<td class="right">1560</td> -->
<!-- 			<td class="center end">2014.04.01 12:34:44</td> -->
<!-- 		</tr> -->
		
		
		<c:forEach var="result" items="${list}" varStatus="status">
		<c:if test="${result.alarmYn != 'Y'}">
		<tr class="gridt_list_bg01" onmouseover="this.className='gridt_list_bg01_ov'" onmousedown="this.className='gridt_list_bg01_dn'" onmouseout="this.className='gridt_list_bg01_ot'">		
		</c:if>
		<c:if test="${result.alarmYn=='Y'}">
		<tr class="gridt_list_point01">
		</c:if>
			<td class="center">${result.notiSeq}</td>
			<td class="left">
				<c:if test="${result.alarmYn=='Y'}"><img src="${ctx}/resources/images/icon/i-notice.gif" align="absbottom"> </c:if> 
				<c:if test="${result.notiReadCnt == 0 or result.alarmYn=='Y'}"><a href="#" onclick="fnGetBoardView('${result.notiId}','${result.notiSeq}')"><strong>${result.notiTitle}</strong></a></c:if> 
				<c:if test="${result.notiReadCnt > 0 and result.alarmYn !='Y'}"><a href="#" onclick="fnGetBoardView('${result.notiId}','${result.notiSeq}')">${result.notiTitle}</a></c:if>
			</td>
			<td class="center">${result.userNm}</td>
			<td class="right">${result.notiReadCnt}</td>
			<td class="center end">${result.regDttm}</td>
		</tr>
		</c:forEach>
		
	</table>
	<!-- Grid_Table_List - end -->

	<div class="blank_height20"></div>

	<!-- Paging - start -->
	<div class="paging">
		  <k:paging name="${pageInfo}" action="customer/list" jsFunction="fn_link_page">
		    <div class="btn fl">
		  	<k:get property="firstPage"/><k:get property="prevPageGroup"/>
		  	</div>
		  	<div class="pagenum fl">
		  	<k:get property="paging"/>
		  	</div>
		  	<div class="btn fr">
		  	<k:get property="nextPageGroup"/><k:get property="lastPage"/>
		  	</div>
		  </k:paging>
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