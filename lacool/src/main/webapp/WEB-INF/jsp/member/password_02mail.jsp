<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<head>
<%@ include file="/WEB-INF/jsp/common/meta.jsp"%>
<%@ include file="/WEB-INF/jsp/common/jsLibs.jsp"%>

<style>
body {background-color: #fff; display: block; overflow-x:auto; overflow-y:scroll;}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, form, fieldset, p, button {margin: 0; padding: 0;}
body, h1, h2, h3, h4, input, button, select, textarea, div, th, td {
font-family: '돋움',Dotum,Helvetica,Arial,Sans-serif;
font-size: 14px;
color: #111111;
line-height:2.0em;
}
A:link		{font-size:14px; font-weight:normal; font-family:'돋움', Dotum, Tahoma, Arial, sans-serif; color:#111111; text-decoration:none;}
A:visited	{font-size:14px; font-weight:normal; font-family:'돋움', Dotum, Tahoma, Arial, sans-serif; color:#888888; text-decoration:none;}
A:hover		{font-size:14px; font-weight:normal; font-family:'돋움', Dotum, Tahoma, Arial, sans-serif; color:#111111; text-decoration:underline;}
A:active	{font-size:14px; font-weight:normal; font-family:'돋움', Dotum, Tahoma, Arial, sans-serif; color:#111111; text-decoration:underline;}

a {selector-dummy:expression(this.hideFocus=true);}

.btn01 {
	height: 44px;
	line-height: 2.8em;
	vertical-align: middle;	text-align: center;
	text-decoration: none;
	font-size: 16px; font-weight: bold; color: #ffffff;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 0 1px 1px rgba(221,221,221,1.0);
	-moz-box-shadow: 0 1px 1px rgba(221,221,221,1.0);
	box-shadow: 0 1px 1px rgba(221,221,221,1.0);
	cursor: pointer;
	border-width: 1px; border-style: solid;
	border-color: #ff3399 #ff3399 #ea1680 #ff3399;
	background-color:#ff3399;
	margin: 0;
	padding: 0px 20px 0px 20px;
	-webkit-padding-start: 20px; -webkit-padding-end: 20px;
	-moz-padding-start: 17px; -moz-padding-end: 17px;
 }
		.ie8    .btn01 {}
		.ie9    .btn01 {}
		.ienone .btn01 {}
.btn01:hover	{
	color: #ffffff;
	border-width: 1px; border-style: solid;
	border-color: #ea1680 #ea1680 #ea1680 #ea1680;
	background-color:#ea1680;
}
.btn01:active	{
	color: #ffffff;
	border-width: 1px; border-style: solid;
	border-color: #ea1680 #ea1680 #ea1680 #ea1680;
	background-color:#ea1680;
}
</style>
</head>

<body>


<!-- // Mail - start // -->
<div style="background-color: #ffffff; vertical-align: top; text-align: left; border: 0px; font-family: '돋움',Dotum,Helvetica,Arial,Sans-serif; font-size: 14px; color: #111111; line-height:2.0em; margin: 0; padding: 49px; width:550px;">

	<!-- logo - start -->
	<div style="height: 47px; border-bottom: 2px solid #111111; padding: 0px;"><img src="${ctx}/resources/images/mail/lalalacool_logo.gif" border="0"></div>
	<!-- logo - end -->

	<!-- Blank - start -->
	<div style="height:60px; font-size:60px; display:block; overflow:hidden;"></div>
	<!-- Blank - end -->

	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" valign="bottom" nowrap><span style="font-family:'돋움', Dotum, Tahoma, Arial, sans-serif; font-size: 35px; font-weight: bold; color: #000000; letter-spacing: -1px;">000</span></td>
			<td width="10">&nbsp;</td>
			<td align="left" valign="bottom"><img src="${ctx}/resources/images/mail/regist01.gif" border="0"></td>
		</tr>
		<tr>
			<td colspan="3" align="left" height="10"></td>
		</tr>
		<tr>
			<td colspan="3" align="left" valign="bottom"><img src="${ctx}/resources/images/mail/regist03.gif" border="0"></td>
		</tr>
	</table>

	<!-- Blank - start -->
	<div style="height:40px; font-size:40px; display:block; overflow:hidden;"></div>
	<!-- Blank - end -->

	새로운 비밀번호로 변경 후 사용 가능합니다.<br />

	비밀번호 변경을 위하여 아래의 URL에 접속하여 주시기 바랍니다.<br />

	<!-- Blank - start -->
	<div style="height:25px; font-size:25px; display:block; overflow:hidden;"></div>
	<!-- Blank - end -->

	<div align="center"><input type="button" class="btn01" value="www.lalalacool.com" style="width:550px;" onclick="" /></div>

	<!-- Blank - start -->
	<div style="height:30px; font-size:30px; display:block; overflow:hidden;"></div>
	<!-- Blank - end -->

	변경을 원치 않으면 본 이메일을 삭제하시면 됩니다.<br />
	lalalacool Team<br />

	<!-- Blank - start -->
	<div style="height:50px; font-size:50px; display:block; overflow:hidden;"></div>
	<!-- Blank - end -->

	<!-- Copy - start -->
	<div style="background-color: #f4f4f4; height: 34px; padding:6px 0px 0px 0px;" align="center">
		<ul style="list-style: none; width: 355px;">
			<li style="float: left; padding:0px;"><span style="font-size: 12px; color: #2e3235; font-weight:normal; line-height: 1.2em;">Copyright ⓒ 2014 lalalacool</span></li>
			<li style="float: left; padding:0px 20px 0px 20px;"><span style="font-size: 12px; color: #cfcfcf; font-weight:normal; line-height: 1.2em;">l</span></li>
			<li style="float: left; padding:0px;"><a href="#"><span style="font-size: 12px; color: #2e3235; font-weight:normal; line-height: 1.2em;">회원약관</span></a></li>
			<li style="float: left; padding:0px 20px 0px 20px;"><span style="font-size: 12px; color: #cfcfcf; font-weight:normal; line-height: 1.2em;">l</span></li>
			<li style="float: left; padding:0px;"><a href="#"><span style="font-size: 12px; color: #2e3235; font-weight:normal; line-height: 1.2em;">Contact Us</span></a></li>
		</ul>
	</div>
	<!-- Copy - end -->

</div>
<!-- // Mail - end // -->


</body>
</html>