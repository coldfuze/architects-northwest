<cfif IsDefined("URL.PlanId") AND IsDefined("URL.ZipCode")>
	<cfif (CGI.HTTP_REFERER DOES NOT CONTAIN 'planPricing')>
		<cfscript>
            if (IsValid("regular_expression",URL.ZipCode,"^[0-9]{0,5}$") AND IsNumeric(URL.PlanId)) {
                Session.PlanId = URL.PlanId;
                Session.ZipCode = LEFT(URL.ZipCode,5);
            }
            else {
                VARIABLES.badPricing = 1;
            }
        </cfscript>
        <cfif NOT IsDefined("VARIABLES.badPricing")>
			<cfscript>
                 VARIABLES.thisURL = '/plans/detailedplaninfo.cfm?PlanId=' & URL.PlanId & '##planPricing';
            </cfscript>
            <cflocation url="#VARIABLES.thisURL#" addtoken="no">
        <cfelse>
        	<cflocation url="default.cfm?bpi" addtoken="no">
        </cfif>
    </cfif>
</cfif>

<cfif IsDefined("URL.PlanId")>
	<cfif IsNumeric(URL.PlanId)>
		<cfscript>
            Session.PlanId = URL.PlanId;
            
            if (NOT ListFind(Session.RecentlyViewedPlans,URL.PlanId)) {
                Session.RecentlyViewedPlans = ListPrepend(Session.RecentlyViewedPlans,URL.PlanId);	
            }
        </cfscript>
    </cfif>
<cfelseif IsDefined("URL.PlanTitle")>
	<cfif IsValid("regular_expression",URL.PlanTitle,"^[a-zA-Z\s'-]+$")>
    	<cfscript>
			VARIABLES.PlanId = Application.PlanService.getPlanIdFromTitle(URL.PlanTitle);
		</cfscript>
        
        <cfif VARIABLES.PlanId NEQ 0>
			<cfscript>
                Session.PlanId = VARIABLES.PlanId;
                
                if (NOT ListFind(Session.RecentlyViewedPlans,VARIABLES.PlanId)) {
                    Session.RecentlyViewedPlans = ListPrepend(Session.RecentlyViewedPlans,VARIABLES.PlanId);	
                }
            </cfscript>
       	</cfif>
	</cfif>
</cfif>

<cfset VARIABLES.PlanId = Session.PlanId>

<cfif NOT IsNumeric(VARIABLES.PlanId) OR VARIABLES.PlanId EQ 0>
	<cflocation url="default.cfm" addtoken="no">
</cfif>

<cfif IsDefined("URL.clearList")>
	<cfscript>
        Session.RecentlyViewedPlans = "";
    </cfscript>
</cfif>

<cfif IsDefined("URL.ZipCode")>
	<cfscript>
		VARIABLES.tZipCode = LEFT(URL.ZipCode,5);
	</cfscript>
	<cfif IsValid("regular_expression",VARIABLES.tZipCode,"^[0-9]{0,5}")>
		<cfscript>
            Session.ZipCode = VARIABLES.tZipCode;
        </cfscript>
    </cfif>
</cfif>

<cfif IsDefined("URL.nps")>
	<cfscript>
        Session.fromPlanSearch = 0;
    </cfscript>
</cfif>

<!--- Convert Session to Local Variables --->
	<cfscript>
        VARIABLES.PlanId = Session.PlanId;
        VARIABLES.ZipCode = Session.ZipCode;
        VARIABLES.RecentlyViewedPlans = Session.RecentlyViewedPlans;
        VARIABLES.fromPlanSearch = Session.fromPlanSearch;
        VARIABLES.PlanList = Session.PlanList;
        VARIABLES.CustomerId = Session.CustomerId;
        VARIABLES.SavedPlans = Session.SavedPlans;
    </cfscript>

<cfif NOT IsNumeric(VARIABLES.PlanId)>
	<cflocation url="default.cfm" addtoken="no">
</cfif>

<!--- Add to saved plans (if applicable) --->    
	<cfif IsDefined("URL.sp")>
        <cfif IsUserLoggedIn() IS "Yes">
            <cfscript>
                // Add this plan to My Saved Plans, if applicable
                VARIABLES.asp = StructNew();
                VARIABLES.asp.PlanId = VARIABLES.PlanId;
                VARIABLES.asp.CustomerId = VARIABLES.CustomerId;
				VARIABLES.asp.SavedPlans = VARIABLES.SavedPlans;
				VARIABLES.addSavedPlan = Application.CustomerService.addToSavedPlans(VARIABLES.asp);
            </cfscript>
            
            <cfif VARIABLES.addSavedPlan.doesPlanExistInList EQ 0>
                <cfsavecontent variable="addPlanAlert">
                    <script language="javascript" type="text/javascript">
                        alert("Plan successfully added to your saved plans");
                    </script>
                </cfsavecontent>
                
				<cfscript>
                    Session.SavedPlans = VARIABLES.addSavedPlan.SavedPlans;
                </cfscript>
            <cfelse>
            	<cfsavecontent variable="addPlanAlert">
                    <script language="javascript" type="text/javascript">
                        alert("This plan is already included as one of your saved plans");
                    </script>
                </cfsavecontent>
            </cfif>
        <cfelse>
            <cfsavecontent variable="addPlanAlert">
                <script language="javascript" type="text/javascript">
                    alert("Saving plans is available for visitors to our site who have created an account on our site. Please log-in to My Account, or Create a New Account, by selecting My Account > Create Account from the top menu bar");
                </script>
            </cfsavecontent>
        </cfif>
    <cfelse>
    	<cfscript>
			VARIABLES.addPlanAlert = "";
		</cfscript>
    </cfif>
    
