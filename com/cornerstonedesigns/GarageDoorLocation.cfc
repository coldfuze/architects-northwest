<cfcomponent output="false" alias="com.cornerstonedesigns.GarageDoorLocation">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="GarageDoorLocationId" type="numeric" default="0">
	<cfproperty name="GarageDoorLocation" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.GarageDoorLocationId = 0;
		this.GarageDoorLocation = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="GarageDoorLocation">
		<cfreturn this>
	</cffunction>
	<cffunction name="getGarageDoorLocationId" output="false" access="public" returntype="any">
		<cfreturn this.GarageDoorLocationId>
	</cffunction>

	<cffunction name="setGarageDoorLocationId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.GarageDoorLocationId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getGarageDoorLocation" output="false" access="public" returntype="any">
		<cfreturn this.GarageDoorLocation>
	</cffunction>

	<cffunction name="setGarageDoorLocation" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.GarageDoorLocation = arguments.val>
	</cffunction>



</cfcomponent>