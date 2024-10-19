<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Site Management - Your Family Architect - Architects Northwest";		
	}
</cfscript>

<cfscript>
	VARIABLES.tpi = Application.PlanService.getPickList();
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainSiteManagementContainer">            
            <div style="position:absolute;top:0px;left:10px;height:1528px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<h1 class="planStyleTitle"><a href="plans/popularSearches.cfm" class="brownLink">POPULAR<br />SEARCHES</a></h1>
                Award Winning Designs<br />
                Best Selling Plans<br />
                Garage & Accessory Plans<br />
                Green Plans<br />
                Homes By Designer<br />
                New Plans<br />
                Plans Comings Soon<br />
                Show All Plans<br />
                Townhouses
                <h1 class="planStyleTitle"><a href="plans/architecturalStyles.cfm" class="brownLink">ARCHITECTURAL<br />STYLES</a></h1>
                Alpine House Designs<br />
                Bungalow House Plans<br />
                Cape Cod House Plans<br />
                Carriage House Plans<br />
                Chateau House Plans<br />
                Colonial House Plans<br />
                Contemporary Home Plans<br />
                Cottage House Plans<br />
                Country House Plans<br />
                Craftsman House Plans<br />
                European House Plans<br />
                Farmhouse Home Plans<br />
                Hampton House Plans<br />
                Lodge House Plans<br />
                Modern Home Plans<br />
                Mountain House Plans<br />
                Northwest Floor Plans<br />
                Prairie Home Plans<br />
                Ranch House Plans<br />
                Shingle House Plans<br />
                Shotgun Floor Plans<br />
                Traditional House Plans<br />
                Tudor House Plans<br />
                Victorian House Designs<br />
                <h1 class="planStyleTitle"><a href="plans/housePlanCollections.cfm" class="brownLink">HOUSE PLAN<BR />COLLECTIONS</a></h1>
                1 Story House Plans<br />
                1 Story House Plans<br />
                &nbsp;&nbsp;&nbsp;With Basement<br />
                2 Story House Plans<br />
                2 Story House Plans<br />
                &nbsp;&nbsp;&nbsp;With Basement<br />
                3 Story House Plans<br />
                3 Story House Plans<br />
                &nbsp;&nbsp;&nbsp;With Basement<br />
                Affordable Home Designs<br />
                Bonus Space Floor Plans<br />
                Covered Porch House Plans<br />
                Garage Detach House Plans<br />
                Garage Rear House Plans<br />
                Garage Side House Plans<br />
                Garage Under House Plans<br />
                Great Room Floor Plans<br />
                Luxury Home Designs<br />
                Master Bedroom Main Floor<br /> 
                Narrow Lot House Plans
                Sloping Lot (Down Hill) Plans<br />
                Sloping Lot  (Side Hill) Plans<br />
                Sloping Lot (Up Hill) Plans<br />
                Small House Plans<br />
                Split Level Home Designs<br />
                Tri Level Home Designs<br />
                Vacation House Plans<br />
                View Lot (Front) Plans<br />
                View Lot (Rear) Plans<br />
                Wide Lot House Plans<br />
            </div>
            
            <div id="siteManagementContainer">
            	<div style="position:relative;text-align:left;">
                	<h1 id="sm">Site Management</h1>
                    
                    <div class="smBreadcrumb">
                    	<a href="/default.cfm">Home</a> &gt; Site Management
                    </div>
                    
                    <div class="normal">
                    	<cfif Hour(Now()) LT 12>Good Morning<cfelseif Hour(Now()) GTE 12 AND Hour(Now()) LT 18>Good Afternoon<cfelse>Good Evening</cfif><cfif IsDefined("Cookie.AdminFName")><cfoutput> #Cookie.AdminFName# </cfoutput></cfif> and welcome back to the site management section of your web site. Please choose a task to perform from the list below.
                        
                        <h3 class="sm">Manage Plans</h3>
                        <ul type="square" style="font-size:12px;">
                        	<li><a href="addplan.cfm">Add a Plan</a></li>
                            <li>
                            	<cfform action="updatePlan.cfm" method="get" name="up">
                                	Update Plan <cfselect name="PlanId" query="VARIABLES.tpi" display="PlanTitle" value="PlanId" />
                                    <cfinput type="submit" name="submit" value="Go!">
                                </cfform>
                            </li>
                            <li>
                            	<cfform action="relatedPlans.cfm" method="get" name="up">
                                	Identify Related Plans for <cfselect name="PlanId" query="VARIABLES.tpi" display="PlanTitle" value="PlanId" />
                                    <cfinput type="submit" name="submit" value="Go!">
                                </cfform>
                            </li>
                            <li>
                            	<cfform action="managePlanImages.cfm" method="get" name="up">
                                	Load Images for Plan <cfselect name="PlanId" query="VARIABLES.tpi" display="PlanTitle" value="PlanId" />
                                    <cfinput type="submit" name="submit" value="Go!">
                                </cfform>
                            </li>
                            <li>
                            	<cfform action="managePlanImages.cfm" method="get" name="up">
                                	Delete Plans <cfselect name="PlanId" query="VARIABLES.tpi" display="PlanTitle" value="PlanId" />
                                    <cfinput type="submit" name="submit" value="Go!">
                                </cfform>
                            </li>
                        </ul>
                        
                        <h3 class="sm">Other Tasks</h3>
                        <ul type="square">
                        	<li><a href="default.cfm?logout">Log-out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div id="newPlanChatContainer">
            	<div id="newPlan">
                	<strong><a href="plans/newPlans.cfm" class="brownLink">NEW<br /> PLANS</a></strong>
                	<br />
                	<img src="../assets/renderings/chathamKnoll.jpg" width="170" height="121" style="padding-top:5px;padding-bottom:5px;" alt="Chatham Knoll" />
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
                        <strong>View Floor Plan</strong>
                    </div>
                 </div>
                 
            	<div id="chat">
                    <!-- live2support.com tracking codes starts --><div id="l2s_trk" style="z-index:99;"><a href="http://live2support.com" style="font-size:1px;">Live Chat Software</a></div><script type="text/javascript"><!-- 
     var l2s_pht=escape(location.protocol); if(l2s_pht.indexOf("http")==-1) l2s_pht='http:'; function l2s_load() { document.write('<scr'+'ipt type="text/javaScr'+'ipt" src="'+unescape(l2s_pht)+'//sb.live2support.com/js/lsjs1.php?stid=17189"  defer=true>'+'</scr'+'ipt>');  } 
    l2s_load();  document.getElementById('l2s_trk').style.visibility='hidden'; //--></script><!-- live2support.com tracking codes closed -->
                </div>
                
                <div id="buildingProducts">
                	<strong><a href="/buildingResources/buildingProducts.cfm" class="brownLink">BUILDING<br />PRODUCTS</a></strong>
                    <br />
                    <img src="/assets/images/SponsorLogos.jpg" width="174" height="592" border=0 usemap="#m_SponsorLogos">
                </div>
            </div>
        </div>
    </cfmodule>