<cfcomponent output="false" alias="com.cornerstonedesigns.State">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="StateId" type="string" default="">
	<cfproperty name="State" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.StateId = "";
		this.State = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="State">
		<cfreturn this>
	</cffunction>
	<cffunction name="getStateId" output="false" access="public" returntype="any">
		<cfreturn this.StateId>
	</cffunction>

	<cffunction name="setStateId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.StateId = arguments.val>
	</cffunction>

	<cffunction name="getState" output="false" access="public" returntype="any">
		<cfreturn this.State>
	</cffunction>

	<cffunction name="setState" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.State = arguments.val>
	</cffunction>



</cfcomponent>