<cfcomponent output="false" alias="com.cornerstonedesigns.FoundationType">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="FoundationTypeId" type="numeric" default="0">
	<cfproperty name="FoundationType" type="string" default="">
	<cfproperty name="FoundationTypeSName" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.FoundationTypeId = 0;
		this.FoundationType = "";
		this.FoundationTypeSName = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="FoundationType">
		<cfreturn this>
	</cffunction>
	<cffunction name="getFoundationTypeId" output="false" access="public" returntype="any">
		<cfreturn this.FoundationTypeId>
	</cffunction>

	<cffunction name="setFoundationTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.FoundationTypeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFoundationType" output="false" access="public" returntype="any">
		<cfreturn this.FoundationType>
	</cffunction>

	<cffunction name="setFoundationType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.FoundationType = arguments.val>
	</cffunction>

	<cffunction name="getFoundationTypeSName" output="false" access="public" returntype="any">
		<cfreturn this.FoundationTypeSName>
	</cffunction>

	<cffunction name="setFoundationTypeSName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.FoundationTypeSName = arguments.val>
	</cffunction>



</cfcomponent>