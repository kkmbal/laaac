<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>


<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		$("#mainCateNm, #subCateNm").click(function(){
			$(this).val("");
		});
		
		$("#btnGo").click(function(){
			var data = {cateNm:"", upCateId:""};
			var url = "";
			
			if ($("#mainChk").is(":checked")){
				if($("#mainCateNm").val() == "" || $("#mainCateNm").val() == "10자 이내 입력"){
					alert("카테고리명을 입력하세요.");
					return;
				}
				data.cateNm = $("#mainCateNm").val();
			    url = "${ctx}/category/regMainCategory?format=json";
				
			}else if ($("#subChk").is(":checked")){
				if($("#upCateId").val() == ""){
					alert("대분류를 선택하세요.");
					return;
				}
				if($("#subCateNm").val() == "" || $("#subCateNm").val() == "10자 이내 입력"){
					alert("카테고리명을 입력하세요.");
					return;
				}
				data.cateNm = $("#subCateNm").val();
				data.upCateId = $("#upCateId").val();
			    url = "${ctx}/category/regSubCategory?format=json";
			}
			
			$.post(url, {data:JSON.stringify(data)}, function(data){
				if(data.error){
					alert(data.error);
					return;
				}
				window.open("${ctx}/category/ask_category_pop", "pop", "height=200,width=340,resizable=no,scrollbars=no");
			});
		});
		
		
		//대분류
		$.post("${ctx}/category/listMainCategory?format=json", {data:""}, function(data){
			if(data.error){
				alert(data.error);
				return;
			}
			if(data.listCategoryVo){
				var json = $.parseJSON(JSON.stringify(data.listCategoryVo));
				for(var i=0;i<json.length;i++){
					$("#mainCate > ul").append('<li><a href="#" id="'+json[i].cateId+'">'+json[i].cateNm+'</a></li>');
					$("#upCateId").append('<option value="'+json[i].cateId+'">'+json[i].cateNm+'</option>');
				}
			}
		});
		
		$(document).on('click',"#mainCate li", function() {	
			var data = {upCateId:$(this).find("a").attr("id")};
			var thi = $(this);
			var obj = $(thi).find("ul");
			if(obj.length > 0 ) return false;
			$.post("${ctx}/category/listSubCategory?format=json", {data:JSON.stringify(data)}, function(data){
				if(data.error){
					alert(data.error);
					return;
				}
				if(data.listCategoryVo){
					var json = $.parseJSON(JSON.stringify(data.listCategoryVo));
					for(var i=0;i<json.length;i++){
						if(i==0){
							$(thi).addClass("sel");
							$(thi).append('<ul><li><a href="#" id="'+json[i].cateId+'">'+json[i].cateNm+'</a></li></ul>');
						}else{
							$(thi).find("ul").append('<li><a href="#" id="'+json[i].cateId+'">'+json[i].cateNm+'</a></li>');
						}
					}
				}
			});	
			return false;
		});
	});
</script>
</head>

