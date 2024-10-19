<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<!--- Set Page Titles and Picklists --->
	<cfscript>
        // Set Page Title
        if (CGI.HTTP_HOST CONTAINS "CornerStone") {
            VARIABLES.pageTitle = "Advanced Plan Search - Stock Home Plans for Every Style - CornerStone Designs";	
        }
        else {
            VARIABLES.pageTitle = "Advanced Plan Search - Your Family Architect - Architects Northwest";		
        }
        
        // House Dimension Width Low Pick List
        VARIABLES.HouseDimensionWidthLow = "Minimum,15,20,25,30,35,40,45,50,60,70,80,90,100";
        
        // House Dimension Width High Pick List
        VARIABLES.HouseDimensionWidthHigh = "Maximum,20,25,30,35,40,45,50,60,70,80,90,100,200";
		
		// House Dimension Width Low Pick List
        VARIABLES.HouseDimensionHeightLow = "Minimum,15,20,25,30,35";
        
        // House Dimension Width High Pick List
        VARIABLES.HouseDimensionHeightHigh = "Maximum,20,25,30,35,40,50";
        
        // Bonus Space Location Picklist
        VARIABLES.BonusSpaceLocationPicklist = "Any,Lower Floor,Main Floor,Upper Floor,3rd Floor";
        
        // Bedrooms Pick List
        VARIABLES.tbr = Application.BedroomService.getBedroomsForAdvancedSearch();
        
        // Full Bathrooms Picklist
        VARIABLES.tfbr = Application.FullBathroomService.getFullBathroomsForAdvancedSearch();
        
        // Get Plan Types
        VARIABLES.ptng = Application.PlanTypeService.getPlanTypesForNonGarageSearch();
        
        // Living Arrangement Picklist
        VARIABLES.la = Application.LivingArrangementService.getAllAsQuery();
        
        // Master Bedroom Location Picklist
        VARIABLES.mbl = Application.MasterBedroomLocationService.getAllAsQuery();
        
        // Covered Porch Picklist
        VARIABLES.cpl = Application.CoveredPorchService.getAllAsQuery();
        
        // Garage Size Picklist
        VARIABLES.gsl = Application.GarageSizeService.getAllAsQuery();
        
        // Garage  Door Location Picklist
        VARIABLES.gdl = Application.GarageDoorLocationService.getAllAsQuery();
        
        // Garage Type Picklist
        VARIABLES.gtl = Application.GarageTypeService.getAllAsQuery();
        
        // Architectural Style Links
        VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
        
        // Popular Search Links
        VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
        
        // Popular Search Links
        VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
        
        // Plan Title Picklist
        VARIABLES.planTitlePicklist = Application.PlanService.getPlanTitlePicklistforQuickSearch();
        
        // Plan Number Picklist
        VARIABLES.planNumberPicklist = Application.PlanService.getPlanNumberPicklistforQuickSearch();
		
		// Randon New Plan
		VARIABLES.NewPlan = Application.PlanService.getFeaturedPlanInfoForSearchSubGrouping(28);
    </cfscript>

<!--- Update Advanced Search Variables, if applicable --->
	<cfif IsDefined("URL.reset") or CGI.HTTP_REFERER DOES NOT CONTAIN "plans/default.cfm">
		<cfscript>
            Session.PlanTypeId = 100;
            Session.TotalSFLow = 0;
            Session.TotalSFHigh = 11000;
            Session.HouseDimensionWidthFtLow = "Minimum";
            Session.HouseDimensionWidthFtHigh = "Maximum";
            Session.HouseDimensionDepthFtLow = "Minimum";
            Session.HouseDimensionDepthFtHigh = "Maximum";
            Session.HouseDimensionHeightFtLow = "Minimum";
            Session.HouseDimensionHeightFtHigh = "Maximum";
            Session.BedroomId = 100;
            Session.FullBathId = 100;
            Session.MasterBedroomLocationId = 100;
            Session.CoveredPorchId = 100;
            Session.GarageSizeId = 100;
            Session.GarageTypeId = 100;
            Session.GarageDoorLocationId = 100;
            Session.BonusRecSpace = "Any";
            Session.LivingArrangementId = 100;
            Session.PlanSortOption = 1;
            Session.PlanViewType = "detailed";
            Session.PlansPerPage = 12;
            Session.CurrentPage = 1;
        </cfscript>
    </cfif>

