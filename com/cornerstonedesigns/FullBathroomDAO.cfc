<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.FullBathroom">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	FullBathroomId, FullBathroom, displayOnPlanSearch, displayOnPlanManagement
			from dbo.FullBathroom
			where FullBathroomId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.FullBathroom").init();
			obj.setFullBathroomId(qRead.FullBathroomId);
			obj.setFullBathroom(qRead.FullBathroom);
			obj.setdisplayOnPlanSearch(qRead.displayOnPlanSearch);
			obj.setdisplayOnPlanManagement(qRead.displayOnPlanManagement);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>