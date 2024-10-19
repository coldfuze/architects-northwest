<cfif IsDefined("URL.PlanId")>
	<cfif IsNumeric(URL.PlanId)>
		<cfscript>
            Session.PlanId = URL.PlanId;
        </cfscript>
    <cfelse>
    	<cflocation url="default.cfm" addtoken="no">
    </cfif>
</cfif>

<cfscript>
	VARIABLES.PlanId = Session.PlanId;
</cfscript>

<cfif NOT IsNumeric(VARIABLES.PlanId)>
	<cflocation url="default.cfm" addtoken="no">
</cfif>

<cfscript>
	VARIABLES.planTitle = Application.PlanService.getPlanTitle(VARIABLES.PlanId);
</cfscript>

<cfif IsDefined("URL.deletePlan")>    
	<cfscript>
		deletePlan = Application.PlanService.deletePlan(VARIABLES.PlanId);
        Session.PlanId = 0;
    </cfscript>
</cfif>

<cfscript>
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Delete a Plan - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Delete a Plan - Site Management - Your Family Architect - Architects Northwest";		
	}

	VARIABLES.tpi = Application.PlanService.getPickList();
	VARIABLES.prevNextPlanInfo = Application.PlanService.getPreviousAndNextPlanForSiteManagement(VARIABLES.PlanId);
</cfscript>

    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <cfif NOT IsDefined("deletePlan")><h2 id="sm">Confirm Plan Deletion</h2><cfelse><h2 id="sm">Plan Deleted Successfully</h2></cfif>
                        
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; <cfif NOT IsDefined("VARIABLES.planDeleted")>Confirm Plan Deletion<cfelse>Plan Deleted successfully</cfif>
            </div>
            
            <div class="planNavigation">
                <strong>Plan Management Navigation:</strong>
                <a href="addPlan.cfm">Add a plan</a> | <a href="updatePlan.cfm">Update this plan</a> | <a href="relatedPlans.cfm">Related Plans</a> | <a href="managePlanImages.cfm">Load/Manage Plan Images</a> | <cfoutput><a href="/plans/detailedPlanInfo.cfm?PlanId=#VARIABLES.PlanId#&nps=1" target="_blank">View Plan</a></cfoutput> | Delete Plan<cfif VARIABLES.prevNextPlanInfo.previousPlanId NEQ 0> | <cfoutput><a href="#CGI.SCRIPT_NAME#?PlanId=#VARIABLES.prevNextPlanInfo.previousPlanId#" title="#VARIABLES.prevNextPlanInfo.previousPlanTitle#">Previous Plan</a></cfoutput></cfif><cfif VARIABLES.prevNextPlanInfo.nextPlanId NEQ 0> | <cfoutput><a href="#CGI.SCRIPT_NAME#?PlanId=#VARIABLES.prevNextPlanInfo.nextPlanId#" title="#VARIABLES.prevNextPlanInfo.nextPlanTitle#">Next Plan</a></cfoutput></cfif>
            </div>
            
            <cfif NOT IsDefined("deletePlan")>
            <div class="deletePlan">
            	Are you sure that you want to delete plan <strong><cfoutput>#VARIABLES.planTitle#</cfoutput></strong>?
                <br /><br />
				<a href="deletePlan.cfm?deletePlan=1">Yes</a> | <a href="default.cfm">No</a>
            </div>
            <cfelse>
                <div class="successMessage">
                    Plan <strong><cfoutput>#VARIABLES.planTitle#</cfoutput></strong> has been deleted successfully!
                </div>
                
                <div class="deletePlan">
                <cfform action="deletePlan.cfm" method="get" name="up" style="margin:20px 0;">
                    Delete Another Plan <cfselect name="PlanId" query="VARIABLES.tpi" display="PlanTitle" value="PlanId" />
                    <cfinput type="submit" name="submit" value="Go!">
                </cfform>
                </div>
            </cfif>
        </div>
    </cfmodule>