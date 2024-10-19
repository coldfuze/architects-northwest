<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.ProfessionalAssociationType">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	ProfessionalAssociationTypeId, ProfessionalAssociationType
			from dbo.ProfessionalAssociationType
			where ProfessionalAssociationTypeId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.ProfessionalAssociationType").init();
			obj.setProfessionalAssociationTypeId(qRead.ProfessionalAssociationTypeId);
			obj.setProfessionalAssociationType(qRead.ProfessionalAssociationType);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>