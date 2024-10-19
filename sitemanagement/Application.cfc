<cfcomponent extends="ApplicationProxy">
	<cfscript>
		this.name = "ArchitectsNWSM";
		this.applicationTimeout = createTimeSpan(0,2,0,0);
		this.sessionTimeout = createTimeSpan(0,4,0,0);
		this.sessionManagement = "true";
		this.loginStorage = "session";
		this.authcookie.disableupdate = "false";
		this.authcookie.timeout = "-1";
		this.authcookie.samesite = "strict";
		this.LogPath = expandPath("/CFError.log");
		this.ErrorTemplate = "/default.cfm";
		if (CGI.HTTP_HOST CONTAINS "architects") {
			this.sessioncookie.domain = '.architectsnw.com';
		}
		else {
			this.sessioncookie.domain = '.cornerstonedesigns.com';
		}
   		this.sessioncookie.httponly = "true";
		this.sessioncookie.secure = "true";
		this.sessioncookie.timeout = "1";
		this.sessioncookie.disableupdate = "false";
		this.searchImplicitScopes = true;
	</cfscript>
    
    <cffunction name="onApplicationStart" returntype="void" output="false">
    	<cfinclude template="../settings.cfm">
    	<cfscript>
			super.onApplicationStart();
        </cfscript>
	</cffunction>
    
    <cffunction name="onSessionStart" returntype="void" output="false">  
    	<cfscript>
			super.onSessionStart();
		</cfscript>
        	   
        <!--- Set shared scope variable defaults --->     
        <cfparam name="Session.UserName" default="">
        <cfparam name="Session.AdminFName" default="">
        <cfparam name="Session.AdminId" default="0">
        <cfparam name="Session.UpdateAdminId" default="0">
        <cfparam name="Session.PermissionLevelId" default="0">
        <cfparam name="Session.getCredentials" default="0">
        <cfparam name="Session.BuildingProductCompanyId" default="0" type="integer">
        <cfparam name="Session.ProfessionalAssociationId" default="0" type="integer">
        <cfparam name="Session.BuilderId" default="0" type="integer">
        <cfparam name="Session.ManagedAdminId" default="0" type="integer">
        <cfparam name="Session.AdminViewedId" default="0" type="integer">
	</cffunction>
	
	<cffunction name="onRequestStart" returntype="void" output="false">
		<cfscript>
    	if (IsDefined("url.reinit")) {
			onApplicationStart();
			onSessionStart();
		}
        </cfscript>
		
		<cfif CGI.REMOTE_ADDR IS "63.235.131.247" OR CGI.REMOTE_ADDR IS "63.235.131.248" OR CGI.REMOTE_ADDR IS "63.231.205.1">
        	<cfabort>
        </cfif>
        
    	<cfif structKeyExists(url, 'logout')>
			<cfscript>
                VARIABLES.AdminId = Session.AdminId;
            </cfscript>
            
			<cfscript>
        		// Record Admin Activity
				aa = CreateObject("component","com.cornerstonedesigns.AdminActivity").init();
				aa.AdminId = VARIABLES.AdminId;
				aa.ImpactedAdminId = VARIABLES.AdminId;
				aa.ActivityDate = CreateODBCDateTime(Now());
				aa.TransactionId = 2;
				aa.PlanId=0;
				VARIABLES.adminActivity = Application.AdminActivityService.save(aa);  
			</cfscript> 
                 
			<cflogout>
		</cfif>
		
		<cfif CGI.REMOTE_ADDR NEQ "73.140.180.241" AND CGI.REMOTE_ADDR NEQ "50.125.23.54" AND CGI.REMOTE_ADDR NEQ "24.19.125.39" AND CGI.REMOTE_ADDR NEQ "207.190.17.192" AND CGI.REMOTE_ADDR NEQ "73.169.251.145" AND CGI.REMOTE_ADDR NEQ "174.165.88.80">
			<cflocation url="/default.cfm?invalid-IP" addtoken="No">
		<cfelse>
			<cfscript>
				VARIABLES.loginName = 'admin' & RandRange(1000,10000);
			</cfscript>
			<cflogin>
				<cfloginuser name="#VARIABLES.loginName#" password="admin" roles="general,admin">	
			</cflogin>
		</cfif>
        
		<!--- <cfinclude template="login/loginAction.cfm"> --->
        
		<cfsetting showdebugoutput="false">
	</cffunction>
</cfcomponent>