<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">

var notiId = "";
var apndFileList = [];

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

		$("input[id^='apndImg']").change(function(e) {
			var id = $(this).attr("id");
			var delid = id.replace('apndImg','');
			$("#"+"delImg"+delid).show();
		});		
		
		//등록
		$("#btnGo").click(function(){
			
			var notiObject = {
					"boardId":"BBS000001",
					"notiId":"",
					"cateId":"",
					"upNotiId":"",
					"notiKind":"",
					"notiTitle":"",
					"notiConts":"",
					"notiUrl":"",
					"notiOpnDiv":"",
					"fbRegYn":"",
					"delYn":"N",
					"statCd":"",
					"userId":"",
					"userNm":"",
					"notiReadCnt":0,
					"notiOkCnt":0,
					"notiNgCnt":0,
					"writeIp":"",
					"notiBgnDttm":"",
					"notiEndDttm":"",
					"scrapCnt":0,
					"notiOpnCnt":0,
					"ref":0,
					"restep":0,
					"relevel":0,
					"notiApndFileList":[]
				};
			
			notiObject.cateId = $("#subCateId").val();
			notiObject.notiKind = $('input:radio[name="notiKind"]:checked').val();
			notiObject.notiTitle = $("#notiTitle").val();
			if(notiObject.notiKind == "001"){ //이미지
				notiObject.notiUrl = $("#notiUrlB").val();
			}else if(notiObject.notiKind == "002"){ //동영상
				notiObject.notiUrl = $("#notiUrlA").val();
			}
			notiObject.notiConts = $("#notiConts").val();
			notiObject.fbRegYn = "N";
			notiObject.notiOpnDiv = "N";
			if ($("#fbRegYn").is(":checked")){
				notiObject.fbRegYn = 'Y';
			}
			if ($("#notiOpnDiv").is(":checked")){
				notiObject.notiOpnDiv = 'Y';
			}
			
			notiObject.notiApndFileList = apndFileList;
			
			console.log(JSON.stringify(notiObject))
			
			if(!confirm("등록하시겠습니까?")){
				return;
			}
			
			if(apndFileList.length > 0){
		 		$("#frm").ajaxSubmit({
					url : "${ctx}/contents/bbsFileUpload.do",
					type : 'POST',
					data : $("#frm").serialize(),
					action: $("#dummy"),
					success : function(data){			
						var json = $.parseJSON(data);
						
						var fileList = notiObject.notiApndFileList;
						for(var i=0;i<fileList.length;i++){
							var obj = fileList[i];
							for(var j=0;j<json.length;j++){
								if(obj.apndFileOrgn == json[j].apndFileOrgn){
									obj.apndFileNm = json[j].apndFileNm;
								}
							}
						}
						
						console.log(JSON.stringify(notiObject))
						
						$.post("${ctx}/contents/contentsReg?format=json", {"data":JSON.stringify(notiObject)}, function(data){
							if(data.result){
								alert(data.result);
								return;
							}
							
							notiId = data.notiId;
							
							$("#pop_confirm").show();
							
							$("#mainCateId").val("");
							$("#subCateId").val("");
							$("#cateId").val("");
							$("#notiUrl").val("");
							$("#notiUrlA").val("");
							$("#notiUrlB").val("");
							$("#notiTitle").val("");
							$("#notiConts").val("");
							for(var i=1;i<=10;i++){
								fnImgReset(i+"");
							}
							
						});						
					},error : function(){
						alert("전송 실패 했습니다.");
					},
					clearForm: true,
					resetForm: true
				});				
			}
			
//			console.log($("#frm").serialize())
			
			
		});
		
		$("#pop_continue, #pop_close").click(function(){
			$("#pop_confirm").hide();
		});
		
		$("#pop_detail").click(function(){
			location.href = "${ctx}/contents/getContentsDetail?notiId="+notiId;
		});
		
	});
	
	function fnImgReset(id){
		$("#imageFile").val("");
		$("#fileNm").val("");
		$("#apndImg"+id).show();
		$("#apndImg"+id).parent().parent().css('background','#fff url(${ctx}/resources/images/photo/imgs_sub_input.gif) no-repeat center center');
		//$("#apndImg"+id+"_div").empty();
		$("#apndImg"+id+"_div").children().remove();
		$("#delImg"+id).hide();
		
		for(var i=0; i < apndFileList.length; i++){
			var json = apndFileList[i];
			if (json.apndId == ('apndImg'+id)){
				apndFileList.splice(i,1);
				break;
			}
		}		
	}
	
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
	
	
	<input type="hidden" name="cateId" id="cateId">
	<input type="hidden" name="notiUrl" id="notiUrl">
	
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
				<!-- 대표이미지 - start 
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"> <strong>대표 이미지 등록 (필수)</strong></td>
					</tr>
				</table>
				-->
				<!-- 
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="200" valign="top"><div class="imgs_main01_input"><a href="#" target="_top" onMouseOver="document.main01.src='${ctx}/resources/images/photo/imgs_main01_input-ov.gif'" onMouseOut="document.main01.src='${ctx}/resources/images/photo/imgs_main01_input.gif'"><img src="${ctx}/resources/images/photo/imgs_main01_input.gif" class="photo" name="main01"></a></div></td>
						<td width="45"></td>
						<td width="290" valign="top"><div class="imgs_main02_input"><a href="#" target="_top" onMouseOver="document.main02.src='${ctx}/resources/images/photo/imgs_main02_input-ov.gif'" onMouseOut="document.main02.src='${ctx}/resources/images/photo/imgs_main02_input.gif'"><img src="${ctx}/resources/images/photo/imgs_main02_input.gif" class="photo" name="main02"></a></div></td>
						<td width="45"></td>
						<td width="240" valign="top"><div class="imgs_main03_input"><a href="#" target="_top" onMouseOver="document.main03.src='${ctx}/resources/images/photo/imgs_main03_input-ov.gif'" onMouseOut="document.main03.src='${ctx}/resources/images/photo/imgs_main03_input.gif'"><img src="${ctx}/resources/images/photo/imgs_main03_input.gif" class="photo" name="main03"></a></div></td>
					</tr>
				</table>
				-->
				<!-- 대표이미지 - end -->
				<!-- 서브이미지 - start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td>서브 이미지 등록 (10개까지 등록 가능합니다.)</td>
					</tr>
				</table>
				<form name="frm" id="frm" enctype="multipart/form-data" method="post">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
								<div class="plus_image">
									<!-- del - start -->
									<input type="button" class="btni_del02 plus_image_del" title="삭제" onclick="fnImgReset('1')" id="delImg1" />
									<!-- del - end -->								
									<canvas id="canvasImg1" width="138" height="138" style="display:none"></canvas>
									<div id="apndImg1_div"></div>
									<a href="#"><input type="file" size="1" id="apndImg1" name="apndImg1" class="plus_image_apnd"></a>
								</div>
							</div>
						</td>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
								<div class="plus_image">
									<!-- del - start -->
									<input type="button" class="btni_del02 plus_image_del" title="삭제" onclick="fnImgReset('2')" id="delImg2" />
									<!-- del - end -->								
									<canvas id="canvasImg2" width="138" height="138" style="display:none"></canvas>
									<div id="apndImg2_div"></div>
									<a href="#"><input type="file" size="1" id="apndImg2" name="apndImg2" class="plus_image_apnd"></a>
								</div>
							</div>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
								<div class="plus_image">
									<!-- del - start -->
									<input type="button" class="btni_del02 plus_image_del" title="삭제" onclick="fnImgReset('3')" id="delImg3" />
									<!-- del - end -->								
									<canvas id="canvasImg3" width="138" height="138" style="display:none"></canvas>
									<div id="apndImg3_div"></div>
									<a href="#"><input type="file" size="1" id="apndImg3" name="apndImg3" class="plus_image_apnd"></a>
								</div>
							</div>
						</td>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
								<div class="plus_image">
									<!-- del - start -->
									<input type="button" class="btni_del02 plus_image_del" title="삭제" onclick="fnImgReset('4')" id="delImg4" />
									<!-- del - end -->								
									<canvas id="canvasImg4" width="138" height="138" style="display:none"></canvas>
									<div id="apndImg4_div"></div>
									<a href="#"><input type="file" size="1" id="apndImg4" name="apndImg4" class="plus_image_apnd"></a>
								</div>
							</div>
						</td>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
								<div class="plus_image">
									<!-- del - start -->
									<input type="button" class="btni_del02 plus_image_del" title="삭제" onclick="fnImgReset('5')" id="delImg5" />
									<!-- del - end -->								
									<canvas id="canvasImg5" width="138" height="138" style="display:none"></canvas>
									<div id="apndImg5_div"></div>
									<a href="#"><input type="file" size="1" id="apndImg5" name="apndImg5" class="plus_image_apnd"></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
								<div class="plus_image">
									<!-- del - start -->
									<input type="button" class="btni_del02 plus_image_del" title="삭제" onclick="fnImgReset('6')" id="delImg6" />
									<!-- del - end -->								
									<canvas id="canvasImg6" width="138" height="138" style="display:none"></canvas>
									<div id="apndImg6_div"></div>
									<a href="#"><input type="file" size="1" id="apndImg6" name="apndImg6" class="plus_image_apnd"></a>
								</div>
							</div>
						</td>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
								<div class="plus_image">
									<!-- del - start -->
									<input type="button" class="btni_del02 plus_image_del" title="삭제" onclick="fnImgReset('7')" id="delImg7" />
									<!-- del - end -->								
									<canvas id="canvasImg7" width="138" height="138" style="display:none"></canvas>
									<div id="apndImg7_div"></div>
									<a href="#"><input type="file" size="1" id="apndImg7" name="apndImg7" class="plus_image_apnd"></a>
								</div>
							</div>
						</td>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
								<div class="plus_image">
									<!-- del - start -->
									<input type="button" class="btni_del02 plus_image_del" title="삭제" onclick="fnImgReset('8')" id="delImg8" />
									<!-- del - end -->								
									<canvas id="canvasImg8" width="138" height="138" style="display:none"></canvas>
									<div id="apndImg8_div"></div>
									<a href="#"><input type="file" size="1" id="apndImg8" name="apndImg8" class="plus_image_apnd"></a>
								</div>
							</div>
						</td>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
								<div class="plus_image">
									<!-- del - start -->
									<input type="button" class="btni_del02 plus_image_del" title="삭제" onclick="fnImgReset('9')" id="delImg9" />
									<!-- del - end -->								
									<canvas id="canvasImg9" width="138" height="138" style="display:none"></canvas>
									<div id="apndImg9_div"></div>
									<a href="#"><input type="file" size="1" id="apndImg9" name="apndImg9" class="plus_image_apnd"></a>
								</div>
							</div>
						</td>
						<td width="30"></td>
						<td width="140" valign="top">
							<div class="imgs_sub_input" style="position:relative">
								<div class="plus_image">
									<!-- del - start -->
									<input type="button" class="btni_del02 plus_image_del" title="삭제" onclick="fnImgReset('10')" id="delImg10" />
									<!-- del - end -->								
									<canvas id="canvasImg10" width="138" height="138" style="display:none"></canvas>
									<div id="apndImg10_div"></div>
									<a href="#"><input type="file" size="1" id="apndImg10" name="apndImg10" class="plus_image_apnd"></a>
								</div>
							</div>
						</td>
					</tr>
				</table>
				</form>
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
						<td><input type="checkbox" name="fbRegYn" id="fbRegYn" hidefocus="true" class="check" value="Y">페이스북 동시 등록</td>
						<td width="30" nowrap></td>
						<td><input type="checkbox" name="notiOpnDiv" id="notiOpnDiv" hidefocus="true" class="check" value="Y">관련 외부 글 공개</td>
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
		<div class="main"><input type="button" class="btnm" value="완료" id="btnGo" /><input type="button" class="btnm_cancel" value="취소" onclick="" /></div>
