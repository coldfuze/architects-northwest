<cfif IsDefined("URL.clearList")>
    <cflock scope="session" type="exclusive" timeout="2">
        <cfscript>
            Session.RecentlyViewedPlans = "";
        </cfscript>
    </cflock>
</cfif>

<cflock scope="session" type="readonly" timeout="2">
    <cfscript>
        VARIABLES.RecentlyViewedPlans = Session.RecentlyViewedPlans;
    </cfscript>
</cflock>

<cfif thisTag.ExecutionMode EQ "Start"></cfif>
<cfif thisTag.ExecutionMode EQ "End"></cfif>