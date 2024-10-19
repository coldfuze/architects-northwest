<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.GarageSize">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	GarageSizeId, GarageSize
			from dbo.GarageSize
			where GarageSizeId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.GarageSize").init();
			obj.setGarageSizeId(qRead.GarageSizeId);
			obj.setGarageSize(qRead.GarageSize);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>