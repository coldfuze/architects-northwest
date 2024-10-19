<cfcomponent output="false">
	<cffunction name="getById" output="false" access="public" roles="admin">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "AdminDAO").read(arguments.id)>
	</cffunction>

	<cffunction name="save" output="false" access="public" roles="admin">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getAdminId() eq 0 )
			{
				return createObject("component", "AdminDAO").create(arguments.obj);
			} else {
				return createObject("component", "AdminDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>

	<cffunction name="getAllAsQuery" output="false" access="public" returntype="query" roles="admin">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select #arguments.fieldList#
			from dbo.Admin
		</cfquery>

		<cfreturn qRead>
    </cffunction>
</cfcomponent>