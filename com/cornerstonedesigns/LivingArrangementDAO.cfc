<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.LivingArrangement">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	LivingArrangementId, LivingArrangement
			from dbo.LivingArrangement
			where LivingArrangementId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.LivingArrangement").init();
			obj.setLivingArrangementId(qRead.LivingArrangementId);
			obj.setLivingArrangement(qRead.LivingArrangement);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>