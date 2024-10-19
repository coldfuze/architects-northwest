<cfcomponent output="false" alias="com.cornerstonedesigns.PlanType">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PlanTypeId" type="numeric" default="0">
	<cfproperty name="PlanType" type="string" default="">
	<cfproperty name="displayOnHomePagePlanSpecSearch" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.PlanTypeId = 0;
		this.PlanType = "";
		this.displayOnHomePagePlanSpecSearch = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="PlanType">
		<cfreturn this>
	</cffunction>
	<cffunction name="getPlanTypeId" output="false" access="public" returntype="any">
		<cfreturn this.PlanTypeId>
	</cffunction>

	<cffunction name="setPlanTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PlanTypeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPlanType" output="false" access="public" returntype="any">
		<cfreturn this.PlanType>
	</cffunction>

	<cffunction name="setPlanType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PlanType = arguments.val>
	</cffunction>

	<cffunction name="getDisplayOnHomePagePlanSpecSearch" output="false" access="public" returntype="any">
		<cfreturn this.DisplayOnHomePagePlanSpecSearch>
	</cffunction>

	<cffunction name="setDisplayOnHomePagePlanSpecSearch" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DisplayOnHomePagePlanSpecSearch = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>