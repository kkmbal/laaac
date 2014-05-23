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
			<li class="sel">대분류 카테고리 명</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->
	<!-- Contents_Title - start -->
	<div class="contents_title">
		<ul>
			<li class="title">대분류 카테고리 명</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	<!-- Tab_Style02 - start -->
	<div class="tab_st02_area">
		<div class="btn fl"><input type="button" class="btni_arr04_prev" title="이전보기" onclick="" /></div>
		<div class="center fl">
			<ul class="tab_st02">
				<li><a href="#">서브카테고리 1</a></li>
				<li class="line">l</li>
				<li><a href="#">서브카테고리 2</a></li>
				<li class="line">l</li>
				<li><a href="#">서브카테고리 3</a></li>
				<li class="line">l</li>
				<li><a href="#">서브카테고리 4</a></li>
				<li class="line">l</li>
				<li><a href="#">서브카테고리 5</a></li>
			</ul>
		</div>
		<div class="btn fr"><input type="button" class="btni_arr04_next" title="다음보기" onclick="" /></div>
		<div class="cb"></div>
	</div>
	<!-- Tab_Style02 - end -->
	<div class="blank_height40"></div>
	<!-- ===== LAYOUT - start ===== -->
	<div class="contents_layout">
		<div class="fl" style="width:700px;">
			<!-- 좌측 - category_view - start -->
			<div class="cate_view"><a href="#"><img src="${ctx}/images/test/photo2_700_01.jpg" class="photo"></a></div>
			<!-- 좌측 - category_view - end -->
		</div>
		<div class="fl" style="width:10px;">&nbsp;</div>
		<div class="fl" style="width:290px;">
			<!-- 우측 - view_list - start -->
			<div class="cate_list">
				<ul>
					<li>
						<!-- 01 start -->
						<div class="photo fl"><a href="#"><img src="${ctx}/images/test/photo2_700_01.jpg" class="photo"></a></div>
						<div class="txt fl"><a href="#">던킨도너츠 3+3 이벤트!!<br>매주 수요일 5일,12일,19일</a></div>
						<!-- 01 end -->
					</li>
					<li>
						<!-- 02 start -->
						<div class="photo fl"><a href="#"><img src="${ctx}/images/test/photo2_700_02.jpg" class="photo"></a></div>
						<div class="txt fl"><a href="#">2014 대구국제섬유<br>박람회 프리뷰 인 대구</a></div>
						<!-- 02 end -->
					</li>
					<li>
						<!-- 03 start -->
						<div class="photo fl"><a href="#"><img src="${ctx}/images/test/photo2_700_03.jpg" class="photo"></a></div>
						<div class="txt fl"><a href="#">제주도, 산책길 새섬<br>가파도, 마라도, 비양도...</a></div>
						<!-- 03 end -->
					</li>
					<li>
						<!-- 04 start -->
						<div class="photo fl"><a href="#"><img src="${ctx}/images/test/photo2_700_04.jpg" class="photo"></a></div>
						<div class="txt fl"><a href="#">2014 대구국제섬유<br>박람회 프리뷰 인 대구</a></div>
						<!-- 04 end -->
					</li>
					<li>
						<!-- 05 start -->
						<div class="photo fl"><a href="#"><img src="${ctx}/images/test/photo2_700_05.jpg" class="photo"></a></div>
						<div class="txt fl"><a href="#">던킨도너츠 3+3 이벤트!!<br>매주 수요일 5일,12일,19일</a></div>
						<!-- 05 end -->
					</li>
					<li>
						<!-- 06 start -->
						<div class="photo fl"><a href="#"><img src="${ctx}/images/test/photo2_700_06.jpg" class="photo"></a></div>
						<div class="txt fl"><a href="#">제33회 금산인삼축제<br>Geumsan Insam Festival</a></div>
						<!-- 06 end -->
					</li>
				</ul>
			</div>
			<!-- 우측 - view_list - end -->
		</div>
	</div>
	<div class="cb"></div>
	<!-- ===== LAYOUT - end ===== -->
	<div class="blank_height50"></div>
	<!-- Title_1depth/btn - start -->
	<div class="title_1depth">
		<ul>
			<li class="title fl">서브카테고리 1</li>
			<li class="btn fr"><span class="t_num"><a href="#">34</a></span>&nbsp;<span class="t_num_txt">건</span>&nbsp;&nbsp;<input type="button" class="btni_more" title="더보기" onclick="" /></li>
		</ul>
	</div>
	<!-- Title_1depth/btn - end -->
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style04 - start -->
	<div class="cont_st04">
		<ul>
			<li class="col">
				<!-- 0101 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0101.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<!-- end -->
						</li>
					</ul>
				</div>
				<!-- 0101 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0102 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0102.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<!-- end -->
						</li>
					</ul>
				</div>
				<!-- 0102 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0103 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0103.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<!-- end -->
						</li>
					</ul>
				</div>
				<!-- 0103 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0104 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0104.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<!-- end -->
						</li>
					</ul>
				</div>
				<!-- 0104 - end -->
			</li>
		</ul>
	</div>
	<!-- ContentsBox_Style04 - end -->
	<div class="blank_height50"></div>
	<!-- Title_1depth/btn - start -->
	<div class="title_1depth">
		<ul>
			<li class="title fl">서브카테고리 2</li>
			<li class="btn fr"><span class="t_num"><a href="#">25</a></span>&nbsp;<span class="t_num_txt">건</span>&nbsp;&nbsp;<input type="button" class="btni_more" title="더보기" onclick="" /></li>
		</ul>
	</div>
	<!-- Title_1depth/btn - end -->
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style04 - start -->
	<div class="cont_st04">
		<ul>
			<li class="col">
				<!-- 0101 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0101.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<!-- end -->
						</li>
					</ul>
				</div>
				<!-- 0101 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0102 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0102.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<!-- end -->
						</li>
					</ul>
				</div>
				<!-- 0102 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0103 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0103.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<!-- end -->
						</li>
					</ul>
				</div>
				<!-- 0103 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0104 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0104.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
										<td><input type="button" class="btni_good03" title="좋아요" onclick="" /></td>
									</tr>
								</table>
								<!-- chart_gauge03 - end -->
							</div>
							<!-- end -->
						</li>
					</ul>
				</div>
				<!-- 0104 - end -->
			</li>
		</ul>
	</div>
	<!-- ContentsBox_Style04 - end -->


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