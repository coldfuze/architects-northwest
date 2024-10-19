<cfcomponent output="false" alias="com.cornerstonedesigns.PermissionLevel">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PermissionLevelId" type="numeric" default="0">
	<cfproperty name="PermissionLevel" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.PermissionLevelId = 0;
		this.PermissionLevel = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="PermissionLevel">
		<cfreturn this>
	</cffunction>
	<cffunction name="getPermissionLevelId" output="false" access="public" returntype="any">
		<cfreturn this.PermissionLevelId>
	</cffunction>

	<cffunction name="setPermissionLevelId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PermissionLevelId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPermissionLevel" output="false" access="public" returntype="any">
		<cfreturn this.PermissionLevel>
	</cffunction>

	<cffunction name="setPermissionLevel" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PermissionLevel = arguments.val>
	</cffunction>



</cfcomponent>