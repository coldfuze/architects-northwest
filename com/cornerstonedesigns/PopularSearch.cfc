<cfcomponent output="false" alias="com.cornerstonedesigns.PopularSearch">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PopularSearchId" type="numeric" default="0">
	<cfproperty name="PopularSearch" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.PopularSearchId = 0;
		this.PopularSearch = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="PopularSearch">
		<cfreturn this>
	</cffunction>
	<cffunction name="getPopularSearchId" output="false" access="public" returntype="any">
		<cfreturn this.PopularSearchId>
	</cffunction>

	<cffunction name="setPopularSearchId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PopularSearchId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPopularSearch" output="false" access="public" returntype="any">
		<cfreturn this.PopularSearch>
	</cffunction>

	<cffunction name="setPopularSearch" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PopularSearch = arguments.val>
	</cffunction>



</cfcomponent>