<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

 
	<script type="text/javascript"> <!-- //GNB 메뉴 -->
	$(document).ready(function($) {
			// GNB 메뉴 처리
			$("#categoryBtn").click(function(){
				$("#totalCategory").toggle();
				if($("#totalCategory").css("display") == 'none'){
					$(this).find('img').attr("src","${ctx}/resources/images/gnb/menu6.gif").attr("alt","category Open");
				}else{
					$(this).find('img').attr("src","${ctx}/resources/images/gnb/menu6-sel.gif").attr("alt","category Close");
				}
				return false;
			});

			$("#goLogin").click(function(){
				window.open("${ctx}/login", "win", "height=475, width=575, scrollbars=no, resizable=no");
			}); 
			
			$("#btnClose").click(function(){
				$("#categoryBtn").trigger("click");
			}); 
			
			//대분류
			$.post("${ctx}/category/listMainCategory?format=json", {data:""}, function(data){
				if(data.result){
					alert(data.result);
					return;
				}
				if(data.listCategoryVo){
					var json = $.parseJSON(JSON.stringify(data.listCategoryVo));
					for(var i=0;i<json.length;i++){
						$("#category_menu").append('<li id="main_'+json[i].cateId+'"><a href="#"><div class="tl10">'+json[i].cateNm+'</div></a><ul></ul></li>');
						var data = {upCateId:json[i].cateId};
						$.post("${ctx}/category/listSubCategory?format=json", {data:JSON.stringify(data)}, function(data){
							if(data.result){
								alert(data.result);
								return;
							}
							if(data.listCategoryVo){
								var json2 = $.parseJSON(JSON.stringify(data.listCategoryVo));
								for(var j=0;j<json2.length;j++){
									$("#category_menu li[id=main_"+json2[j].upCateId+"]").find("ul").append('<li><a href="#">'+json2[j].cateNm+'</a></li>');
								}
							}
						});						
					}
				}
			});			
	});
	</script>
 
<!--[if IE 8]><div class="wrapper ie8"><![endif]-->
<!--[if IE 9]><div class="wrapper ie9"><![endif]-->
<!--[if !IE]><div class="wrapper ienone"><![endif]-->


<!-- // GNB(header) - start // -->
<div id="header">
	<div class="gnb_info_area">
		<!-- 로그인 전 - start -->
		<h2 class="blind">회원정보</h2>
		<ul class="gnb_info">
			<li><img src="${ctx}/resources/images/gnb/gnb_info_line.gif" /></li>
        	<c:choose>
        		<c:when test="${not empty userVo}">
        			<li class="login"><a href="#" id="goPerson">${userVo.userNm}</a></li>
        			<li><img src="${ctx}/resources/images/gnb/gnb_info_line.gif" /></li>
					<li class="members"><a href="${ctx}/member/doLogout" target="_top">로그아웃</a></li>
					<li><img src="${ctx}/resources/images/gnb/gnb_info_line.gif" /></li>					
        		</c:when>
        		<c:otherwise>
        			<li class="login"><a href="#" id="goLogin">로그인</a></li>
        			<li><img src="${ctx}/resources/images/gnb/gnb_info_line.gif" /></li>
					<li class="members"><a href="${ctx}/member/regist_01" target="_top">회원가입</a></li>
					<li><img src="${ctx}/resources/images/gnb/gnb_info_line.gif" /></li>
        		</c:otherwise>
        	</c:choose>			
		</ul>
		<!-- 로그인 전 - end -->
		<!-- 로그인 후 - start 
		<h2 class="blind">회원정보</h2>
		<ul class="gnb_info">
			<li class="name"><strong>관리자</strong>&nbsp;님</li>
			<li><img src="${ctx}/resources/images/gnb/gnb_info_line.gif" /></li>
			<li class="btn"><a href="#">관리자</a></li>
			<li><img src="${ctx}/resources/images/gnb/gnb_info_line.gif" /></li>
			<li class="logout"><a href="#">로그아웃</a></li>
			<li><img src="${ctx}/resources/images/gnb/gnb_info_line.gif" /></li>
		</ul>
		 로그인 후 - end -->
	</div>

	<div class="gnb_search_area">
		<h2 class="blind">검색</h2>
		<div class="gnb_search_center">
			<div class="gnb_search_line01">
				<div class="fl"><input name="" type="text" class="gnb_search_input" value=""></div>
				<div class="btn fr"><input type="button" class="btni_search" title="검색" onclick="" /></div>
			</div>
			<div class="gnb_search_line02">
				<div class="gnb_search_word fl">
					<ul>
						<li class="txt"><a href="#">주말 문화공연 순위</a></li>
						<li class="line">l</li>
						<li class="txt"><a href="#">제주도 여행 즐기기</a></li>
						<li class="line">l</li>
						<li class="txt"><a href="#">오늘의 이벤트</a></li>
					</ul>
				</div>
				<div class="fr"><input type="button" class="btni_arr03_prev" title="이전 검색어" onclick="" /><input type="button" class="btni_arr03_next" title="다음 검색어" onclick="" /></div>
			</div>
		</div>
	</div>

	<div class="gnb_menu">
		<h2 class="blind">로고/메뉴</h2>
		<ul>
			<li class="logo" style="width:432px;"><a href="${ctx}/" target="_top"><img src="${ctx}/resources/images/gnb/lalalacool_logo.gif" /></a></li>
			<li><img src="${ctx}/resources/images/gnb/gnb_menu_line.gif" align="absmiddle" /></li>
			<li><a href="${ctx}/" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('gnbmenu0101','','${ctx}/resources/images/gnb/menu1-ov.gif',1)">
