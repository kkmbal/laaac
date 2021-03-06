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
				<li class="sel"><a href="#">서브카테고리 2</a></li>
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
	<div>
		<select name="" class="select" style="width:234px;">
		<option value="" selected>좋아요 순</option>
		<option value="">나빠요 순</option>
		<option value="">최신 순</option>
		<option value="">클릭 순</option>
		<option value="">전체</option>
		</select>
	</div>
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style04 - start -->
	<div class="cont_st04">
		<ul>
			<li class="col">
				<!-- 0101 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0101.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/resources/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
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
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0102.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/resources/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
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
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0103.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/resources/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
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
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0104.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/resources/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
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
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style04 - start -->
	<div class="cont_st04">
		<ul>
			<li class="col">
				<!-- 0101 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0101.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/resources/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
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
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0102.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/resources/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
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
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0103.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/resources/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
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
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/test/imgs_main0104.jpg" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/resources/images/test/photo_user01.jpg" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
							<div class="gauge">
								<!-- chart_gauge03 - start -->
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td><input type="button" class="btni_bad03" title="나빠요" onclick="" /></td>
										<td width="131" height="20" align="center" valign="middle"><img src="${ctx}/resources/images/test/ct_gauge_st03.gif" align="absmiddle"></td>
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
	<div class="blank_height20"></div>
	<!-- Paging - start -->
	<div class="paging">
		<div class="btn fl"><input type="button" class="btni_first_inact" title="처음" onclick="" /><input type="button" class="btni_prev_inact" title="이전" onclick="" /></div>
		<div class="pagenum fl"><span class="iListNum">1</span><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a><a href="#">9</a><a href="#">10</a></div>
		<div class="btn fr"><input type="button" class="btni_next" title="다음" onclick="" /><input type="button" class="btni_last" title="끝" onclick="" /></div>
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