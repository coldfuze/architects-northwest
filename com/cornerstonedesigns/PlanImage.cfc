<cfcomponent output="false" alias="com.cornerstonedesigns.PlanImage">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ImageId" type="numeric" default="0">
	<cfproperty name="PlanId" type="numeric" default="0">
	<cfproperty name="ImageFile" type="string" default="">
	<cfproperty name="Caption" type="string" default="">
	<cfproperty name="displayInGallery" type="numeric" default="0">
	<cfproperty name="isPlanThumbnail" type="numeric" default="0">
	<cfproperty name="isGalleryThumbnail" type="numeric" default="0">
	<cfproperty name="DisplayOrder" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		this.ImageId = 0;
		this.PlanId = 0;
		this.ImageFile = "";
		this.Caption = "";
		this.displayInGallery = 0;
		this.isPlanThumbnail = 0;
		this.isGalleryThumbnail = 0;
		this.DisplayOrder = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="PlanImage">
		<cfreturn this>
	</cffunction>
	<cffunction name="getImageId" output="false" access="public" returntype="any">
		<cfreturn this.ImageId>
	</cffunction>

	<cffunction name="setImageId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.ImageId = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
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

	<cffunction name="getImageFile" output="false" access="public" returntype="any">
		<cfreturn this.ImageFile>
	</cffunction>

	<cffunction name="setImageFile" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.ImageFile = arguments.val>
	</cffunction>

	<cffunction name="getCaption" output="false" access="public" returntype="any">
		<cfreturn this.Caption>
	</cffunction>

	<cffunction name="setCaption" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset this.Caption = arguments.val>
	</cffunction>

	<cffunction name="getDisplayInGallery" output="false" access="public" returntype="any">
		<cfreturn this.DisplayInGallery>
	</cffunction>

	<cffunction name="setDisplayInGallery" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DisplayInGallery = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIsPlanThumbnail" output="false" access="public" returntype="any">
		<cfreturn this.IsPlanThumbnail>
	</cffunction>

	<cffunction name="setIsPlanThumbnail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.IsPlanThumbnail = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getIsGalleryThumbnail" output="false" access="public" returntype="any">
		<cfreturn this.IsGalleryThumbnail>
	</cffunction>

	<cffunction name="setIsGalleryThumbnail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.IsGalleryThumbnail = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDisplayOrder" output="false" access="public" returntype="any">
		<cfreturn this.DisplayOrder>
	</cffunction>

	<cffunction name="setDisplayOrder" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset this.DisplayOrder = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>