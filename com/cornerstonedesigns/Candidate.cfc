<cfcomponent output="false" alias="com.peaksportsandspinept.Candidate">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="CandidateId" type="numeric" default="0">
	<cfproperty name="FName" type="string" default="">
	<cfproperty name="LName" type="string" default="">
	<cfproperty name="Phone" type="string" default="">
	<cfproperty name="EMail" type="string" default="">
	<cfproperty name="Resume" type="string" default="">
	<cfproperty name="JobReqId" type="numeric" default="0">
	<cfproperty name="LocationId" type="numeric" default="0">
	<cfproperty name="DateSubmitted" type="date" default="">
	<cfproperty name="Comments" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.CandidateId = 0;
		this.FName = "";
		this.LName = "";
		this.Phone = "";
		this.EMail = "";
		this.Resume = "";
		this.JobReqId = 0;
		this.LocationId = 0;
		this.DateSubmitted = "";
		this.Comments = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Candidate">
		<cfreturn this>
	</cffunction>
	<cffunction name="getCandidateId" output="false" access="public" returntype="any">
		<cfreturn this.CandidateId>
	</cffunction>

	<cffunction name="setCandidateId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.CandidateId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getFName" output="false" access="public" returntype="any">
		<cfreturn this.FName>
	</cffunction>

	<cffunction name="setFName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.FName = arguments.val>
	</cffunction>

	<cffunction name="getLName" output="false" access="public" returntype="any">
		<cfreturn this.LName>
	</cffunction>

	<cffunction name="setLName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.LName = arguments.val>
	</cffunction>

	<cffunction name="getPhone" output="false" access="public" returntype="any">
		<cfreturn this.Phone>
	</cffunction>

	<cffunction name="setPhone" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Phone = arguments.val>
	</cffunction>

	<cffunction name="getEMail" output="false" access="public" returntype="any">
		<cfreturn this.EMail>
	</cffunction>

	<cffunction name="setEMail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.EMail = arguments.val>
	</cffunction>

	<cffunction name="getResume" output="false" access="public" returntype="any">
		<cfreturn this.Resume>
	</cffunction>

	<cffunction name="setResume" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Resume = arguments.val>
	</cffunction>

	<cffunction name="getJobReqId" output="false" access="public" returntype="any">
		<cfreturn this.JobReqId>
	</cffunction>

	<cffunction name="setJobReqId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.JobReqId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getLocationId" output="false" access="public" returntype="any">
		<cfreturn this.LocationId>
	</cffunction>

	<cffunction name="setLocationId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.LocationId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDateSubmitted" output="false" access="public" returntype="any">
		<cfreturn this.DateSubmitted>
	</cffunction>

	<cffunction name="setDateSubmitted" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DateSubmitted = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getComments" output="false" access="public" returntype="any">
		<cfreturn this.Comments>
	</cffunction>

	<cffunction name="setComments" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Comments = arguments.val>
	</cffunction>



</cfcomponent>