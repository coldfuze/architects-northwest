<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.MasterBedroomLocation">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	MasterBedroomLocationId, MasterBedroomLocation
			from dbo.MasterBedroomLocation
			where MasterBedroomLocationId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.MasterBedroomLocation").init();
			obj.setMasterBedroomLocationId(qRead.MasterBedroomLocationId);
			obj.setMasterBedroomLocation(qRead.MasterBedroomLocation);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>