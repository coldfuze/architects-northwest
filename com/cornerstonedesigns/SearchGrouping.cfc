<cfcomponent output="false" alias="com.cornerstonedesigns.SearchGrouping">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="SearchGroupingId" type="numeric" default="0">
	<cfproperty name="SearchGrouping" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.SearchGroupingId = 0;
		this.SearchGrouping = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="SearchGrouping">
		<cfreturn this>
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

	<cffunction name="getSearchGrouping" output="false" access="public" returntype="any">
		<cfreturn this.SearchGrouping>
	</cffunction>

	<cffunction name="setSearchGrouping" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.SearchGrouping = arguments.val>
	</cffunction>



</cfcomponent>