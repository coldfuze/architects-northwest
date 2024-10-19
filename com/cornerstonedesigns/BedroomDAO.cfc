<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.Bedroom">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	BedroomId, Bedroom, displayOnPlanSearch, displayOnPlanManagement
			from dbo.Bedroom
			where BedroomId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.Bedroom").init();
			obj.setBedroomId(qRead.BedroomId);
			obj.setBedroom(qRead.Bedroom);
			obj.setdisplayOnPlanSearch(qRead.displayOnPlanSearch);
			obj.setdisplayOnPlanManagement(qRead.displayOnPlanManagement);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>