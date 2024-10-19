<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.peaksportsandspinept.BestTime">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	BestTimeId, BestTime
			from dbo.BestTime
			where BestTimeId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.peaksportsandspinept.BestTime").init();
			obj.setBestTimeId(qRead.BestTimeId);
			obj.setBestTime(qRead.BestTime);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>