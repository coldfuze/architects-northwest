<cfcomponent output="false">
	<cffunction name="getById" output="false" access="public" roles="general,admin">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "ActivityDAO").read(arguments.id)>
	</cffunction>

	<cffunction name="save" output="false" access="public" roles="admin">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getActivityId() eq 0 )
			{
				return createObject("component", "ActivityDAO").create(arguments.obj);
			} else {
				return createObject("component", "ActivityDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>

	<cffunction name="deleteById" output="false" access="public">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "ActivityDAO").delete(obj)>
	</cffunction>

	<cffunction name="getAllAsQuery" output="false" access="public" returntype="query" roles="general,admin">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="peaksports">
			select #arguments.fieldList#
			from dbo.Activity
		</cfquery>

		<cfreturn qRead>
	</cffunction>
</cfcomponent>