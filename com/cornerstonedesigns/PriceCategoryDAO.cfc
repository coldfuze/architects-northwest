<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.PriceCategory">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	PriceCategoryId, PriceCategory
			from dbo.PriceCategory
			where PriceCategoryId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.PriceCategory").init();
			obj.setPriceCategoryId(qRead.PriceCategoryId);
			obj.setPriceCategory(qRead.PriceCategory);
			return obj;
		</cfscript>
	</cffunction>
</cfcomponent>