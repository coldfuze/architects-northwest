<cfcomponent extends="SearchSubGroupingGateway">
	<cffunction name="getSubGroupingByType" access="public" returntype="query" hint="This method returns sub-groupings by type">
    	<cfargument name="SearchGroupingId" required="yes" type="numeric" hint="This argument expects a numeric SubGroupingId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT 	*
            FROM 	SearchSubGrouping
            WHERE	SearchGroupingId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.SearchGroupingId#">
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getArchitecturalStylesforPlan" access="public" returntype="query" hint="This method returns architectural styles for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric Plan Id">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT	a.SearchSubGrouping
            FROM	SearchSubGrouping a
                    INNER JOIN SearchGrouping b ON a.SearchGroupingId = b.SearchGroupingId
                    INNER JOIN PlanToSearchSubGrouping c ON a.SearchSubGroupingId = c.SearchSubGroupingId
            WHERE 	c.PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
            		AND a.SearchGroupingId = 1
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getHousePlanCollectionAndPopularSearchItemsforPlan" access="public" returntype="query" hint="This method returns architectural styles for a plan">
    	<cfargument name="PlanId" required="yes" type="numeric" hint="This argument expects a numeric Plan Id">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT	a.SearchSubGroupingLabel AS PlanDesignFeature
            FROM	SearchSubGrouping a
                    INNER JOIN SearchGrouping b ON a.SearchGroupingId = b.SearchGroupingId
                    INNER JOIN PlanToSearchSubGrouping c ON a.SearchSubGroupingId = c.SearchSubGroupingId
            WHERE 	c.PlanId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.PlanId#">
            		AND a.SearchGroupingId > 1
            ORDER BY a.SearchSubGrouping
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getSearchSubGroupingTitle" access="public" returntype="string" hint="This method returns the SearchSubGroupingTitle when passed its id">
    	<cfargument name="Id" type="numeric" default="25" hint="This argument expects a numeric SearchSubGroupingId">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT	SearchSubGrouping
            FROM	SearchSubGrouping
            WHERE	SearchSubGroupingId = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.Id#">
        </cfquery>
        
        <cfreturn gi.SearchSubGrouping>
    </cffunction>
</cfcomponent>