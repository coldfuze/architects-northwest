<cfcomponent extends="FullBathroomGateway">
	<cffunction name="getFullBathroomsForSearch" access="public" returntype="query">
		<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	FullBathroomId, FullBathroom
            FROM    FullBathroom
            WHERE	displayOnPlanSearch = <cfqueryparam cfsqltype="cf_sql_bit" value="1">
        </cfquery>
        
		<cfreturn gi>
	</cffunction>
    
    <cffunction name="getFullBathroomsForAdvancedSearch" access="public" returntype="query">
		<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	FullBathroomId, FullBathroomText
            FROM    FullBathroom
            WHERE	displayOnPlanSearch = <cfqueryparam cfsqltype="cf_sql_bit" value="1">
        </cfquery>
        
		<cfreturn gi>
	</cffunction>
    
    <cffunction name="getFullBathroomsForPlanManagement" access="public" returntype="query">
		<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	FullBathroomId, FullBathroom
            FROM    FullBathroom
            WHERE	displayOnPlanManagement = <cfqueryparam cfsqltype="cf_sql_bit" value="1">
        </cfquery>
        
		<cfreturn gi>
	</cffunction>
</cfcomponent>