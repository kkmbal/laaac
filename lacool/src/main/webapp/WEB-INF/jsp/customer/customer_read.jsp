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

var fnDoFileDown = function fnDoFileDown(notiId, fileseq, filename, fileorg){	
	
	 var jsonObject = {
		'apndFileOrgn' : fileorg,
		'apndFileName' : filename,
		'apndFileSeq' :  fileseq,
		'notiId' : notiId
	 };
	 
	 var url = "${ctx}/customer/bbsFileDownload.do?data="+encodeURI(JSON.stringify(jsonObject),"UTF-8");
	 document.dummy.location.href = url;
};

$(document).ready(function(){
	$("#btnList").click(function(){	
		location.href = "${ctx}/customer/list?currPage=${currPage}";
	});
	$("#btnWrite").click(function(){	
		location.href = "${ctx}/customer/customer_write";
	});
	$("#btnDelete").click(function(){	
		location.href = "${ctx}/customer/delete?notiId=${customerVo.notiId}";
		
	});
	$("#btnDelPop").click(function(){	
		var left = (screen.width/2)-(296/2);
		$("#delPop").css("left",left).css("top", 400).show();
		
	});
	$(".btnDeleteClose").click(function(){	
		$("#delPop").hide();
		
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
			<td class="headl">${customerVo.notiSeq}</td>
			<th class="headl">조회수</th>
			<td class="headl">${customerVo.notiReadCnt}</td>
			<th class="headl">작성자</th>
			<td class="headl">${customerVo.userNm}</td>
			<th class="headl">등록일</th>
			<td class="headl">${customerVo.regDttm}</td>
		</tr>
		<tr>
			<td class="title" colspan="8">${customerVo.notiTitle}</td>
		</tr>
		<tr>
			<td class="content" colspan="8">
			${customerVo.notiConts}
			</td>
		</tr>
		<c:if test="${not empty customerVo.apndFileOrgn}">
		<tr>
			<th class="file">첨부파일</th>
			<td class="file" colspan="7">
				<!-- gridt_file - start -->
				<table cellpadding="0" cellspacing="0" border="0" class="gridt_file">
					<tr>
						<td class="filel"><img src="${ctx}/resources/images/icon/i_file.gif"></td>
						<td width="5" nowrap></td>
						<td class="filel"><span class="t_file"><a href="#" onclick="fnDoFileDown('${customerVo.notiId}','${customerVo.apndFileSeq}','${customerVo.apndFileNm}','${customerVo.apndFileOrgn}')">${customerVo.apndFileOrgn}</a></span></td>
						<td width="5" nowrap></td>
						<td class="filel"><span class="t_num_txt">(${customerVo.apndFileSz} kb)</span></td>
					</tr>
				</table>
				<!-- gridt_file - end -->
			</td>
		</tr>
		</c:if>
		<tr class="gridt_read_bg01" onmouseover="this.className='gridt_read_bg01_ov'" onmousedown="this.className='gridt_read_bg01_dn'" onmouseout="this.className='gridt_read_bg01_ot'">
			<td class="listprev" colspan="8">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td class="listtxt01">이전</td>
						<td class="gridt_blank" nowrap></td>
						<td><img src="${ctx}/resources/images/icon/i_prev.gif"></td>
						<td width="25" nowrap></td>
						<td>
							<c:if test="${not empty prevCustomerVo.notiId}">
							<a href="#" onclick="fnGetBoardView('${prevCustomerVo.notiId}','${prevCustomerVo.notiSeq}')">${prevCustomerVo.notiTitle}</a>
							</c:if>
							<c:if test="${empty prevCustomerVo.notiId}">마지막</c:if>
						</td>
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
						<td><img src="${ctx}/resources/images/icon/i_next.gif"></td>
						<td width="25" nowrap></td>
						<td>
							<c:if test="${not empty nextCustomerVo.notiId}">
							<a href="#" onclick="fnGetBoardView('${nextCustomerVo.notiId}','${nextCustomerVo.notiSeq}')">${nextCustomerVo.notiTitle}</a>
							</c:if>
							<c:if test="${empty nextCustomerVo.notiId}">마지막</c:if>
						</td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
	</table>
	<!-- Grid_Table_READ - end -->


	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"><input type="button" class="btns_st04_write" value="글쓰기" id="btnWrite" /><input type="button" class="btns_st04" value="답글 쓰기" onclick="location.href='customer_reply.html'" /><input type="button" class="btns" value="수정" onclick="location.href='customer_modify.html'" /><input type="button" class="btns" value="삭제" id="btnDelPop" /></div>
		<div class="main"><input type="button" class="btnm" value="목록" id="btnList" /></div>
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

<iframe name="dummy" width=0 height=0 border=0 style="visibility:hidden"></iframe>

<!--[if IE]></div><![endif]-->
<!--[if !IE]></div><![endif]-->


<div class="popup_st01" style="width:296px; height:176px; z-index:100; position:absolute; display:none;" id="delPop">
	<!-- Title/Btn_close - start -->
	<div class="popup_st01_title">
		<ul>
			<li class="btn fr"><input type="button" class="btni_close02 btnDeleteClose" title="닫기" /></li>
		</ul>
	</div>
	<!-- Title/Btn_close - end -->

	<!-- 내용 들어가는 곳 - start -->
	<div class="popup_st01_contents">

		<!-- start -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
		  <tr>
		    <td class="popup_st01_contents_txt">게시물을 삭제합니다.<br>삭제된 게시물은 복구할 수 없습니다.</td>
		  </tr>
		</table>
		<!-- end -->

	</div>
	<!-- 내용 들어가는 곳 - end -->

	<!-- Popup_Style01_Btn - start -->
	<div class="popup_st01_btn">
		<input type="button" class="btnm" value="확인" id="btnDelete" /><input type="button" class="btnm_cancel btnDeleteClose" value="취소"  />
	</div>
	<!-- Popup_Style01_Btn - end -->
</div>


</body>
</html>