<!--- Get Plan Information --->
	<cfscript>
		VARIABLES.PlanInfo = Application.PlanService.getPlanInfo(VARIABLES.PlanId);
		VARIABLES.isWashingtonStateZipCode = Application.WashingtonStateZipCodeService.isWashingtonStateZipCode(VARIABLES.ZipCode);
		VARIABLES.SimilarPlans = Application.PlanService.getSimilarPlans(VARIABLES.PlanId);
		if (VARIABLES.SimilarPlans.recordCount LTE 5) {
			VARIABLES.SimilarPlansToDisplay = VARIABLES.SimilarPlans.recordCount;
			VARIABLES.ScrollSimilarPlans = 0;
		}
		else {
			VARIABLES.SimilarPlansToDisplay = 5;
			VARIABLES.ScrollSimilarPlans = 1;
		}
		if (LEN(TRIM(VARIABLES.ZipCode)) GT 0 AND VARIABLES.ZipCode NEQ 0) {
			VARIABLES.planPricingInfo = structNew();
			if (NOT IsNumeric(VARIABLES.PlanInfo.PriceCategoryId)) {
				VARIABLES.planPricingInfo.PriceCategoryId = APPLICATION.PriceCategoryService.getPricingCategoryForPlan(VARIABLES.PlanId);
			}
			else {
				VARIABLES.planPricingInfo.PriceCategoryId = VARIABLES.PlanInfo.PriceCategoryId;	
			}
			VARIABLES.planPricingInfo.ZipCode = VARIABLES.ZipCode;
			VARIABLES.planPricingInfo.TotalSF = VARIABLES.PlanInfo.TotalSF;
			VARIABLES.planPricingInfo.MainFloorSF = VARIABLES.PlanInfo.MainFloorSF;
			VARIABLES.planPricingInfo.UpperFloorSF = VARIABLES.PlanInfo.UpperFloorSF;
			VARIABLES.planPricingInfo.GarageSF = VARIABLES.PlanInfo.GarageSF;
			if (VARIABLES.PlanInfo.PlanTypeId EQ 7) {
				VARIABLES.planPricingInfo.isGarageAccessoryPlan = 1;
			}
			else {
				VARIABLES.planPricingInfo.isGarageAccessoryPlan = 0;	
			}
			VARIABLES.pricingInfo = Application.PlanPricingService.getPricingForPlan(VARIABLES.planPricingInfo);
		}
		else {
			VARIABLES.pricingInfo = 0;	
		}
		VARIABLES.architecturalStyles = Application.SearchSubGroupingService.getArchitecturalStylesforPlan(VARIABLES.PlanId);
		VARIABLES.garageTypes = Application.GarageTypeService.getGarageTypesForPlan(VARIABLES.PlanId);
		VARIABLES.designFeatures = Application.PlanService.getPlanDesignFeatures(VARIABLES.PlanId);
		VARIABLES.xmlPath = "/assets/photoXML/" & VARIABLES.PlanId & '.xml';
		VARIABLES.xmlPathAbsolute = ExpandPath(VARIABLES.xmlPath);
		VARIABLES.xmlExists = FileExists(VARIABLES.xmlPathAbsolute);
		VARIABLES.PlanLabel = Application.PlanService.getPlanTitleWithTitleFirst(VARIABLES.PlanId);
		VARIABLES.Media = Application.PlanService.doesPlanHaveMedia(VARIABLES.PlanId);
		VARIABLES.hasMainFloorPlan = 0;
		VARIABLES.hasUpperFloorPlan = 0;
		VARIABLES.hasLowerFloorPlan = 0;
		VARIABLES.hasThirdFloorPlan = 0;
	
		// Determine which floor plans to display
		VARIABLES.mainFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/MainFloorPlan.gif';
		VARIABLES.mainFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/MainFloorPlan.gif';
		VARIABLES.mainFloorPlanAbsolutePath = ExpandPath(VARIABLES.mainFloorPlanPath);
		if (FileExists(VARIABLES.mainFloorPlanAbsolutePath)) {
			VARIABLES.hasMainFloorPlan = 1;	
		}
		VARIABLES.upperFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/UpperFloorPlan.gif';
		VARIABLES.upperFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/UpperFloorPlan.gif';
		VARIABLES.upperFloorPlanAbsolutePath = ExpandPath(VARIABLES.upperFloorPlanPath);
		if (FileExists(VARIABLES.upperFloorPlanAbsolutePath)) {
			VARIABLES.hasUpperFloorPlan = 1;	
		}
		VARIABLES.lowerFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/LowerFloorPlan.gif';
		VARIABLES.lowerFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/LowerFloorPlan.gif';
		VARIABLES.lowerFloorPlanAbsolutePath = ExpandPath(VARIABLES.lowerFloorPlanPath);
		if (FileExists(VARIABLES.lowerFloorPlanAbsolutePath)) {
			VARIABLES.hasLowerFloorPlan = 1;	
		}
		VARIABLES.thirdFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/ThirdFloorPlan.gif';
		VARIABLES.thirdFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/ThirdFloorPlan.gif';
		VARIABLES.thirdFloorPlanAbsolutePath = ExpandPath(VARIABLES.thirdFloorPlanPath);
		if (FileExists(VARIABLES.thirdFloorPlanAbsolutePath)) {
			VARIABLES.hasThirdFloorPlan = 1;	
		}
		
		// Get Previous and Next Plans (if applicable)
		if 	(VARIABLES.fromPlanSearch EQ 1) {
			VARIABLES.pnPlan = StructNew();
			if (ListLen(VARIABLES.PlanList) GTE 1) {
				VARIABLES.pnPlan.PlanList = VARIABLES.PlanList;
			}
			else {
				VARIABLES.pnPlan.PlanList = Application.PlanService.getAllPlansList();
			}
			VARIABLES.pnPlan.PlanId = VARIABLES.PlanId;
			VARIABLES.pnPlanInfo = Application.PlanService.getPreviousNextPlan(VARIABLES.pnPlan);
		}
		else {
			VARIABLES.pnPlan = StructNew();
			VARIABLES.pnPlan.PlanList = Application.PlanService.getAllPlansList();
			VARIABLES.pnPlan.PlanId = VARIABLES.PlanId;
			VARIABLES.pnPlanInfo = Application.PlanService.getPreviousNextPlan(VARIABLES.pnPlan);
		}
	</cfscript>
    
