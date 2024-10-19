<cfif IsDefined("URL.PlanId")>
	<cfif NOT IsValid('integer',URL.PlanId)>
    	<cflocation url="default.cfm">
    <cfelse>    
		<cfscript>
            Session.PlanId = URL.PlanId;
        </cfscript>
    </cfif>
</cfif>

<cfscript>
	VARIABLES.PlanId = Session.PlanId;
	VARIABLES.AdminId = Session.AdminId;
</cfscript>

<cfif VARIABLES.PlanId EQ 0 OR NOT IsNumeric(VARIABLES.PlanId)>
	<cflocation url="default.cfm">
</cfif>

<!--- Delete related plans --->
	<cfif IsDefined("Form.PlanToRelatedPlanId")>
    	<cfloop list="#Form.PlanToRelatedPlanId#" index="i" delimiters=",">
        	<cfscript>
				if (IsNumeric(i)) {
					VARIABLES.delRelatedPlan = Application.RelatedPlanService.deleteById(i);
					VARIABLES.planDeleted = 1;
				}
			</cfscript>
        </cfloop>
        <cfscript>
			// Record Admin Activity
			aa = CreateObject("component","com.cornerstonedesigns.AdminActivity").init();
			aa.AdminId = VARIABLES.AdminId;
			aa.ImpactedAdminId = VARIABLES.AdminId;
			aa.ActivityDate = CreateODBCDateTime(Now());
			aa.TransactionId = 9;
			aa.PlanId=VARIABLES.PlanId;
			VARIABLES.adminActivity = Application.AdminActivityService.save(aa);
		</cfscript>
    </cfif>

<!--- Add related plan --->
	<cfif IsDefined("Form.PlanNumber")>
    	<cfscript>
			VARIABLES.rpi = StructNew();
			VARIABLES.rpi.PlanId = VARIABLES.PlanId;
			VARIABLES.rpi.PlanNumber = Form.PlanNumber;
			VARIABLES.newRelatedPlan = Application.RelatedPlanService.addRelatedPlan(VARIABLES.rpi);
		</cfscript>
        <cfscript>
			// Record Admin Activity
			aa = CreateObject("component","com.cornerstonedesigns.AdminActivity").init();
			aa.AdminId = VARIABLES.AdminId;
			aa.ImpactedAdminId = VARIABLES.AdminId;
			aa.ActivityDate = CreateODBCDateTime(Now());
			aa.TransactionId = 7;
			aa.PlanId=VARIABLES.PlanId;
			VARIABLES.adminActivity = Application.AdminActivityService.save(aa);
		</cfscript>
    </cfif>

<!--- Get plan information --->
	<cfscript>
        VARIABLES.thisPlan = Application.PlanService.getById(VARIABLES.PlanId);
        VARIABLES.relatedPlans = Application.RelatedPlanService.getRelatedPlansForPlan(VARIABLES.PlanId);
		VARIABLES.prevNextPlanInfo = Application.PlanService.getPreviousAndNextPlanForSiteManagement(VARIABLES.PlanId);
    </cfscript>

<!--- Set the Plan Title --->
	<cfscript>	
        if (CGI.HTTP_HOST CONTAINS "CornerStone") {
            VARIABLES.pageTitle = "Plan " & VARIABLES.thisPlan.PlanNumber & " Related Plans - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
        }
        else {
            VARIABLES.pageTitle = "Plan " & VARIABLES.thisPlan.PlanNumber & "Related Plans - Site Management - Your Family Architect - Architects Northwest";		
        }
		VARIABLES.thisPage = "Plan " & VARIABLES.thisPlan.PlanNumber & " Related Plans";
    </cfscript>
    
<!--- Get the plan number picklist --->
	<cfscript>
		VARIABLES.PlanNumberList = Application.PlanService.getPulldownFromPlanNumber();
	</cfscript>

<!--- Page Content --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
			<h1 id="sm">Site Management</h1>
            <h2 id="sm"><cfoutput>#VARIABLES.thisPage#</cfoutput></h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; <cfoutput>#VARIABLES.thisPage#</cfoutput>
            </div>

            <div class="planNavigation">
                <strong>Plan Management Navigation:</strong>
                <a href="addPlan.cfm">Add a plan</a> | <cfoutput><a href="updatePlan.cfm?PlanId=#VARIABLES.PlanId#">Update this plan</a></cfoutput> | Related Plans | <a href="managePlanImages.cfm">Load/Manage Plan Images</a> | <cfoutput><a href="/plans/detailedPlanInfo.cfm?PlanId=#VARIABLES.PlanId#&nps=1" target="_blank">View Plan</a></cfoutput> | <a href="deletePlan.cfm">Delete Plan</a> | <cfif VARIABLES.prevNextPlanInfo.previousPlanId NEQ 0> | <cfoutput><a href="#CGI.SCRIPT_NAME#?PlanId=#VARIABLES.prevNextPlanInfo.previousPlanId#" title="#VARIABLES.prevNextPlanInfo.previousPlanTitle#">Previous Plan</a></cfoutput></cfif><cfif VARIABLES.prevNextPlanInfo.nextPlanId NEQ 0> | <cfoutput><a href="#CGI.SCRIPT_NAME#?PlanId=#VARIABLES.prevNextPlanInfo.nextPlanId#" title="#VARIABLES.prevNextPlanInfo.nextPlanTitle#">Next Plan</a></cfoutput></cfif>
            </div>
            <cfif VARIABLES.relatedPlans.recordCount GT 0>
            <h3>Currently Related Plans</h3>
            <cfform name="dp" method="post" action="#CGI.SCRIPT_NAME#">
            <table cellpadding=5 cellspacing=0 border=1>
                <tr>
                    <th style="background-color:#4a5b49;color:#eee;font-size:12px;width:50px;">Delete</th>
                    <th style="background-color:#4a5b49;color:#eee;font-size:12px;text-align:left;width:400px;">Plan</th>
                </tr>
                <cfoutput query="VARIABLES.relatedPlans">
                    <cfif VARIABLES.relatedPlans.currentRow MOD(2)><tr style="background-color:##eee;"><cfelse><tr style="background-color:##ddd;"></cfif>
                        <td style="text-align:center;"><cfinput type="checkbox" name="PlanToRelatedPlanId" value="#PlanToRelatedPlanId#"></td>
                        <td>#PlanTitle#</td>
                    </tr>
                </cfoutput>
                <tr>
                    <th colspan=2 style="background-color:#4a5b49;color:#eee;font-size:12px;">
                        <cfinput name="submit" type="submit" value="Deleted Related Plans">
                    </th>
                </tr>
            </table>
            </cfform>
            </cfif>

            <h3>
                Add Related Plan
            </h3>            
            
            <form name="ap" method="post" action="#CGI.SCRIPT_NAME#">
                <div style="position:relative;">
                    <div style="position:float;">
                        <strong>Plan Number:</strong>
                    </div>
                    <div style="position:float;">
                    	<input name="PlanNumber" id="PlanNumber" type="text" autosuggest="#VARIABLES.PlanNumberList#" style="margin-right:2px;color:black;font-size:16px;width:250px;" align="left" value="Enter a Plan Number" onClick="this.form.PlanNumber.value='';">
                        <input type="submit" name="submit" value="Go!">
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </form>
        </div>
    </cfmodule>