<cfcomponent output="false" alias="com.cornerstonedesigns.PlanToSearchSubGrouping">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PlanToSearchSubGroupingId" type="numeric" default="0">
	<cfproperty name="PlanId" type="numeric" default="0">
	<cfproperty name="SearchSubGroupingId" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.PlanToSearchSubGroupingId = 0;
		this.PlanId = 0;
		this.SearchSubGroupingId = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="PlanToSearchSubGrouping">
		<cfreturn this>
	</cffunction>
	<cffunction name="getPlanToSearchSubGroupingId" output="false" access="public" returntype="any">
		<cfreturn this.PlanToSearchSubGroupingId>
	</cffunction>

	<cffunction name="setPlanToSearchSubGroupingId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PlanToSearchSubGroupingId = arguments.val>
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

	<cffunction name="getSearchSubGroupingId" output="false" access="public" returntype="any">
		<cfreturn this.SearchSubGroupingId>
	</cffunction>

	<cffunction name="setSearchSubGroupingId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.SearchSubGroupingId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>