<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.HowContact">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	HowContactId, HowContact
			from dbo.HowContact
			where HowContactId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.HowContact").init();
			obj.setHowContactId(qRead.HowContactId);
			obj.setHowContact(qRead.HowContact);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>