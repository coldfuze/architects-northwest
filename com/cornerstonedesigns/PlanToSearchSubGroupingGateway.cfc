<cfcomponent output="false">
	<cffunction name="getById" output="false" access="public">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "PlanToSearchSubGroupingDAO").read(arguments.id)>
	</cffunction>

	<cffunction name="save" output="false" access="public" roles="admin">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getPlanToSearchSubGroupingId() eq 0 )
			{
				return createObject("component", "PlanToSearchSubGroupingDAO").create(arguments.obj);
			} else {
				return createObject("component", "PlanToSearchSubGroupingDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>

	<cffunction name="deleteById" output="false" access="public" roles="admin">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "PlanToSearchSubGroupingDAO").delete(obj)>
	</cffunction>

	<cffunction name="getAllAsQuery" output="false" access="public" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select #arguments.fieldList#
			from dbo.PlanToSearchSubGrouping
		</cfquery>

		<cfreturn qRead>
	</cffunction>
</cfcomponent>