<%-- 		<div class="main"><input type="button" class="btnm" value="완료" onclick="window.open('${ctx}/contents/creation_pop','win','toolbar=no,directories=no,menubar=no,scrollbars=no,resizable=no,status=no,location=no,copyhistory=no,width=300,height=180,top=200,left=200')" /><input type="button" class="btnm_cancel" value="취소" onclick="" /></div> --%>
		<div class="cb"></div>
	</div>
	<!-- Btn_Form(Sub/Main) - end -->


</div>
<!-- contents-end -->
</div>
<!-- //  CONTAINER(sidebar+contents) - end // -->

<div id="pop_confirm" class="popup_st01" style="position:absolute;width:296px; height:176px;margin-left:400px;z-index:10;display:none;">
	<!-- Title/Btn_close - start -->
	<div class="popup_st01_title">
		<ul>
			<li class="btn fr"><input type="button" class="btni_close02" title="닫기"  id="pop_close" /></li>
		</ul>
	</div>
	<!-- Title/Btn_close - end -->

	<!-- 내용 들어가는 곳 - start -->
	<div class="popup_st01_contents">

		<!-- start -->
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
		  <tr>
		    <td class="popup_st01_contents_txt">컨텐츠 등록이 완료되었습니다.</td>
		  </tr>
		</table>
		<!-- end -->

	</div>
	<!-- 내용 들어가는 곳 - end -->

	<!-- Popup_Style01_Btn - start -->
	<div class="popup_st01_btn">
		<input type="button" class="btnm" value="계속 등록" id="pop_continue" /><input type="button" class="btnm_cancel" value="컨텐츠 보기" id="pop_detail" />
	</div>
	<!-- Popup_Style01_Btn - end -->
