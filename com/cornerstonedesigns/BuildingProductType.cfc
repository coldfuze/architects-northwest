<cfcomponent output="false" alias="com.cornerstonedesigns.BuildingProductType">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="BuildingProductTypeId" type="numeric" default="0">
	<cfproperty name="BuildingProductType" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.BuildingProductTypeId = 0;
		this.BuildingProductType = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="BuildingProductType">
		<cfreturn this>
	</cffunction>
	<cffunction name="getBuildingProductTypeId" output="false" access="public" returntype="any">
		<cfreturn this.BuildingProductTypeId>
	</cffunction>

	<cffunction name="setBuildingProductTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BuildingProductTypeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBuildingProductType" output="false" access="public" returntype="any">
		<cfreturn this.BuildingProductType>
	</cffunction>

	<cffunction name="setBuildingProductType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.BuildingProductType = arguments.val>
	</cffunction>



</cfcomponent>