<cfif VARIABLES.xmlExists IS "Yes">
	<cfoutput>
        <cfsavecontent variable="head">
            <script type="text/javascript" src="/assets/js/swfobject.js"></script>
            <script type="text/javascript">
                var flashvars = {
                    xmlFilePath: "#VARIABLES.xmlPath#"
                };
                var params = {};
                params.play = "true";
                params.wmode = "transparent";
                params.bgcolor = "##caccbb";
                params.allowfullscreen = "true";
                var attributes = {};
                attributes.id = "PlanAnimation";
                swfobject.embedSWF("PlanImages.swf", "planPhotoAnimation", "535", "393", "9.0.0", false, flashvars, params, attributes);
            </script>

            <script type="text/javascript" src="/assets/js/jquery.jshowoff.min.js"></script>  
            
            <script>
				function makeWin(x,y) {
					ColdFusion.Window.show('emailWindow','Windows Rules','win.cfm',{x:x+25,y:y+25});
				}
			</script>

            <link rel="stylesheet" type="text/css" href="/assets/css/planSubNavigation.css"/>
        </cfsavecontent>
    </cfoutput>
    
    <cfscript>
		VARIABLES.galleriaCode = Application.PlanImageService.generateGalleriaCode(VARIABLES.PlanId);
	</cfscript>
<cfelse>
	<cfsavecontent variable="head">
		<script type="text/javascript" src="/assets/js/jquery.jshowoff.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/assets/css/planSubNavigation.css"/>
    </cfsavecontent>
</cfif>

<cfhtmlhead text="#head#">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = VARIABLES.PlanLabel & ": Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = VARIABLES.PlanLabel & ": Your Family Architect - Architects Northwest";		
	}
