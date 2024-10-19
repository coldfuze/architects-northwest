<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<!--- Change the type of plans searched (if applicable) --->
	<cfif IsDefined("URL.Id")>
        <cfif IsNumeric(URL.Id)>
			<cfscript>
                Session.PlanSearchId = URL.Id;
                Session.PlanSearchType = "Canned Search";
                Session.PlanViewType = "detailed";
                Session.PlanSortOption = 1;
                Session.PlansPerPage = 12;
                Session.CurrentPage = 1;
            </cfscript>
        <cfelse>
        	<cflocation url="/default.cfm?noid" addtoken="No">
        </cfif>
    </cfif>

<!--- Change the plan view type, if applicable --->
	<cfif IsDefined("URL.pvt")>
        <cfif URL.pvt EQ "gallery">
			<cfscript>
                Session.PlanViewType = "gallery";
                Session.CurrentPage = 1;
                Session.PlansPerPage = 12;
            </cfscript>
        <cfelseif URL.pvt EQ "detailed">
			<cfscript>
                Session.PlanViewType = "detailed";
                Session.CurrentPage = 1;
                Session.PlansPerPage = 12;
            </cfscript>
        <cfelse>
			<cfscript>
                Session.PlanViewType = "gallery";
                Session.CurrentPage = 1;
                Session.PlansPerPage = 12;
            </cfscript>
        </cfif>
    </cfif>
    
<!--- Set the current page, if applicable --->
	<cfif IsDefined("URL.page")>
    	<cfscript>
			if (IsNumeric(URL.Page)) {
				Session.CurrentPage = URL.page;
			}
			else {
				Session.CurrentPage = 1;
			}
		</cfscript>
    </cfif>
    
<!--- Change the plan sort type, if applicable --->
	<cfif IsDefined("URL.so")>
    	<cfif URL.so EQ 1>
			<cfscript>
                Session.PlanSortOption = 1;
                Session.CurrentPage = 1;
            </cfscript>
        <cfelseif URL.so EQ 2>
			<cfscript>
                Session.PlanSortOption = 2;
                Session.CurrentPage = 1;
            </cfscript>
        <cfelse>
			<cfscript>
                Session.PlanSortOption = 1;
                Session.CurrentPage = 1;
            </cfscript>
        </cfif>
    </cfif>
    
<!--- Change the Plans Per Page, if applicable --->
	<cfif IsDefined("URL.ppp")>
    	<cfif IsNumeric(URL.ppp)>
			<cfscript>
                Session.PlansPerPage = URL.ppp;
                Session.CurrentPage = 1;
            </cfscript>
        <cfelse>
        	<cflocation url="/default.cfm?ppp" addtoken="No">
        </cfif>    	
    </cfif>
    
<!--- Convert Session to Local Variables --->
	<cfscript>
        VARIABLES.PlanSearchId = Session.PlanSearchId;
        if (IsDefined("Session.PlanSearchType")) {
            VARIABLES.PlanSearchType = Session.PlanSearchType;
        }
        VARIABLES.PlanSortOption = Session.PlanSortOption;
        VARIABLES.PlanViewType = Session.PlanViewType;
        VARIABLES.PlansPerPage = Session.PlansPerPage;
        VARIABLES.thisPage = Session.CurrentPage;
        VARIABLES.firstPlan = ((VARIABLES.thisPage * VARIABLES.PlansPerPage) + 1) - VARIABLES.PlansPerPage;
        VARIABLES.lastPlan = VARIABLES.thisPage * VARIABLES.PlansPerPage;
    </cfscript>
    
