<cfcomponent extends="BedroomGateway">
	<cffunction name="getBedroomsForSearch" access="public" returntype="query">
		<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	BedroomId, Bedroom
            FROM    Bedroom
            WHERE	displayOnPlanSearch = <cfqueryparam cfsqltype="cf_sql_bit" value="1">
        </cfquery>
        
		<cfreturn gi>
	</cffunction>
    
    <cffunction name="getBedroomsForAdvancedSearch" access="public" returntype="query">
		<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	BedroomId, BedroomText
            FROM    Bedroom
            WHERE	displayOnPlanSearch = <cfqueryparam cfsqltype="cf_sql_bit" value="1">
        </cfquery>
        
		<cfreturn gi>
	</cffunction>
    
    <cffunction name="getBedroomsForPlanManagement" access="public" returntype="query">
		<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	BedroomId, Bedroom
            FROM    Bedroom
            WHERE	displayOnPlanManagement = <cfqueryparam cfsqltype="cf_sql_bit" value="1">
        </cfquery>
        
		<cfreturn gi>
	</cffunction>
</cfcomponent>