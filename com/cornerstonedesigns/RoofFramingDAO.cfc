<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.RoofFraming">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	RoofFramingId, RoofFraming
			from dbo.RoofFraming
			where RoofFramingId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.RoofFraming").init();
			obj.setRoofFramingId(qRead.RoofFramingId);
			obj.setRoofFraming(qRead.RoofFraming);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>