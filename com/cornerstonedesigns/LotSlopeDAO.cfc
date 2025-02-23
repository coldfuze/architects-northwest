<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.LotSlope">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	LotSlopeId, LotSlope
			from dbo.LotSlope
			where LotSlopeId = <cfqueryparam cfsqltype="CF_SQL_TINYINT" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.LotSlope").init();
			obj.setLotSlopeId(qRead.LotSlopeId);
			obj.setLotSlope(qRead.LotSlope);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>