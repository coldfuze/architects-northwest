<cfcomponent output="false" alias="com.cornerstonedesigns.Stories">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="Stories" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.Stories = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="Stories">
		<cfreturn this>
	</cffunction>
	<cffunction name="getStories" output="false" access="public" returntype="any">
		<cfreturn this.Stories>
	</cffunction>

	<cffunction name="setStories" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.Stories = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>
</cfcomponent>