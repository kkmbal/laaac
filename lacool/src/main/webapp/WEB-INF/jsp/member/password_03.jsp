<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

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
			<li class="sel">비밀번호 변경하기</li>
		</ul>
	</div>
	<!-- Local_Navi - end -->

	<!-- == 중앙정렬 == - start -->
	<div align="center">

	<!-- Contents_Title - start -->
	<div class="contents_title">
		<ul>
			<li class="title">비밀번호 변경하기</li>
		</ul>
	</div>
	<!-- Contents_Title - end -->
	<div class="blank_height20"></div>
	<div class="t_guide01" style="width:500px; text-align:left;"><img src="${ctx}/resources/images/icon/i_warn.gif" align="texttop"> 새로운 비밀번호를 입력해 주세요.</div>
	<div class="blank_height5"></div>
	<!-- Grid_Table_Input - start -->
	<table cellpadding="0" cellspacing="0" border="0" width="500" class="gridt_input" style="border-top:0px solid #f0f0f0;">
		<tr>
			<td class="left_st01"><input name="" type="text" class="input" style="width:480px;" value="새 비밀번호 (6자 이상 영문/숫자 혼합)"></td>
		</tr>
		<tr>
			<td class="left_st01"><input name="" type="text" class="input" style="width:480px;" value="새 비밀번호 확인"></td>
		</tr>
	</table>
	<!-- Grid_Table_Input - end -->
	<div class="blank_height5"></div>
	<!-- Btn_Form(Main) - start -->
	<div align="center"><input type="button" class="btnm_st01" value="완료" style="width:500px;" onclick="" /></div>
	<!-- Btn_Form(Main) - end -->

	</div>
	<!-- == 중앙정렬 == - end -->

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