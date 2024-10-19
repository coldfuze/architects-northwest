<cfcomponent output="false">
	<cffunction name="getById" output="false" access="public">
		<cfargument name="id" required="true" />
 		<cfreturn createObject("component", "BuildingProductCompanyDAO").read(arguments.id)>
	</cffunction>

	<cffunction name="save" output="false" access="public" roles="admin">
		<cfargument name="obj" required="true" />
 		<cfscript>
			if( obj.getBuildingProductCompanyId() eq 0 )
			{
				return createObject("component", "BuildingProductCompanyDAO").create(arguments.obj);
			} else {
				return createObject("component", "BuildingProductCompanyDAO").update(arguments.obj);
			}
		</cfscript>
	</cffunction>

	<cffunction name="deleteById" output="false" access="public" roles="admin">
		<cfargument name="id" required="true" />
		<cfset var obj = getById(arguments.id)>
		<cfset createObject("component", "BuildingProductCompanyDAO").delete(obj)>
	</cffunction>

	<cffunction name="getAllAsQuery" output="false" access="public" returntype="query">
		<cfargument name="fieldlist" default="*" hint="List of columns to be returned in the query.">

		<cfset var qRead="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#">
			select #arguments.fieldList#
			from dbo.BuildingProductCompany
		</cfquery>

		<cfreturn qRead>
	</cffunction>
</cfcomponent>