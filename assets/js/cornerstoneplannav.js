var awmMenuName='cornerstoneplannav';
var awmLibraryBuild=868;
var awmLibraryPath='/assets/js/plannavigation/awmdata';
var awmImagesPath='/assets/plannavimages/';
var awmSupported=(navigator.appName + navigator.appVersion.substring(0,1)=="Netscape5" || document.all || document.layers || navigator.userAgent.indexOf('Opera')>-1 || navigator.userAgent.indexOf('Konqueror')>-1)?1:0;
if (awmAltUrl!='' && !awmSupported) window.location.replace(awmAltUrl);
if (awmSupported){
var nua=navigator.userAgent,scriptNo=(nua.indexOf('Chrome')>-1)?2:((nua.indexOf('Safari')>-1)?2:(nua.indexOf('Gecko')>-1)?2:((nua.indexOf('Opera')>-1)?4:1));
var mpi=document.location,xt="";
var mpa=mpi.protocol+"//"+mpi.host;
var mpi=mpi.protocol+"//"+mpi.host+mpi.pathname;
if(scriptNo==1){oBC=document.all.tags("BASE");if(oBC && oBC.length) if(oBC[0].href) mpi=oBC[0].href;}
while (mpi.search(/\\/)>-1) mpi=mpi.replace("\\","/");
mpi=mpi.substring(0,mpi.lastIndexOf("/")+1);
var e=document.getElementsByTagName("SCRIPT");
for (var i=0;i<e.length;i++){if (e[i].src){if (e[i].src.indexOf(awmMenuName+".js")!=-1){xt=e[i].src.split("/");if (xt[xt.length-1]==awmMenuName+".js"){xt=e[i].src.substring(0,e[i].src.length-awmMenuName.length-3);if (e[i].src.indexOf("://")!=-1){mpi=xt;}else{if(xt.substring(0,1)=="/")mpi=mpa+xt; else mpi+=xt;}}}}}
while (mpi.search(/\/\.\//)>-1) {mpi=mpi.replace("/./","/");}
var awmMenuPath=mpi.substring(0,mpi.length-1);
while (awmMenuPath.search("'")>-1) {awmMenuPath=awmMenuPath.replace("'","%27");}
document.write("<SCRIPT SRC='"+awmMenuPath+awmLibraryPath+"/awmlib"+scriptNo+".js'><\/SCRIPT>");
var n=null;
awmzindex=1050;
}

var awmImageName='';
var awmPosID='nav';
var awmSubmenusFrame='';
var awmSubmenusFrameOffset;
var awmOptimize=0;
var awmHash='NDBBADVSVLYMPKMIKGQEHCMALYGWYR';
var awmDotGif=1;
var awmNoMenuPrint=1;
var awmUseTrs=0;
var awmMarg=[0,0,0,0];
var awmSepr=["0","","",""];
function awmBuildMenu(){
if (awmSupported){
awmImagesColl=["main-button-tile.jpg",16,44,"main-header.jpg",7,44,"main-footer.jpg",7,44,"main-buttonOver-tile.jpg",2,44,"main-buttonOver-left.jpg",9,44,"main-buttonOver-right.jpg",11,44];
awmCreateCSS(0,1,0,n,n,0,n,n,'none','0','#000000','0px 0px 0px 0',0,'0px / 0px',n);
awmCreateCSS(1,2,1,'#FFFFFF',n,0,'bold 12px Tahoma',n,'none','0','#000000','0px 4px 0px 4',1,'0px / 0px',n);
awmCreateCSS(0,2,1,'#FFFFFF',n,3,'bold 12px Tahoma',n,'none','0','#000000','0px 4px 0px 4',1,'0px / 0px',n);
awmCreateCSS(0,2,1,'#FFFFFF',n,3,'bold 12px Tahoma',n,'none','0','#000000','0px 4px 0px 4',1,'0px / 0px',n);
awmCreateCSS(1,2,1,'#FFFFFF',n,0,'bold 12px Tahoma',n,'none','0','#000000','0px 4px 0px 4',1,'0px / 0px',n);
awmCreateCSS(1,2,1,'#FFFFFF',n,n,'14px sans-serif',n,'none','0','#000000','0px 0px 0px 0',0,'0px / 0px',n);
awmCreateCSS(1,2,1,'#000000',n,n,'14px sans-serif',n,'none','0','#000000','0px 0px 0px 0',0,'0px / 0px',n);
awmCreateCSS(0,1,0,n,n,n,n,n,'none','0','#000000','0px 0px 0px 0',0,'0px / 0px',n);
awmCreateCSS(1,2,0,'#000000','#E6EBE7',n,'bold 12px Tahoma',n,'none none solid none','0px 0px 1px 0','#000000 #000000 #FFFFFF #000000','0px 5px 0px 5',1,'0px / 0px',n);
awmCreateCSS(0,2,0,'#000000','#CED9D1',n,'bold 12px Tahoma',n,'none none solid none','0px 0px 1px 0','#000000 #000000 #FFFFFF #000000','0px 5px 0px 5',1,'0px / 0px',n);
awmCreateCSS(0,2,0,'#000000','#CED9D1',n,'bold 12px Tahoma',n,'none none solid none','0px 0px 1px 0','#000000 #000000 #FFFFFF #000000','0px 5px 0px 5',1,'0px / 0px',n);
awmCreateCSS(1,2,0,'#000000','#E6EBE7',n,'bold 12px Tahoma',n,'none none solid none','0px 0px 1px 0','#000000 #000000 #FFFFFF #000000','0px 5px 0px 5',1,'0px / 0px',n);
awmCreateCSS(1,2,1,'#FFFFFF',n,n,'14px sans-serif',n,'none','0','#000000','0px 0px 0px 0',0,'0px / 0px',n);
awmCreateCSS(1,2,1,'#000000',n,n,'14px sans-serif',n,'none','0','#000000','0px 0px 0px 0',0,'0px / 0px',n);
awmCreateCSS(0,1,0,n,n,n,n,n,'solid','1','#808080','0px 0px 0px 0',0,'0px / 0px',n);
awmCreateCSS(1,2,1,'#000000','#FFFFFF',n,'11px Tahoma',n,'solid','2','#000000','0px 5px 0px 5',1,'0px / 0px',n);
awmCreateCSS(0,2,1,'#000000','#C7DDD3',n,'11px Tahoma',n,'solid','2','#000000','0px 5px 0px 5',1,'0px / 0px',n);
awmCreateCSS(0,2,1,'#000000','#C7DDD3',n,'11px Tahoma',n,'solid','2','#000000','0px 5px 0px 5',1,'0px / 0px',n);
awmCreateCSS(1,2,1,'#000000','#FFFFFF',n,'11px Tahoma',n,'solid','2','#000000','0px 5px 0px 5',1,'0px / 0px',n);
awmCreateCSS(1,2,1,'#FFFFFF',n,n,'14px sans-serif',n,'none','0','#000000','0px 0px 0px 0',0,'0px / 0px',n);
awmCreateCSS(1,2,1,'#000000',n,n,'14px sans-serif',n,'none','0','#000000','0px 0px 0px 0',0,'0px / 0px',n);
var s0=awmCreateMenu(0,0,0,0,1,0,0,0,0,0,15,0,1,0,0,0,1,n,n,100,1,0,10,10,941,-1,1,200,200,0,0,0,"0,0,0",n,n,n,n,n,n,n,n,0,0,0,0,0,0,0,0,1,0);
it=s0.pm.mkFI(n,n,n,92,44,n,4,4,n,5,5,1,1,1,0,n,n,n,n,n,n,3,3,3,"0,0","0,0","0,0",n,0,0,0,0,0,0);
it=s0.pm.mkFI(n,n,n,180,32,n,n,n,n,n,n,0,0,0,0,n,n,n,n,n,n,3,3,3,"0,0","0,0","0,0",n,0,0,0,0,0,0);
it=s0.pm.mkFI(n,n,n,0,32,n,n,n,n,n,n,0,0,0,0,n,n,n,n,n,n,3,3,3,"0,0","0,0","0,0",n,0,0,0,0,0,0);
it=s0.pm.mkFI(n,n,n,0,0,n,n,n,n,n,n,0,0,0,0,n,n,n,1,1,1,3,3,3,"0,0","0,0","0,0",n,0,0,0,0,0,0);
it=s0.pm.mkFI(n,n,n,0,0,n,n,n,n,n,n,0,0,0,0,n,n,n,2,2,2,3,3,3,"2,2","2,2","2,2",n,0,0,0,0,0,0);
it=s0.pm.mkFI(n,n,n,0,0,n,n,n,n,n,n,0,0,0,0,n,n,n,n,n,n,3,3,3,"0,0","0,0","0,0",n,0,0,0,0,0,0);
it=s0.pm.mkFI(n,n,n,0,0,n,n,n,n,n,n,0,0,0,0,n,n,n,n,n,n,3,3,3,"2,2","2,2","2,2",n,0,0,0,0,0,0);
it=s0.pm.mkFI(n,n,n,0,0,n,n,n,n,n,n,0,0,0,0,n,n,n,n,n,n,3,3,3,"0,0","0,0","0,0",n,0,0,0,0,0,0);
it=s0.pm.mkFI(n,n,n,0,0,n,n,n,n,n,n,0,0,0,0,n,n,n,n,n,n,3,3,3,"2,2","2,2","2,2",n,0,0,0,0,0,0);
s1=s0.pm.mkFS(1,1);
s1=s0.pm.mkFS(0,0,0,0,0,0,0,0,1,0,100,5,0,-1,1,200,200,0,0,"0,0,0",0,0,0,"0",1);
s1=s0.pm.mkFS(0,0,-1,0,0,2,0,0,1,0,100,-2,0,-1,1,200,200,0,0,"0,0,0",0,0,0,"0",1);
s0.pm.ioUL="planSubNavigation";
s0.pm.buildMenu(1);
}}