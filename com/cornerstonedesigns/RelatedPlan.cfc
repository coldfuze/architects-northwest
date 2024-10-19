<cfcomponent output="false" alias="com.cornerstonedesigns.RelatedPlan">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PlanToRelatedPlanId" type="numeric" default="0">
	<cfproperty name="PlanId" type="numeric" default="0">
	<cfproperty name="RelatedPlanId" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.PlanToRelatedPlanId = 0;
		this.PlanId = 0;
		this.RelatedPlanId = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="RelatedPlan">
		<cfreturn this>
	</cffunction>
	<cffunction name="getPlanToRelatedPlanId" output="false" access="public" returntype="any">
		<cfreturn this.PlanToRelatedPlanId>
	</cffunction>

	<cffunction name="setPlanToRelatedPlanId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PlanToRelatedPlanId = arguments.val>
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

	<cffunction name="getRelatedPlanId" output="false" access="public" returntype="any">
		<cfreturn this.RelatedPlanId>
	</cffunction>

	<cffunction name="setRelatedPlanId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.RelatedPlanId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>