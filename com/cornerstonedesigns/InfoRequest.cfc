<cfcomponent output="false" alias="com.cornerstonedesigns.InfoRequest">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="InfoRequestId" type="numeric" default="0">
	<cfproperty name="InfoRequestTypeId" type="numeric" default="0">
	<cfproperty name="FName" type="string" default="">
	<cfproperty name="LName" type="string" default="">
	<cfproperty name="Address" type="string" default="">
	<cfproperty name="Address2" type="string" default="">
	<cfproperty name="City" type="string" default="">
	<cfproperty name="StateId" type="string" default="">
	<cfproperty name="ZipCode" type="string" default="">
	<cfproperty name="Email" type="string" default="">
	<cfproperty name="Phone" type="string" default="">
	<cfproperty name="PlanNameNumber" type="string" default="">
	<cfproperty name="Comments" type="string" default="">
	<cfproperty name="RequestDate" type="date" default="">
	<cfproperty name="WebSite" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.InfoRequestId = 0;
		this.InfoRequestTypeId = 0;
		this.FName = "";
		this.LName = "";
		this.Address = "";
		this.Address2 = "";
		this.City = "";
		this.StateId = "";
		this.ZipCode = "";
		this.Email = "";
		this.Phone = "";
		this.PlanNameNumber = "";
		this.Comments = "";
		this.RequestDate = "";
		this.WebSite = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="InfoRequest">
		<cfreturn this>
	</cffunction>
	<cffunction name="getInfoRequestId" output="false" access="public" returntype="any">
		<cfreturn this.InfoRequestId>
	</cffunction>

	<cffunction name="setInfoRequestId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.InfoRequestId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getInfoRequestTypeId" output="false" access="public" returntype="any">
		<cfreturn this.InfoRequestTypeId>
	</cffunction>

	<cffunction name="setInfoRequestTypeId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.InfoRequestTypeId = arguments.val>
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

	<cffunction name="getAddress" output="false" access="public" returntype="any">
		<cfreturn this.Address>
	</cffunction>

	<cffunction name="setAddress" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Address = arguments.val>
	</cffunction>

	<cffunction name="getAddress2" output="false" access="public" returntype="any">
		<cfreturn this.Address2>
	</cffunction>

	<cffunction name="setAddress2" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Address2 = arguments.val>
	</cffunction>

	<cffunction name="getCity" output="false" access="public" returntype="any">
		<cfreturn this.City>
	</cffunction>

	<cffunction name="setCity" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.City = arguments.val>
	</cffunction>

	<cffunction name="getStateId" output="false" access="public" returntype="any">
		<cfreturn this.StateId>
	</cffunction>

	<cffunction name="setStateId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.StateId = arguments.val>
	</cffunction>

	<cffunction name="getZipCode" output="false" access="public" returntype="any">
		<cfreturn this.ZipCode>
	</cffunction>

	<cffunction name="setZipCode" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.ZipCode = arguments.val>
	</cffunction>

	<cffunction name="getEmail" output="false" access="public" returntype="any">
		<cfreturn this.Email>
	</cffunction>

	<cffunction name="setEmail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Email = arguments.val>
	</cffunction>

	<cffunction name="getPhone" output="false" access="public" returntype="any">
		<cfreturn this.Phone>
	</cffunction>

	<cffunction name="setPhone" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Phone = arguments.val>
	</cffunction>

	<cffunction name="getPlanNameNumber" output="false" access="public" returntype="any">
		<cfreturn this.PlanNameNumber>
	</cffunction>

	<cffunction name="setPlanNameNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.PlanNameNumber = arguments.val>
	</cffunction>

	<cffunction name="getComments" output="false" access="public" returntype="any">
		<cfreturn this.Comments>
	</cffunction>

	<cffunction name="setComments" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Comments = arguments.val>
	</cffunction>

	<cffunction name="getRequestDate" output="false" access="public" returntype="any">
		<cfreturn this.RequestDate>
	</cffunction>

	<cffunction name="setRequestDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.RequestDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getWebSite" output="false" access="public" returntype="any">
		<cfreturn this.WebSite>
	</cffunction>

	<cffunction name="setWebSite" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.WebSite = arguments.val>
	</cffunction>



</cfcomponent>