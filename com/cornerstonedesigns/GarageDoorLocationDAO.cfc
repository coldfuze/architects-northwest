<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.GarageDoorLocation">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	GarageDoorLocationId, GarageDoorLocation
			from dbo.GarageDoorLocation
			where GarageDoorLocationId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.GarageDoorLocation").init();
			obj.setGarageDoorLocationId(qRead.GarageDoorLocationId);
			obj.setGarageDoorLocation(qRead.GarageDoorLocation);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>