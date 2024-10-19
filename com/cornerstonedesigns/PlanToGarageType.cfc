<cfcomponent output="false" alias="com.cornerstonedesigns.PlanToGarageType">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PlanToGarageType" type="numeric" default="0">
	<cfproperty name="PlanId" type="numeric" default="0">
	<cfproperty name="GarageTypeId" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.PlanToGarageType = 0;
		this.PlanId = 0;
		this.GarageTypeId = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="PlanToGarageType">
		<cfreturn this>
	</cffunction>
	<cffunction name="getPlanToGarageType" output="false" access="public" returntype="any">
		<cfreturn this.PlanToGarageType>
	</cffunction>

	<cffunction name="setPlanToGarageType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PlanToGarageType = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPlanId" output="false" access="public" returntype="any">
		<cfreturn this.PlanId>
	</cffunction>

	<cffunction name="setPlanId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PlanId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
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



</cfcomponent>