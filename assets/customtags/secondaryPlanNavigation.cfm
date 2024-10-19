<cfparam name="Attributes.FloorPlan" default="Stock Home Plans for Every Style - CornerStone Designs">
<cfparam name="Attributes.PlanId" default="545">
	<cfscript>
		VARIABLES.ReverseNormalPlanLink = 'detailedplaninfo.cfm##' & Attributes.FloorPlan;
		VARIABLES.ReversePlanLink = 'detailedplaninfo.cfm?reverse=1##' & Attributes.FloorPlan;
	</cfscript>
    <cfif thisTag.ExecutionMode EQ "Start">
    <div class="planNavigationContainer">
    	<div class="planNavigationBar">
        <ul id="navigationplansubnavigation">
            <li id="navigationplansubnavigation-1"><a href="#planDetailsTitleContainer" title="Plan Details"><span>Plan Details</span></a></li>
            <li id="navigationplansubnavigation-2"><a href="#planPricingTitleContainer" title="Plan Pricing"><span>Plan Pricing</span></a></li>
            <li id="navigationplansubnavigation-3"><a href="/aboutPlans/copyrightInformation.cfm" title="Copyright Information"><span>Copyright Information</span></a></li>
            <li id="navigationplansubnavigation-4"><a href="detailedPlanInfo.cfm?sp=1" title="Add To My Saved Plans"><span>Add To My Saved Plans</span></a></li>
            <li id="navigationplansubnavigation-5"><a href="/aboutPlans/planModifications.cfm" title="Plan Modifications"><span>Plan Modifications</span></a></li>
            <li id="navigationplansubnavigation-6"><a href="#similarPlansTitleContainer" title="Similar Plans"><span>Similar Plans</span></a></li>
            <cfoutput><li id="navigationplansubnavigation-7"><a href="printPlan.cfm?PlanId=#Attributes.PlanId#" title="Print This Plan"><span>Print This Plan</span></a></li></cfoutput>
            <cfoutput><li id="navigationplansubnavigation-8"><a href="javascript: newWindow = openWin( 'emailPlan.cfm?PlanId=#Attributes.PlanId#', 'planid', 'width=600,height=500,toolbar=0,location=0,directories=0,status=0,menuBar=0,scrollBars=1,resizable=0' ); newWindow.focus()" title="E-Mail This Plan"><span>E-Mail This Plan</span></a></li></cfoutput>
            <li id="navigationplansubnavigation-9"><cfif IsDefined("URL.Reverse")><cfoutput><a class="greenBarBold" href="#VARIABLES.ReverseNormalPlanLink#" title="Reverse Floor Plan"><span>Reverse Floor Plan</span></a></cfoutput><cfelse><cfoutput><a class="greenBarBold" href="#VARIABLES.ReversePlanLink#" title="Reverse Floor Plan"><span>Reverse Floor Plan</span></a></cfoutput></cfif></li>
		</ul>
        </div>
    </div>
    </cfif>