<!--- Recently Viewed Plans --->
<cfif IsDefined("URL.clearList")>
	<cfscript>
        Session.RecentlyViewedPlans = "";
    </cfscript>
</cfif>

<cfscript>
	VARIABLES.RecentlyViewedPlans = Session.RecentlyViewedPlans;
</cfscript>