<cfcomponent output="false" alias="com.cornerstonedesigns.GarageType">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="GarageTypeId" type="numeric" default="0">
	<cfproperty name="GarageType" type="string" default="">
	<cfproperty name="GarageTypeLabel" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.GarageTypeId = 0;
		this.GarageType = "";
		this.GarageTypeLabel = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="GarageType">
		<cfreturn this>
	</cffunction>
	<cffunction name="getGarageTypeId" output="false" access="public" returntype="any">
		<cfreturn this.GarageTypeId>
	</cffunction>

	<cffunction name="setGarageTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.GarageTypeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getGarageType" output="false" access="public" returntype="any">
		<cfreturn this.GarageType>
	</cffunction>

	<cffunction name="setGarageType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.GarageType = arguments.val>
	</cffunction>

	<cffunction name="getGarageTypeLabel" output="false" access="public" returntype="any">
		<cfreturn this.GarageTypeLabel>
	</cffunction>

	<cffunction name="setGarageTypeLabel" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.GarageTypeLabel = arguments.val>
	</cffunction>



</cfcomponent>