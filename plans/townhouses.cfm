<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<!--- Change the type of plans searched (if applicable) --->
	<cfif IsDefined("URL.so")>
        <cfif IsNumeric(URL.so)>
			<cfscript>
                Session.PlanViewType = "detailed";
                Session.PlanSortOption = 1;
                Session.PlansPerPage = 12;
                Session.CurrentPage = 1;
            </cfscript>
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
        VARIABLES.PlanSortOption = Session.PlanSortOption;
        VARIABLES.PlanViewType = Session.PlanViewType;
        VARIABLES.PlansPerPage = Session.PlansPerPage;
        VARIABLES.thisPage = Session.CurrentPage;
        VARIABLES.firstPlan = ((VARIABLES.thisPage * VARIABLES.PlansPerPage) + 1) - VARIABLES.PlansPerPage;
        VARIABLES.lastPlan = VARIABLES.thisPage * VARIABLES.PlansPerPage;
    </cfscript>
    
<!--- Get Plan Information --->
	<cfscript>
		// Get the page title
		VARIABLES.PageTitle = "TOWNHOUSES";
	</cfscript>
    
    <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
    	SELECT 	PlanId
        FROM	[Plan]
        WHERE	DisplayPlan = 1
        		AND PlanTypeId = 10
    </cfquery>

    <cfscript>
        if (gi.RecordCount LT VARIABLES.lastPlan) {
            VARIABLES.lastPlan = gi.recordCount;	
        }
        pdLen = gi.recordCount;
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
   pai.totalrecords = gi.RecordCount;
   pai.currentPage = VARIABLES.thisPage;
   pai.recordsPerPage = VARIABLES.plansPerPage;
   pai.linksPerPage = linksPerPage;
   pai.cssClass = cssClass;
   pai.pnCssClass = pnCssClass;
   VARIABLES.paging = Application.PagingService.generatePaging(pai);
</cfscript>

    <cfscript>
		if (gi.recordCount GT 0) {
			VARIABLES.pic = StructNew();
			VARIABLES.pic.Plans = ValueList(gi.PlanId);
			VARIABLES.pic.thisPage = VARIABLES.thisPage;
			VARIABLES.pic.plansPerPage = VARIABLES.PlansPerPage;
			VARIABLES.pic.planSortOption = VARIABLES.PlanSortOption;
			if (VARIABLES.PlanViewType EQ 'detailed') {
				VARIABLES.pi = Application.PlanService.getPlanInfoForDetailedSearchResults(VARIABLES.pic);
				VARIABLES.minHeight = (VARIABLES.pi.recordCount * 307) + 224;
			}
			else {
				VARIABLES.pi = Application.PlanService.getPlanInfoForGallerySearchResults(VARIABLES.pic);
				VARIABLES.minHeight = ((Ceiling(VARIABLES.pi.recordCount/3)) * 321) + 224;
			}
		}
		else {
			VARIABLES.minHeight = 500;
		}
	</cfscript>

