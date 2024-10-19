<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.PermissionLevel">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	PermissionLevelId, PermissionLevel
			from dbo.PermissionLevel
			where PermissionLevelId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.PermissionLevel").init();
			obj.setPermissionLevelId(qRead.PermissionLevelId);
			obj.setPermissionLevel(qRead.PermissionLevel);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>