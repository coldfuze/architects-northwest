<cfcomponent output="false" alias="com.cornerstonedesigns.AdminActivity">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="AdminActivityId" type="numeric" default="0">
	<cfproperty name="AdminId" type="numeric" default="0">
	<cfproperty name="TransactionId" type="numeric" default="0">
	<cfproperty name="ImpactedAdminId" type="numeric" default="0">
	<cfproperty name="ActivityDate" type="date" default="">
	<cfproperty name="PlanId" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.AdminActivityId = 0;
		this.AdminId = 0;
		this.TransactionId = 0;
		this.ImpactedAdminId = 0;
		this.ActivityDate = "";
		this.PlanId = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="AdminActivity">
		<cfreturn this>
	</cffunction>
	<cffunction name="getAdminActivityId" output="false" access="public" returntype="any">
		<cfreturn this.AdminActivityId>
	</cffunction>

	<cffunction name="setAdminActivityId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.AdminActivityId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAdminId" output="false" access="public" returntype="any">
		<cfreturn this.AdminId>
	</cffunction>

	<cffunction name="setAdminId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.AdminId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getTransactionId" output="false" access="public" returntype="any">
		<cfreturn this.TransactionId>
	</cffunction>

	<cffunction name="setTransactionId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.TransactionId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getImpactedAdminId" output="false" access="public" returntype="any">
		<cfreturn this.ImpactedAdminId>
	</cffunction>

	<cffunction name="setImpactedAdminId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ImpactedAdminId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getActivityDate" output="false" access="public" returntype="any">
		<cfreturn this.ActivityDate>
	</cffunction>

	<cffunction name="setActivityDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ActivityDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getPlanId" output="false" access="public" returntype="any">
		<cfreturn this.PlanId>
	</cffunction>

	<cffunction name="setPlanId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.PlanId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>