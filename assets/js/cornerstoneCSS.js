//----------CSS Menu Created using AllWebMenus PRO ver 5.3-#940---------------
//C:\Users\leon\OneDrive\Clients\Architects NW\CornerstoneDesignsCSS.awm
// Copyright (c) Likno Software 2008-2013
// This code is property of Likno Software and licensed for use in *websites* only. It is *not* licensed for use in distributable implementations (applications or CD-based webs), unless the related license is provided by Likno Software.
// Any unauthorized use, reverse-engineering, alteration, transmission, transformation, or copying of any means (electronic or not) is strictly prohibited and will be prosecuted.
// *Removal of the present copyright notice is strictly prohibited*
var awmcssName = 'cornerstoneCSS';

if ("undefined"==typeof (document.buildLiknoCSSMenu)) {
	var awmcssLib = 'awmcsslib.js';
	var nua=navigator.userAgent,scriptNo=(nua.indexOf('Chrome')>-1)?2:((nua.indexOf('Safari')>-1)?7:(nua.indexOf('Gecko')>-1)?2:((document.layers)?3:((nua.indexOf('Opera')>-1)?4:((nua.indexOf('Mac')>-1)?5:1))));var awmcssmpi=document.location,xt="";
	var mpa=awmcssmpi.protocol+"//"+awmcssmpi.host;
	var awmcssmpi=awmcssmpi.protocol+"//"+awmcssmpi.host+awmcssmpi.pathname;
	if(scriptNo==1){oBC=document.all.tags("BASE");if(oBC && oBC.length) if(oBC[0].href) awmcssmpi=oBC[0].href;}
	while (awmcssmpi.search(/\\/)>-1) awmcssmpi=awmcssmpi.replace("\\","/");
	awmcssmpi=awmcssmpi.substring(0,awmcssmpi.lastIndexOf("/")+1);
	var e=document.getElementsByTagName("SCRIPT");
	for (var i=0;i<e.length;i++){if (e[i].src){if (e[i].src.indexOf(awmcssName+".js")!=-1){xt=e[i].src.split("/");if (xt[xt.length-1]==awmcssName+".js"){xt=e[i].src.substring(0,e[i].src.length-awmcssName.length-3);if (e[i].src.indexOf("://")!=-1){awmcssmpi=xt;}else{if(xt.substring(0,1)=="/")awmcssmpi=mpa+xt; else awmcssmpi+=xt;}}}}}
	while (awmcssmpi.search(/\/\.\//)>-1) {awmcssmpi=awmcssmpi.replace("/./","/");}

	var newjQ = document.createElement('script');
	newjQ.type = 'text/javascript';
	newjQ.onload = awmBuildCSSMenu_cornerstoneCSS;
	newjQ.onreadystatechange = awmBuildCSSMenu_cornerstoneCSS;
	newjQ.src = awmcssmpi+awmcssLib;
	document.getElementsByTagName("head")[0].appendChild(newjQ);
} else awmBuildCSSMenu_cornerstoneCSS();
	
function awmBuildCSSMenu_cornerstoneCSS () {
	if (typeof(document.buildLiknoCSSMenu)=="function") {
		document.buildLiknoCSSMenu({menuName:'cornerstoneCSS',ulliClass:'awmULLI-cornerstoneCSS',keyboardType:[1,0,0],tabMovement:1,alignParams:[[95,0,1,1,7,7],[180,0,0,0,0,0],[941,0,0,0,0,0]],posParams:[1,"nav",10,10,0,0],respMenus:[1]});
	} else {
		setTimeout(awmBuildCSSMenu_cornerstoneCSS,100);
	}
} 