<!--- Page Titles --->  
	<cfscript>	
        if (CGI.HTTP_HOST CONTAINS "CornerStone") {
            VARIABLES.pageTitleBar = VARIABLES.PageTitle & " - Stock Home Plans for Every Style - CornerStone Designs";	
        }
        else {
            VARIABLES.pageTitleBar = VARIABLES.PageTitle & " - Stock Home Plans for Every Style - Your Family Architect - Architects Northwest";		
        }
    </cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitleBar#" recentlyViewedPlans="#VARIABLES.RecentlyViewedPlans#" minHeight="#VARIABLES.minHeight#" cannedSearch="1">
    	<div id="planSearchResultsContainer">
        	<div id="planSearchResultsLeftColumn">
            	<div id="quickSearchContainer">
                	<div id="qsTop2">
                    	<a id="avs" href="/plans/"></a>
                	</div>
                    <div id="qsContainer">
                        <h1 class="quickSearch">Search by Plan Name:</h1>
                        <cfform name="sbpn" action="#CGI.SCRIPT_NAME#" method="get" style="margin:0 0 10px 0;white-space:nowrap;vertical-align:middle;">
                            <cfif CGI.HTTP_USER_AGENT CONTAINS "MSIE 6.0">
                                <cfinput name="PlanTitle" type="text" autosuggest="#ValueList(planTitlePicklist.PlanTitle)#" maxresultsdisplayed="20" style="margin-right:2px;color:black;font-size:12px;width:138px;" align="left" value="Enter a Plan Name" onFocus="this.form.PlanTitle.value='';">
                            <cfelse>
                                <cfinput name="PlanTitle" type="text" autosuggest="#ValueList(planTitlePicklist.PlanTitle)#" maxresultsdisplayed="20" style="margin-right:2px;color:black;font-size:12px;width:141px;" align="left" value="Enter a Plan Name" onFocus="this.form.PlanTitle.value='';">
                            </cfif>
                            <cfif CGI.HTTP_USER_AGENT CONTAINS "Chrome" OR CGI.HTTP_USER_AGENT CONTAINS "Safari">
                                <cfinput type="image" src="/assets/images/btn_Go.gif" name="submit" value="Go" style="display:inline-block;padding-top:2px;">
                            <cfelse>
                                <cfinput type="image" src="/assets/images/btn_Go.gif" name="submit" value="Go" style="display:inline-block;">
                            </cfif>
                        </cfform>
                    
                        <h1 class="quickSearch3">Search By Plan Number:</h1>
                        <cfform name="sbpno" action="#CGI.SCRIPT_NAME#" method="get" style="margin:0 0 10px 0;white-space:nowrap;">
                            <cfselect name="PlanId" query="VARIABLES.planNumberPicklist" display="PlanNumber" value="PlanId" queryPosition="below" style="font-size:12px;width:173px;" onChange="this.form.submit();">
                                <option value="">Select a Plan Number</option>
                            </cfselect>
                        </cfform>
                        
                        <h1 class="quickSearch3">Search By Plan Type:</h1>
                        <cfform name="sbpt" action="#CGI.SCRIPT_NAME#" method="get" style="margin:0 0 10px 0;white-space:nowrap;">
                            <cfselect name="PlanType" query="VARIABLES.pt" display="PlanType" value="PlanTypeId" queryposition="below" style="font-size:12px;width:173px;" onChange="this.form.submit();">
                                <option value="">Select a Plan Type</option>
                                <option value="10000">Show All Plans</option>
                            </cfselect>
                        </cfform>
                        
                        <h1 class="quickSearch2">Search By Plan Features:</h1>
                        <cfform name="sbps" id="sbps" action="#CGI.SCRIPT_NAME#" method="get" style="margin:0;white-space:nowrap;">
                            <h1 class="quickSearch3">Plan Type:</h1>
                            <cfselect name="PlanType" query="VARIABLES.ptng" display="PlanType" selected="#VARIABLES.PlanType#" queryPosition="below" value="PlanTypeId" style="font-size:12px;width:172px;" onChange="this.form.submit();">
                                <option value="0">Any</option>
                            </cfselect>
                            <h1 class="quickSearch3">Square Footage:</h1>
                           
                            <div class="quickSearchLeft">
                                <cfselect name="squareFootageLow" style="font-size:12px;width:84px;" onChange="this.form.submit();">
                                    <option value="0">Min</option>
                                    <cfloop from="500" to="7000" step="500" index="i"><cfif i EQ VARIABLES.squareFootageLow><cfoutput><option selected>#i#</option></cfoutput><cfelse><cfoutput><option>#i#</option></cfoutput></cfif></cfloop>
                                </cfselect>
                            </div>
                            
                            <div class="quickSearchRight">
                                <cfselect name="squareFootageHigh" style="font-size:12px;width:84px;" onChange="this.form.submit();">
                                    <option value="10001">Max</option>
                                    <cfloop from="1000" to="7000" step="500" index="i"><cfif i EQ VARIABLES.squareFootageHigh><cfoutput><option selected>#i#</option></cfoutput><cfelse><cfoutput><option>#i#</option></cfoutput></cfif></cfloop>
                                    <option value="10000">7500 +</option>
                                </cfselect>
                            </div>
                            
                            <br clear="all" />
                            <div class="quickSearchLeft">
                                <h1 class="quickSearch">Bedrooms:</h1>
                                <cfselect name="Bedrooms" query="VARIABLES.br" display="Bedroom" value="BedroomId" selected="#VARIABLES.Bedrooms#" queryPosition="below" style="font-size:12px;width:84px;" onChange="this.form.submit();">
                                    <option value="100">Any</option>
                                </cfselect>
                            </div>
                            
                            <div class="quickSearchRight">
                                <h1 class="quickSearch">Full Baths:</h1>
                                <cfselect name="Bathrooms" query="VARIABLES.fbr" display="FullBathroom" value="FullBathroomId" selected="#VARIABLES.Bathrooms#" queryPosition="below" style="font-size:12px;width:84px;" onChange="this.form.submit();">
                                    <option value="100">Any</option>
                                </cfselect>
                            </div>
                            
                            <br clear="all" />
                            
                            <div id="qsPlanCount">
                                Plans Found: <span style="font-size:22px;"><cfoutput>#sr.plans#</cfoutput></span>
                            </div>
                                                    
                            <div id="qsPlanSearchSubmit">
                                <cfinput type="submit" name="planSearch" value="Begin Search" style="margin-bottom:10px;font-weight:bold;"><br />
                                <cfoutput><a href="#CGI.SCRIPT_NAME#?reset=1" onClick="javascript:document.getElementById('sbps').reset();" class="qs">Reset Search</a></cfoutput>
                            </div>
                        </cfform>
                        <map name="m_quickSearchTop" id="m_quickSearchTop">
                            <area shape="poly" coords="93,0,184,0,184,41,93,41,93,0" href="/plans/" title="Advanced Search" alt="Advanced Search" />
                        </map>
                    </div>
                </div>
                <div id="whiteSpacer"></div>
                <div id="planStyles">
                    <cfinclude template="../planStyleLinks.cfm">
                </div>
            </div>
            <div id="planSearchResultsCenterColumn">
            	<div id="titleBarPS">
                	<cfoutput>#UCASE(VARIABLES.PageTitle)#</cfoutput>
                </div>
                <cfif gi.recordCount EQ 0>
                    <div style="text-align:center;color:red;margin:10px 0;">
                    There are no plans currently identified as <cfoutput>#VARIABLES.PageTitle#</cfoutput>.
                    </div>
                <cfelse>
                <div class="planSearchResultsNavigation">
                	<div class="planSearchResultCount">
                    	Results: <cfoutput>#VARIABLES.FirstPlan#-#VARIABLES.lastPlan# of #gi.recordCount#</cfoutput>
                    </div>
                    <cfif VARIABLES.paging.TotalPages GT 1>
                	<div class="searchResultsPaging"><cfoutput>#VARIABLES.paging.paging#</cfoutput></div>
                    </cfif>
                </div>
                <div class="planSearchResultsOptions">
                	<div class="planSort">
                    	Sort By:
                    	<cfform action="#CGI.SCRIPT_NAME#" method="get" name="sbt">
                        	<cfselect name="so" onChange="this.form.submit();">
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
                            </cfselect>
                        </cfform>
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
                    	<cfform action="#CGI.SCRIPT_NAME#" method="get" name="ppp">
                        	<cfselect name="ppp" onChange="this.form.submit();">
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
                            </cfselect>
                        </cfform>
                    </div>
                    <div class="clearFloat"></div>
                </div>

               	<cfif VARIABLES.PlanViewType EQ "detailed">
                	<cfoutput query="VARIABLES.pi">
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
                	<cfoutput query="VARIABLES.pi">
                    <cfif VARIABLES.pi.currentRow MOD(3) NEQ 0><div class="PlanGalleryContainer"><cfelse><div class="PlanGalleryContainerRight"></cfif>
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
                     <cfif VARIABLES.pi.currentRow MOD(3) EQ 0><div class="clearFloat"></div></cfif> 
                    </cfoutput>
                    <div class="clearFloat"></div>
                </cfif>
                <div class="planSearchResultsNavigation">
                	<div class="planSearchResultCount">
                    	Results: <cfoutput>#VARIABLES.FirstPlan#-#VARIABLES.lastPlan# of #gi.recordCount#</cfoutput>
                    </div>
                	<div class="searchResultsPagingAlt"><cfoutput>#VARIABLES.paging.paging#</cfoutput></div>
                </div>
                <div class="planSearchResultsOptions">
                	<div class="planSort">
                    	Sort By:
                    	<cfform action="#CGI.SCRIPT_NAME#" method="get" name="sbt">
                        	<cfselect name="so" onChange="this.form.submit();">
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
                            </cfselect>
                        </cfform>
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
                    	<cfform action="#CGI.SCRIPT_NAME#" method="get" name="ppp">
                        	<cfselect name="ppp" onChange="this.form.submit();">
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
                            </cfselect>
                        </cfform>
                    </div>
                    <div class="clearFloat"></div>
                </div>
            </cfif>
            </div>
            <div id="planSearchResultsRightColumn">
            	<div id="newPlan">
                	<strong>NEW<br />PLANS</strong>
                	<br />
                	<a href="/plans/detailedPlanInfo.cfm?PlanId=803"><img src="../assets/renderings/chathamKnoll.jpg" width="170" height="121" style="padding-top:5px;padding-bottom:5px;" border="0" alt="Chatham Knoll" /></a>
                	<strong>CHATHAM KNOLL<br />M5900A3S-0</strong>
                    <div style="font-size:12px;position:relative;padding:5px 0 5px 5px;">
                        <div style="float:left;width:80px;text-align:left;margin:10px 0 10px 0;">
                            Total Area:<br />
                            Stories:<br />
                            Bedrooms:<br />
                            Full Baths:
                        </div>
                        <div style="float:left;width:85px;text-align:right;margin:10px 0 10px 0;">
                            5900 sq. ft.<br />
                            2<br />
                            4<br />
                            4
                        </div>
                        <br clear="all" />
                        <strong><a class="planSpec" href="/plans/detailedPlanInfo.cfm?PlanId=803">View Floor Plan</a></strong>
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