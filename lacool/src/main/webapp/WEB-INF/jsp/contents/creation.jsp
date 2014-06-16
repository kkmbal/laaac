<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		//대분류
		$.post("${ctx}/category/listMainCategory?format=json", {data:""}, function(data){
			if(data.result){
				alert(data.result);
				return;
			}
			if(data.listCategoryVo){
				var json = $.parseJSON(JSON.stringify(data.listCategoryVo));
				for(var i=0;i<json.length;i++){
					$("#mainCateId").append('<option value="'+json[i].cateId+'">'+json[i].cateNm+'</option>');
				}
			}
		});	
		
		//중분류
		$("#mainCateId").change(function(){
			$("#subCateId option:gt(0)").remove();
			if($(this).val() != ""){
				var data = {upCateId:$(this).val()};
				$.post("${ctx}/category/listSubCategory?format=json", {data:JSON.stringify(data)}, function(data){
					if(data.result){
						alert(data.result);
						return;
					}
					if(data.listCategoryVo){
						var json = $.parseJSON(JSON.stringify(data.listCategoryVo));
						for(var i=0;i<json.length;i++){
							$("#subCateId").append('<option value="'+json[i].cateId+'">'+json[i].cateNm+'</option>');
						}
					}
				});					
			}
		});
		
		$("#notiTitle, #notiConts, #notiKindA, #notiKindB").click(function(){
			var id = $(this).attr("id");
			if(id == "notiTitle"){
				$(this).val("");
			}else if(id == "notiConts"){
				$(this).val("");
			}else if(id == "notiKindA"){
				$("#notiUrlA").attr("disabled", true);
				$("#notiUrlB").attr("disabled", false);
			}else if(id == "notiKindB"){
				$("#notiUrlB").attr("disabled", true);
				$("#notiUrlA").attr("disabled", false);
			}
		});

		$("#apndImg1").change(function(e) {
			
			//if(!PortalCommon.imgUploadFileCheck(bbsImgform.bbsUpImg.value)){
			//	alert("추가할 수 없는 파일입니다.");
			//	return;
			//}
		
			/*
	 		$("#bbsImgform").ajaxSubmit({
				url : "${WEB_HOME}/person300/bbsFileUpload.do",
				type : 'POST',
				data : $("#bbsImgform").serialize(),
				action: $("#dummy"),
				success : function(data){			
					loadImageList($.parseJSON(data));
				},error : function(){
					alert("전송 실패 했습니다.");
				},
				clearForm: true,
				resetForm: true
			});	
			*/
			$(this).hide();
			$(this).parent().parent().css('background','');
			$("#delImg1").show();
		});		
		
		//등록
		$("#btnGo").click(function(){
			
		});
		
		
	});
	
	function fnImgReset(id){
		$("#imageFile"+id).val("");
		$("#apndImg"+id).show();
		$("#apndImg"+id).parent().parent().css('background','#fff url(${ctx}/resources/images/photo/imgs_sub_input.gif) no-repeat center center');
		$("#canvasImg"+id).hide();
		$("#delImg"+id).hide();
	}
	
	window.onload = new Function("makeThumbnail('apndImg1', 'fileNm1', 'canvasImg1', 'imageFile1', 138, 138);");
	
