<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.HalfBathroom">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	HalfBathroomId, HalfBathroom
			from dbo.HalfBathroom
			where HalfBathroomId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.HalfBathroom").init();
			obj.setHalfBathroomId(qRead.HalfBathroomId);
			obj.setHalfBathroom(qRead.HalfBathroom);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>