<!--- Get Plan Information --->
	<cfif IsNumeric(VARIABLES.PlanSearchId)>
    	<cfif VARIABLES.PlanSearchId GTE 1 AND VARIABLES.PlanSearchId LTE 61>
        	<cfif VARIABLES.PlanSearchId NEQ 5>
				<cfscript>
                    // Get Plan Information
                    VARIABLES.PlanInfo = Application.PlanSearchService.getPlanSearchResults(VARIABLES.PlanSearchId);
                </cfscript>
            <cfelse>
    			<cflocation url="/default.cfm?neq5" addtoken="No">
            </cfif>
        <cfelse>
    		<cflocation url="/default.cfm?invid" addtoken="No">
        </cfif>
    <cfelse>
    	<cflocation url="/default.cfm?badid" addtoken="No">
    </cfif>
    
	<cfscript>
        if (VARIABLES.PlanInfo.MatchingPlanCount LT VARIABLES.lastPlan) {
            VARIABLES.lastPlan = VARIABLES.PlanInfo.MatchingPlanCount;	
        }
        pdLen = VARIABLES.PlanInfo.MatchingPlanCount;
        RecordDisplayOptions = "10,25,50,All";
        noThumbnail = '/assets/images/noPhoto.gif';
        noThumbnailW = 75;
        noThumbnailH = 50;
    </cfscript>
    
    <cfparam name="linksPerPage" type="integer" default="5">
    <cfparam name="cssClass" default="paging">
    <cfparam name="pnCssClass" default="pagingPN">

<cfscript>
   pai = StructNew();
   pai.totalrecords = VARIABLES.PlanInfo.MatchingPlanCount;
   pai.currentPage = VARIABLES.thisPage;
   pai.recordsPerPage = VARIABLES.plansPerPage;
   pai.linksPerPage = linksPerPage;
   pai.cssClass = cssClass;
   pai.pnCssClass = pnCssClass;
   VARIABLES.paging = Application.PagingService.generatePaging(pai);

	if (VARIABLES.PlanInfo.MatchingPlanCount GT 0) {
		VARIABLES.pic = StructNew();
		VARIABLES.pic.Plans = VARIABLES.PlanInfo.Plans;
		VARIABLES.pic.thisPage = VARIABLES.thisPage;
		VARIABLES.pic.plansPerPage = VARIABLES.PlansPerPage;
		VARIABLES.pic.planSortOption = VARIABLES.PlanSortOption;
		if (VARIABLES.PlanViewType EQ 'detailed') {
			VARIABLES.pi = Application.PlanService.getPlanInfoForDetailedSearchResults(VARIABLES.pic);
			VARIABLES.minHeight = (VARIABLES.pi.plans.recordCount * 307) + 224;
		}
		else {
			VARIABLES.pi = Application.PlanService.getPlanInfoForGallerySearchResults(VARIABLES.pic);
			VARIABLES.minHeight = ((Ceiling(VARIABLES.pi.plans.recordCount/3)) * 321) + 224;
		}
		Session.PlanList = VARIABLES.pi.planList;
		Session.fromPlanSearch = 1;
	}
	else {
		VARIABLES.minHeight = 500;
		Session.PlanList = Application.PlanService.getAllPlansList();
		Session.fromPlanSearch = 0;
	}
