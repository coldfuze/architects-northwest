<cfcomponent output="false" alias="com.cornerstonedesigns.LivingArrangement">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="LivingArrangementId" type="numeric" default="0">
	<cfproperty name="LivingArrangement" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.LivingArrangementId = 0;
		this.LivingArrangement = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="LivingArrangement">
		<cfreturn this>
	</cffunction>
	<cffunction name="getLivingArrangementId" output="false" access="public" returntype="any">
		<cfreturn this.LivingArrangementId>
	</cffunction>

	<cffunction name="setLivingArrangementId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LivingArrangementId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLivingArrangement" output="false" access="public" returntype="any">
		<cfreturn this.LivingArrangement>
	</cffunction>

	<cffunction name="setLivingArrangement" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.LivingArrangement = arguments.val>
	</cffunction>



</cfcomponent>