<cfcomponent output="false" alias="com.cornerstonedesigns.HowContact">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="HowContactId" type="numeric" default="0">
	<cfproperty name="HowContact" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.HowContactId = 0;
		this.HowContact = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="HowContact">
		<cfreturn this>
	</cffunction>
	<cffunction name="getHowContactId" output="false" access="public" returntype="any">
		<cfreturn this.HowContactId>
	</cffunction>

	<cffunction name="setHowContactId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.HowContactId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getHowContact" output="false" access="public" returntype="any">
		<cfreturn this.HowContact>
	</cffunction>

	<cffunction name="setHowContact" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.HowContact = arguments.val>
	</cffunction>



</cfcomponent>