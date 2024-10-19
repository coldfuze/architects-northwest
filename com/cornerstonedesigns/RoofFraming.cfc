<cfcomponent output="false" alias="com.cornerstonedesigns.RoofFraming">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="RoofFramingId" type="numeric" default="0">
	<cfproperty name="RoofFraming" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.RoofFramingId = 0;
		this.RoofFraming = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="RoofFraming">
		<cfreturn this>
	</cffunction>
	<cffunction name="getRoofFramingId" output="false" access="public" returntype="any">
		<cfreturn this.RoofFramingId>
	</cffunction>

	<cffunction name="setRoofFramingId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.RoofFramingId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRoofFraming" output="false" access="public" returntype="any">
		<cfreturn this.RoofFraming>
	</cffunction>

	<cffunction name="setRoofFraming" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.RoofFraming = arguments.val>
	</cffunction>



</cfcomponent>