<cfcomponent output="false" alias="com.peaksportsandspinept.BestTime">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="BestTimeId" type="numeric" default="0">
	<cfproperty name="BestTime" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.BestTimeId = 0;
		this.BestTime = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="BestTime">
		<cfreturn this>
	</cffunction>
	<cffunction name="getBestTimeId" output="false" access="public" returntype="any">
		<cfreturn this.BestTimeId>
	</cffunction>

	<cffunction name="setBestTimeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.BestTimeId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getBestTime" output="false" access="public" returntype="any">
		<cfreturn this.BestTime>
	</cffunction>

	<cffunction name="setBestTime" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.BestTime = arguments.val>
	</cffunction>



</cfcomponent>