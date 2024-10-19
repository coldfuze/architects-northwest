<cfcomponent output="false" alias="com.cornerstonedesigns.HalfBathroom">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="HalfBathroomId" type="numeric" default="0">
	<cfproperty name="HalfBathroom" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.HalfBathroomId = 0;
		this.HalfBathroom = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="HalfBathroom">
		<cfreturn this>
	</cffunction>
	<cffunction name="getHalfBathroomId" output="false" access="public" returntype="any">
		<cfreturn this.HalfBathroomId>
	</cffunction>

	<cffunction name="setHalfBathroomId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HalfBathroomId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHalfBathroom" output="false" access="public" returntype="any">
		<cfreturn this.HalfBathroom>
	</cffunction>

	<cffunction name="setHalfBathroom" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HalfBathroom = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>