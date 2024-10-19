<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Add a Professional Association Link - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Add a Professional Association Link - Site Management - Your Family Architect - Architects Northwest";		
	}
</cfscript>

<cfscript>
	if (IsDefined("Form.ProfessionalAssociationTypeId")) {
		pa = CreateObject("component","com.cornerstonedesigns.ProfessionalAssociation").init();
		pa.ProfessionalAssociationTypeId = Form.ProfessionalAssociationTypeId;
		pa.ProfessionalAssociation = Form.ProfessionalAssociation;
		pa.WebSite = Form.WebSite;
		VARIABLES.newPA = Application.ProfessionalAssociationService.save(pa);
	}
	VARIABLES.ProfessionalAssociationType = Application.ProfessionalAssociationTypeService.getProfessionalAssociationTypesSorted();
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm">Add Professional Association Link</h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; Add a Professional Association Link
            </div>
            
            <cfif IsDefined("VARIABLES.newPA")>
                <div class="loadPlanSuccessMessage">
                    <strong>New Professional Association added successfully!</strong>
                </div>
            </cfif>
              
            <div class="smNormal">
                <cfif Hour(Now()) LT 12>Good Morning<cfelseif Hour(Now()) GTE 12 AND Hour(Now()) LT 18>Good Afternoon<cfelse>Good Evening</cfif><cfif IsDefined("Cookie.AdminFName")><cfoutput> #Cookie.AdminFName# </cfoutput></cfif> and welcome back to the site management section of your web site. Add a new Professional Association by completing the information in the form below, then click the <strong>Add Professional Association</strong> link.
                
                <cfform action="#CGI.SCRIPT_NAME#" name="abpc" method="post">
                    <table border="0" cellpadding=5 cellspacing=0 style="width:500px;margin-top:10px;">
                        <tr class="planMainRow">
                            <td>
                                Professional Association Type
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfselect name="ProfessionalAssociationTypeId" query="VARIABLES.ProfessionalAssociationType" display="ProfessionalAssociationType" value="ProfessionalAssociationTypeId" queryposition="below" style="font-size:12px;margin-top:0px;width:450px;">
                                    <option value="0">Select a Professional Association Type</option>
                                </cfselect>
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Company Name
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="ProfessionalAssociation" required="yes" validate="noblanks" maxlength="75" message="Please enter the company name for this company - thanks" type="text" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Web Site
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="WebSite" required="yes" maxlength="75" validate="url" message="Please enter the web site for this company - thanks" type="text" value="http://www." size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td align="center">
                                <cfinput type="submit" name="ap" value="Add Professional Association" style="width:400px;">
                            </td>
                        </tr>
                    </table>
                </cfform>
            </div>
        </div>
    </cfmodule>