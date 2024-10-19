<cfcomponent output="false" alias="com.cornerstonedesigns.PriceCategory">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PriceCategoryId" type="numeric" default="0">
	<cfproperty name="PriceCategory" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.PriceCategoryId = 0;
		this.PriceCategory = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="PriceCategory">
		<cfreturn this>
	</cffunction>
	<cffunction name="getPriceCategoryId" output="false" access="public" returntype="any">
		<cfreturn this.PriceCategoryId>
	</cffunction>

	<cffunction name="setPriceCategoryId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PriceCategoryId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPriceCategory" output="false" access="public" returntype="any">
		<cfreturn this.PriceCategory>
	</cffunction>

	<cffunction name="setPriceCategory" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PriceCategory = arguments.val>
	</cffunction>



</cfcomponent>