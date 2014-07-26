<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">
var apndFileList = [];


$(document).ready(function(){
	
	$("#nationNm").val('${userVo.nationNm}');
	var birthYmd = '${userVo.birthYmd}';
	$("#year").val(birthYmd.substring(0, 4));
	$("#month").val(birthYmd.substring(4, 6));
	$("#day").val(birthYmd.substring(6));
	var sex = '${userVo.sex}';
	if(sex == 'F'){
		$("#femail").attr("checked", true);
	}else if(sex == 'M'){
		$("#mail").attr("checked", true);
	}
	var mailRecvYn = '${userVo.mailRecvYn}';
	if(mailRecvYn == 'Y'){
		$("#mailRecvYn").attr("checked", true);
	}
	$("#apndImg_div").html('<img src="${ctx}/${userVo.userFilePath}${userVo.userFileNm}" width="100" height=100>');
	
	$("#userUrl").click(function(){
		$("#userUrl").val("");
	});
	
	$("#apndImg").bind("change",function(e) {
		$("#fileNm").val($(this).val());
	});
	
	$("#btnGo").click(function(){
		if($("#nationNm").val() == ""){
			alert("국가를 선택하세요.");
			return;
		}
		if($("#year").val()=="" || $("#month").val()=="" || $("#day").val()==""){
			alert("생년월일을 선택하세요.");
			return;
		}
		//if(apndFileList.length == 0){
		//	alert("파일을 선택하세요.");
		//	return;
		//}
		
		var mobile = $("#phone").val().replace(/-/g,'');
		$("#mobile").val(mobile);
		var birthYmd = $("#year").val() + $("#month").val() + $("#day").val(); 
		$("#birthYmd").val(birthYmd);
		if ($("#female").is(":checked")){
			$("#sex").val("F");
		}else if ($("#male").is(":checked")){
			$("#sex").val("M");
		}
		
		//alert($("#frm").serialize())
		/*
		$("#frm").ajaxSubmit({
			url : "${ctx}/member/userRegDetail",
			type : 'POST',
			data :  $("#frm").serialize(),
			action: $("#dummy"),
			dataType : "script",
			success : function(data){
				window.open("${ctx}/member_regist_03_pop", "pop", "height=100,width=100,resizable=no,scrollbars=no");
			},error : function(){
				alert("전송 실패 했습니다.");
			},
			clearForm: true,
			resetForm: true
		});	
		*/
		var usrObject = {mobile:"", email:"", pwd:"", userFileNm:"", userFilePath:""};
		usrObject.mobile = $("#mobile").val();
		usrObject.birthYmd = $("#birthYmd").val();
		usrObject.sex = $("#sex").val();
		usrObject.imageFile = $("#imageFile").val();
		usrObject.nationNm = $("#nationNm").val();
		usrObject.userUrl = $("#userUrl").val();
		usrObject.fbId = $("#fbId").val();
		usrObject.mailRecvYn = $("#mailRecvYn").val();
		
		if(!confirm("수정하시겠습니까?")){
			return;
		}		
		
		if(apndFileList.length > 0){
	 		$("#frm").ajaxSubmit({
				url : "${ctx}/personal/bbsFileUpload.do",
				type : 'POST',
				data : $("#frm").serialize(),
				action: $("#dummy"),
				success : function(data){			
					var json = $.parseJSON(data);
						
					if(json.length > 0){
						usrObject.userFileNm = json[0].apndFileNm;
						usrObject.userFilePath = json[0].apndFilePath;
					}
					
					console.log(JSON.stringify(usrObject))
					
					$.post("${ctx}/personal/userRegDetail?format=json", {data:JSON.stringify(usrObject)}, function(data){
						if(data.error){
							alert(data.error);
							return;
						}
						alert("수정되었습니다.");
					});
					
				},error : function(){
					alert("전송 실패 했습니다.");
				},
				clearForm: true,
				resetForm: true
			});				
		}else{
			$.post("${ctx}/personal/userRegDetail?format=json", {data:JSON.stringify(usrObject)}, function(data){
				if(data.error){
					alert(data.error);
					return;
				}
				alert("수정되었습니다.");
			});
		}		

	});
	
	$("#btnCancel").click(function(){
		location.href = '${ctx}';
	});
});
</script>
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
			<li class="title fl">${userVo.userNm} <span class="sub">님의 개인홈</span></li>
			<li class="tab_area fr">
				<!-- tab_style01 - start -->
				<div class="tab_st01">
					<ul>
						<li><a href="${ctx}/personal/home" target="_top">개인홈</a></li>
						<li class="sel"><a target="_top">개인정보 관리</a></li>
						<li><a href="${ctx}/personal/scrap" target="_top">스크랩</a></li>
						<li><a href="${ctx}/personal/temporary" target="_top">임시저장</a></li>
