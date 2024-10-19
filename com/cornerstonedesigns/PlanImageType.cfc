<cfcomponent output="false" alias="com.cornerstonedesigns.PlanImageType">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="PlanImageType" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.PlanImageType = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="PlanImageType">
		<cfreturn this>
	</cffunction>
	<cffunction name="getPlanImageType" output="false" access="public" returntype="any">
		<cfreturn this.PlanImageType>
	</cffunction>

	<cffunction name="setPlanImageType" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PlanImageType = arguments.val>
	</cffunction>



</cfcomponent>