<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<script type="text/javascript">

$(document).ready(function(){
	$("#period").change(function(){
		location.href = "${ctx}/contents/listHistory?period="+$(this).val();
	});
});
</script>
</head>

<body onLoad="javascript:MenuOn(0103);">
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
			<li class="sel">HISTORY</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->
	<!-- Contents_Title - start -->
	<div class="contents_title">
		<ul>
			<li class="title">HISTORY</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height20"></div>
	<div>
		<select name="period" id="period" class="select" style="width:234px;">
		<option value="7" <c:if test="${period=='7'}">selected</c:if> >1주일</option>
		<option value="15" <c:if test="${period=='15'}">selected</c:if> >15일</option>
		<option value="30" <c:if test="${period=='30'}">selected</c:if> >30일</option>
		<option value="180" <c:if test="${period=='180'}">selected</c:if> >6개월</option>
		<option value="" <c:if test="${empty period}">selected</c:if> >전체</option>
		</select>
	</div>
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style04 - start -->
	<div class="cont_st04">
		<ul>
			<c:forEach var="result" items="${listHistory}" end="3" varStatus="status">
			<li class="col">
				<!-- 0101 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/upload/${result.apndFileNm}" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/${result.userFilePath}${result.userFileNm}" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">${result.notiTitle}</a></span></div>
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
			</c:forEach>
			
			<%-- 
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
			--%>
		</ul>
	</div>
	<!-- ContentsBox_Style04 - end -->
	<div class="blank_height20"></div>
	<!-- ContentsBox_Style04 - start -->
	<div class="cont_st04">
		<ul>
			<c:forEach var="result" items="${listHistory}" begin="4" varStatus="status">
			<li class="col">
				<!-- 0101 - start -->
				<div class="photo"><a href="#"><img src="${ctx}/resources/images/upload/${result.apndFileNm}" class="photo"></a></div>
				<div class="content">
					<ul>
						<li><div class="photo_user"><a href="#"><img src="${ctx}/${result.userFilePath}${result.userFileNm}" class="photo_user"></a></div></li>
						<li>
							<!-- start -->
							<div class="title"><span class="t_ellipsis" style="width:170px;"><a href="#">${result.notiTitle}</a></span></div>
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
			</c:forEach>
			
			<%-- 
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
			--%>
		</ul>
	</div>
	<!-- ContentsBox_Style04 - end -->
	<div class="blank_height20"></div>
	<div class="paging">
		  <k:paging name="${pageInfo}" action="contents/listHistory" jsFunction="fn_link_page">
		    <div class="btn fl">
		  	<k:get property="firstPage"/><k:get property="prevPageGroup"/>
		  	</div>
		  	<div class="pagenum fl">
		  	<k:get property="paging"/>
		  	</div>
		  	<div class="btn fr">
		  	<k:get property="nextPageGroup"/><k:get property="lastPage"/>
		  	</div>
		  </k:paging>
		<div class="cb"></div>
	</div>		
	
	
	
	<%-- 
	<!-- Paging - start -->
	<div class="paging">
		<div class="btn fl"><input type="button" class="btni_first" title="처음" onclick="" /><input type="button" class="btni_prev" title="이전" onclick="" /></div>
		<div class="pagenum fl"><a href="#">1</a><a href="#">2</a><span class="iListNum">3</span><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a><a href="#">9</a><a href="#">10</a></div>
		<div class="btn fr"><input type="button" class="btni_next" title="다음" onclick="" /><input type="button" class="btni_last" title="끝" onclick="" /></div>
		<div class="cb"></div>
	</div>
	<!-- Paging - end -->
	--%>

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