<cfcomponent output="false">
	<cffunction name="getById" output="false" access="public">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "GarageSizeDAO").read(arguments.id)>
	</cffunction>

	<cffunction name="getAllAsQuery" output="false" access="public" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select #arguments.fieldList#
			from dbo.GarageSize
		</cfquery>

		<cfreturn qRead>
	</cffunction>
</cfcomponent>