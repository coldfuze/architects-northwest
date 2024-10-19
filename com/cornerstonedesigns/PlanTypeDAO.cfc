<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.PlanType">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	PlanTypeId, PlanType, displayOnHomePagePlanSpecSearch
			from dbo.PlanType
			where PlanTypeId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.PlanType").init();
			obj.setPlanTypeId(qRead.PlanTypeId);
			obj.setPlanType(qRead.PlanType);
			obj.setdisplayOnHomePagePlanSpecSearch(qRead.displayOnHomePagePlanSpecSearch);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>