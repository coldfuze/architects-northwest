<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.CoveredPorch">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	CoveredPorchId, CoveredPorch, CoveredPorchLabel
			from dbo.CoveredPorch
			where CoveredPorchId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.CoveredPorch").init();
			obj.setCoveredPorchId(qRead.CoveredPorchId);
			obj.setCoveredPorch(qRead.CoveredPorch);
			obj.setCoveredPorchLabel(qRead.CoveredPorchLabel);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>