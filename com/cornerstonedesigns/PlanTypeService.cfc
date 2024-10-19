<cfcomponent extends="PlanTypeGateway">
	<cffunction name="getPlanTypesForNonGarageSearch" access="public" returntype="query">
		<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT	PlanTypeId, PlanType
            FROM    PlanType
            WHERE	displayOnHomePagePlanSpecSearch = <cfqueryparam cfsqltype="cf_sql_bit" value="1">
        </cfquery>
        
		<cfreturn gi>
	</cffunction>
</cfcomponent>