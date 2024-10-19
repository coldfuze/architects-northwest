<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.SearchSubGrouping">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	SearchSubGroupingId, SearchGroupingId, SearchSubGrouping
			from dbo.SearchSubGrouping
			where SearchSubGroupingId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.SearchSubGrouping").init();
			obj.setSearchSubGroupingId(qRead.SearchSubGroupingId);
			obj.setSearchGroupingId(qRead.SearchGroupingId);
			obj.setSearchSubGrouping(qRead.SearchSubGrouping);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>