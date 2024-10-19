<cfcomponent output="false" alias="com.peaksportsandspinept.Activity">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ActivityId" type="numeric" default="0">
	<cfproperty name="Activity" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.ActivityId = 0;
		this.Activity = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Activity">
		<cfreturn this>
	</cffunction>
	<cffunction name="getActivityId" output="false" access="public" returntype="any">
		<cfreturn this.ActivityId>
	</cffunction>

	<cffunction name="setActivityId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ActivityId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getActivity" output="false" access="public" returntype="any">
		<cfreturn this.Activity>
	</cffunction>

	<cffunction name="setActivity" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Activity = arguments.val>
	</cffunction>



</cfcomponent>