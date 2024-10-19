<cfcomponent output="false">
	<cffunction name="getById" output="false" access="public" roles="admin">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "TransactionDAO").read(arguments.id)>
	</cffunction>

	<cffunction name="getAllAsQuery" output="false" access="public" returntype="query" roles="admin">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select #arguments.fieldList#
			from dbo.Transaction
		</cfquery>

		<cfreturn qRead>
	</cffunction>
</cfcomponent>