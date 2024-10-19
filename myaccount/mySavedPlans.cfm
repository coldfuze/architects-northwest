<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">
    
<!--- Delete a saved plan, if applicable --->
	<cfif IsDefined("URL.delPlanId")>
    	<cfif IsNumeric(URL.delPlanId)>
			<cfscript>
                VARIABLES.CustomerId = Session.CustomerId;
				VARIABLES.dsp = {};
				VARIABLES.dsp.CustomerId = VARIABLES.CustomerId;
				VARIABLES.dsp.PlanId = URL.delPlanId;
				VARIABLES.newSavedPlans = Application.CustomerService.deleteSavedPlan(VARIABLES.dsp);
				Session.SavedPlans = VARIABLES.newSavedPlans;
			</cfscript>
        </cfif>
    </cfif>

<!--- Change the type of plans searched (if applicable) --->
	<cfif IsDefined("URL.so")>
		<cfscript>
            Session.PlanViewType = "detailed";
            Session.PlanSortOption = 1;
            Session.PlansPerPage = 12;
            Session.CurrentPage = 1;
            Session.PlanList = Session.SavedPlans;
        </cfscript>
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
			Session.CurrentPage = URL.page;
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
        </cfif>
    </cfif>
    
<!--- Convert Session to Local Variables --->
	<cfscript>
        VARIABLES.SavedPlans = Session.SavedPlans;
        VARIABLES.PlanSortOption = Session.PlanSortOption;
        VARIABLES.PlanViewType = Session.PlanViewType;
        VARIABLES.PlansPerPage = Session.PlansPerPage;
        VARIABLES.thisPage = Session.CurrentPage;
        VARIABLES.firstPlan = ((VARIABLES.thisPage * VARIABLES.PlansPerPage) + 1) - VARIABLES.PlansPerPage;
        VARIABLES.lastPlan = VARIABLES.thisPage * VARIABLES.PlansPerPage;
    </cfscript>

	<cfscript>
        if (ListLen(VARIABLES.SavedPlans) LT VARIABLES.lastPlan) {
            VARIABLES.lastPlan = ListLen(VARIABLES.SavedPlans);	
        }
        pdLen = ListLen(VARIABLES.SavedPlans);
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
       pai.totalrecords = ListLen(VARIABLES.SavedPlans);
       pai.currentPage = VARIABLES.thisPage;
       pai.recordsPerPage = VARIABLES.plansPerPage;
       pai.linksPerPage = linksPerPage;
       pai.cssClass = cssClass;
       pai.pnCssClass = pnCssClass;
       VARIABLES.paging = Application.PagingService.generatePaging(pai);
    </cfscript>

    <cfscript>
		if (ListLen(VARIABLES.SavedPlans) GT 0) {
			VARIABLES.pic = StructNew();
			VARIABLES.pic.Plans = VARIABLES.SavedPlans;
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

	<cfscript>
		// Page Titles
        if (CGI.HTTP_HOST CONTAINS "CornerStone") {
            VARIABLES.pageTitleBar = "My Saved Plans - Stock Home Plans for Every Style - CornerStone Designs";	
        }
        else {
            VARIABLES.pageTitleBar = "My Saved Plans - Stock Home Plans for Every Style - Your Family Architect - Architects Northwest";		
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

    <cfif IsDefined("VARIABLES.newSavedPlans")>
    	<cfsavecontent variable="alert">
        	<script language="javascript" type="text/javascript">
				alert("Plan deleted from your saved plans successfully!");
			</script>
        </cfsavecontent>
        
        <cfhtmlhead text="#alert#">
    </cfif>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitleBar#" recentlyviewedplans="#VARIABLES.RecentlyViewedPlans#" minheight="#VARIABLES.minHeight#"  isMySavedPlansPage="1">
    	<div id="planSearchResultsContainer">
        	<div id="planSearchResultsLeftColumn">
            	<div id="quickSearchContainer">
                	<div id="qsTop">
                        <a id="avs" href="/plans/"></a>
                    </div>
                    <div class="clearFloat"></div>
                    <div id="qsContainer">
                    	<h1 class="quickSearch">Search by Plan Name:</h1>
                        <form name="sbpn" action="/plans/detailedPlanInfo.cfm" method="get" style="margin:0 0 10px 0;padding:0;white-space:nowrap;vertical-align:middle;">
                            <input type="hidden" name="nps" value="0">
                            <input name="PlanTitle" type="text" style="margin-right:0px;color:black;font-size:12px;width:141px;" align="left" value="Enter a Plan Name" onClick="this.form.PlanTitle.value='';">
                            <input type="image" src="/assets/images/btn_Go.gif" name="submit" value="Go" style="display:inline-block;vertical-align:bottom;">
                        </form>
                        <h1 class="quickSearch3">Search By Plan Number:</h1>
                        <form name="sbpno" action="/plans/detailedPlanInfo.cfm" method="get" style="margin:0 0 10px 0;padding:0;white-space:nowrap;">
                            <input type="hidden" name="nps" value="0">
                            <select name="PlanId"  style="font-size:12px;width:173px;" onChange="this.form.submit();">
                                <option value="">Select a Plan Number</option>
								<cfoutput query="VARIABLES.planNumberPicklist">
								<option value="#EncodeForHTMLAttribute(PlanId)#">#EncodeForHTML(PlanNumber)#</option>
								</cfoutput>
                            </select>
                        </form>
                        
                        <h1 class="quickSearch3">Search By Plan Type:</h1>
                        <form name="sbpt" action="/plans/planSearchResults.cfm" method="get" style="margin:0 0 10px 0;padding:0;white-space:nowrap;">
                            <select name="Id" style="font-size:12px;width:173px;" onChange="this.form.submit();">
                                <option value="8">Select a Plan Type</option>
                                <option value="8">Show All Plans</option>
                                <option value="34">1 Story House Plans</option>
                                <option value="35">1 Story House Plans With Basement</option>
                                <option value="36">2 Story House Plans</option>
                                <option value="37">2 Story House Plans With Basement</option>
                                <option value="38">3 Story House Plans</option>
                                <option value="39">3 Story House Plans With Basement</option>
                                <option value="3">Garage and Accessory Plans</option>
                                <option value="55">Split Level Plans</option>
                                <option value="56">Tri Level Plans</option>
                            </select>
                        </form>
                        
                        <h1 class="quickSearch2">Search By Plan Features:</h1>
                        
                        <form name="sbps" id="sbps" style="margin:0;white-space:nowrap;">
                            <h1 class="quickSearch3">Plan Type:</h1>
                            <select id="qsPlanTypeId" name="PlanTypeId" value="PlanTypeId" style="font-size:12px;width:172px;">
                                <option value="0">Any</option>
								<cfloop query="VARIABLES.ptng">
									<cfif VARIABLES.PlanType EQ PlanTypeId>
										<cfoutput><option selected value="#EncodeForHTMLAttribute(PlanTypeId)#">#EncodeForHTML(PlanType)#</option></cfoutput>
									<cfelse>
										<cfoutput><option value="#EncodeForHTMLAttribute(PlanTypeId)#">#EncodeForHTML(PlanType)#</option></cfoutput>
									</cfif>
								</cfloop>
                            </select>
                            <h1 class="quickSearch3">Square Footage:</h1>
                           
                            <div class="quickSearchLeft">
                                <select id="qsSquareFootageLow" name="SquareFootageLow" style="font-size:12px;width:84px;">
                                    <option value="0">Min</option>
                                    <cfloop from="500" to="7000" step="500" index="i"><cfif i EQ VARIABLES.squareFootageLow><cfoutput><option selected value="#i#">#i#</option></cfoutput><cfelse><cfoutput><option value="#i#">#i#</option></cfoutput></cfif></cfloop>
                                </select>
                            </div>
                            
                            <div class="quickSearchRight">
                                <select id="qsSquareFootageHigh" name="SquareFootageHigh" style="font-size:12px;width:84px;">
                                    <option value="11000">Max</option>
                                    <cfloop from="1000" to="7000" step="500" index="i"><cfif i EQ VARIABLES.squareFootageHigh><cfoutput><option selected value="#i#">#i#</option></cfoutput><cfelse><cfoutput><option value="#i#">#i#</option></cfoutput></cfif></cfloop>
                                    <option value="11000">7500 +</option>
                                </select>
                            </div>
                            <div class="qsClearFloat"></div>
                            
                            <div class="quickSearchLeft">
                                <h1 class="quickSearch">Bedrooms:</h1>
                                <select id="qsBedrooms" name="Bedrooms" style="font-size:12px;width:84px;">
                                    <option value="100">Any</option>
									<cfloop query="VARIABLES.br">
										<cfoutput>#VARIABLES.br.currentrow#</cfoutput>
										<cfif BedroomId EQ VARIABLES.Bedrooms>
											<cfoutput><option selected value="#EncodeForHTMLAttribute(BedroomId)#">#EncodeForHTML(Bedroom)#</option></cfoutput>
										<cfelse>
											<cfoutput><option value="#EncodeForHTMLAttribute(BedroomId)#">#EncodeForHTML(Bedroom)#</option></cfoutput>
										</cfif>
									</cfloop>
                                </select>
                            </div>
                            <div class="quickSearchRight">
                                <h1 class="quickSearch">Full Baths:</h1>
                                <select id="qsBathrooms" name="Bathrooms" style="font-size:12px;width:84px;">
                                    <option value="100">Any</option>
									<cfloop query="VARIABLES.fbr">
									<cfif FullBathroomId EQ VARIABLES.Bathrooms>
										<cfoutput><option selected value="#EncodeForHTMLAttribute(FullBathroomId)#">#EncodeForHTML(FullBathroom)#</option></cfoutput>
									<cfelse>
										<cfoutput><option value="#EncodeForHTMLAttribute(FullBathroomId)#">#EncodeForHTML(FullBathroom)#</option></cfoutput>
									</cfif>
									</cfloop>	 
                                </select>
                            </div>
                            <div class="clearFloat"></div>
                        </form>
                        
                        <!---<cfdiv id="qsPlanCount" bind="url:quickSearchPlans.cfm?PlanTypeId={PlanTypeId}&Bedrooms={Bedrooms}&Bathrooms={Bathrooms}&SquareFootageLow={SquareFootageLow}&SquareFootageHigh={SquareFootageHigh}" />--->
								
						<div id="qsPlanCount"></div>
                                                
                        <div id="qsPlanSearchSubmit">
                            <form name="qsSearch" action="/plans/QuickSearchResults.cfm" method="get" style="margin:0;padding:0;">
                                <input type="hidden" name="so" value="1">
                                <input type="submit" name="thisQuickSearch" value="Begin Search" style="font-weight:bold;">
                            </form>
                        </div>
                        <div id="qsPlanSearchReset" style="text-align:center;margin-top:15px;">
                            <cfoutput><a href="#CGI.SCRIPT_NAME#?reset=1" onClick="javascript:document.getElementById('sbps').reset();" class="qs">Reset Search</a></cfoutput>
                        </div>
                    </div>
                </div>
                <div id="whiteSpacer"></div>
                <div id="planStyles">
                    <cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                	<cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                	<cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
                </div>
            </div>
            <div id="planSearchResultsCenterColumn">
            	<div id="titleBarPS">
                	<cfoutput>MY SAVED PLANS</cfoutput>
                </div>
                <cfif ListLen(VARIABLES.SavedPlans) EQ 0>
                    <div style="text-align:center;color:red;margin:10px 0;">
                    	You do not have any saved plans.
                    </div>
                <cfelse>
                <div class="planSearchResultsNavigation">
                	<div class="planSearchResultCount">
                    	Results: <cfoutput>#VARIABLES.FirstPlan#-#VARIABLES.lastPlan# of #ListLen(VARIABLES.SavedPlans)#</cfoutput>
                    </div>
                    <cfif VARIABLES.paging.TotalPages GT 1>
                	<div class="searchResultsPaging"><cfoutput>#VARIABLES.paging.paging#</cfoutput></div>
                    </cfif>
                </div>
                <div class="planSearchResultsOptions">
                	<div class="planSort">
                    	Sort By:
                    	<form action="mySavedPlans.cfm" method="get" name="sbt">
                        	<select name="so" onChange="this.form.submit();">
                            	<cfif VARIABLES.PlanSortOption EQ 1>
                            	<option value="1">High to Low Sq. Ft.</option>
                                <option value="2">Low to High Sq. Ft.</option>
                            	<cfelseif VARIABLES.PlanSortOption EQ 2>
                            	<option value="1">High to Low Sq. Ft.</option>
                                <option value="2" selected>Low to High Sq. Ft.</option>
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
						<a href="mySavedPlans.cfm?pvt=detailed"><img src="/assets/images/btn_DetailView.gif" width="30" height="30" border="0" alt="View Plans in Detail View" /></a>
                    </div>
                    <div class="galleryViewNav">
                    	Gallery<br />
						View<br />
						<a href="mySavedPlans.cfm?pvt=gallery"><img src="/assets/images/btn_GalleryView.gif" width="30" height="30" border="0" alt="View Plans in Gallery View" /></a>
                    </div>
                    <div class="plansPerPageOption">
                    	Plans Per Page
                    	<form action="mySavedPlans.cfm" method="get" name="ppp">
                        	<select name="ppp" onChange="this.form.submit();">
                            <cfif VARIABLES.PlansPerPage EQ 12>
                            	<option value="12">12 Per Page</option>
                                <option value="24">24 Per Page</option>
                                <option value="1000">All </option>
                            <cfelseif VARIABLES.PlansPerPage EQ 24>
                            	<option value="12">12 Per Page</option>
                                <option value="24" selected>24 Per Page</option>
                                <option value="1000">All </option>
                            <cfelse>
                            	<option value="12">12 Per Page</option>
                                <option value="24">24 Per Page</option>
                                <option value="1000" selected>All </option>
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
                        	<a class="planSpec" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#"><img src="#planThumbnail#" width="378" height="277" border=0 /></a>
                        </div>
                        <div style="float:right;width:145px;">
                        	<div style="text-align:center;font-size:13px;border-bottom:thin solid black;font-weight:bold;text-transform:uppercase;padding-bottom:5px;">
                        		<a class="brownLink" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#">#PlanTitle#</a>
                            </div>
                            <div style="text-align:center;font-size:13px;font-weight:bold;text-transform:uppercase;padding-top:5px;padding-bottom:20px;">
                            	<a class="brownLink" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#">#PlanNumber#</a>
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
                            	<div style="line-height:20px;">
                                    <a class="planSpec" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#">View Floor Plan</a><br />
                                    <a class="planSpec" href="mySavedPlans.cfm?delPlanId=#PlanId#" onClick="javascript:return confirm('Are you sure you want to delete this plan from your Saved Plans ?')">Remove This Plan</a>
                                </div>
                            </div>
                        </div>
                        <div class="clearFloat"></div>
                    </div>
                    </cfoutput>
                <cfelse>
                	<cfoutput query="VARIABLES.pi.plans">
                    <cfif VARIABLES.pi.plans.currentRow MOD(3) NEQ 0><div class="PlanGalleryContainer"><cfelse><div class="PlanGalleryContainerRight"></cfif>
                    	<div style="text-align:center;font-size:13px;font-weight:bold;text-transform:uppercase;padding-bottom:5px;">
                            <a class="brownLink" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#">#PlanTitle#</a>
                        </div>
                        <a href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#"><img src="#PlanThumbnail#" width="165" height="121" border="0" alt="#PlanTitle#" /></a>
                        <div style="text-align:center;font-size:13px;font-weight:bold;text-transform:uppercase;padding-top:5px;padding-bottom:20px;">
                            <a class="brownLink" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#">#PlanNumber#</a>
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
                        	<div style="line-height:20px;">
                                <a class="planSpec" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#">View Floor Plan</a><br />
                                <a class="planSpec" href="mySavedPlans.cfm?delPlanId=#PlanId#" onClick="javascript:return confirm('Are you sure you want to delete this plan from your Saved Plans ?')">Remove This Plan</a>
                            </div>
                        </div>
                     </div>
                     <cfif VARIABLES.pi.plans.currentRow MOD(3) EQ 0><div class="clearFloat"></div></cfif> 
                    </cfoutput>
                    <div class="clearFloat"></div>
                </cfif>
                <div class="planSearchResultsNavigation">
                	<div class="planSearchResultCount">
                    	Results: <cfoutput>#VARIABLES.FirstPlan#-#VARIABLES.lastPlan# of #ListLen(VARIABLES.SavedPlans)#</cfoutput>
                    </div>
                	<cfif VARIABLES.paging.TotalPages GT 1>
                	<div class="searchResultsPagingAlt"><cfoutput>#VARIABLES.paging.paging#</cfoutput></div>
                    </cfif>
                </div>
                <div class="planSearchResultsOptions">
                	<div class="planSort">
                    	Sort By:
                    	<form action="mySavedPlans.cfm" method="get" name="sbt">
                        	<select name="so" onChange="this.form.submit();">
                            	<cfif VARIABLES.PlanSortOption EQ 1>
                            	<option value="1">High to Low Sq. Ft.</option>
                                <option value="2">Low to High Sq. Ft.</option>
                            	<cfelseif VARIABLES.PlanSortOption EQ 2>
                            	<option value="1">High to Low Sq. Ft.</option>
                                <option value="2" selected>Low to High Sq. Ft.</option>
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
						<a href="mySavedPlans.cfm?pvt=detailed"><img src="/assets/images/btn_DetailView.gif" width="30" height="30" border="0" alt="View Plans in Detail View" /></a>
                    </div>
                    <div class="galleryViewNav">
                    	Gallery<br />
						View<br />
						<a href="mySavedPlans.cfm?pvt=gallery"><img src="/assets/images/btn_GalleryView.gif" width="30" height="30" border="0" alt="View Plans in Gallery View" /></a>
                    </div>
                    <div class="plansPerPageOption">
                    	Plans Per Page
                    	<form action="mySavedPlans.cfm" method="get" name="ppp">
                        	<select name="ppp" onChange="this.form.submit();">
                            <cfif VARIABLES.PlansPerPage EQ 12>
                            	<option value="12">12 Per Page</option>
                                <option value="24">24 Per Page</option>
                                <option value="1000">All </option>
                            <cfelseif VARIABLES.PlansPerPage EQ 24>
                            	<option value="12">12 Per Page</option>
                                <option value="24" selected>24 Per Page</option>
                                <option value="1000">All </option>
                            <cfelse>
                            	<option value="12">12 Per Page</option>
                                <option value="24">24 Per Page</option>
                                <option value="1000" selected>All </option>
                            </cfif>
                            </select>
                        </form>
                    </div>
                    <div class="clearFloat"></div>
                </div>
            </cfif>
            </div>
            <div id="planSearchResultsRightColumn">
            	<div id="newPlan">
                	<strong><a href="/plans/mySavedPlans.cfm?Id=6" class="brownLink">NEW<br />PLANS</a></strong>
                	<br />
                	<cfoutput query="VARIABLES.NewPlan">
                    <a href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#&nps=0" title="Click to view #PlanTitle# - Plan #PlanNumber#"><img src="#PlanThumbnail#" width="165" height="121" border=0 style="padding-top:5px;padding-bottom:5px;" alt="Carberry" /></a>
                    <strong><a href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#&nps=0" title="Click to view The #PlanTitle# - Plan #PlanNumber#" class="brownLink">#PlanTitle#<br />#PlanNumber#</a></strong>
                    <div style="font-size:12px;position:relative;padding:5px 0 5px 5px;">
                        <div style="float:left;width:80px;text-align:left;margin:10px 0 10px 0;">
                            Total Area:<br />
                            Stories:<br />
                            Bedrooms:<br />
                            Full Baths:
                        </div>
                        <div style="float:left;width:85px;text-align:right;margin:10px 0 10px 0;">
                            #TotalSF# sq. ft.<br />
                            #Stories#<br />
                            #Bedroom#<br />
                            #FullBathroom#
                        </div>
                        <br clear="all" />
                        <strong><a class="planSpec" href="/plans/detailedPlanInfo.cfm?PlanId=#PlanId#&nps=0" title="Click to view #PlanTitle# - Plan #PlanNumber#">View Floor Plan</a></strong>
                        </cfoutput>
                    </div>
                 </div>
                 
                 <div id="whiteSpacer"></div>
                
            	<div id="chatPS">
                    <img src="/assets/images/PayPal.gif" width="175" height="154" alt="Pay Pal Image"/>
                </div>
                
                <div id="whiteSpacer"></div>
                
                <div id="buildingProducts">
                	<strong>BUILDING<br />
                    PRODUCTS</strong>
                    <br />
                    <img src="/assets/images/SponsorLogos.jpg" width="174" height="592" border=0 usemap="#m_SponsorLogos">
                </div>
            </div>
            <div class="clearFloat"></div>
        </div>
    </cfmodule>