</script>
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
	<div class="t_guide01"><img src="${ctx}/resources/images/icon/i_warn.gif" align="texttop"> 이미지나 동영상 등의 게시물이 저작권을 포함하여 타인의 권리를 침해하거나 명예를 훼손하는 경우 이용약관 및 관련 법률에 의하여 제재를 받을 수 있습니다.</div>
	<div class="blank_height5"></div>
	<!-- Grid_Table_Input - start -->
	
	<form name="frm" id="frm">
	<input type="hidden" name="cateId" id="cateId">
	<input type="hidden" name="notiUrl" id="notiUrl">
	<input type="hidden" name="imageFile1" id="imageFile1">
	<input type="hidden" name="fileNm1" id="fileNm1">
	
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
						<td><select name="mainCateId" id="mainCateId" class="select" style="width:200px;">
						<option value="">선택</option>
						</select></td>
						<td class="gridt_blank" nowrap></td>
						<td><select name="subCateId" id="subCateId" class="select" style="width:200px;">
						<option value="">선택</option>
						</select></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">제목</th>
			<td class="left"><input name="notiTitle" id="notiTitle" type="text" class="input" style="width:820px;" value="제목을 30자 이내로 입력하세요." maxlength="30"></td>
		</tr>
		<tr>
			<th class="right">종류</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="30" nowrap></td>
						<td><input type="radio" name="notiKind" id="notiKindA" hidefocus="true" class="radio" value="001" checked>이미지</td>
						<td><input type="radio" name="notiKind" id="notiKindB" hidefocus="true" class="radio" value="002">동영상</td>
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
						<td><img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"> <strong>대표 이미지 등록 (필수)</strong></td>
					</tr>
				</table>
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="200" valign="top"><div class="imgs_main01_input"><a href="#" target="_top" onMouseOver="document.main01.src='${ctx}/resources/images/photo/imgs_main01_input-ov.gif'" onMouseOut="document.main01.src='${ctx}/resources/images/photo/imgs_main01_input.gif'"><img src="${ctx}/resources/images/photo/imgs_main01_input.gif" class="photo" name="main01"></a></div></td>
						<td width="45"></td>
						<td width="290" valign="top"><div class="imgs_main02_input"><a href="#" target="_top" onMouseOver="document.main02.src='${ctx}/resources/images/photo/imgs_main02_input-ov.gif'" onMouseOut="document.main02.src='${ctx}/resources/images/photo/imgs_main02_input.gif'"><img src="${ctx}/resources/images/photo/imgs_main02_input.gif" class="photo" name="main02"></a></div></td>
						<td width="45"></td>
						<td width="240" valign="top"><div class="imgs_main03_input"><a href="#" target="_top" onMouseOver="document.main03.src='${ctx}/resources/images/photo/imgs_main03_input-ov.gif'" onMouseOut="document.main03.src='${ctx}/resources/images/photo/imgs_main03_input.gif'"><img src="${ctx}/resources/images/photo/imgs_main03_input.gif" class="photo" name="main03"></a></div></td>
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
							<div class="imgs_sub_input" style="position:relative">
								<img src="${ctx}/resources/images/test/imgs_sub01.jpg" class="photo">
								<!-- del - start -->
								<div style="position:absolute; left:0px; top:0px;" nowrap><input type="button" class="btni_del02" title="삭제" onclick="" /></div>
								<!-- del - end -->
							</div>
						</td>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative"><img src="${ctx}/resources/images/test/imgs_sub02.jpg" class="photo">
								<!-- del - start -->
								<div style="position:absolute; left:0px; top:0px;" nowrap><input type="button" class="btni_del02" title="삭제" onclick="" /></div>
								<!-- del - end -->
							</div>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
<%-- 							<a href="#" target="_top" onMouseOver="document.sub.src='${ctx}/resources/images/photo/imgs_sub_input-ov.gif'" onMouseOut="document.sub.src='${ctx}/resources/images/photo/imgs_sub_input.gif'"> --%>
<%-- 							<img src="${ctx}/resources/images/photo/imgs_sub_input.gif" class="photo" name="sub"> --%>
							<div  style="width:138px;height:138px;border:0;float:left;margin:1px 1px 1px 1px;background: #fff url(${ctx}/resources/images/photo/imgs_sub_input.gif) no-repeat center center;">
								<!-- del - start -->
<!-- 								<div style="position:absolute; left:0px; top:0px;z-index:10;float:left;"> -->
								<input type="button" class="btni_del02" title="삭제" onclick="fnImgReset('1')" style="position:absolute; left:0px; top:0px;z-index:10;float:left;display:none;" id="delImg1" />
<!-- 								</div> -->
								<!-- del - end -->								
							<canvas id="canvasImg1" width="138" height="138" style="display:none"></canvas>
							<a href="#">
							<input type="file" size="1" id="apndImg1" name="apndImg1" style="position:relative;left:0;top:0;height:140px;width:140px;opacity:0;filter:alpha(opacity:0);cursor:pointer;">
							</a>
							</div>
							</div>
						</td>
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
						<td><div style="position:relative; left:-2px; top:0px;"><input name="notiUrlA" id="notiUrlA" type="text" class="input_inact" style="width:671px;" disabled></div></td>
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
						<td><div style="position:relative; left:-2px; top:0px;"><input name="notiUrlB" id="notiUrlB" type="text" class="input" style="width:763px;" value=""></div></td>
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
						<td><textarea name="notiConts" id="notiConts" class="textarea" style="width:820px; height:140px;">게시물에 대한 설명을 입력하세요.</textarea></td>
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
						<td><input type="checkbox" name="fbRegYn" id=""fbRegYn"" hidefocus="true" class="check" value="Y">페이스북 동시 등록</td>
						<td width="30" nowrap></td>
						<td><input type="checkbox" name="notiOpnDiv" id="notiOpnDiv" hidefocus="true" class="check" value="Y">관련 외부 글 공개</td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
	</table>
	</form>
	<!-- Grid_Table_Input - end -->
	
	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"><input type="button" class="btns" value="미리보기" onclick="" /><input type="button" class="btns" value="임시저장" onclick="" /></div>
		<div class="main"><input type="button" class="btnm" value="완료" id="btnGo" /><input type="button" class="btnm_cancel" value="취소" onclick="" /></div>
<%-- 		<div class="main"><input type="button" class="btnm" value="완료" onclick="window.open('${ctx}/contents/creation_pop','win','toolbar=no,directories=no,menubar=no,scrollbars=no,resizable=no,status=no,location=no,copyhistory=no,width=300,height=180,top=200,left=200')" /><input type="button" class="btnm_cancel" value="취소" onclick="" /></div> --%>
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