</cfscript>

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyviewedplans="#VARIABLES.RecentlyViewedPlans#" planid="#VARIABLES.PlanId#" similarplanstodisplay="#VARIABLES.SimilarPlansToDisplay#" scrollsimilarplans="#VARIABLES.ScrollSimilarPlans#" totalsimilarplans="#VARIABLES.SimilarPlans.RecordCount#" alertmessage="#VARIABLES.addPlanAlert#">
        <div id="dpTopContentContainer">
        	<div id="highLevelPlanInfo">
            	<cfif LEN(VARIABLES.PlanInfo.PlanTitle) LTE 14>
            	<div id="planTitle">
            		<cfoutput>#VARIABLES.PlanInfo.PlanTitle#</cfoutput>
                </div>
                <cfelse>
                <div id="planTitle2Lines">
            		<cfoutput>#VARIABLES.PlanInfo.PlanTitle#</cfoutput>
                </div>
                </cfif>
                <div id="planNumber">
                	<cfoutput>#VARIABLES.PlanInfo.PlanNumber#</cfoutput>
                </div>
                <div class="planSpecTitle">
                	Total Area:
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.TotalSF# sq. ft.</cfoutput>
                </div>
                <br clear="all" />
                <div class="planSpecTitle">
                	Garage Area:
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.GarageSF# sq. ft.</cfoutput>
                </div>
                <br clear="all" />
                <div class="planSpecTitle">
                	Garage Size:
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.GarageSizeAbbr#</cfoutput>
                </div>
                <br clear="all" />
                <div class="planSpecTitle">
                	Stories:
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.Stories#</cfoutput>
                </div>
                <cfif IsNumeric(VARIABLES.PlanInfo.Bedroom)>
                <br clear="all" />
                <div class="planSpecTitle">
                	Bedrooms:
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.Bedroom#</cfoutput>
                </div>
                </cfif>
                <cfif IsNumeric(VARIABLES.PlanInfo.FullBathroom)>
                <br clear="all" />
                <div class="planSpecTitle">
                	Full Baths:
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.FullBathroom#</cfoutput>
                </div>
                </cfif>
                <cfif IsNumeric(VARIABLES.PlanInfo.HalfBathroom)>
                <br clear="all" />
                <div class="planSpecTitle">
                	Half Baths:
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.HalfBathroom#</cfoutput>
                </div>
                </cfif>
                <br clear="all" />
                <div class="planSpecTitle">
                	Width:
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthIn#</cfoutput>&quot;
                </div>
                <br clear="all" />
                <div class="planSpecTitle">
                	Depth:
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthIn#</cfoutput>&quot;
                </div>
                <br clear="all" />
                <div class="planSpecTitle">
                	<div style="float:left;margin-right:3px;">Height</div>
                    <div style="float:left;width:16px;"><a href="javascript:void(0);" id="ph" title="is measured from the main floor to the top of the ridge"><img src="/assets/images/btnInfo.png" width="16" height="16" alt="information button image" /></a></div>
                    <div style="float:left;width:5px;">:</div>
                    <div style="clear:both;"></div>
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightIn#</cfoutput>&quot;
                </div>
                <br clear="all" />
                <div class="planSpecTitle">
                	Foundation:
                </div>
                <div class="planSpecValue">
                	<cfoutput>#VARIABLES.PlanInfo.FoundationType#</cfoutput>
                </div>
                <br clear="all" />
                <cfif VARIABLES.Media.hasMedia EQ 1>
                <div id="mediaLinks">
                	<strong>Select Below to View:</strong>
                    <ul type="square" id="mediaLinkList">
                        <cfif VARIABLES.Media.hasAnimation360 EQ 1><cfif VARIABLES.PlanInfo.PlanId EQ 411 OR VARIABLES.PlanInfo.PlanId EQ 36 OR VARIABLES.PlanInfo.PlanId EQ 436 OR VARIABLES.PlanInfo.PlanId EQ 951 OR VARIABLES.PlanInfo.PlanId EQ 982 OR VARIABLES.PlanInfo.PlanId EQ 1001 OR VARIABLES.PlanInfo.PlanId EQ 1002 OR VARIABLES.PlanInfo.PlanId EQ 1015><li><cfoutput><a class="planSpec" href="javascript: newWindow = openWin( '#VARIABLES.Media.animation360Path#', 'animation360', 'width=640,height=360,toolbar=0,location=0,directories=0,status=0,menuBar=0,scrollBars=0,resizable=0' ); newWindow.focus()">360 Image</a></cfoutput></li><cfelse><li><cfoutput><a class="planSpec" href="javascript: newWindow = openWin( '#VARIABLES.Media.animation360Path#', 'animation360', 'width=640,height=480,toolbar=0,location=0,directories=0,status=0,menuBar=0,scrollBars=0,resizable=0' ); newWindow.focus()">360 Image</a></cfoutput></li></cfif></cfif>
                        <cfif VARIABLES.Media.hasAnimation EQ 1><li><cfoutput><a class="planSpec" href="#VARIABLES.Media.animationPath#">Animation</a></cfoutput></li></cfif>
                        <cfif VARIABLES.Media.hasVideo EQ 1><li><cfoutput><a class="planSpec" href="#VARIABLES.Media.videoPath#">Video</a></cfoutput></li></cfif>
                        <cfif VARIABLES.Media.hasYouTube EQ 1><li><cfoutput><a class="planSpec" href="javascript: newWindow = openWin( 'youTube.cfm?PlanId=#VARIABLES.PlanId#', 'youTube', 'width=864,height=520,toolbar=0,location=0,directories=0,status=0,menuBar=0,scrollBars=0,resizable=0' ); newWindow.focus()">YouTube Video</a></cfoutput></li></cfif>
					</ul>
                </div>
                </cfif>
                <br clear="all" />
            </div>
            <div id="planPhotoAnimationContainer">
            	<div id="planTitle">
            		<cfoutput>#VARIABLES.PlanLabel#</cfoutput>
                </div>
            	<div id="planPhotoAnimation">
				<cfif IsDefined("VARIABLES.galleriaCode")>
					<cfoutput>#VARIABLES.galleriaCode#</cfoutput>
                    <script type="text/javascript">		
                        $(document).ready(function(){ $('#planPhotoAnimation').jshowoff({ 
                            links: false,
                            speed: 5000,
                            controls: false,
                            effect: 'fade',
                            cssClass: 'basicFeatures',
                            hoverPause: true
                        }); });
                    </script>
                <cfelse>
                    No Plan Images Have Been Uploaded
                </cfif>
                </div>
            </div>
            
            <div id="previousNextChatContainer">
                <div id="previousNextContainer">
                    <cfform action="#CGI.SCRIPT_NAME#" name="pplan" method="get">
                    	<cfinput type="hidden" name="PlanId" value="#VARIABLES.pnPlanInfo.previousPlan#">
                        <cfinput type="submit" name="submit" value="Previous Plan" style="width:150px;color:##06C;font-weight:bold;">
                    </cfform>
                    
                    <cfform action="#CGI.SCRIPT_NAME#" name="nplan" method="get" style="margin-top:12px;">
                    	<cfinput type="hidden" name="PlanId" value="#VARIABLES.pnPlanInfo.nextPlan#">
                        <cfinput type="submit" name="submit" value="Next Plan" style="width:150px;color:##06C;font-weight:bold;">
                    </cfform>
                </div>
                <div id="spacer"></div>
                <div id="detailedPlanChat">
                    <img src="/assets/images/PayPal.gif" width="175" height="154" alt="Pay Pal Image"/>
                </div>
            </div>
        </div>
        <div id="planImageCopyright">
           	All images are &copy; copyrighted by Architects Northwest. Photographs, if shown, may have been modified to homeowner's preferences or site conditions.
		</div>
		<cfif LEN(TRIM(VARIABLES.PlanInfo.PlanDescription)) GT 0>
        <div id="planDescription"><cfoutput>#Replace(Replace(VARIABLES.PlanInfo.PlanDescription,'<p>','','All'),'</p>','','All')#</cfoutput></div>
        </cfif>
        
        <cfmodule template="#Application.CTPath#secondaryPlanNavigation.cfm" floorplan="MainFloorPlan" planid="#VARIABLES.PlanId#" />
        
        <div class="dpFloorPlanContainer" id="MainFloorPlan">
        	<a name="floorPlans"></a>
        	<cfif VARIABLES.hasMainFloorPlan EQ 1>
            	<strong style="text-decoration:underline;font-size:14px;">MAIN FLOOR</strong><br />
                <cfif IsDefined("URL.Reverse")>
					<cfoutput><img src="#VARIABLES.mainFloorPlanReversePath#" alt="Main Floor Plan" /></cfoutput>
                <cfelse>
                	<cfoutput><img src="#VARIABLES.mainFloorPlanPath#" alt="Main Floor Plan" /></cfoutput>
                </cfif>
                <br /><strong style="text-decoration:underline;font-size:14px;">MAIN FLOOR</strong>
            </cfif>
        </div>
        
		<cfif VARIABLES.hasUpperFloorPlan EQ 1>
        	<cfmodule template="#Application.CTPath#secondaryPlanNavigation.cfm" floorplan="UpperFloorPlan" planid="#VARIABLES.PlanId#" />
        	<div class="dpFloorPlanContainer" id="UpperFloorPlan">
            	<strong style="text-decoration:underline;font-size:14px;">UPPER FLOOR</strong><br />
            <cfif IsDefined("URL.Reverse")>
                <cfoutput><img src="#VARIABLES.upperFloorPlanReversePath#" alt="Upper Floor Plan" /></cfoutput>
            <cfelse>
                <cfoutput><img src="#VARIABLES.upperFloorPlanPath#" alt="Upper Floor Plan" /></cfoutput>
            </cfif>
            	<br /><strong style="text-decoration:underline;font-size:14px;">UPPER FLOOR</strong>
            </div>
        </cfif>
        
        <cfif VARIABLES.hasLowerFloorPlan EQ 1>
        	<cfmodule template="#Application.CTPath#secondaryPlanNavigation.cfm" floorplan="LowerFloorPlan" planid="#VARIABLES.PlanId#" />
        	<div class="dpFloorPlanContainer" id="LowerFloorPlan">
            	<strong style="text-decoration:underline;font-size:14px;">LOWER FLOOR</strong><br />
            <cfif IsDefined("URL.Reverse")>
                <cfoutput><img src="#VARIABLES.lowerFloorPlanReversePath#" alt="Lower Floor Plan" /></cfoutput>
            <cfelse>
                <cfoutput><img src="#VARIABLES.lowerFloorPlanPath#" alt="Lower Floor Plan" /></cfoutput>
            </cfif>
            	<br /><strong style="text-decoration:underline;font-size:14px;">LOWER FLOOR</strong>
            </div>
        </cfif>
        <cfif VARIABLES.hasThirdFloorPlan EQ 1>
        	<cfmodule template="#Application.CTPath#secondaryPlanNavigation.cfm" floorplan="ThirdFloorPlan" planid="#VARIABLES.PlanId#" />
        	<div class="dpFloorPlanContainer" id="ThirdFloorPlan">
            	<strong style="text-decoration:underline;font-size:14px;">THIRD FLOOR</strong><br />
            <cfif IsDefined("URL.Reverse")>
                <cfoutput><img src="#VARIABLES.thirdFloorPlanReversePath#" alt="Third Floor Plan" /></cfoutput>
            <cfelse>
                <cfoutput><img src="#VARIABLES.thirdFloorPlanPath#" alt="Third Floor Plan" /></cfoutput>
            </cfif>
            	<br /><strong style="text-decoration:underline;font-size:14px;">THIRD FLOOR</strong>
            </div>
        </cfif>
        
        <div id="planDetailsTitleContainer">
        	<div id="planDetailsTitleBar">
            	<div id="planDetailsTitleBarContent">
            	PLAN DETAILS FOR THE <cfoutput>#VARIABLES.PlanLabel#</cfoutput>
                </div>
            </div>
        </div>
        
        <div id="planDetailsContainer">
        	<div id="planDetailsContentContainer">
            	<div id="planDetailsContentCol1">
                	<div>
                    	<div style="float:left;width:140px;margin-right:35px;">
                            <strong style="text-decoration:underline;">Area Summary</strong><br />
                            <div class="planDetailsContentLeft">Total Area:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.TotalSF#</cfoutput> sq. ft.</div>
                            <div class="clearFloat"></div>
                            
                            <cfif VARIABLES.PlanInfo.MainFloorSF GT 0>
                                <div class="planDetailsContentLeft">Main Floor:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.MainFloorSF#</cfoutput> sq. ft.</div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif VARIABLES.PlanInfo.UpperFloorSF GT 0>
                                <div class="planDetailsContentLeft">Upper Floor:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.UpperFloorSF#</cfoutput> sq. ft.</div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif VARIABLES.PlanInfo.ThirdFloorSF GT 0>
                                <div class="planDetailsContentLeft">3rd Floor:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.ThirdFloorSF#</cfoutput> sq. ft.</div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif VARIABLES.PlanInfo.LowerFloorSF GT 0>
                                <div class="planDetailsContentLeft">Lower Floor:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.LowerFloorSF#</cfoutput> sq. ft.</div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif VARIABLES.PlanInfo.GarageSF GT 0>
                                <div class="planDetailsContentLeft">Garage Floor:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.GarageSF#</cfoutput> sq. ft.</div>
                                <div class="clearFloat"></div>
                            </cfif>
                        </div>
                        <div style="float:left;width:110px;margin-right:35px;">
                        	<strong style="text-decoration:underline;">Architectural Style</strong><br />
                    		<cfoutput query="VARIABLES.architecturalStyles">#SearchSubGrouping#<cfif VARIABLES.architecturalStyles.currentRow LT VARIABLES.architecturalStyles.recordCount><br /></cfif></cfoutput>
                        </div>
                        <div style="float:left;width:160px;">
                        	<cfif VARIABLES.PlanInfo.GarageSizeId GT 1>
                                <strong style="text-decoration:underline;">Garage</strong><br />
                                <div class="planDetailsContentLeft">Garage Size:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.GarageSizeAbbr#</cfoutput></div>
                                <div class="clearFloat"></div>
                                <cfif LEN(VARIABLES.PlanInfo.GarageDoorLocationAbbr) GT 0>
                                    <div class="planDetailsContentLeft">Garage Door Location:</div>
                                    <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.GarageDoorLocationAbbr#</cfoutput></div>
                                    <div class="clearFloat"></div>
                                </cfif>
                                <cfif VARIABLES.garageTypes.recordCount GT 0>
                                    <div class="planDetailsContentLeft">Garage Type:</div>
                                    <div class="planDetailsContentRight"><cfoutput query="VARIABLES.garageTypes">#GarageType#</cfoutput></div>
                                    <div class="clearFloat"></div>
                                </cfif>
                            <cfelse>
                                <div class="planDetailsContentLeft"><strong style="text-decoration:underline;">Garage</strong></div>
                                <div class="planDetailsContentRight">No Garage</div>
                                <div class="clearFloat"></div>
                            </cfif>
                        </div>
                        <div class="planDetailsContentCol4">
                            <strong style="text-decoration:underline;">Foundation Type</strong><br />
                            <cfoutput>#VARIABLES.PlanInfo.FoundationType#</cfoutput>
                            <br /><br />
                            <strong style="text-decoration:underline;">Roof Framing</strong><br />
                            <cfoutput>#VARIABLES.PlanInfo.RoofFraming#</cfoutput>
                    	</div>
                        <div class="clearFloat"></div>
                    </div>
                    <div style="margin-top:10px;">
                    	<div style="float:left;width:140px;margin-right:35px;">
                            <strong style="text-decoration:underline;">General Information</strong><br />
                            <div class="planDetailsContentLeft">Stories:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.Stories#</cfoutput></div>
                            <div class="clearFloat"></div>
                            
                            <div class="planDetailsContentLeft">Width:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthIn#</cfoutput>&quot;</div>
                            <div class="clearFloat"></div>
                            
                            <div class="planDetailsContentLeft">Depth:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthIn#</cfoutput>&quot;</div>
                            <div class="clearFloat"></div>
                            
                            <div class="planDetailsContentLeft">
                            	<div style="float:left;margin-right:3px;">Height</div>
                                <div style="float:left;width:16px;"><a href="javascript:void(0);" id="ph" title="is measured from the main floor to the top of the ridge"><img src="/assets/images/btnInfo.png" width="16" height="16" alt="information button image" /></a></div>
                                <div style="float:left;width:5px;">:</div>
                                <div style="clear:both;"></div>
                            </div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightIn#</cfoutput>&quot;</div>
                            <div class="clearFloat"></div>
                        </div>
                		<div style="float:left;width:110px;margin-right:35px;">
                            <strong style="text-decoration:underline;">Number of Rooms</strong><br />
                            <cfif IsNumeric(VARIABLES.PlanInfo.Bedroom)>
                                <div class="planDetailsContentLeft">Bedrooms:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.Bedroom#</cfoutput></div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.FullBathroom)>
                            <div class="planDetailsContentLeft">Full Baths:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.FullBathroom#</cfoutput></div>
                            <div class="clearFloat"></div>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.HalfBathroom)>
                            <div class="planDetailsContentLeft">Half Baths:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HalfBathroom#</cfoutput></div>
                            <div class="clearFloat"></div>
                            </cfif>
                        </div>
                		<div style="float:left;width:160px;">
                            <strong style="text-decoration:underline;">Roof Pitches</strong><br />
                            <div class="planDetailsContentLeft">Primary:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofPrimary#</cfoutput>:12</div>
                            <div class="clearFloat"></div>
                            <cfif IsNumeric(VARIABLES.PlanInfo.RoofSecondary)>
                            <div class="planDetailsContentLeft">Secondary:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofSecondary#</cfoutput>:12</div>
                            <div class="clearFloat"></div>
                            </cfif>
                        </div>
                        <div class="planDetailsContentCol4">
                            <strong style="text-decoration:underline;">Floor Load</strong><br />
                            <div class="planDetailsContentLeft">Live (lbs):</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.FloorLive#</cfoutput> PSF</div>
                            <div class="clearFloat"></div>
                            <div class="planDetailsContentLeft">Dead (lbs):</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.FloorDead#</cfoutput> PSF</div>
                            <div class="clearFloat"></div>
                        </div>
                    </div>
                    <div class="clearFloat"></div>
                    <div style="margin-top:10px;">
                    	<div style="float:left;width:285px;margin-right:35px;">
                        	&nbsp;
                        </div>
                        <div style="float:left;width:160px;">
                            <strong style="text-decoration:underline;">Wall Heights</strong><br />
                            <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightMainFloor)>
                            <div class="planDetailsContentLeft">Main:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightMainFloor#</cfoutput>&#39;-0&quot;</div>
                            <div class="clearFloat"></div>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightUpperFloor)>
                            <div class="planDetailsContentLeft">Upper:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightUpperFloor#</cfoutput>&#39;-0&quot;</div>
                            <div class="clearFloat"></div>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightThirdFloor)>
                            <div class="planDetailsContentLeft">3rd Floor:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightThirdFloor#</cfoutput>&#39;-0&quot;</div>
                            <div class="clearFloat"></div>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightLowerFloor)>
                            <div class="planDetailsContentLeft">Lower:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightLowerFloor#</cfoutput>&#39;-0&quot;</div>
                            <div class="clearFloat"></div>
                            </cfif>
                        </div>
                    	<div class="planDetailsContentCol4">
                            <strong style="text-decoration:underline;">Roof Load</strong><br />
                            <div class="planDetailsContentLeft">Live (lbs):</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofLive#</cfoutput> PSF</div>
                            <div class="clearFloat"></div>
                            <div class="planDetailsContentLeft">Dead (lbs):</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofDead#</cfoutput> PSF</div>
                            <div class="clearFloat"></div>
                            <div class="planDetailsContentLeft">Wind:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.MaxWind#</cfoutput> MPH</div>
                            <div class="clearFloat"></div>
                        </div>
                    </div>
                </div>
                
				<cfif CGI.HTTP_USER_AGENT CONTAINS "MSIE 7" OR CGI.HTTP_USER_AGENT CONTAINS "MSIE 6">
                <div id="planDetailsContentCol5MSIE6">
            		<strong style="text-decoration:underline;">Design Features</strong>
					<cfoutput>#VARIABLES.designFeatures#</cfoutput>
                </div>
                <cfelse>
                <div id="planDetailsContentCol5">
                    <div style="margin-left:40px;">
            		<strong style="text-decoration:underline;">Design Features</strong>
                    </div>
					<cfoutput>#VARIABLES.designFeatures#</cfoutput>
                </div>
                </cfif>
            </div>
        </div>
        
        <cfif VARIABLES.SimilarPlans.recordCount GT 0>
        <div id="similarPlansTitleContainer">
        	<div id="similarPlansTitleBar">
            	<div id="similarPlansTitleBarSpacer">&nbsp;</div>
            	SIMILAR PLANS TO THE <cfoutput>#VARIABLES.PlanLabel#</cfoutput>
            </div>
        </div>
        
        <div id="similarPlansContainer">
        	<div id="similarPlansContentContainer">
            	<cfif VARIABLES.ScrollSimilarPlans EQ 1><div id="first-carousel" class="carousel jcarousel-skin-tango"><cfelse><div id="centered-carousel" class="carousel jcarousel-skin-tangoNN"><div align="center"></cfif>
                    <ul>
                    <cfoutput query="VARIABLES.SimilarPlans">
                    	<li style="width:165px;height:300px;font-size:14px;">
                        <div class="thisRecentlyViewedPlanContainer">
                    	<div style="text-align:center;font-weight:bold;text-transform:uppercase;vertical-align:text-bottom;height:30px;line-height:15px;padding-bottom:5px;">
                            <a class="brownLink" href="/plans/detailedPlanInfo.cfm?PlanId=#RelatedPlanId#&nps=1">#PlanTitle#</a>
                        </div>
                        <a href="/plans/detailedPlanInfo.cfm?PlanId=#RelatedPlanId#&nps=1"><img src="/assets/planImages/#RelatedPlanId#/planthu/#ImageFile#" width="165" height="121" border="0" alt="#PlanTitle#" /></a>
                        <div style="text-align:center;font-size:13px;font-weight:bold;text-transform:uppercase;padding-top:5px;padding-bottom:20px;">
                            <a class="brownLink" href="/plans/detailedPlanInfo.cfm?PlanId=#RelatedPlanId#&nps=1">#PlanNumber#</a>
                        </div>
                        <div class="planSpecItemContainer2">
                            <div style="float:left;padding-left:10px;">Total Area:</div>
                            <div style="float:right;">#TotalSF# sq. ft.</div>
                            <div class="clearFloat"></div>
                        </div>
                        <div class="planSpecItemContainer2">
                            <div style="float:left;padding-left:10px;">Stories:</div>
                            <div style="float:right;">#Stories#</div>
                            <div class="clearFloat"></div>
                        </div>
                        <cfif IsNumeric(Bedroom)>
                            <div class="planSpecItemContainer2">
                                <div style="float:left;padding-left:10px;">Bedrooms:</div>
                                <div style="float:right;">#Bedroom#</div>
                                <div class="clearFloat"></div>
                            </div>
                            <cfif IsNumeric(FullBathroom)>
                                <div class="planSpecItemContainer2">
                                    <div style="float:left;padding-left:10px;">Full Baths:</div>
                                    <div style="float:right;">#FullBathroom#</div>
                                    <div class="clearFloat"></div>
                                </div>
                            <cfelse>
                            	<div class="planSpecItemContainer2">
                                    &nbsp;
                                </div>
                            </cfif>
                        <cfelseif IsNumeric(FullBathroom)>
                            <div class="planSpecItemContainer2">
                                <div style="float:left;padding-left:10px;">Full Baths:</div>
                                <div style="float:right;">#FullBathroom#</div>
                                <div class="clearFloat"></div>
                            </div>
                            <div class="planSpecItemContainer2">
                                &nbsp;
                            </div>
                        <cfelse>
                        	<div class="planSpecItemContainer2">
                                &nbsp;
                            </div>
                            <div class="planSpecItemContainer2">
                                &nbsp;
                            </div>
                        </cfif>
                        <div class="planSpecViewPlan">
                        	<div style="text-align:center;">
                            <a class="planSpec" href="/plans/detailedPlanInfo.cfm?PlanId=#RelatedPlanId#&nps=1">View Floor Plan</a>
                            </div>
                        </div>
                     </div>
                    </li>
					</cfoutput>
                    </ul>
                    <cfif VARIABLES.ScrollSimilarPlans NEQ 1></div></cfif>
                </div>
            </div>
        </div>
        </cfif>
        
        <a name="planPricing"></a>
        <div id="planPricingTitleContainer">
        	<div id="planPricingTitleBar">
            	<div id="planPricingTitleBarContent">
            	PLAN PRICING FOR THE <cfoutput>#VARIABLES.PlanLabel#</cfoutput>
                </div>
            </div>
        </div>
        
        <cfif IsNumeric(VARIABLES.ZipCode)>
			<cfif VARIABLES.isWashingtonStateZipCode is "false">
            	<div id="emptyPlanPricingContainer">
                    <div id="emptyPlanPricingContentContainer">
                        <cfform name="ppi" method="get" action="detailedplaninfo.cfm">
                        	<cfinput type="hidden" name="PlanId" value="#VARIABLES.PlanId#">
                            You Are Viewing Plan Pricing Information for Zip Code
                            <cfinput type="text" maxlength="5" size="5" name="ZipCode" value="#VARIABLES.ZipCode#" validate="zipcode" message="Please enter your 5 digit zip code, or leave this field blank" required="yes" style="height:15px;">
                            <cfinput type="image" src="/assets/images/btn_Go.gif" name="submit" align="absmiddle">
                        </cfform>
                    </div>
                </div>
                <cfoutput>#VARIABLES.pricingInfo#</cfoutput>
            <cfelse>
            	<div id="emptyPlanPricingContainer">
                    <div id="emptyPlanPricingContentContainer">
                        <cfform name="ppi" method="get" action="detailedplaninfo.cfm">
                        	<cfinput type="hidden" name="PlanId" value="#VARIABLES.PlanId#">
                            You Are Viewing Plan Pricing Information for Zip Code
                            <cfinput type="text" maxlength="5" size="5" name="ZipCode" value="#VARIABLES.ZipCode#" validate="zipcode" message="Please enter your 5 digit zip code, or leave this field blank" required="yes" style="height:15px;">
                            <cfinput type="image" src="/assets/images/btn_Go.gif" name="submit" align="absmiddle">
                        </cfform>
                    </div>
                </div>
                <cfoutput>#VARIABLES.pricingInfo#</cfoutput>
            </cfif>
        <cfelse>
        	<div id="emptyPlanPricingContainer">
                <div id="emptyPlanPricingContentContainer">
                	<cfform name="ppi" method="get" action="detailedplaninfo.cfm" style="height:25px;">
                    	<cfinput type="hidden" name="PlanId" value="#VARIABLES.PlanId#">
                        Please enter your zip code, then select the Go! button to view pricing information for this house plan.
                        <cfinput type="text" maxlength="5" size="5" name="ZipCode" validate="zipcode" message="Please enter your 5 digit zip code, or leave this field blank" required="yes" style="height:15px;">
                        <cfinput type="image" src="/assets/images/btn_Go.gif" name="submit" align="absmiddle">
                    </cfform>
                </div>
            </div>
        </cfif>
    </cfmodule>