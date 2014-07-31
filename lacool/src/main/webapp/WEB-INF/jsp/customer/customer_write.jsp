<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>


<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>
<script type="text/javascript">

$(document).ready(function(){
	$("#apndImg").bind("change",function(e) {
		$("#fileNm").val($(this).val());
	});
	
	<c:if test="${empty customerVo.notiId}">
	$("#notiTitle, #notiConts").click(function(){
		$(this).val("");
	});
	</c:if>
	
	$("#btnSave").click(function(){	
		if($("#notiTitle").val() == "" || $("#notiTitle").val() == "제목을 30자 이내로 입력하세요."){
			alert("제목을 입력하세요.");
			return;
		}
		if($("#notiConts").val() == "" || $("#notiConts").val() == "내용을 입력하세요."){
			alert("내용을 입력하세요.");
			return;
		}
		var saveObject = {
				"notiId":"${customerVo.notiId}", 
				"upNotiId":"",
				"notiTitle":"", 
				"notiConts":"", 
				"notiReadCnt":0,
				"notiOkCnt":0,
				"notiNgCnt":0,
				"scrapCnt":0,
				"notiOpnCnt":0,
				"ref":0,
				"restep":0,
				"relevel":0,
				"prvtYn":"N",
				"apndFileNm":"${customerVo.apndFileNm}", 
				"apndFileOrgn":"${customerVo.apndFileOrgn}", 
				"apndFilePath":"${customerVo.apndFilePath}",
				"apndFileSz":0
				};
		saveObject.notiTitle = $("#notiTitle").val();
		saveObject.notiConts = $("#notiConts").val();
		if($("#prvtYn").is(":checked")){
			saveObject.prvtYn = "Y";
		}
		
		if(!confirm("등록하시겠습니까?")){
			return;
		}
		
		if($("#fileNm").val() != ""){
	 		$("#frm").ajaxSubmit({
				url : "${ctx}/customer/bbsFileUpload.do",
				type : 'POST',
				data : $("#frm").serialize(),
				action: $("#dummy"),
				success : function(data){			
					var json = $.parseJSON(data);
						
					if(json.length > 0){
						saveObject.apndFileNm = json[0].apndFileNm;
						saveObject.apndFileOrgn = json[0].apndFileOrgn;
						saveObject.apndFilePath = json[0].apndFilePath;
						saveObject.apndFileSz = json[0].apndFileSz;
					}
					
					console.log(JSON.stringify(saveObject))
					
					$.post("${ctx}/customer/insert?format=json", {data:JSON.stringify(saveObject)}, function(data){
						if(data.error){
							alert(data.error);
							return;
						}
						alert("등록되었습니다.");
						location.href = "${ctx}/customer/list";
					});
					
				},error : function(){
					alert("전송 실패 했습니다.");
				},
				clearForm: true,
				resetForm: true
			});				
		}else{
			$.post("${ctx}/customer/insert?format=json", {data:JSON.stringify(saveObject)}, function(data){
				if(data.error){
					alert(data.error);
					return;
				}
				alert("등록되었습니다.");
				location.href = "${ctx}/customer/list";
			});
		}			
	});
	
	$("#btnList").click(function(){	
		location.href = "${ctx}/customer/list";
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
	<div class="t_guide01"><img src="${ctx}/resources/images/icon/i_warn.gif" align="texttop"> 게시판 게시기준에 맞지 않는 부적절한 게시물은 사전 안내 없이 관리자가 삭제합니다.</div>
	<div class="blank_height5"></div>
	<!-- Grid_Table_Input - start -->
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_input">
		<colgroup>
			<col width="100">
			<col width="">
		</colgroup>
		<tr>
			<th class="left">제목</th>
			<td class="left">
				<input name="notiTitle" id="notiTitle" type="text" class="input" style="width:870px;" value="<c:if test="${empty customerVo}">제목을 30자 이내로 입력하세요.</c:if><c:if test="${not empty customerVo}">${customerVo.notiTitle}</c:if>">
			</td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td width="100%">${userVo.userNm}</td>
						<td align="right" style="padding-right:30px;" nowrap>
							<c:if test="${customerVo.prvtYn == 'Y'}">
							<input type="checkbox" name="prvtYn" id="prvtYn" hidefocus="true" class="check" value="Y" checked>
							</c:if>
							<c:if test="${customerVo.prvtYn != 'Y'}">
							<input type="checkbox" name="prvtYn" id="prvtYn" hidefocus="true" class="check" value="Y">
							</c:if>
							비밀글
						</td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<td class="center" colspan="2"><textarea name="notiConts" id="notiConts" class="textarea" style="width:960px; height:250px;"><c:if test="${empty customerVo}">내용을 입력하세요.</c:if><c:if test="${not empty customerVo}">${customerVo.notiConts}</c:if></textarea></td>
		</tr>
		<tr>
			<th class="left">파일첨부</th>
			<td class="left">
				<!-- start -->
				<form name="frm" id="frm" enctype="multipart/form-data" method="post">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><input name="fileNm" id="fileNm" type="text" class="input" readonly style="width:230px;" value=""></td>
						<td class="gridt_blank" nowrap></td>
						<td>
							<div class="btnd" style="width:50px;position:relative;">
								파일찾기
								<input type="file" size="1" id="apndImg" name="apndImg" value="파일찾기" style="position:absolute;left:0px;top:0px;width:80px;height:40px;display:inline-block;opacity: 0;filter: alpha(opacity:0);" />
							</div>						
						</td>
						<td class="gridt_blank" nowrap></td>
						<td><span class="t_num_txt">파일 0개 이하, 000MB 이하</span>&nbsp;<span class="t_num_txt">/</span>&nbsp;<span class="t_num">345MB</span></td>
					</tr>
				</table>
				</form>
				<!-- end -->
				<c:if test="${not empty customerVo.apndFileNm}">
				<div class="blank_height10"></div>
				<!-- gridt_file - start -->
				<table cellpadding="0" cellspacing="0" border="0" class="gridt_file">
					<tr>
						<td class="filel"><input type="button" class="btni_del03" title="삭제" onclick="" /></td>
						<td class="gridt_blank" nowrap></td>
						<td class="filel"><a href="#">${customerVo.apndFileOrgn}</a></td>
					</tr>
				</table>
				<!-- gridt_file - end -->
				</c:if>				
			</td>
		</tr>
	</table>
	<!-- Grid_Table_Input - end -->

	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"><!-- <input type="button" class="btns" value="글쓰기" onclick="" /> --></div>
		<div class="main"><input type="button" class="btnm" value="등록" id="btnSave" /><input type="button" class="btnm_cancel" value="목록" id="btnList" /></div>
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