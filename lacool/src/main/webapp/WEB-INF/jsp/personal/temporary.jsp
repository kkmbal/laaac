<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>
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
			<li class="title fl">김동준 <span class="sub">님의 개인홈</span></li>
			<li class="tab_area fr">
				<!-- tab_style01 - start -->
				<div class="tab_st01">
					<ul>
						<li><a href="personal_home.html" target="_top">개인홈</a></li>
						<li><a href="personal_informaion.html" target="_top">개인정보 관리</a></li>
						<li><a href="scrap.html" target="_top">스크랩</a></li>
						<li class="sel"><a href="temporary.html" target="_top">임시저장</a></li>
						<li><a href="chat.html" target="_top">대화기록</a></li>
						<li><a href="member_cancel.html" target="_top">회원탈퇴</a></li>
					</ul>
				</div>
				<!-- tab_style01 - end -->
			</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height30"></div>
	<!-- title_1depth/btn - start -->
	<div class="title_1depth">
		<ul>
			<li class="title fl">임시저장 컨텐츠</li>
			<li class="num fr"><span class="t_num"><a href="#">345</a></span>&nbsp;<span class="t_num_txt">건</span></li>
		</ul>
	</div>
	<!-- title_1depth/btn - end -->
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style03 - start -->
	<div class="cont_st03">
		<ul>
			<li class="col">
				<!-- 0101 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0101.jpg" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
				<div class="btn fr"><input type="button" class="btni_write01" title="계속 작성" onclick="" />&nbsp;<input type="button" class="btni_del01" title="삭제" onclick="" /></div>
				<!-- 0101 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0102 - start -->
				<div class="photo"><img src="${ctx}/images/photo/imgs_no_232.gif" class="photo"></div>
				<div class="title"><span class="t_inact">제목 미등록</span></div>
				<div class="btn fr"><input type="button" class="btni_write01" title="계속 작성" onclick="" />&nbsp;<input type="button" class="btni_del01" title="삭제" onclick="" /></div>
				<!-- 0102 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0103 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0101.jpg" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
				<div class="btn fr"><input type="button" class="btni_write01" title="계속 작성" onclick="" />&nbsp;<input type="button" class="btni_del01" title="삭제" onclick="" /></div>
				<!-- 0103 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0104 - start -->
				<div class="photo"><img src="${ctx}/images/photo/imgs_no_232.gif" class="photo"></div>
				<div class="title"><span class="t_inact">제목 미등록</span></div>
				<div class="btn fr"><input type="button" class="btni_write01" title="계속 작성" onclick="" />&nbsp;<input type="button" class="btni_del01" title="삭제" onclick="" /></div>
				<!-- 0104 - end -->
			</li>
		</ul>
	</div>
	<!-- ContentsBox_Style03 - end -->
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style03 - start -->
	<div class="cont_st03">
		<ul>
			<li class="col">
				<!-- 0101 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0101.jpg" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
				<div class="btn fr"><input type="button" class="btni_write01" title="계속 작성" onclick="" />&nbsp;<input type="button" class="btni_del01" title="삭제" onclick="" /></div>
				<!-- 0101 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0102 - start -->
				<div class="photo"><img src="${ctx}/images/photo/imgs_no_232.gif" class="photo"></div>
				<div class="title"><span class="t_inact">제목 미등록</span></div>
				<div class="btn fr"><input type="button" class="btni_write01" title="계속 작성" onclick="" />&nbsp;<input type="button" class="btni_del01" title="삭제" onclick="" /></div>
				<!-- 0102 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0103 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/images/test/imgs_main0101.jpg" class="photo"></a></div>
				<div class="title"><span class="t_ellipsis" style="width:222px;"><a href="#">[오션리조트] 3인 가족 초대권 이벤트 3인 가족</a></span></div>
				<div class="btn fr"><input type="button" class="btni_write01" title="계속 작성" onclick="" />&nbsp;<input type="button" class="btni_del01" title="삭제" onclick="" /></div>
				<!-- 0103 - end -->
			</li>
			<li class="blank">&nbsp;</li>
			<li class="col">
				<!-- 0104 - start -->
				<div class="photo"><img src="${ctx}/images/photo/imgs_no_232.gif" class="photo"></div>
				<div class="title"><span class="t_inact">제목 미등록</span></div>
				<div class="btn fr"><input type="button" class="btni_write01" title="계속 작성" onclick="" />&nbsp;<input type="button" class="btni_del01" title="삭제" onclick="" /></div>
				<!-- 0104 - end -->
			</li>
		</ul>
	</div>
	<!-- ContentsBox_Style03 - end -->
	<div class="blank_height20"></div>
	<!-- Paging - start -->
	<div class="paging">
		<div class="btn fl"><input type="button" class="btni_first_inact" title="처음" onclick="" /><input type="button" class="btni_prev_inact" title="이전" onclick="" /></div>
		<div class="pagenum fl"><span class="iListNum">1</span></div>
		<div class="btn fr"><input type="button" class="btni_next_inact" title="다음" onclick="" /><input type="button" class="btni_last_inact" title="끝" onclick="" /></div>
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