</cfscript>
 
 <cfif NOT IsDefined("VARIABLES.pi")>
 	<cflocation url="/default.cfm?nopi" addtoken="No">
 </cfif>
 
	<cfscript>
		// Page Titles
        if (CGI.HTTP_HOST CONTAINS "CornerStone") {
            VARIABLES.pageTitleBar = VARIABLES.PlanInfo.PageTitle & " - Stock Home Plans for Every Style - CornerStone Designs";	
        }
        else {
            VARIABLES.pageTitleBar = VARIABLES.PlanInfo.PageTitle & " - Stock Home Plans for Every Style - Your Family Architect - Architects Northwest";		
        }
		// Architectural Style Links
		VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
		
		// Popular Search Links
		VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
		
		// Popular Search Links
		VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
		
		// Randon New Plan
		VARIABLES.NewPlan = Application.PlanService.getFeaturedPlanInfoForSearchSubGrouping(28);
    </cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">

    <cfmodule template="#Application.CTPath#planLayout.cfm" title="#VARIABLES.pageTitleBar#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#" minHeight="#VARIABLES.minHeight#" cannedSearch="1">
            <div id="centerColumn">
            	<div id="titleBarPS">
                	<cfoutput>#UCASE(VARIABLES.PlanInfo.PageTitle)#</cfoutput>
                </div>
                <cfif ListLen(VARIABLES.PlanInfo.MatchingPlanCount) EQ 0>
                    <div style="text-align:center;color:red;margin:10px 0;">
                    There are no plans currently identified as <cfoutput>#VARIABLES.PageTitle#</cfoutput>.
                    </div>
                <cfelse>
                <div class="planSearchResultsNavigation">
                	<div class="planSearchResultCount">
                    	Results: <cfoutput>#VARIABLES.FirstPlan#-#VARIABLES.lastPlan# of #VARIABLES.PlanInfo.MatchingPlanCount#</cfoutput>
                    </div>
                    <cfif VARIABLES.paging.TotalPages GT 1>
                	<div class="searchResultsPaging"><cfoutput>#VARIABLES.paging.paging#</cfoutput></div>
                    </cfif>
                </div>
                <div class="planSearchResultsOptions">
                	<div class="planSort">
                    	Sort By:
                    	<form action="#CGI.SCRIPT_NAME#" method="get" name="sbt" style="margin-top:0px;">
                        	<select name="so" onChange="this.form.submit();">
                            	<cfif VARIABLES.PlanSortOption EQ 1>
                            	<option value="1">High to Low Sq. Ft.</option>
                                <option value="2">Low to High Sq. Ft.</option>
                            	<cfelseif VARIABLES.PlanSortOption EQ 2>
                            	<option value="1">High to Low Sq. Ft.</option>
                                <option value="2" SELECTED>Low to High Sq. Ft.</option>
                            	<cfelse>
                            	<option value="1">High to Low Sq. Ft.</option>
                                <option value="2">Low to High Sq. Ft.</option>
                                </cfif>
                            </select>
                        </form>
                    </div>
                	<div class="detailViewNav">
                    	Detail<br />
						View<br />
						<cfoutput><a href="#CGI.SCRIPT_NAME#?pvt=detailed"><img src="/assets/images/btn_DetailView.gif" width="30" height="30" border="0" alt="View Plans in Detail View" /></a></cfoutput>
                    </div>
                    <div class="galleryViewNav">
                    	Gallery<br />
						View<br />
						<cfoutput><a href="#CGI.SCRIPT_NAME#?pvt=gallery"><img src="/assets/images/btn_GalleryView.gif" width="30" height="30" border="0" alt="View Plans in Gallery View" /></a></cfoutput>
                    </div>
                    <div class="plansPerPageOption">
                    	Plans Per Page
                    	<form action="#CGI.SCRIPT_NAME#" method="get" name="ppp" style="margin-top:0px;">
                        	<select name="ppp" onChange="this.form.submit();">
                            <cfif VARIABLES.PlansPerPage EQ 12>
                            	<option value="12">12 Per Page</option>
                                <option value="24">24 Per Page</option>
                                <option value="1000">All </option>
                            <cfelseif VARIABLES.PlansPerPage EQ 24>
                            	<option value="12">12 Per Page</option>
                                <option value="24" SELECTED>24 Per Page</option>
                                <option value="1000">All </option>
                            <cfelse>
                            	<option value="12">12 Per Page</option>
                                <option value="24">24 Per Page</option>
                                <option value="1000" SELECTED>All </option>
                            </cfif>
                            </select>
                        </form>
                    </div>
                    <div class="clearFloat"></div>
                </div>

               	<cfif VARIABLES.PlanViewType EQ "detailed">
                	<cfoutput query="VARIABLES.pi.plans">
                	<div class="planDetailedContainer">
                    	<div style="float:left;">
                        	<a class="planSpec" href="detailedPlanInfo.cfm?PlanId=#PlanId#"><img src="#planThumbnail#" width="378" height="277" border=0 /></a>
                        </div>
                        <div style="float:right;width:145px;">
                        	<div style="text-align:center;font-size:13px;border-bottom:thin solid black;font-weight:bold;text-transform:uppercase;padding-bottom:5px;">
                        		<a class="brownLink" href="detailedPlanInfo.cfm?PlanId=#PlanId#">#PlanTitle#</a>
                            </div>
                            <div style="text-align:center;font-size:13px;font-weight:bold;text-transform:uppercase;padding-top:5px;padding-bottom:20px;">
                            	<a class="brownLink" href="detailedPlanInfo.cfm?PlanId=#PlanId#">#PlanNumber#</a>
                            </div>
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Total Area:</div>
                                <div style="float:right;">#TotalSF# sq. ft.</div>
                                <div class="clearFloat"></div>
                            </div>
                            <cfif GarageSize NEQ "No Garage">
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Garage Area:</div>
                                <div style="float:right;">#GarageSF# sq. ft.</div>
                                <div class="clearFloat"></div>
                            </div>
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Garage Size:</div>
                                <div style="float:right;">#GarageSize#</div>
                                <div class="clearFloat"></div>
                            </div>
                            </cfif>
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Stories:</div>
                                <div style="float:right;">#Stories#</div>
                                <div class="clearFloat"></div>
                            </div>
                            <cfif IsNumeric(Bedroom)>
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Bedrooms:</div>
                                <div style="float:right;">#Bedroom#</div>
                                <div class="clearFloat"></div>
                            </div>
                            </cfif>
                            <cfif IsNumeric(FullBathroom)>
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Full Baths:</div>
                                <div style="float:right;">#FullBathroom#</div>
                                <div class="clearFloat"></div>
                            </div>
                            </cfif>
                            <cfif IsNumeric(HalfBathroom)>
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Half Baths:</div>
                                <div style="float:right;">#HalfBathroom#</div>
                                <div class="clearFloat"></div>
                            </div>
                            </cfif>
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Width:</div>
                                <div style="float:right;">#Width#</div>
                                <div class="clearFloat"></div>
                            </div>
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Depth:</div>
                                <div style="float:right;">#Depth#</div>
                                <div class="clearFloat"></div>
                            </div>
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Height:</div>
                                <div style="float:right;">#Height#</div>
                                <div class="clearFloat"></div>
                            </div>
                            <div class="planSpecItemContainer">
                                <div style="float:left;">Foundation:</div>
                                <div style="float:right;">#FoundationType#</div>
                                <div class="clearFloat"></div>
                            </div>
                            <div class="planSpecViewPlan">
                            	<a class="planSpec" href="detailedPlanInfo.cfm?PlanId=#PlanId#">View Floor Plan</a>
                            </div>
                        </div>
                        <div class="clearFloat"></div>
                    </div>
                    </cfoutput>
                <cfelse>
                	<cfoutput query="VARIABLES.pi.plans">
                    <cfif VARIABLES.pi.plans.currentRow MOD(3) NEQ 0><div class="PlanGalleryContainer"><cfelse><div class="PlanGalleryContainerRight"></cfif>
                    	<div style="text-align:center;font-size:13px;font-weight:bold;text-transform:uppercase;padding-bottom:5px;">
                            <a class="brownLink" href="detailedPlanInfo.cfm?PlanId=#PlanId#">#PlanTitle#</a>
                        </div>
                        <a href="detailedPlanInfo.cfm?PlanId=#PlanId#"><img src="#PlanThumbnail#" width="165" height="121" border="0" alt="#PlanTitle#" /></a>
                        <div style="text-align:center;font-size:13px;font-weight:bold;text-transform:uppercase;padding-top:5px;padding-bottom:20px;">
                            <a class="brownLink" href="detailedPlanInfo.cfm?PlanId=#PlanId#">#PlanNumber#</a>
                        </div>
                        <div class="planSpecItemContainer">
                            <div style="float:left;">Total Area:</div>
                            <div style="float:right;">#TotalSF# sq. ft.</div>
                            <div class="clearFloat"></div>
                        </div>
                        <div class="planSpecItemContainer">
                            <div style="float:left;">Stories:</div>
                            <div style="float:right;">#Stories#</div>
                            <div class="clearFloat"></div>
                        </div>
                        <cfif IsNumeric(Bedroom)>
                        <div class="planSpecItemContainer">
                            <div style="float:left;">Bedrooms:</div>
                            <div style="float:right;">#Bedroom#</div>
                            <div class="clearFloat"></div>
                        </div>
                        </cfif>
                        <cfif IsNumeric(FullBathroom)>
                        <div class="planSpecItemContainer">
                            <div style="float:left;">Full Baths:</div>
                            <div style="float:right;">#FullBathroom#</div>
                            <div class="clearFloat"></div>
                        </div>
                        </cfif>
                        <div class="planSpecViewPlan">
                            <a class="planSpec" href="detailedPlanInfo.cfm?PlanId=#PlanId#">View Floor Plan</a>
                        </div>
                     </div>
                     <cfif VARIABLES.pi.plans.currentRow MOD(3) EQ 0><div class="clearFloat"></div></cfif> 
                    </cfoutput>
                    <div class="clearFloat"></div>
                </cfif>
                <div class="planSearchResultsNavigation">
                	<div class="planSearchResultCount">
                    	Results: <cfoutput>#VARIABLES.FirstPlan#-#VARIABLES.lastPlan# of #VARIABLES.PlanInfo.MatchingPlanCount#</cfoutput>
                    </div>
                	<div class="searchResultsPagingAlt"><cfoutput>#VARIABLES.paging.paging#</cfoutput></div>
                </div>
                <div class="planSearchResultsOptions">
                	<div class="planSort">
                    	Sort By:
                    	<form action="#CGI.SCRIPT_NAME#" method="get" name="sbt" style="margin-top:0px;">
                        	<select name="so" onChange="this.form.submit();">
                            	<cfif VARIABLES.PlanSortOption EQ 1>
                            	<option value="1">High to Low Sq. Ft.</option>
                                <option value="2">Low to High Sq. Ft.</option>
                            	<cfelseif VARIABLES.PlanSortOption EQ 2>
                            	<option value="1">High to Low Sq. Ft.</option>
                                <option value="2" SELECTED>Low to High Sq. Ft.</option>
                            	<cfelse>
                            	<option value="1">High to Low Sq. Ft.</option>
                                <option value="2">Low to High Sq. Ft.</option>
                                </cfif>
                            </select>
                        </form>
                    </div>
                	<div class="detailViewNav">
                    	Detail<br />
						View<br />
						<cfoutput><a href="#CGI.SCRIPT_NAME#?pvt=detailed"><img src="/assets/images/btn_DetailView.gif" width="30" height="30" border="0" alt="View Plans in Detail View" /></a></cfoutput>
                    </div>
                    <div class="galleryViewNav">
                    	Gallery<br />
						View<br />
						<cfoutput><a href="#CGI.SCRIPT_NAME#?pvt=gallery"><img src="/assets/images/btn_GalleryView.gif" width="30" height="30" border="0" alt="View Plans in Gallery View" /></a></cfoutput>
                    </div>
                    <div class="plansPerPageOption">
                    	Plans Per Page
                    	<form action="#CGI.SCRIPT_NAME#" method="get" name="ppp" style="margin-top:0px;">
                        	<select name="ppp" onChange="this.form.submit();">
                            <cfif VARIABLES.PlansPerPage EQ 12>
                            	<option value="12">12 Per Page</option>
                                <option value="24">24 Per Page</option>
                                <option value="1000">All </option>
                            <cfelseif VARIABLES.PlansPerPage EQ 24>
                            	<option value="12">12 Per Page</option>
                                <option value="24" SELECTED>24 Per Page</option>
                                <option value="1000">All </option>
                            <cfelse>
                            	<option value="12">12 Per Page</option>
                                <option value="24">24 Per Page</option>
                                <option value="1000" SELECTED>All </option>
                            </cfif>
                            </select>
                        </form>
                    </div>
                    <div class="clearFloat"></div>
                </div>
            </cfif>
            </div>
        </cfmodule>