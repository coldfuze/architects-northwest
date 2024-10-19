<cfcomponent output="false" alias="com.cornerstonedesigns.WashingtonStateZipCode">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ZipCode" type="numeric" default="0">
	<cfproperty name="City" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.ZipCode = 0;
		this.City = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="WashingtonStateZipCode">
		<cfreturn this>
	</cffunction>
	<cffunction name="getZipCode" output="false" access="public" returntype="any">
		<cfreturn this.ZipCode>
	</cffunction>

	<cffunction name="setZipCode" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ZipCode = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCity" output="false" access="public" returntype="any">
		<cfreturn this.City>
	</cffunction>

	<cffunction name="setCity" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.City = arguments.val>
	</cffunction>



</cfcomponent>