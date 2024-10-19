<cfcomponent output="false" alias="com.cornerstonedesigns.MasterBedroomLocation">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="MasterBedroomLocationId" type="numeric" default="0">
	<cfproperty name="MasterBedroomLocation" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.MasterBedroomLocationId = 0;
		this.MasterBedroomLocation = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="MasterBedroomLocation">
		<cfreturn this>
	</cffunction>
	<cffunction name="getMasterBedroomLocationId" output="false" access="public" returntype="any">
		<cfreturn this.MasterBedroomLocationId>
	</cffunction>

	<cffunction name="setMasterBedroomLocationId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.MasterBedroomLocationId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getMasterBedroomLocation" output="false" access="public" returntype="any">
		<cfreturn this.MasterBedroomLocation>
	</cffunction>

	<cffunction name="setMasterBedroomLocation" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.MasterBedroomLocation = arguments.val>
	</cffunction>



</cfcomponent>