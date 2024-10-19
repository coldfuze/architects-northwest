<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.PopularSearch">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	PopularSearchId, PopularSearch
			from dbo.PopularSearch
			where PopularSearchId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.PopularSearch").init();
			obj.setPopularSearchId(qRead.PopularSearchId);
			obj.setPopularSearch(qRead.PopularSearch);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>