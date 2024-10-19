<cfcomponent output="false" alias="com.cornerstonedesigns.SearchSubGrouping">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="SearchSubGroupingId" type="numeric" default="0">
	<cfproperty name="SearchGroupingId" type="numeric" default="0">
	<cfproperty name="SearchSubGrouping" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.SearchSubGroupingId = 0;
		this.SearchGroupingId = 0;
		this.SearchSubGrouping = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="SearchSubGrouping">
		<cfreturn this>
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

	<cffunction name="getSearchGroupingId" output="false" access="public" returntype="any">
		<cfreturn this.SearchGroupingId>
	</cffunction>

	<cffunction name="setSearchGroupingId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.SearchGroupingId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSearchSubGrouping" output="false" access="public" returntype="any">
		<cfreturn this.SearchSubGrouping>
	</cffunction>

	<cffunction name="setSearchSubGrouping" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.SearchSubGrouping = arguments.val>
	</cffunction>



</cfcomponent>