<%-- 						<li><a href="${ctx}/personal/chat" target="_top">대화기록</a></li> --%>
						<li><a href="${ctx}/member/member_cancel" target="_top">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- tab_style01 - end -->
			</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	
	<!-- Grid_Table_Input - start -->
	<form name="frm" id="frm" method="post">
	<input type="hidden" name="mobile" id="mobile">
	<input type="hidden" name="birthYmd" id="birthYmd">
	<input type="hidden" name="sex" id="sex">
	<input type="hidden" name="imageFile" id="imageFile" />
	
	<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_input">
		<colgroup>
			<col width="160">
			<col width="">
		</colgroup>
		<tr>
			<th class="right">사용자 이름</th>
			<td class="left"><input name="" type="text" class="input_inact" style="width:340px;" value="${userVo.userNm}" readonly></td>
		</tr>
		<tr>
			<th class="right">휴대전화</th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><input name="phone" id="phone" type="text" class="input" style="width:340px;" value="${userVo.mobile}"></td>
						<td class="gridt_blank" nowrap></td>
						<td><span class="gridt_txt01">- 없이 입력</span></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">국가&nbsp;<img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"></th>
			<td class="left"><select name="nationNm" id="nationNm" class="select" style="width:360px;">
			<option value="">선택</option>
			<option value="001">대한민국</option>
			<option value="002">미국</option>
			<option value="003">영국</option>
			<option value="004">프랑스</option>
			<option value="005">독일</option>
			</select></td>
		</tr>
		<tr>
			<th class="right">생년월일&nbsp;<img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"></th>
			<td class="left">
				<!-- start -->
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td><select name="year" id="year" class="select" style="width:96px;">
						<option value="">선택</option>
						<c:forEach var="y" begin="1950" end="2014" step="1">
						<option value="${y}">${y}</option>
						</c:forEach>
						</select></td>
						<td class="gridt_blank" nowrap></td>
						<td>년</td>
						<td width="30"></td>
						<td><select name="month" id="month" class="select" style="width:78px;">
						<option value="">선택</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						</select></td>
						<td class="gridt_blank" nowrap></td>
						<td>월</td>
						<td width="30"></td>
						<td><select name="day" id="day" class="select" style="width:78px;">
						<option value="">선택</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<c:forEach var="d" begin="10" end="31" step="1">
						<option value="${d}">${d}</option>
						</c:forEach>
						</select></td>
						<td class="gridt_blank" nowrap></td>
						<td>일</td>
						<td width="60"></td>
						<td><input type="radio" name="mailfemale" id="female" hidefocus="true" class="radio" value="F" checked>여성</td>
						<td width="30" nowrap></td>
						<td><input type="radio" name="mailfemale" id="male" hidefocus="true" class="radio" value="M">남성</td>
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
						<td><div style="position:relative; left:-2px; top:0px;"><input name="userUrl" id="userUrl" type="text" class="input" style="width:761px;" value="${userVo.userUrl}"></div></td>
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
						<td><div style="position:relative; left:-2px; top:0px;"><input name="fbId" id="fbId" type="text" class="input" style="width:661px;" value="${userVo.fbId}"></div></td>
					</tr>
				</table>
				<!-- end -->
			</td>
		</tr>
		<tr>
			<th class="right">메일 수신</th>
			<td class="left"><input type="checkbox" name="mailRecvYn" id="mailRecvYn" hidefocus="true" class="check" value="Y" checked>Lalalacool의 뉴스레터</td>
		</tr>
		<tr>
			<th class="right">사용자 이미지&nbsp;<img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"></th>
			<td class="left">
				<!-- start -->
			    <form name="frm" id="frm" enctype="multipart/form-data" method="post">
				<table cellpadding="0" cellspacing="0" border="0">
					<tr>
<%-- 						<td><div class="imgs_user"><img src="${ctx}/resources/images/photo/imgs_user_input.gif" class="photo" id="myImg"></div></td> --%>
						<td><div class="imgs_user"><div id="apndImg_div"></div></div></td>
						<td class="gridt_blank" nowrap></td>
						<td>
							<div style="vertical-align:top; height:100px;">
								<input name="fileNm" id="fileNm" type="text" class="input" readonly style="width:230px;" value=""><br>
								<div class="blank_height5"></div>
								<span class="t_num_txt">400KB이하</span>&nbsp;<span class="t_num_txt">/</span>&nbsp;<span class="t_num">315KB</span>
							</div>
						</td>
						<td class="gridt_blank" nowrap></td>
						<td style="vertical-align:top;">
<!-- 							<div style="vertical-align:top; height:100px;"> -->
							<div class="btnd" style="width:50px;position:relative;">
<!-- 								<input type="file" size="1" id="apndImg" name="apndImg" class="file2">  -->
								파일찾기
								<input type="file" size="1" id="apndImg" name="apndImg" value="파일찾기" style="position:absolute;left:0px;top:0px;width:80px;height:40px;display:inline-block;opacity: 0;filter: alpha(opacity:0);" />
							</div>
						</td>
					</tr>
				</table>
				</form>
				<!-- end -->
			</td>
		</tr>
	</table>
	</form>
	<!-- Grid_Table_Input - end -->
	
	<!-- Btn_Form(Sub/Main) - start -->
	<div class="btn_form">
		<div class="sub"></div>
		<div class="main"><input type="button" class="btnm" value="수정" id="btnGo" /><input type="button" class="btnm_cancel" value="취소" id="btnCancel" /></div>
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

<script>
window.onload = function(){
	    var fileInputs = ['apndImg'];
	    
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
						img.width = 100;
						img.height = 100;
						var imageDiv = document.getElementById(id+"_div");
						$("#"+id+"_div").empty();
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
						apndFileList = [];
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