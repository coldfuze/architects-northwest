<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Update a Builder Link - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Update a Builder Link - Site Management - Your Family Architect - Architects Northwest";		
	}
</cfscript>

<cfif IsDefined("URL.BuilderId")>
	<cfif IsNumeric(URL.BuilderId)>
		<cfscript>
            Session.BuilderId = URL.BuilderId;
        </cfscript>
    </cfif>
</cfif>

<cfscript>
	VARIABLES.BuilderId = Session.BuilderId;
</cfscript>

<cfif VARIABLES.BuilderId EQ 0 OR NOT IsNumeric(VARIABLES.BuilderId)>
	<cflocation url="default.cfm">
</cfif>

<cfscript>
	if (IsDefined("Form.Builder")) {
		bpc = CreateObject("component","com.cornerstonedesigns.Builder").init();
		bpc.BuilderId = VARIABLES.BuilderId;
		bpc.Builder = Form.Builder;
		bpc.Link = Form.Link;
		VARIABLES.newBuilder = Application.BuilderService.save(bpc);
	}
	
	VARIABLES.builderInfo = Application.BuilderService.getById(VARIABLES.BuilderId);
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm">Update Builder Link</h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; Update a Builder Link
            </div>
            
            <cfif IsDefined("VARIABLES.newBuilder")>
                <div class="loadPlanSuccessMessage">
                    <strong>New Builder Updated successfully!</strong>
                </div>
            </cfif>
              
            <div class="smNormal">
                <cfif Hour(Now()) LT 12>Good Morning<cfelseif Hour(Now()) GTE 12 AND Hour(Now()) LT 18>Good Afternoon<cfelse>Good Evening</cfif><cfif IsDefined("Cookie.AdminFName")><cfoutput> #Cookie.AdminFName# </cfoutput></cfif> and welcome back to the site management section of your web site. Update builder information by completing the information in the form below, then click the <strong>Update Builder</strong> link.
                
                <cfform action="#CGI.SCRIPT_NAME#" name="abpc" method="post">
                    <table border="0" cellpUpdateing=5 cellspacing=0 style="width:500px;margin-top:10px;">
                        <tr class="planMainRow">
                            <td>
                                Company Name
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="Builder" value="#VARIABLES.builderInfo.Builder#" required="yes" validate="noblanks" maxlength="75" message="Please enter the company name for this builder - thanks" type="text" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Web Site
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="Link" value="#VARIABLES.builderInfo.Link#" required="yes" maxlength="75" validate="url" message="Please enter the web site for this builder - thanks" type="text" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td align="center">
                                <cfinput type="submit" name="ap" value="Update Builder" style="width:400px;">
                            </td>
                        </tr>
                    </table>
                </cfform>
            </div>
        </div>
    </cfmodule>