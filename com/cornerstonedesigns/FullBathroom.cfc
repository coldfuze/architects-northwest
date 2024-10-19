<cfcomponent output="false" alias="com.cornerstonedesigns.FullBathroom">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="FullBathroomId" type="numeric" default="0">
	<cfproperty name="FullBathroom" type="string" default="">
	<cfproperty name="displayOnPlanSearch" type="numeric" default="0">
	<cfproperty name="displayOnPlanManagement" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.FullBathroomId = 0;
		this.FullBathroom = "";
		this.displayOnPlanSearch = 0;
		this.displayOnPlanManagement = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="FullBathroom">
		<cfreturn this>
	</cffunction>
	<cffunction name="getFullBathroomId" output="false" access="public" returntype="any">
		<cfreturn this.FullBathroomId>
	</cffunction>

	<cffunction name="setFullBathroomId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.FullBathroomId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFullBathroom" output="false" access="public" returntype="any">
		<cfreturn this.FullBathroom>
	</cffunction>

	<cffunction name="setFullBathroom" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.FullBathroom = arguments.val>
	</cffunction>

	<cffunction name="getDisplayOnPlanSearch" output="false" access="public" returntype="any">
		<cfreturn this.DisplayOnPlanSearch>
	</cffunction>

	<cffunction name="setDisplayOnPlanSearch" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DisplayOnPlanSearch = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDisplayOnPlanManagement" output="false" access="public" returntype="any">
		<cfreturn this.DisplayOnPlanManagement>
	</cffunction>

	<cffunction name="setDisplayOnPlanManagement" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DisplayOnPlanManagement = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>