<img src="${ctx}/resources/images/gnb/menu1.gif" width="69" height="63" border="0" name="gnbmenu0101" id="gnbmenu0101" title="홈"></a></li>
			<li><img src="${ctx}/resources/images/gnb/gnb_menu_line.gif" align="absmiddle" /></li>
			<li><a href="${ctx}/personal/personal_home" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('gnbmenu0102','','${ctx}/resources/images/gnb/menu2-ov.gif',1)">
<img src="${ctx}/resources/images/gnb/menu2.gif" width="94" height="63" border="0" name="gnbmenu0102" id="gnbmenu0102" title="개인 홈"></a></li>
			<li><img src="${ctx}/resources/images/gnb/gnb_menu_line.gif" align="absmiddle" /></li>
			<li><a href="${ctx}/contents/history" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('gnbmenu0103','','${ctx}/resources/images/gnb/menu3-ov.gif',1)">
<img src="${ctx}/resources/images/gnb/menu3.gif" width="83" height="63" border="0" name="gnbmenu0103" id="gnbmenu0103" title="히스토리"></a></li>
			<li><img src="${ctx}/resources/images/gnb/gnb_menu_line.gif" align="absmiddle" /></li>
			<li><a href="${ctx}/category/ask_category" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('gnbmenu0104','','${ctx}/resources/images/gnb/menu4-ov.gif',1)">
<img src="${ctx}/resources/images/gnb/menu4.gif" width="119" height="63" border="0" name="gnbmenu0104" id="gnbmenu0104" title="카테고리 등록"></a></li>
			<li><img src="${ctx}/resources/images/gnb/gnb_menu_line.gif" align="absmiddle" /></li>
			<li><a href="${ctx}/contents/creation" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('gnbmenu0105','','${ctx}/resources/images/gnb/menu5-ov.gif',1)">
<img src="${ctx}/resources/images/gnb/menu5.gif" width="131" height="63" border="0" name="gnbmenu0105" id="gnbmenu0105" title="컨텐츠 등록"></a></li>
			<li><img src="${ctx}/resources/images/gnb/gnb_menu_line.gif" align="absmiddle" /></li>
			<!-- <li><a href="#" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('gnbmenu0106','','${ctx}/resources/images/gnb/menu6-ov.gif',1)">
<img src="${ctx}/resources/images/gnb/menu6.gif" width="65" height="63" border="0" name="gnbmenu0106" id="gnbmenu0106" title="카테고리 보기"></a></li> -->
			<li style="position:relative"><div id="categoryBtn"><a href="#"><img src="${ctx}/resources/images/gnb/menu6.gif" alt="category Open" border="0" width="65" height="63" title="카테고리 보기"></a></div></li>
			<li><img src="${ctx}/resources/images/gnb/gnb_menu_line.gif" align="absmiddle" /></li>
		</ul>
	</div>
</div>

<!-- Category_Area - start -->
<div style="position:absolute; left:0px; top:193px; width:100%; height:125px; z-index:100000;">
	<div id="totalCategory" style="display:none;" class="category_area">
	<!-- category_menu - start  -->
		<ul id="category_menu" style="position:relative">
			<!-- category_select - start  -->
			<div style="position:absolute; left:959px; top:-4px; width:15px; height:8px; z-index:100001;">
			<img src="${ctx}/resources/images/gnb/i_category_sel.gif" />
			</div>
			<!-- category_select - end  -->
			<!-- btni_close - start  -->
			<div style="position:absolute; left:999px; top:0px; width:42px; height:40px; z-index:100002;">
			<input type="button" class="btni_close01" title="메뉴 닫기" id="btnClose" />
			</div>
			<!-- btni_close - end  -->
			<!-- 
			<li><a href="#"><div class="tl" style="width:90px;">맛있는 음식</div></a></li>
			<li><a href="#"><div class="tl" style="width:105px;">근사한 이벤트</div></a></li>
			<li><a href="#"><div class="tl" style="width:80px;">좋은 물건</div></a></li>
			<li><a href="#"><div class="tl" style="width:105px;">우리동네 가게</div></a></li>
			<li><a href="#"><div class="tl" style="width:80px;">멋진 경치</div></a></li>
			<li><a href="#"><div class="tl" style="width:100px;">즐거운 쇼핑</div></a>
				<ul style="width:95px;">
					<li><a href="#">Women</a></li>
					<li><a href="#">Men</a></li>
					<li><a href="#">Children</a></li>
					<li><a href="#">Senior</a></li>
					<li><a href="#">Home</a></li>
					<li><a href="#">Gifts</a></li>
					<li><a href="#">좋은 쇼핑몰</a></li>
				</ul>
			</li>
			<li><a href="#"><div class="tl" style="width:105px;">아름다운 사람</div></a></li>
			<li><a href="#"><div class="tl" style="width:100px;">신나는 여행</div></a>
				<ul style="width:95px;">
					<li><a href="#">가이드</a></li>
					<li><a href="#">숙박</a></li>
					<li><a href="#">명소</a></li>
					<li><a href="#">쇼핑</a></li>
				</ul>
			</li>
			<li><a href="#"><div class="tl" style="width:105px;">Cool Korea</div></a>
				<ul style="width:100px;">
					<li><a href="#">Travel Guide</a></li>
					<li><a href="#">Accommodations</a></li>
					<li><a href="#">Hot Places</a></li>
					<li><a href="#">Shopping</a></li>
					<li><a href="#">Friends</a></li>
				</ul>
			</li>
			<li><a href="#"><div class="tl" style="width:80px;">나쁜 사기</div></a></li>
			 -->
		</ul>
	<!-- category_menu - end  -->
	</div>
</div>
<!-- Category_Area - end -->


<!-- // GNB(header) - end // -->


<!--[if IE]></div><![endif]-->
<!--[if !IE]></div><![endif]-->
 