<cfscript>
	if (NOT IsDefined("planTitlePicklist")){
		abort;
	}
</cfscript>
		<div id="qs">
        	<div id="qsTop">
                <a id="avs" href="/plans/"></a>
            </div>
            <div id="qsContainer">
            	<h1 class="quickSearch">Search by Plan Name:</h1>
                <cfform name="sbpn" action="/plans/detailedPlanInfo.cfm" method="get" style="margin:0 0 10px 0;white-space:nowrap;vertical-align:middle;">
                	<cfinput type="hidden" name="nps" value="0">
                	<cfif CGI.HTTP_USER_AGENT CONTAINS "MSIE 6.0">
               			<cfinput name="PlanTitle" type="text" autosuggest="#ValueList(planTitlePicklist.PlanTitle)#" maxresultsdisplayed="20" style="margin-right:2px;color:black;font-size:12px;width:138px;" align="left" value="Enter a Plan Name" onClick="this.form.PlanTitle.value='';">
                    <cfelse>
                    	<cfinput name="PlanTitle" type="text" autosuggest="#ValueList(planTitlePicklist.PlanTitle)#" maxresultsdisplayed="20" style="margin-right:2px;color:black;font-size:12px;width:141px;" align="left" value="Enter a Plan Name" onClick="this.form.PlanTitle.value='';">
                    </cfif>
                    <cfif CGI.HTTP_USER_AGENT CONTAINS "Chrome" OR CGI.HTTP_USER_AGENT CONTAINS "Safari">
                    	<cfinput type="image" src="/assets/images/btn_Go.gif" name="submit" value="Go" style="display:inline-block;padding-top:2px;">
                    <cfelse>
                    	<cfinput type="image" src="/assets/images/btn_Go.gif" name="submit" value="Go" style="display:inline-block;">
                    </cfif>
                </cfform>
                
                <h1 class="quickSearch3">Search By Plan Number:</h1>
                <cfform name="sbpno" action="/plans/detailedPlanInfo.cfm" method="get" style="margin:0 0 10px 0;white-space:nowrap;">
                	<cfinput type="hidden" name="nps" value="0">
                    <cfselect name="PlanId" query="VARIABLES.planNumberPicklist" display="PlanNumber" value="PlanId" queryPosition="below" style="font-size:12px;width:173px;" onChange="this.form.submit();">
                        <option value="">Select a Plan Number</option>
                    </cfselect>
                </cfform>
                
                <h1 class="quickSearch3">Search By Plan Type:</h1>
                <cfform name="sbpt" action="/plans/planSearchResults.cfm" method="get" style="margin:0 0 10px 0;white-space:nowrap;">
                    <cfselect name="Id" style="font-size:12px;width:173px;" onChange="this.form.submit();">
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
                    </cfselect>
                </cfform>
                
                <h1 class="quickSearch2">Search By Plan Features:</h1>
                <cfform name="sbps" id="sbps" style="margin:0;white-space:nowrap;">
                    <h1 class="quickSearch3">Plan Type:</h1>
                    <cfselect name="PlanTypeId" query="VARIABLES.ptng" display="PlanType" selected="#VARIABLES.PlanType#" queryPosition="below" value="PlanTypeId" style="font-size:12px;width:172px;">
                        <option value="0">Any</option>
                    </cfselect>
                    <h1 class="quickSearch3">Square Footage:</h1>
                   
                    <div class="quickSearchLeft">
                        <cfselect name="SquareFootageLow" style="font-size:12px;width:84px;">
                        	<option value="0">Min</option>
                            <cfloop from="500" to="7000" step="500" index="i"><cfif i EQ VARIABLES.squareFootageLow><cfoutput><option selected>#i#</option></cfoutput><cfelse><cfoutput><option>#i#</option></cfoutput></cfif></cfloop>
                        </cfselect>
                    </div>
                    
                    <div class="quickSearchRight">
                        <cfselect name="SquareFootageHigh" style="font-size:12px;width:84px;">
                        	<option value="11000">Max</option>
                            <cfloop from="1000" to="7000" step="500" index="i"><cfif i EQ VARIABLES.squareFootageHigh><cfoutput><option selected>#i#</option></cfoutput><cfelse><cfoutput><option>#i#</option></cfoutput></cfif></cfloop>
                            <option value="11000">7500 +</option>
                        </cfselect>
                    </div>
                    
                    <br clear="all" />
                    <div class="quickSearchLeft">
                        <h1 class="quickSearch">Bedrooms:</h1>
                        <cfselect name="Bedrooms" query="VARIABLES.br" display="Bedroom" value="BedroomId" selected="#VARIABLES.Bedrooms#" queryPosition="below" style="font-size:12px;width:84px;">
                            <option value="100">Any</option>
                        </cfselect>
                    </div>
                    
                    <div class="quickSearchRight">
                        <h1 class="quickSearch">Full Baths:</h1>
                        <cfselect name="Bathrooms" query="VARIABLES.fbr" display="FullBathroom" value="FullBathroomId" selected="#VARIABLES.Bathrooms#" queryPosition="below" style="font-size:12px;width:84px;">
                            <option value="100">Any</option>
                        </cfselect>
                    </div>
                    </cfform>
                    <br clear="all" />
                    
                    <cfdiv id="qsPlanCount" bind="url:quickSearchResults.cfm?PlanTypeId={PlanTypeId}&Bedrooms={Bedrooms}&Bathrooms={Bathrooms}&SquareFootageLow={SquareFootageLow}&SquareFootageHigh={SquareFootageHigh}" />
              
                    <div id="qsPlanSearchSubmit">
                    	<cfform name="qsSearch" action="/plans/QuickSearchResults.cfm" method="get">
                        	<cfinput type="hidden" name="so" value="1">
                        	<cfinput type="submit" name="quickSearch" value="Begin Search" style="margin-bottom:10px;font-weight:bold;">
                        </cfform>
                        <cfoutput><a href="#CGI.SCRIPT_NAME#?reset=1" onClick="javascript:document.getElementById('sbps').reset();" class="qs">Reset Search</a></cfoutput>
                    </div>
            </div>
        </div>
        <map name="m_quickSearchTop" id="m_quickSearchTop">
        	<area shape="poly" coords="93,0,184,0,184,41,93,41,93,0" href="/plans/" title="Advanced Search" alt="Advanced Search" />
        </map>