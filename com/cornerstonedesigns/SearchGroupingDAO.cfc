<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.SearchGrouping">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	SearchGroupingId, SearchGrouping
			from dbo.SearchGrouping
			where SearchGroupingId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.SearchGrouping").init();
			obj.setSearchGroupingId(qRead.SearchGroupingId);
			obj.setSearchGrouping(qRead.SearchGrouping);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>