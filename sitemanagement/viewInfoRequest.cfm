<cfsetting enablecfoutputonly="no" requesttimeout="1000">

<cfif IsDefined("URL.InfoRequestId")>
	<cfif IsNumeric(URL.InfoRequestId)>
		<cfscript>
            Session.InfoRequestId = URL.InfoRequestId;
        </cfscript>
    <cfelse>
		<cfscript>
            Session.InfoRequestId = 0;
        </cfscript>
    </cfif>
</cfif>

<cfscript>
	VARIABLES.InfoRequestId = Session.InfoRequestId;
</cfscript>

<cfif VARIABLES.InfoRequestId EQ 0>
	<cflocation url="default.cfm" addtoken="no">
</cfif>

<cfscript>
	// Get Information for this informaiton request
	VARIABLES.InfoRequest = Application.InfoRequestService.getById(VARIABLES.InfoRequestId);
	VARIABLES.InfoRequestType = Application.InfoRequestTypeService.getById(VARIABLES.InfoRequest.InfoRequestTypeId);
	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = VARIABLES.InfoRequestType.InfoRequestTypeSubject & " - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = VARIABLES.InfoRequestType.InfoRequestTypeSubject & " - Site Management - Your Family Architect - Architects Northwest";		
	}
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm"><cfoutput>#VARIABLES.InfoRequestType.InfoRequestTypeSubject# from #VARIABLES.InfoRequest.FName# #VARIABLES.InfoRequest.LName#</cfoutput></h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; <cfoutput>#VARIABLES.InfoRequestType.InfoRequestTypeSubject# from #VARIABLES.InfoRequest.FName# #VARIABLES.InfoRequest.LName#</cfoutput>
            </div>
            
            <div class="smNormal">
            	<cfoutput>#DateFormat(VARIABLES.InfoRequest.RequestDate, "DDDD, MMMM D, YYYY")#</cfoutput>
                
                <cfoutput>
                <p>
                	#VARIABLES.InfoRequest.FName# #VARIABLES.InfoRequest.LName#<cfif LEN(TRIM(VARIABLES.InfoRequest.Address)) GT 0><br />#VARIABLES.InfoRequest.Address#<cfif LEN(TRIM(VARIABLES.InfoRequest.Address2)) GT 0><br />#VARIABLES.InfoRequest.Address2#</cfif></cfif>
                    <br />
					<cfif LEN(TRIM(VARIABLES.InfoRequest.City)) GT 0>
                    	#VARIABLES.InfoRequest.City#<cfif LEN(TRIM(VARIABLES.InfoRequest.StateId)) GT 0>, #VARIABLES.InfoRequest.StateId#<cfif LEN(TRIM(VARIABLES.InfoRequest.ZipCode)) GT 0>&nbsp;&nbsp;#VARIABLES.InfoRequest.ZipCode#</cfif><cfelseif LEN(TRIM(VARIABLES.InfoRequest.ZipCode)) GT 0>&nbsp;&nbsp;#VARIABLES.InfoRequest.ZipCode#
                        </cfif>
                    <cfelseif LEN(TRIM(VARIABLES.InfoRequest.StateId)) GT 0>
                    	#VARIABLES.InfoRequest.StateId#
						<cfif LEN(TRIM(VARIABLES.InfoRequest.ZipCode)) GT 0>&nbsp;&nbsp;#VARIABLES.InfoRequest.ZipCode#</cfif>
                    <cfelseif LEN(TRIM(VARIABLES.InfoRequest.ZipCode)) GT 0>
                    	&nbsp;&nbsp;#VARIABLES.InfoRequest.ZipCode#
                    </cfif>
                </p>
                <p>
               		e-mail: <a href="mailto:#LCASE(VARIABLES.InfoRequest.EMail)#">#LCASE(VARIABLES.InfoRequest.EMail)#</a><cfif LEN(TRIM(VARIABLES.InfoRequest.Phone)) GT 0><br />phone: #VARIABLES.InfoRequest.Phone#</cfif>
                </p>
                <p>
                    <strong>Plan Name or Number:</strong> <cfif LEN(VARIABLES.InfoRequest.planNameNumber) GT 0>#VARIABLES.InfoRequest.planNameNumber#<cfelse>Plan Not Identified</cfif>
                </p>
                <p>
                	<strong>Comments:</strong><br />
					#VARIABLES.InfoRequest.Comments#
                </p>
                </cfoutput>
            </div>
        </div>
    </cfmodule>