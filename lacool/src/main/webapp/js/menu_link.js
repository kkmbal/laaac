var menuId;
function MM_preloadImages() { // v3.0
	var d = document;
	if (d.images) {
		if (!d.MM_p)
			d.MM_p = new Array();
		var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
		for (i = 0; i < a.length; i++)
			if (a[i].indexOf("#") != 0) {
				d.MM_p[j] = new Image;
				d.MM_p[j++].src = a[i];
			}
	}
}

function MM_swapImgRestore() { // v3.0
	MenuOn(menuId);
	var i, x, a = document.MM_sr;
	for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
		x.src = x.oSrc;
}

function MM_findObj(n, d) { // v4.01
	var p, i, x;
	if (!d)
		d = document;
	if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
		d = parent.frames[n.substring(p + 1)].document;
		n = n.substring(0, p);
	}
	if (!(x = d[n]) && d.all)
		x = d.all[n];
	for (i = 0; !x && i < d.forms.length; i++)
		x = d.forms[i][n];
	for (i = 0; !x && d.layers && i < d.layers.length; i++)
		x = MM_findObj(n, d.layers[i].document);
	if (!x && d.getElementById)
		x = d.getElementById(n);
	return x;
}

function MM_swapImage() { // v3.0
	var i, j = 0, x, a = MM_swapImage.arguments;
	document.MM_sr = new Array;
	for (i = 0; i < (a.length - 2); i += 3)
		if ((x = MM_findObj(a[i])) != null) {
			document.MM_sr[j++] = x;
			if (!x.oSrc)
				x.oSrc = x.src;
			x.src = a[i + 2];
		}
}
//-->



// GNB MENU의 링크값

function GoMenu(name) {
    if (eval(name) == "") {
        alert("서비스 준비중입니다.");
        return;    
    } else {
		document.location.href = eval(name);
	}
}



// GNB 메뉴 활성화
	function MenuOn(gnbNum)
	{
		menuId = gnbNum;
		switch(gnbNum) {

		case 0101 : gnbmenu0101.src=ctx+"/images/gnb/menu1-sel.gif"; break;
		case 0102 : gnbmenu0102.src=ctx+"/images/gnb/menu2-sel.gif"; break;
		case 0103 : gnbmenu0103.src=ctx+"/images/gnb/menu3-sel.gif"; break;
		case 0104 : gnbmenu0104.src=ctx+"/images/gnb/menu4-sel.gif"; break;
		case 0105 : gnbmenu0105.src=ctx+"/images/gnb/menu5-sel.gif"; break;
		
		}
	}
	
	
	
