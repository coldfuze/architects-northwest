//----------DHTML Menu Created using AllWebMenus PRO ver 5.3-#940---------------
//C:\Users\leon\OneDrive\Clients\Architects NW\ArchitectsNW.awm
var awmMenuName='architectsnw';
var awmLibraryBuild=940;
var awmLibraryPath='/';
var awmImagesPath='/../plannavimages';
var awmSupported=(navigator.appName + navigator.appVersion.substring(0,1)=="Netscape5" || document.all || document.layers || navigator.userAgent.indexOf('Opera')>-1 || navigator.userAgent.indexOf('Konqueror')>-1)?1:0;
if (awmSupported){
var nua=navigator.userAgent,scriptNo=(nua.indexOf('Chrome')>-1||nua.indexOf('Safari')>-1||nua.indexOf('Gecko')>-1||nua.indexOf('Opera')>-1||nua.indexOf('Lumia')>-1||nua.indexOf('WPDesktop')>-1)?2:1;
var mpi=document.location,xt="";
var mpa=mpi.protocol+"//"+mpi.host;
var mpi=mpi.protocol+"//"+mpi.host+mpi.pathname;
if(scriptNo==1){oBC=document.all.tags("BASE");if(oBC && oBC.length) if(oBC[0].href) mpi=oBC[0].href;}
while (mpi.search(/\\/)>-1) mpi=mpi.replace("\\","/");
mpi=mpi.substring(0,mpi.lastIndexOf("/")+1);
var mpin=mpi;
var e=document.getElementsByTagName("SCRIPT");
for (var i=0;i<e.length;i++){if (e[i].src){if (e[i].src.indexOf(awmMenuName+".js")!=-1){xt=e[i].src.split("/");if (xt[xt.length-1]==awmMenuName+".js"){xt=e[i].src.substring(0,e[i].src.length-awmMenuName.length-3);if (e[i].src.indexOf("://")!=-1){mpi=xt;}else{if(xt.substring(0,1)=="/")mpi=mpa+xt; else mpi+=xt;}}}}}
while (mpi.search(/\/\.\//)>-1) {mpi=mpi.replace("/./","/");}
var awmMenuPath=mpi.substring(0,mpi.length-1);
while (awmMenuPath.search("'")>-1) {awmMenuPath=awmMenuPath.replace("'","%27");}
document.write("<SCRIPT SRC='"+(awmMenuPath+awmLibraryPath).replace(/\/$/,"")+"/awmlib"+scriptNo+".js'><\/SCRIPT>");
var n=null;
awmzindex=1000;
}

var awmImageName='';
var awmPosID='nav';
var awmPosClass='';
var awmSubmenusFrame='';
var awmSubmenusFrameOffset;
var awmOptimize=0;
var awmHash='IPTUYKHWXNSUFISWGKCYJMEATOECMB';
var awmNoMenuPrint=1;
var awmUseTrs=0;
var awmSepr=["0","","","","90","#FFFFFF","","3"];
var awmMarg=[0,0,0,0];
function awmBuildMenu(){
if (awmSupported){
awmImagesColl=["main-header.jpg",7,44,"main-footer.jpg",7,44];
awmCreateCSS(0,1,0,n,'#4A5A48',n,n,n,'none','0','#000000','0px 0px 0px 0',0,'0px / 0px',n);
awmCreateCSS(1,2,1,'#FFFFFF',n,n,'bold 12px Tahoma',n,'none','0','#000000','0px 4px 0px 4',1,'0px / 0px',n);
awmCreateCSS(0,2,1,'#BCDCB0',n,n,'bold 12px Tahoma',n,'none','0','#000000','0px 4px 0px 4',1,'0px / 0px',n);
awmCreateCSS(0,1,0,n,n,n,n,n,'solid','1','#808080','0px 0px 0px 0',0,'0px / 0px',n);
awmCreateCSS(1,2,0,'#000000','#E6EBE7',n,'bold 11px Tahoma',n,'dotted','1','#526251','0px 5px 0px 5',1,'0px / 0px',n);
awmCreateCSS(0,2,0,'#000000','#CED9D1',n,'bold 11px Tahoma',n,'dotted','1','#CACCBB','0px 5px 0px 5',1,'0px / 0px',n);
var s0=awmCreateMenu(0,0,0,0,1,0,0,0,0,0,15,0,1,0,0,0,1,n,n,100,1,0,0,0,941,-1,1,200,200,0,0,0,"0,0,0",n,n,n,n,n,n,n,n,0,0,0,0,0,0,0,0,1,0,0,2,n,n,'',n,0,[],0,"");
it=s0.addItem(1,2,2,"HOME",n,n,"","",n,n,n,"/default.cfm",n,95,44,2,1,0,0,n);
it=s0.addItem(1,2,2,"FIND A<BR>PLAN",n,n,"","",n,n,n,n,n,95,44,2,1,0,1,n);
var s1=it.addSubmenu(0,0,-1,1,3,0,0,3,0,1,0,n,n,100,5,1,0,-1,1,200,200,1,3,"0,0,0",0,"0",1,0,"");
it=s1.addItem(4,5,5,"POPULAR SEARCHES",n,n,"","/plans/popularSearches.cfm",n,n,n,"/plans/popularSearches.cfm",n,180,32,2,0,0,10,n);
it=s1.addItem(4,5,5,"ADVANCED SEARCH",n,n,"","/plans/",n,n,n,"/plans/",n,180,32,2,0,0,9,n);
it=s1.addItem(4,5,5,"ARCHITECTURAL STYLES",n,n,"","/plans/architecturalStyles.cfm",n,n,n,"/plans/architecturalStyles.cfm",n,180,32,2,0,0,11,n);
it=s1.addItem(4,5,5,"HOUSE PLAN COLLECTIONS",n,n,"","/plans/housePlanCollections.cfm",n,n,n,"/plans/housePlanCollections.cfm",n,180,32,2,0,0,12,n);
it=s1.addItem(4,5,5,"NEW PLANS",n,n,"","/plans/planSearchResults.cfm?Id=6",n,n,n,"/plans/planSearchResults.cfm?Id=6",n,180,32,2,0,0,13,n);
it=s0.addItem(1,2,2,"ABOUT<BR>PLANS",n,n,"","",n,n,n,n,n,95,44,2,1,0,2,n);
var s1=it.addSubmenu(0,0,-1,1,3,0,0,3,0,1,0,n,n,100,5,2,0,-1,1,200,200,1,3,"0,0,0",0,"0",1,0,"");
it=s1.addItem(4,5,5,"BUILDING CODES",n,n,"","/aboutPlans/buildingCodes.cfm",n,n,n,"/aboutPlans/buildingCodes.cfm",n,180,32,2,0,0,15,n);
it=s1.addItem(4,5,5,"COPYRIGHT INFORMATION",n,n,"","/aboutPlans/copyrightInformation.cfm",n,n,n,"/aboutPlans/copyrightInformation.cfm",n,180,32,2,0,0,16,n);
it=s1.addItem(4,5,5,"PLAN MODIFICATIONS",n,n,"","/aboutPlans/planModifications.cfm",n,n,n,"/aboutPlans/planModifications.cfm",n,180,32,2,0,0,18,n);
it=s1.addItem(4,5,5,"PLAN PACKAGES",n,n,"","/aboutPlans/planPackages.cfm",n,n,n,"/aboutPlans/planPackages.cfm",n,180,32,2,0,0,17,n);
it=s1.addItem(4,5,5,"PLAN PACKAGE CONTENTS",n,n,"","/aboutPlans/planPackageContents.cfm",n,n,n,"/aboutPlans/planPackageContents.cfm",n,180,32,2,0,0,19,n);
it=s0.addItem(1,2,2,"DESIGN<BR>SERVICES",n,n,"","",n,n,n,n,n,95,44,2,1,0,3,n);
var s1=it.addSubmenu(0,0,-1,1,3,0,0,3,0,1,0,n,n,100,5,3,0,-1,1,200,200,1,3,"0,0,0",0,"0",1,0,"");
it=s1.addItem(4,5,5,"CUSTOM HOME DESIGNS",n,n,"","/designServices/customHomeDesigns.cfm",n,n,n,"/designServices/customHomeDesigns.cfm",n,180,32,2,0,0,20,n);
it=s1.addItem(4,5,5,"MULTI-FAMILY DESIGNS",n,n,"","/designServices/multiFamilyDesigns.cfm",n,n,n,"/designServices/multiFamilyDesigns.cfm",n,180,32,2,0,0,21,n);
it=s1.addItem(4,5,5,"NEIGHBORHOOD DESIGNS",n,n,"","/designServices/neighborhoodDesigns.cfm",n,n,n,"/designServices/neighborhoodDesigns.cfm",n,180,32,2,0,0,22,n);
it=s0.addItem(1,2,2,"MARKETING<BR>PRODUCTS",n,n,"","",n,n,n,n,n,95,44,2,1,0,4,n);
var s1=it.addSubmenu(0,0,-1,1,3,0,0,3,0,1,0,n,n,100,5,4,0,-1,1,200,200,1,3,"0,0,0",0,"0",1,0,"");
it=s1.addItem(4,5,5,"PLAN BOOKS",n,n,"","/marketingProducts/planBooks.cfm",n,n,n,"/marketingProducts/planBooks.cfm",n,180,32,2,0,0,23,n);
it=s1.addItem(4,5,5,"REALTOR PRODUCTS",n,n,"","/marketingProducts/realtorProducts.cfm",n,n,n,"/marketingProducts/realtorProducts.cfm",n,180,32,2,0,0,24,n);
it=s1.addItem(4,5,5,"VIDEO GALLERY",n,n,"","/marketingProducts/videoGallery.cfm",n,n,n,"/marketingProducts/videoGallery.cfm",n,180,32,2,0,0,25,n);
it=s1.addItem(4,5,5,"PHOTO GALLERY",n,n,"","/marketingProducts/photoGallery.cfm",n,n,n,"/marketingProducts/photoGallery.cfm",n,180,32,2,0,0,26,n);
it=s0.addItem(1,2,2,"BUILDING<BR>RESOURCES",n,n,"","",n,n,n,n,n,95,44,2,1,0,5,n);
var s1=it.addSubmenu(0,0,-1,1,3,0,0,3,0,1,0,n,n,100,5,5,0,-1,1,200,200,1,3,"0,0,0",0,"0",1,0,"");
it=s1.addItem(4,5,5,"BUILDER DIRECTORY",n,n,"","/buildingResources/builderDirectory.cfm",n,n,n,"/buildingResources/builderDirectory.cfm",n,180,32,2,0,0,27,n);
it=s1.addItem(4,5,5,"BUILDING PRODUCTS",n,n,"","/buildingResources/buildingProducts.cfm",n,n,n,"/buildingResources/buildingProducts.cfm",n,180,32,2,0,0,28,n);
it=s1.addItem(4,5,5,"ENGINEERS &amp; SURVEYORS",n,n,"","/buildingResources/engineersAndSurveyors.cfm",n,n,n,"/buildingResources/engineersAndSurveyors.cfm",n,180,32,2,0,0,29,n);
it=s1.addItem(4,5,5,"PROFESSIONAL ASSOCIATIONS",n,n,"","/buildingResources/professionalAssociations.cfm",n,n,n,"/buildingResources/professionalAssociations.cfm",n,180,32,2,0,0,30,n);
it=s0.addItem(1,2,2,"ABOUT<BR>US",n,n,"","",n,n,n,n,n,95,44,2,1,0,6,n);
var s1=it.addSubmenu(0,0,-1,1,3,0,0,3,0,1,0,n,n,100,5,6,0,-1,1,200,200,1,3,"0,0,0",0,"0",1,0,"");
it=s1.addItem(4,5,5,"ARTICLES",n,n,"","/aboutUs/articles.cfm",n,n,n,"/aboutUs/articles.cfm",n,180,32,2,0,0,31,n);
it=s1.addItem(4,5,5,"AWARDS",n,n,"","/aboutus/awards.cfm",n,n,n,"/aboutus/awards.cfm",n,180,32,2,0,0,32,n);
it=s1.addItem(4,5,5,"MAP &amp; DIRECTIONS",n,n,"","/aboutus/mapAndDirections.cfm",n,n,n,"/aboutus/mapAndDirections.cfm",n,180,32,2,0,0,35,n);
it=s0.addItem(1,2,2,"CONTACT<BR>US",n,n,"","",n,n,n,n,n,95,44,2,1,0,7,n);
var s1=it.addSubmenu(0,0,-1,1,3,0,0,3,0,1,0,n,n,100,5,7,0,-1,1,200,200,1,3,"0,0,0",0,"0",1,0,"");
it=s1.addItem(4,5,5,"CONTACT US",n,n,"","/contactUs/",n,n,n,"/contactUs/",n,180,32,2,0,0,36,n);
it=s1.addItem(4,5,5,"CUSTOM HOME DESIGNS",n,n,"","/designServices/customHomeDesigns.cfm",n,n,n,"/designServices/customHomeDesigns.cfm",n,180,32,2,0,0,37,n);
it=s1.addItem(4,5,5,"PLAN MODIFICATIONS",n,n,"","/aboutPlans/planModifications.cfm",n,n,n,"/aboutPlans/planModifications.cfm",n,180,32,2,0,0,38,n);
it=s0.addItem(1,2,2,"MY<BR>ACCOUNT",n,n,"","",n,n,n,n,n,95,44,2,0,0,8,n);
var s1=it.addSubmenu(0,0,-1,1,3,4,0,3,0,1,0,n,n,100,-4,8,0,-1,1,200,200,1,3,"0,0,0",0,"0",1,0,"");
it=s1.addItem(4,5,5,"MY SAVED PLANS",n,n,"","/myAccount/mySavedPlans.cfm",n,n,n,"/myAccount/mySavedPlans.cfm",n,180,32,2,0,0,39,n);
it=s1.addItem(4,5,5,"CREATE ACCOUNT",n,n,"","/createAccount/",n,n,n,"/createAccount/",n,180,32,2,0,0,41,n);
it=s1.addItem(4,5,5,"LOG-OUT",n,n,"","/myAccount/?logout",n,n,n,"/myAccount/?logout",n,180,32,2,0,0,42,n);
s0.pm.buildMenu();
}}