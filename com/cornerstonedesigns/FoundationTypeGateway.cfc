<cfcomponent output="false">
	<cffunction name="getById" output="false" access="public">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "FoundationTypeDAO").read(arguments.id)>
	</cffunction>

	<cffunction name="getAllAsQuery" output="false" access="public" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#">
			select #arguments.fieldList#
			from dbo.FoundationType
		</cfquery>

		<cfreturn qRead>
	</cffunction>
</cfcomponent>