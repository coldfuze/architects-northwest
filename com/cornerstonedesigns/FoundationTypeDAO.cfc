<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.FoundationType">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#">
			select 	FoundationTypeId, FoundationType, FoundationTypeSName
			from dbo.FoundationType
			where FoundationTypeId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.FoundationType").init();
			obj.setFoundationTypeId(qRead.FoundationTypeId);
			obj.setFoundationType(qRead.FoundationType);
			obj.setFoundationTypeSName(qRead.FoundationTypeSName);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>