<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>


<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">
var fromLimit = ${fromLimit};
var searchKeyword = '${searchKeyword}';


function listSearch(){
	var json = {
			"searchKeyword" : searchKeyword,
			"fromLimit" : fromLimit
		};		
	
	$.post("${ctx}/contents/listSearch?format=json", {data:JSON.stringify(json)}, function(data){
		if(data.error){
			alert(data.error);
			return;
		}
		//$("#opnDiv div").remove();
		if(data.listSearch){
			var json = $.parseJSON(JSON.stringify(data.listSearch));
			for(var i=0;i<json.length;i++){
				$("#search_div > ul").append(
						'<li>'
						+'<div class="search_set">'
						+'	<ul>'
						+'		<li class="photo"><a href="#"><img src="${ctx}/resources/images/upload/contents/'+json[i].apndFileNm+'" class="photo"></a></li>'
						+'		<li class="title">'
						+'			<div class="ti"><a href="#">'+json[i].notiTitle+'</a></div>'
						+'			<div class="name"><a href="#">'+json[i].userNm+'</a></div>'
						+'		</li>'
						+'		<li class="content">'
						+'			<span class="t_ellipsis_height" style="width:450px; height:81px;"><a href="#">'
						+'			<table cellpadding="0" cellspacing="0" border="0">'
						+'				<tr>'
						+'					<td width="450" height="81" align="left" valign="middle">'+json[i].notiConts+'</td>'
						+'				</tr>'
						+'			</table>'
						+'			</a></span>'
						+'		</li>'
						+'		<li class="chart">'
						+'			<div class="gauge">'
						+'				<table cellspacing="0" cellpadding="0" border="0">'
						+'					<tr>'
						+'						<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>'
						+'						<td width="151" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st04.gif" align="absmiddle"></td>'
						+'						<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>'
						+'					</tr>'
						+'				</table>'
						+'			</div>'
						+'			<div class="scrap"><a href="#">'+json[i].scrapCnt+'</a>&nbsp;<a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle"></a></div>'
						+'		</li>'
						+'	</ul>'
						+'</div>'
						+'</li>	'					
				);						
			}
		}	
		fromLimit = data.fromLimit;
	});	
	event.stopPropagation();
	event.preventDefault();
}

	$(document).ready(function(){
		
		
		
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
			<li class="sel">검색</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->
	<!-- Contents_Title - start -->
	<div class="contents_title">
		<ul>
			<li class="title">검색</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	<!-- Title_1depth/btn - start -->
	<div class="title_1depth">
		<ul>
			<li class="title fl">검색 결과</li>
			<li class="num fr"><span class="t_num"><a href="#">${totalCnt}</a></span>&nbsp;<span class="t_num_txt">건</span></li>
		</ul>
	</div>
	<!-- Title_1depth/btn - end -->
	<!-- Search_List - start -->
	<div class="search_list" id="search_div">
		<ul>
			<c:forEach var="result" items="${listSearch}" varStatus="status">
			<li>
				<!-- search_set01 - start -->
				<div class="search_set">
					<ul>
						<li class="photo"><a href="#"><img src="${ctx}/resources/images/upload/contents/${result.apndFileNm}" class="photo"></a></li>
						<li class="title">
							<div class="ti"><a href="#">${result.notiTitle}</a></div>
							<div class="name"><a href="#">${result.userNm}</a></div>
						</li>
						<li class="content">
							<span class="t_ellipsis_height" style="width:450px; height:81px;"><a href="#">
							<!-- table - start -->
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="450" height="81" align="left" valign="middle">${result.notiConts}</td>
								</tr>
							</table>
							<!-- table - end -->
							</a></span>
						</li>
						<li class="chart">
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="151" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st04.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<div class="scrap"><a href="#">${result.scrapCnt}</a>&nbsp;<a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle"></a></div>
						</li>
					</ul>
				</div>
				<!-- search_set01 - end -->
			</li>
			</c:forEach>
			
			<%-- 
			<li>
				<!-- search_set02 - start -->
				<div class="search_set">
					<ul>
						<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo1_250_02.jpg" class="photo"></a></li>
						<li class="title">
							<div class="ti"><a href="#">마우나리조트 가족초대권</a></div>
							<div class="name"><a href="#">워터케어</a></div>
						</li>
						<li class="content">
							<span class="t_ellipsis_height" style="width:450px; height:81px;"><a href="#">
							<!-- table - start -->
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="450" height="81" align="left" valign="middle">3인 가족 초대권 이벤트!! 경기도 가평 1박2일 / 2박3일 / 선착순 접수중 / 무료</td>
								</tr>
							</table>
							<!-- table - end -->
							</a></span>
						</li>
						<li class="chart">
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="151" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st04.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<div class="scrap"><a href="#">1278</a>&nbsp;<a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle"></a></div>
						</li>
					</ul>
				</div>
				<!-- search_set02 - end -->
			</li>
			<li>
				<!-- search_set03 - start -->
				<div class="search_set">
					<ul>
						<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo1_250_03.jpg" class="photo"></a></li>
						<li class="title">
							<div class="ti"><a href="#">[EXCO] 2014 대구 국제 섬유박람회 프리뷰 인 대구</a></div>
							<div class="name"><a href="#">금순이</a></div>
						</li>
						<li class="content">
							<span class="t_ellipsis_height" style="width:450px; height:81px;"><a href="#">
							<!-- table - start -->
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="450" height="81" align="left" valign="middle">2014 대구국제섬유박람회 프리뷰 인 대구<br>
									- 기간 : 2014.03.05(수) ~ 03.07(금), 3일간<br>
									- 장소 : EXCO 1층 - 시간 : 오전10:00 ~ 오후06:00 ...</td>
								</tr>
							</table>
							<!-- table - end -->
							</a></span>
						</li>
						<li class="chart">
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="151" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st04.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<div class="scrap"><a href="#">978</a>&nbsp;<a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle"></a></div>
						</li>
					</ul>
				</div>
				<!-- search_set03 - end -->
			</li>
			<li>
				<!-- search_set04 - start -->
				<div class="search_set">
					<ul>
						<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo1_250_04.jpg" class="photo"></a></li>
						<li class="title">
							<div class="ti"><a href="#">제33회 금산인삼축제 Geumsan Insam Festival...</a></div>
							<div class="name"><a href="#">덩이의 행복이야기</a></div>
						</li>
						<li class="content">
							<span class="t_ellipsis_height" style="width:450px; height:81px;"><a href="#">
							<!-- table - start -->
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="450" height="81" align="left" valign="middle">The 33rd Geumsan Insam Festival<br>
									금산으로의 건강여행, 당신의 미래가 건강해 집니다.<br>
									- 2013년 9월6일(금) ~ 2014년 3월30일(일) ...</td>
								</tr>
							</table>
							<!-- table - end -->
							</a></span>
						</li>
						<li class="chart">
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="151" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st04.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<div class="scrap"><a href="#">52</a>&nbsp;<a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle"></a></div>
						</li>
					</ul>
				</div>
				<!-- search_set04 - end -->
			</li>
			<li>
				<!-- search_set05 - start -->
				<div class="search_set">
					<ul>
						<li class="photo"><a href="#"><img src="${ctx}/resources/images/test/photo1_250_05.jpg" class="photo"></a></li>
						<li class="title">
							<div class="ti"><a href="#">ETUDE HOUSE 올봄, 프린세스가 되다!!</a></div>
							<div class="name"><a href="#">추억의 한페이지</a></div>
						</li>
						<li class="content">
							<span class="t_ellipsis_height" style="width:450px; height:81px;"><a href="#">
							<!-- table - start -->
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="450" height="81" align="left" valign="middle">2014 NEW EVENT 1+1!! 가볍고 생생한 컬러로 올봄, 프린세스가 되다.<br>판타지 핫 핑크 + 드림 핫 코랄</td>
								</tr>
							</table>
							<!-- table - end -->
							</a></span>
						</li>
						<li class="chart">
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="151" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st04.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<div class="scrap"><a href="#">8</a>&nbsp;<a href="#"><img src="${ctx}/resources/images/icon/i_scrap.gif" align="absmiddle"></a></div>
						</li>
					</ul>
				</div>
				<!-- search_set05 - end -->
			</li>
			--%>
		</ul>
	</div>
	<!-- Search_List - end -->

	<div class="blank_height20"></div>

	<!-- More_Btn - start -->
	<div class="more">
		<div class="btn fl">&nbsp;</div>
		<div class="center fl"><img src="${ctx}/resources/images/icon/i-more.gif" align="absmiddle"><a href="#" onclick="listSearch()">더보기</a></div>
		<div class="btn fr"><input type="button" class="btni_top" title="위로" onclick="" /></div>
		<div class="cb"></div>
	</div>
	<!-- More_Btn - end -->


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