</div>

<!-- // FOOTER - start // -->
<%@ include file="/WEB-INF/jsp/common/layout/footer.jsp"%>
<!-- // FOOTER - end // -->


</div>
<!-- ***** WRAPPER - end ***** -->


<!--[if IE]></div><![endif]-->
<!--[if !IE]></div><![endif]-->



<script>
window.onload = function(){
	    var fileInputs = ['apndImg1','apndImg2','apndImg3','apndImg4','apndImg5','apndImg6','apndImg7','apndImg8','apndImg9','apndImg10'];
	    
	    for(var i=0;i<fileInputs.length;i++){
			var fileInput = document.getElementById(fileInputs[i]);
			fileInput.addEventListener('change', function(e) {
				var file = this.files[0];
				var id = this.id;
				var imageType = /image.*/;
				if (file.type.match(imageType)) {
					var reader = new FileReader();
					reader.onload = function(e) {
						var img = new Image();
						img.src = reader.result;
						img.width = 138;
						img.height = 138;
						var imageDiv = document.getElementById(id+"_div");
						imageDiv.appendChild(img);
						
						var jsonObject = {
								"notiId":"",
								"apndFileSeq":"",
								"apndFileTp":"",
								"apndFileSz":0,
								"apndFileOrgn":file.name,
								"apndFileNm":"",
								"apndFilePath":"",
								"delYn":"N",
								"apndFilePreNm":"",
								"apndFilePrePath":"",
								"apndId":id
							};
						apndFileList.push(jsonObject);
					};
					reader.readAsDataURL(file); 
				} else {
					fileNm.value = "File not supported!";
				}
			});	
	    }
}
</script>

<iframe id="dummy" name="dummy" width=0 height=0></iframe>
</body>
</html>