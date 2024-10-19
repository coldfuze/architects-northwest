<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.BuildingProductType">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#">
			select 	BuildingProductTypeId, BuildingProductType
			from dbo.BuildingProductType
			where BuildingProductTypeId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.BuildingProductType").init();
			obj.setBuildingProductTypeId(qRead.BuildingProductTypeId);
			obj.setBuildingProductType(qRead.BuildingProductType);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>