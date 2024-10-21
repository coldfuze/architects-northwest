<cfcomponent>
	<cfscript>
		this.name = "ArchitectsNWOct2024";
		this.applicationTimeOut = CreateTimeSpan(1,0,0,0);
		this.sessionManagement = "true";
		this.sessionTimeOut = CreateTimeSpan(0,12,0,0);
		this.scriptProtect = "all";
		this.loginStorage = "session";
		this.LogPath = expandPath("CFError.log");
		this.setClientCookies = true;
		this.setDomainCookies = true;
		this.ErrorTemplate = "/error.cfm";
		if (CGI.HTTP_HOST CONTAINS "architectsnw.com") {
			this.sessioncookie.domain = '.architectsnw.com';
		}
		else {
			this.sessioncookie.domain = '.cornerstondesigns.com';
		}
   		this.sessioncookie.httponly = true;
		this.searchImplicitScopes = true;
	</cfscript>

	<cffunction name="onApplicationStart" returntype="void" output="false">
		<cfinclude template="settings.cfm">
		<cfscript>
			Application.AdminService = CreateObject("component","com.cornerstonedesigns.AdminService");
			Application.AdminActivityService = CreateObject("component","com.cornerstonedesigns.AdminActivityService");
			Application.BedroomService = CreateObject("component","com.cornerstonedesigns.BedroomService");
			Application.BestTimeService = CreateObject("component","com.cornerstonedesigns.BestTimeService");
			Application.BuilderService = CreateObject("component","com.cornerstonedesigns.BuilderService");
			Application.BuildingProductCompanyService = CreateObject("component","com.cornerstonedesigns.BuildingProductCompanyService");
			Application.BuildingProductTypeService = CreateObject("component","com.cornerstonedesigns.BuildingProductTypeService");
			Application.CandidateService = CreateObject("component","com.cornerstonedesigns.CandidateService");
			Application.CoveredPorchService = CreateObject("component","com.cornerstonedesigns.CoveredPorchService");
			Application.CustomerService = CreateObject("component","com.cornerstonedesigns.CustomerService");
			Application.DesignerService = CreateObject("component","com.cornerstonedesigns.DesignerService");
			Application.FoundationTypeService = CreateObject("component","com.cornerstonedesigns.FoundationTypeService");
			Application.FullBathroomService = CreateObject("component","com.cornerstonedesigns.FullBathroomService");
			Application.GarageDoorLocationService = CreateObject("component","com.cornerstonedesigns.GarageDoorLocationService");
			Application.GarageSizeService = CreateObject("component","com.cornerstonedesigns.GarageSizeService");
			Application.GarageTypeService = CreateObject("component","com.cornerstonedesigns.GarageTypeService");
			Application.HalfBathroomService = CreateObject("component","com.cornerstonedesigns.HalfBathroomService");
			Application.HistoryService = CreateObject("component","com.cornerstonedesigns.HistoryService");
			Application.HowContactService = CreateObject("component","com.cornerstonedesigns.HowContactService");
			Application.InfoRequestService = CreateObject("component","com.cornerstonedesigns.InfoRequestService");
			Application.InfoRequestTypeService = CreateObject("component","com.cornerstonedesigns.InfoRequestTypeService");
			Application.JobReqService = CreateObject("component","com.cornerstonedesigns.JobReqService");
			Application.LivingArrangementService = CreateObject("component","com.cornerstonedesigns.LivingArrangementService");
			Application.LotSlopeService = CreateObject("component","com.cornerstonedesigns.LotSlopeService");
			Application.MailService = CreateObject("component","com.cornerstonedesigns.MailService");
			Application.MasterBedroomLocationService = CreateObject("component","com.cornerstonedesigns.MasterBedroomLocationService");
			Application.PagingService = CreateObject("component","com.cornerstonedesigns.PagingService");
			Application.PermissionLevelService = CreateObject("component","com.cornerstonedesigns.PermissionLevelService");
			Application.PlanService = CreateObject("component","com.cornerstonedesigns.PlanService");
			Application.PlanPricingService = CreateObject("component","com.cornerstonedesigns.PlanPricing");
			Application.PlanImageService = CreateObject("component","com.cornerstonedesigns.PlanImageService");
			Application.PlanToGarageTypeService = CreateObject("component","com.cornerstonedesigns.PlanToGarageTypeService");
			Application.PlanToSearchSubGroupingService = CreateObject("component","com.cornerstonedesigns.PlanToSearchSubGroupingService");
			Application.PlanSearchService = CreateObject("component","com.cornerstonedesigns.PlanSearchService");
			Application.PlanTypeService = CreateObject("component","com.cornerstonedesigns.PlanTypeService");
			Application.PopularSearchService = CreateObject("component","com.cornerstonedesigns.PopularSearchService");
			Application.PriceCategoryService = CreateObject("component","com.cornerstonedesigns.PriceCategoryService");
			Application.ProfessionalAssociationService = CreateObject("component","com.cornerstonedesigns.ProfessionalAssociationService");
			Application.ProfessionalAssociationTypeService = CreateObject("component","com.cornerstonedesigns.ProfessionalAssociationTypeService");
			Application.RelatedPlanService = CreateObject("component","com.cornerstonedesigns.RelatedPlanService");
			Application.RoofFramingService = CreateObject("component","com.cornerstonedesigns.RoofFramingService");
			Application.SearchGroupingService = CreateObject("component","com.cornerstonedesigns.SearchGroupingService");
			Application.SearchSubGroupingService = CreateObject("component","com.cornerstonedesigns.SearchSubGroupingService");
			Application.StateService = CreateObject("component","com.cornerstonedesigns.StateService");
			Application.StoriesService = CreateObject("component","com.cornerstonedesigns.StoriesService");
			Application.TransactionService = CreateObject("component","com.cornerstonedesigns.TransactionService");
			Application.WashingtonStateZipCodeService = CreateObject("component","com.cornerstonedesigns.WashingtonStateZipCodeService");
		</cfscript>
	</cffunction>
    
    <cffunction name="onSessionStart" returntype="void" output="false">
		<cfscript>
            VARIABLES.PlanList = Application.PlanService.getAllPlansList();
        </cfscript>
        
        <!--- Contact Us Session Variables --->
        <cfparam name="Session.InfoRequestTypeId" default="0" type="integer">
        <cfparam name="Session.InfoRequestId" default="0" type="integer">
        <cfparam name="Session.Type" default="1" type="integer">
        <cfparam name="Session.FName" default="" type="string">
        <cfparam name="Session.LName" default="" type="string">
        <cfparam name="Session.EMail" default="" type="string">
        <cfparam name="Session.Phone" default="" type="string">
        <cfparam name="Session.Comments" default="" type="string">
        <cfparam name="Session.Address" default="" type="string">
        <cfparam name="Session.Address2" default="" type="string">
        <cfparam name="Session.City" default="" type="string">
        <cfparam name="Session.StateId" default="WA" type="string">
        <cfparam name="Session.ZipCode" default="" type="string">
        
        <!--- Quick Search Session Variables --->
        <cfparam name="Session.qsBathroons" default="100" type="integer">
        <cfparam name="Session.qsPlanType" default="0" type="integer">
        <cfparam name="Session.qsSquareFootageLow" default="0" type="integer">
        <cfparam name="Session.qsSquareFootageHigh" default="11000" type="integer">
        <cfparam name="Session.qsBedrooms" default="100" type="integer">
        <cfparam name="Session.qsBathrooms" default="100" type="integer">
        
        <!--- Plan Management Variables --->
        <cfparam name="Session.RoofLive" type="numeric" default="25">
        <cfparam name="Session.RoofDead" type="numeric" default="15">
        <cfparam name="Session.FloorLive" type="numeric" default="40">
        <cfparam name="Session.FloorDead" type="numeric" default="10">
        <cfparam name="Session.MaxWind" type="numeric" default="85">
        <cfparam name="Session.PlanId" type="numeric" default="0">
        
        <!--- Plan Search Variables --->
        <cfparam name="Session.SearchSubGroupingId" default="25" type="integer">
        <cfparam name="Session.PlanViewType" default="gallery">
        <cfparam name="Session.PlanSortOption" default="1" type="integer">
        <cfparam name="Session.PlansPerPage" default="12" type="integer">
        <cfparam name="Session.CurrentPage" default="1" type="integer">
        <cfparam name="Session.DesignerId" default="1" type="integer">
        <cfparam name="Session.PlanList" default="">
        <cfparam name="Session.PreviousPlanId" default="1" type="integer">
        <cfparam name="Session.NextPlanId" default="1" type="integer">
        <cfparam name="Session.PlanList" default="#VARIABLES.PlanList#">
        <cfparam name="Session.fromPlanSearch" type="numeric" default="0">
        <cfparam name="Session.savedPlans" default="">
        
        <!--- Advanced Search Variables --->
        <cfparam name="Session.PlanTypeId" type="integer" default="0">
        <cfparam name="Session.TotalSFLow" type="integer" default="0">
        <cfparam name="Session.TotalSFHigh" type="integer" default="11000">
        <cfparam name="Session.HouseDimensionWidthFtLow" type="string" default="Minimum">
        <cfparam name="Session.HouseDimensionWidthFtHigh" type="string" default="Maximum">
        <cfparam name="Session.HouseDimensionDepthFtLow" type="string" default="Minimum">
        <cfparam name="Session.HouseDimensionDepthFtHigh" type="string" default="Maximum">
        <cfparam name="Session.HouseDimensionHeightFtLow" type="string" default="Minimum">
        <cfparam name="Session.HouseDimensionHeightFtHigh" type="string" default="Maximum">
        <cfparam name="Session.BedroomId" type="integer" default="100">
        <cfparam name="Session.FullBathId" type="integer" default="100">
        <cfparam name="Session.MasterBedroomLocationId" type="integer" default="100">
        <cfparam name="Session.CoveredPorchId" type="integer" default="100">
        <cfparam name="Session.GarageSizeId" type="integer" default="100">
        <cfparam name="Session.GarageTypeId" type="integer" default="100">
        <cfparam name="Session.GarageDoorLocationId" type="integer" default="100">
        <cfparam name="Session.BonusRecSpace" type="string" default="Any">
        <cfparam name="Session.LivingArrangementId" type="integer" default="100">
        <cfparam name="Session.AdvancedSearchPlans" type="string" default="">
        <cfparam name="Session.QuickSearchPlans" type="string" default="">
        
        <!--- Search Variables --->
        <cfparam name="Session.PlanSearchId" default="0" type="integer">
        
        <!--- Plan Search/View Variables --->
        <cfparam name="Session.RecentlyViewedPlans" type="string" default="">
        
        <!--- Customer Variables --->
        <cfparam name="Session.CustomerFName" type="string" default="">
        <cfparam name="Session.CustomerId" type="integer" default="0">
        <cfparam name="Session.GetCredentials" type="boolean" default="0">  	
    </cffunction>
	
	<cffunction name="onRequestStart" returntype="void" output="false">
        <cfif IsDefined("url.reinit")>
			<cfscript>
                onApplicationStart();
                onSessionStart();
            </cfscript>
        </cfif>
        <cfif CGI.REMOTE_ADDR IS "63.235.131.247" OR CGI.REMOTE_ADDR IS "63.235.131.248" OR CGI.REMOTE_ADDR IS "63.231.205.1">
        	<cfabort>
        </cfif>
        <!--- Make sure that the HTTP_HOST contains www 
        <cfif CGI.HTTP_HOST CONTAINS "architectsnw">
        	<cfif CGI.HTTP_HOST DOES NOT CONTAIN "www">
				<cfif Len(Trim(cgi.Query_String))>
                    <cfset variables.QueryDelim = "?">
                <cfelse>
                    <cfset variables.QueryDelim = "">
                </cfif>
                
                <cfset variables.CurrPage="https://www.architectsnw.com" & cgi.Path_Info & variables.QueryDelim & cgi.Query_String>
                
                <cflocation url="#variables.CurrPage#" addtoken="No" statuscode="301">
            </cfif>
        <cfelse>
        	<cfif CGI.HTTP_HOST DOES NOT CONTAIN "www">
				<cfif Len(Trim(cgi.Query_String))>
                    <cfset variables.QueryDelim = "?">
                <cfelse>
                    <cfset variables.QueryDelim = "">
                </cfif>
                
                <cfset variables.CurrPage="https://www.cornerstonedesigns.com" & cgi.Path_Info & variables.QueryDelim & cgi.Query_String>
                
                <cflocation url="#variables.CurrPage#" addtoken="No" statuscode="301">
            </cfif>
        </cfif>--->
        <!---
        <cfif CGI.REMOTE_ADDR IS NOT "24.22.215.89">
        	<cflocation url="http://64.78.33.132" addtoken="no">
        </cfif>--->
		<cfif structKeyExists(url, 'logout')>           
            <cflogout>
        </cfif>
    
        <cfif CGI.SCRIPT_NAME CONTAINS "/myAccount">
            <cfinclude template="/myaccount/login/loginAction.cfm">
        </cfif>
             
		<cfif LEN(TRIM(Session.CustomerFName)) EQ 0>
            <cflogout>
        </cfif>
	</cffunction>
    
</cfcomponent>