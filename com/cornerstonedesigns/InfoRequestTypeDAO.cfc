<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.InfoRequestType">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	InfoRequestTypeId, InfoRequestType, InfoRequestTypeSubject
			from dbo.InfoRequestType
			where InfoRequestTypeId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.InfoRequestType").init();
			obj.setInfoRequestTypeId(qRead.InfoRequestTypeId);
			obj.setInfoRequestType(qRead.InfoRequestType);
			obj.setInfoRequestTypeSubject(qRead.InfoRequestTypeSubject);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>