<cfcomponent output="false" alias="com.cornerstonedesigns.CoveredPorch">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="CoveredPorchId" type="numeric" default="0">
	<cfproperty name="CoveredPorch" type="string" default="">
	<cfproperty name="CoveredPorchLabel" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.CoveredPorchId = 0;
		this.CoveredPorch = "";
		this.CoveredPorchLabel = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="CoveredPorch">
		<cfreturn this>
	</cffunction>
	<cffunction name="getCoveredPorchId" output="false" access="public" returntype="any">
		<cfreturn this.CoveredPorchId>
	</cffunction>

	<cffunction name="setCoveredPorchId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.CoveredPorchId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCoveredPorch" output="false" access="public" returntype="any">
		<cfreturn this.CoveredPorch>
	</cffunction>

	<cffunction name="setCoveredPorch" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.CoveredPorch = arguments.val>
	</cffunction>

	<cffunction name="getCoveredPorchLabel" output="false" access="public" returntype="any">
		<cfreturn this.CoveredPorchLabel>
	</cffunction>

	<cffunction name="setCoveredPorchLabel" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.CoveredPorchLabel = arguments.val>
	</cffunction>



</cfcomponent>