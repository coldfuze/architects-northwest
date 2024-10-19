<cfcomponent extends="PlanSearchGateway">
	<cffunction name="getSideBarLinks" access="public" returntype="string">
		<cfargument name="SearchGroupingId" required="yes" type="numeric" hint="This argument expects a numeric SearchGroupingId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT 	FormattedPageTitle, Link
            FROM	PlanSearch
            WHERE	SearchGroupingId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.SearchGroupingId#">
            ORDER BY SortOrder
        </cfquery>
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gri">
        	SELECT 	SearchGroupingLabel, Link
            FROM	SearchGrouping
            WHERE	SearchGroupingId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.SearchGroupingId#">
        </cfquery>
        
        <cfsavecontent variable="links">
			<cfoutput query="gri"><h1 class="planStyleTitle"><a href="#Link#" class="brownLink">#SearchGroupingLabel#</a></h1></cfoutput>
            <cfoutput query="gi"><a class="planSearch" href="#Link#">#FormattedPageTitle#</a><cfif gi.currentRow LT gi.recordCount><br /></cfif></cfoutput>
		</cfsavecontent>
        
		<cfreturn links>
	</cffunction>
    
    <cffunction name="getPlanSearchResults" access="public" returntype="struct" hint="This method returns a structure containing a list of plans and the title for the plan search type">
    	<cfargument name="PlanSearchId" type="numeric" required="yes" hint="This method expects a numeric PlanSearchId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="qi">
        	SELECT 	PageTitle, SQL AS SQLStatement
            FROM 	PlanSearch
            WHERE	PlanSearchId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.PlanSearchId#">
        </cfquery>
        
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	<cfoutput>#qi.SQLStatement#</cfoutput>
        </cfquery>
        
        <cfscript>
			VARIABLES.pi = StructNew();
			VARIABLES.pi.PageTitle = qi.PageTitle;
			VARIABLES.pi.Plans = ValueList(gi.PlanId);
			VARIABLES.pi.MatchingPlanCount = gi.recordCount;
		</cfscript>
        
        <cfreturn VARIABLES.pi>
    </cffunction>
</cfcomponent>