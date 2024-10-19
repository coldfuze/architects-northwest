<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.WashingtonStateZipCode">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	ZipCode, City
			from dbo.WashingtonStateZipCode
			where ZipCode = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.WashingtonStateZipCode").init();
			obj.setZipCode(qRead.ZipCode);
			obj.setCity(qRead.City);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>