<!--- Change the plan view type, if applicable --->
	<cfif IsDefined("URL.PlanViewTypeDetailed")>
		<cfscript>
            Session.PlanViewType = "detailed";
            Session.CurrentPage = 1;
        </cfscript>
    </cfif>
    
    <cfif IsDefined("URL.PlanViewTypeGallery")>
		<cfscript>
            Session.PlanViewType = "gallery";
            Session.CurrentPage = 1;
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
        VARIABLES.PlanSortOption = Session.PlanSortOption;
        VARIABLES.PlanViewType = Session.PlanViewType;
        VARIABLES.PlansPerPage = Session.PlansPerPage;
    </cfscript>
    
<!--- Convert Session to Local Variables --->
	<cfscript>
        VARIABLES.PlanTypeId = Session.PlanTypeId;
        VARIABLES.TotalSFLow = Session.TotalSFLow;
        VARIABLES.TotalSFHigh = Session.TotalSFHigh;
        VARIABLES.HouseDimensionWidthFtLow = Session.HouseDimensionWidthFtLow;
        VARIABLES.HouseDimensionWidthFtHigh = Session.HouseDimensionWidthFtHigh;
        VARIABLES.HouseDimensionDepthFtLow = Session.HouseDimensionDepthFtLow;
        VARIABLES.HouseDimensionDepthFtHigh = Session.HouseDimensionDepthFtHigh;
        VARIABLES.HouseDimensionHeightFtLow = Session.HouseDimensionHeightFtLow;
        VARIABLES.HouseDimensionHeightFtHigh = Session.HouseDimensionHeightFtHigh;
        VARIABLES.BedroomId = Session.BedroomId;
        VARIABLES.FullBathId = Session.FullBathId;
        VARIABLES.MasterBedroomLocationId = Session.MasterBedroomLocationId;
        VARIABLES.CoveredPorchId = Session.CoveredPorchId;
        VARIABLES.GarageSizeId = Session.GarageSizeId;
        VARIABLES.GarageTypeId = Session.GarageTypeId;
        VARIABLES.GarageDoorLocationId = Session.GarageDoorLocationId;
        VARIABLES.BonusRecSpace = Session.BonusRecSpace;
        VARIABLES.LivingArrangementId = Session.LivingArrangementId;
        VARIABLES.PlanViewType = Session.PlanViewType;
    </cfscript>

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyviewedplans="#VARIABLES.RecentlyViewedPlans#" advancedPlanSearch="1">
        <div id="mainPlanStyleContainer">            
            <div style="position:absolute;top:0px;left:10px;height:1528px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="planStyleContainer">
            	<div id="titleBar">
                	ADVANCED SEARCH
                </div>

                <div id="planSearchOptions">
                	There are 4 ways to search for the plan that is right for you.
                    <ul type="square" style="margin-top:0px;margin-bottom:0px;">
                		<li><a class="planSpec" href="#sbf">Search By Plan Features</a></li>
						<li><a class="planSpec" href="#sbpn">Search By Plan Name</a></li>
						<li><a class="planSpec" href="#sbpno">Search By Plan Number</a></li>
                        <li><a class="planSpec" href="#sbpt">Search By Plan Type</a></li>
                    </ul>
                </div>
                <a name="sbf">
                <form id="sbf" name="sbf" style="margin:0;white-space:nowrap;">
                <div class="greenTitleBar">
                	SEARCH BY PLAN FEATURES
                </div></a>
                <div style="text-align:left;padding:5px 0px 10px 5px;">
                Please select only the categories that best fit your design criteria.
                </div>
                <div class="planSpecContainerLeft">
                    Plan Type:
                </div>
                <div class="planSpecContainerRight">
                    <select id="PlanTypeId" name="PlanTypeId" display="PlanType" value="PlanTypeId" selected="##" queryPosition="below" style="font-size:12px;width:220px;margin-top:0px;">
                        <option value="100">Any</option>
						<cfloop query="VARIABLES.ptng">
							<cfif PlanTypeId EQ VARIABLES.PlanTypeId>
								<cfoutput><option selected value="#EncodeForHTMLAttribute(PlanTypeId)#">#EncodeForHTML(PlanType)#</option></cfoutput>
							<cfelse>
								<cfoutput><option value="#EncodeForHTMLAttribute(PlanTypeId)#">#EncodeForHTML(PlanType)#</option></cfoutput>
							</cfif>
						</cfloop>	
                    </select>
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft">
                    Square Footage:
                </div>
                <div class="planSpecContainerRight">
                    <input id="SquareFootageLow" name="SquareFootageLow" style="font-size:12px;width:100px;margin-top:0px;" maxlength="5">
                    to
                    <input id="SquareFootageHigh" name="SquareFootageHigh" style="font-size:12px;width:100px;margin-top:0px;" maxlength="5">
                    sq. ft.
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft">
                    House Width:
                </div>
                <div class="planSpecContainerRight">
                    <input id="houseWidthLow" name="houseWidthLow" style="font-size:12px;width:100px;margin-top:0px;" maxlength="3">
                    to
                    <input id="houseWidthHigh" name="houseWidthHigh" style="font-size:12px;width:100px;margin-top:0px;" maxlength="3">
                    ft.
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft">
                    House Depth:
                </div>
                <div class="planSpecContainerRight">
                    <input id="houseDepthLow" name="houseDepthLow" style="font-size:12px;width:100px;margin-top:0px;" maxlength="3">
                    to
                    <input id="houseDepthHigh" name="houseDepthHigh" style="font-size:12px;width:100px;margin-top:0px;" maxlength="3">
                    ft.
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft">
                    <div style="float:left;margin-right:3px;">House Height</div>
                    <div style="float:left;width:16px;"><a href="javascript:void(0);" id="ph" title="is measured from the main floor to the top of the ridge"><img src="/assets/images/btnInfo.png" width="16" height="16" alt="information button image" /></a></div>
                    <div style="float:left;width:5px;">:</div>
                    <div style="clear:both;"></div>
                </div>
                <div class="planSpecContainerRight">
                    <input id="houseHeightLow" name="houseHeightLow" style="font-size:12px;width:100px;margin-top:0px;" maxlength="3">
                    to
                    <input id="houseHeightHigh" name="houseHeightHigh" style="font-size:12px;width:100px;margin-top:0px;" maxlength="3">
                    ft.
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft">
                    Bedrooms:
                </div>
                <div class="planSpecContainerRight">
                    <select id="BedroomId" name="BedroomId" style="font-size:12px;width:220px;">
                        <option value="100">Any</option>
						<cfloop query="VARIABLES.tbr">
							<cfif BedroomId EQ VARIABLES.BedroomId>
								<cfoutput><option selected value="#BedroomId#">#BedroomText#</option></cfoutput>
							<cfelse>
								<cfoutput><option value="#BedroomId#">#BedroomText#</option></cfoutput>
							</cfif>
						</cfloop>
                    </select>
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft">
                    Full Baths:
                </div>
                <div class="planSpecContainerRight">
                    <select id="FullBathId" name="FullBathId" style="font-size:12px;width:220px;">
                        <option value="100">Any</option>
						<cfloop query="VARIABLES.tfbr">
						<cfif FullBathroomId EQ VARIABLES.FullBathId>
						<cfoutput><option selected value="#EncodeForHTMLAttribute(FullBathroomId)#">#EncodeForHTML(FullBathroomText)#</option></cfoutput>
						<cfelse>
						<cfoutput><option value="#EncodeForHTMLAttribute(FullBathroomId)#">#EncodeForHTML(FullBathroomText)#</option></cfoutput>
						</cfif>
						</cfloop>
                    </select>
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft2L">
                   Master Bedroom<br />Location:
                </div>
                <div class="planSpecContainerRight">
                    <select id="MasterBedroomLocationId" name="MasterBedroomLocationId" style="font-size:12px;width:220px;">
                        <option value="100">Any</option>
						<cfloop query="VARIABLES.mbl">
						<cfif MasterBedroomLocationId EQ VARIABLES.MasterBedroomLocationId>
						<cfoutput><option selected value="#EncodeForHTMLAttribute(MasterBedroomLocationId)#">#EncodeForHTML(MasterBedroomLocation)#</option></cfoutput>
						<cfelse>
						<cfoutput><option value="#EncodeForHTMLAttribute(MasterBedroomLocationId)#">#EncodeForHTML(MasterBedroomLocation)#</option></cfoutput>
						</cfif>
						</cfloop>
                    </select>
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft">
                   Covered Porch:
                </div>
                <div class="planSpecContainerRight">
                    <select id="CoveredPorchId" name="CoveredPorchId" style="font-size:12px;width:220px;">
                        <option value="100">Any</option>
						<cfloop query="VARIABLES.cpl">
						<cfif CoveredPorchId EQ VARIABLES.CoveredPorchId>
						<cfoutput><option selected value="#EncodeForHTMLAttribute(CoveredPorchId)#">#EncodeForHTML(CoveredPorchLabel)#</option></cfoutput>
						<cfelse>
						<cfoutput><option value="#EncodeForHTMLAttribute(CoveredPorchId)#">#GetSafeHTML(CoveredPorchLabel)#</option></cfoutput>
						</cfif>
						</cfloop>
                    </select>
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft">
                   Garage Size:
                </div>
                <div class="planSpecContainerRight">
                    <select id="GarageSizeId" name="GarageSizeId" style="font-size:12px;width:220px;">
                        <option value="100">Any</option>
						<cfloop query="VARIABLES.gsl">
							<cfif GarageSizeId EQ VARIABLES.GarageSizeId>
								<cfoutput><option selected value="#EncodeForHTMLAttribute(GarageSizeId)#">#EncodeforHTML(GarageSize)#</option></cfoutput>
							<cfelse>
								<cfoutput><option value="#EncodeForHTMLAttribute(GarageSizeId)#">#EncodeforHTML(GarageSize)#</option></cfoutput>
							</cfif>
						</cfloop>
                    </select>
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft2L">
                   Garage Door<br />Location:
                </div>
                <div class="planSpecContainerRight">
                    <select id="GarageDoorLocationId" name="GarageDoorLocationId" style="font-size:12px;width:220px;">
                        <option value="100">Any</option>
						<cfloop query="VARIABLES.gdl">
							<cfif GarageDoorLocationId EQ VARIABLES.GarageDoorLocationId>
								<cfoutput><option selected value="#EncodeForHTMLAttribute(GarageDoorLocationId)#">#EncodeForHTML(GarageDoorLocation)#</option></cfoutput>
							<cfelse>
								<cfoutput><option value="#EncodeForHTMLAttribute(GarageDoorLocationId)#">#EncodeForHTML(GarageDoorLocation)#</option></cfoutput>
							</cfif>
						</cfloop>
                    </select>
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft">
                   Garage Type:
                </div>
                <div class="planSpecContainerRight">
                    <select id="GarageTypeId" name="GarageTypeId" style="font-size:12px;width:220px;">
                        <option value="100">Any</option>
						<cfloop query="VARIABLES.gtl">
							<cfif GarageTypeId EQ VARIABLES.GarageTypeId>
								<cfoutput><option selected value="#EncodeForHTMLAttribute(GarageTypeId)#">#EncodeForHTML(GarageTypeLabel)#</option></cfoutput>
							<cfelse>
								<cfoutput><option value="#EncodeForHTMLAttribute(GarageTypeId)#">#EncodeForHTML(GarageTypeLabel)#</option></cfoutput>
							</cfif>
						</cfloop>
                    </select>
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft2L">
                   	Bonus / Recreational<br />
					Space Location:
                </div>
                <div class="planSpecContainerRight">
                    <select id="bonusSpaceLocation" name="bonusSpaceLocation" style="font-size:12px;width:220px;margin-top:0px;">
                        <cfloop list="#VARIABLES.BonusSpaceLocationPicklist#" index="i"><cfif VARIABLES.BonusRecSpace EQ i><cfoutput><option selected>#i#</option></cfoutput><cfelse><cfoutput><option>#i#</option></cfoutput></cfif></cfloop>
                    </select>
                </div>
                <br clear="all" />
                <div class="planSpecContainerLeft2L">
                   Living Space<br />Arrangement:
                </div>
                <div class="planSpecContainerRight">
                    <select id="LivingArrangementId" name="LivingArrangementId" style="font-size:12px;width:220px;">
                        <option value="100">Any</option>
						<cfloop query="VARIABLES.la">
							<cfif LivingArrangementId EQ VARIABLES.LivingArrangementId>
								<cfoutput><option selected value="#EncodeForHTMLAttribute(LivingArrangementId)#">#GetSafeHTML(LivingArrangement)#</option></cfoutput>
							<cfelse>
								<cfoutput><option value="#EncodeForHTMLAttribute(LivingArrangementId)#">#GetSafeHTML(LivingArrangement)#</option></cfoutput>
							</cfif>
						</cfloop>
                    </select>
                </div>
                <br clear="all" />
                <div class="planSpecLeft">
                   <cfoutput><a href="default.cfm?reset=1" class="planSpec">Reset Search</a></cfoutput>
                </div>
                </form>
                <div class="planSpecCenter">
                	<form name="sbf" action="advancedSearchResults.cfm" method="post" style="margin:0;white-space:nowrap;">
                    	<input type="hidden" name="so" value="1">
                   		<input type="submit" name="submit" value="Begin Search" style="font-weight:bold;margin-top:0px;width:220px;">
                    </form>
                </div>
                <!---<cfdiv id="PlanCount" class="planSpecRight" bind="url:advancedPlanSearchCounter.cfm?PlanTypeId={PlanTypeId}&SquareFootageLow={SquareFootageLow}&SquareFootageHigh={SquareFootageHigh}&houseWidthLow={houseWidthLow}&houseWidthHigh={houseWidthHigh}&houseDepthLow={houseDepthLow}&houseDepthHigh={houseDepthHigh}&houseHeightLow={houseHeightLow}&houseHeightHigh={houseHeightHigh}&BedroomId={BedroomId}&FullBathId={FullBathId}&MasterBedroomLocationId={MasterBedroomLocationId}&CoveredPorchId={CoveredPorchId}&GarageSizeId={GarageSizeId}&GarageTypeId={GarageTypeId}&GarageDoorLocationId={GarageDoorLocationId}&bonusSpaceLocation={bonusSpaceLocation}&LivingArrangementId={LivingArrangementId}&so={sortOrder}&ppp={plansPerPage}&pvt1={pvt1.checked}&pvt2={pvt2.checked}" />--->
				<div id="PlanCount" class="planSpecRight"></div>
                <br clear="all" />
                <div class="greenTitleBar"><a name="sbpn">SEARCH BY PLAN NAME</a></div>
                <div class="planSpecContainerLeft">
                    Select a Plan Name:
                </div>
                <div class="planSpecContainerRight">
                	<form action="detailedPlanInfo.cfm" method="get" style="margin:0;white-space:nowrap;">
                    	<input type="hidden" name="nps" value="0">
                        <select name="PlanId" style="font-size:12px;width:220px;margin-top:0px;" onChange="this.form.submit();">
                        	<option value="0">Select a Plan</option>
							<cfoutput query="VARIABLES.planTitlePicklist">
								<option value="#EncodeForHTMLAttribute(PlanId)#">#EncodeForHTML(PlanTitle)#</option>
							</cfoutput>
                        </select>
                    </form>
                </div>
                <br clear="all" />
                <div class="greenTitleBar"><a name="sbpno">SEARCH BY PLAN NUMBER</a></div>
                <div class="planSpecContainerLeft">
                    Select a Plan Number:
                </div>
                <div class="planSpecContainerRight">
                	<form name="sbpno" action="detailedPlanInfo.cfm" method="get" style="margin:0 0 10px 0;white-space:nowrap;">
                    	<input type="hidden" name="nps" value="0">
                        <select name="PlanId" query="" display="PlanNumber" value="PlanId" queryPosition="below" style="font-size:12px;width:220px;" onChange="this.form.submit();">
                        	<option value="0">Select a Plan</option><br>
							<cfoutput query="VARIABLES.planNumberPicklist">
								<option value="#EncodeForHTMLAttribute(PlanId)#">#EncodeForHTML(PlanNumber)#</option>
							</cfoutput>
                        </select>
                    </form>
                </div>
                <br clear="all" />
                <div class="greenTitleBar"><a name="sbpt">SEARCH BY PLAN TYPE</a></div>
                <div class="planSpecContainerLeft">
                    Select a Plan Type:
                </div>
                <div class="planSpecContainerRight">
                	<form action="planSearchResults.cfm" method="get" style="margin:0;white-space:nowrap;">
                        <select name="Id" style="font-size:12px;width:220px;margin-top:0px;" onChange="this.form.submit();">
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
                            <!---<option value="9">Townhouses</option>--->
                        </select>
                    </form>
                </div>
                <br clear="all" />
                <div class="greenTitleBar">DISPLAY OPTIONS</div>
                <div class="planSearchResultsOptions">
                	<div class="planSort">
                    	Sort By:
                    	<form action="default.cfm" name="sbt">
                        	<select name="sortOrder">
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
                    
                    <form name="selPVT">
                	<div class="detailViewNavAPS">
                    	<div style="float:left;width:20px;padding-top:35px;">
                            <input id="pvt1" name="PlanViewType" type="radio" value="detailed" checked>
                        </div>
                    	<div class="float:left;">
                    		Detail<br />
							View<br />
							<img src="/assets/images/btn_DetailView.gif" width="30" height="30" border="0" alt="View Plans in Detail View" />
                        </div>
                        <div class="clearFloat;"></div>
                    </div>

                    <div class="galleryViewNavAPS">
                    	<div style="float:left;width:20px;padding-top:35px;">
                            <input id="pvt2" name="PlanViewType" type="radio" value="gallery">
                        </div>
                    	<div class="float:left;">
                    		Gallery<br />
							View<br />
							<img src="/assets/images/btn_GalleryView.gif" width="30" height="30" border="0" alt="View Plans in Gallery View" />
                        </div>
                    </div>
                    </form>
                    <div class="plansPerPageOption">
                    	Plans Per Page
                    	<form action="default.cfm" name="pppForm">
                        	<select name="plansPerPage">
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
            </div>
            
            <div id="newPlanChatContainer">
            	<div id="newPlan">
                	<strong><a href="/plans/planSearchResults.cfm?id=6" class="brownLink">NEW<br /> PLANS</a></strong>
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
                 
            	<div id="chatPS">
                    <img src="/assets/images/PayPal.gif" width="175" height="154" alt="Pay Pal Image"/>
                </div>
                
                <div id="buildingProductsAPS">
                	<strong><a href="/buildingResources/buildingProducts.cfm" class="brownLink">BUILDING<br />PRODUCTS</a></strong>
                    <br />
                    <img src="/assets/images/SponsorLogos.jpg" width="174" height="592" border=0 usemap="#m_SponsorLogos">
                </div>
            </div>
        </div>
    </cfmodule>