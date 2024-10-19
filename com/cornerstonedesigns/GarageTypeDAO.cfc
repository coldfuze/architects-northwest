<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.GarageType">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	GarageTypeId, GarageType, GarageTypeLabel
			from dbo.GarageType
			where GarageTypeId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.GarageType").init();
			obj.setGarageTypeId(qRead.GarageTypeId);
			obj.setGarageType(qRead.GarageType);
			obj.setGarageTypeLabel(qRead.GarageTypeLabel);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>