<body onLoad="javascript:MenuOn(0104);">
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
			<li class="sel">카테고리 신청</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->
	<!-- Contents_Title - start -->
	<div class="contents_title">
		<ul>
			<li class="title">카테고리 신청</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>

	<!-- ===== LAYOUT - start ===== -->
	<div class="contents_layout">
		<div class="fl" style="width:480px;">
			<!-- 좌측 - 카테고리 table - start -->
			<!-- Grid_Table_Menu(overflow-y:scroll) - start -->
			<div class="gridt_menu_area" style="height:615px;">
				<!-- ** Grid_Table_Menu(header) - start ** -->
				<div class="head">
					<table cellpadding="0" cellspacing="0" border="0" width="478" class="gridt_menu_head">
						<colgroup>
							<col width="239">
							<col width="239"><!-- + 16(스크롤바) -->
						</colgroup> 
						<tr>
							<th>대분류</th>
							<th class="end">중분류</th>
						</tr>
					</table>
				</div>
				<!-- ** Grid_Table_Menu(header) - end ** -->
				<!-- ** Grid_Table_Menu(body) - start ** -->
				<div class="body" style="height:576px; width:; overflow-x:hidden; overflow-y:scroll;">
					<!-- gridt_menu - start -->
					<div class="gridt_menu" id="mainCate">
						<ul>
						<!-- 
							<li><a href="#">맛있는 음식</a></li>
							<li><a href="#">근사한 이벤트</a></li>
							<li><a href="#">좋은 물건</a></li>
							<li><a href="#">우리동네 가게</a></li>
							<li><a href="#">멋진 경치</a></li>
							<li class="sel"><a href="#">즐거운 쇼핑</a>
								<ul>
									<li><a href="#">Women</a></li>
									<li><a href="#">Men</a></li>
									<li><a href="#">Children</a></li>
									<li><a href="#">Senior</a></li>
									<li><a href="#">Home</a></li>
									<li><a href="#">Gifts</a></li>
									<li><a href="#">좋은 쇼핑몰</a></li>
								</ul>
							</li>
							<li><a href="#">아름다운 사람</a></li>
							<li class="on"><a href="#">신나는 여행</a></li>
							<li class="on"><a href="#">Cool Korea</a></li>
							<li><a href="#">나쁜 사기</a></li>
						-->
						</ul>
					</div>
					<!-- gridt_menu - end -->
				</div>
				<!-- ** Grid_Table_Menu(body) - end ** -->
			</div>
			<!-- Grid_Table_Menu(overflow-y:scroll) - end -->
			<!-- 좌측 - 카테고리 table - end -->
		</div>
		<div class="fl" style="width:40px;">&nbsp;</div>
		<div class="fl" style="width:480px;">
			<!-- 우측 - 카테고리 입력table - start -->
			<div class="t_guide01">추가 할 카테고리명을 입력해 주세요.</div>
			<div class="blank_height5"></div>
			<!-- Grid_Table_Input - start -->
			<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_input">
				<colgroup>
					<col width="125">
					<col width="">
				</colgroup>
				<tr>
					<th class="right"><input type="radio" name="chk" id="mainChk" hidefocus="true" class="radio" value="AA" checked>대분류 추가</th>
					<td class="left"><input name="mainCateNm" id="mainCateNm" type="text" class="input" style="width:335px;" value="10자 이내 입력" maxlength="10"></td>
				</tr>
				<tr>
					<th class="right"><input type="radio" name="chk" id="subChk" hidefocus="true" class="radio" value="BB">중분류 추가</th>
					<td class="left"><select name="upCateId" id="upCateId" class="select_inact" style="width:355px;">
					<option value="">선택</option>
					</select></td>
				</tr>
				<tr>
					<th class="right"></th>
					<td class="left"><input name="subCateNm" id="subCateNm" type="text" class="input_inact" style="width:335px;" value="10자 이내 입력" maxlength="10"></td>
				</tr>
			</table>
			<!-- Grid_Table_Input - end -->
			<div class="blank_height40"></div>
			<div class="t_guide01">신청 결과를 안내할 연락처를 입력해 주십시오.&nbsp;&nbsp;&nbsp;<img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"> 표는 필수 입력 항목 입니다.</div>
			<div class="blank_height5"></div>
			<!-- Grid_Table_Input - start -->
			<table cellpadding="0" cellspacing="0" border="0" width="100%" class="gridt_input">
				<colgroup>
					<col width="125">
					<col width="">
				</colgroup>
				<tr>
					<th class="right">휴대전화&nbsp;<img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"></th>
					<td class="left">
						<!-- start -->
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td><input name="" type="text" class="input" style="width:160px;" value=""></td>
								<td class="gridt_blank" nowrap></td>
								<td><span class="gridt_txt01">- 없이 입력 / SMS 발송</span></td>
							</tr>
						</table>
						<!-- end -->
					</td>
				</tr>
				<tr>
					<th class="right">E-mail&nbsp;<img src="${ctx}/resources/images/icon/i_check.gif" align="absmiddle"></th>
					<td class="left"><input name="" type="text" class="input" style="width:335px;" value=""></td>
				</tr>
			</table>
			<!-- Grid_Table_Input - end -->
			<!-- Btn_Form(Sub/Main) - start -->
			<div class="btn_form">
				<div class="sub"></div>
				<div class="main"><input type="button" class="btnm" value="신청" id="btnGo" /><input type="button" class="btnm_cancel" value="취소" onclick="" /></div>
				<div class="cb"></div>
			</div>
			<!-- Btn_Form(Sub/Main) - end -->
			<!-- 우측 - 카테고리 입력table - end -->
		</div>
	</div>
	<div class="cb"></div>
	<!-- ===== LAYOUT - end ===== -->


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