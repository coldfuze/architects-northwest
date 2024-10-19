<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Add a Building Product Company Link - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Add a Building Product Company Link - Site Management - Your Family Architect - Architects Northwest";		
	}
</cfscript>

<cfscript>
	if (IsDefined("Form.BuildingProductTypeId")) {
		bpc = CreateObject("component","com.cornerstonedesigns.BuildingProductCompany").init();
		bpc.BuildingProductTypeId = Form.BuildingProductTypeId;
		bpc.BuildingProductCompany = Form.BuildingProductCompany;
		bpc.WebSite = Form.WebSite;
		VARIABLES.newBPC = Application.BuildingProductCompanyService.save(bpc);
	}
	VARIABLES.buildingProductType = Application.buildingProductTypeService.getBuildingProductTypesSorted();
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm">Add Building Product Company Link</h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; Add a Building Product Company Link
            </div>
            
            <cfif IsDefined("VARIABLES.newBPC")>
                <div class="loadPlanSuccessMessage">
                    <strong>New building product company added successfully!</strong>
                </div>
            </cfif>
              
            <div class="smNormal">
                <cfif Hour(Now()) LT 12>Good Morning<cfelseif Hour(Now()) GTE 12 AND Hour(Now()) LT 18>Good Afternoon<cfelse>Good Evening</cfif><cfif IsDefined("Cookie.AdminFName")><cfoutput> #Cookie.AdminFName# </cfoutput></cfif> and welcome back to the site management section of your web site. Add a new Building Product Company by completing the information in the form below, then click the <strong>Add Building Product Company</strong> link.
                
                <cfform action="#CGI.SCRIPT_NAME#" name="abpc" method="post">
                    <table border="0" cellpadding=5 cellspacing=0 style="width:500px;margin-top:10px;">
                        <tr class="planMainRow">
                            <td>
                                Building Product Company Type
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfselect name="BuildingProductTypeId" query="VARIABLES.buildingProductType" display="BuildingProductType" value="BuildingProductTypeId" queryposition="below" style="font-size:12px;margin-top:0px;width:450px;">
                                    <option value="0">Select a Building Product Type</option>
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
                                <cfinput name="BuildingProductCompany" required="yes" validate="noblanks" maxlength="75" message="Please enter the company name for this company - thanks" type="text" size="40" style="width:450px;">
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
                                <cfinput type="submit" name="ap" value="Add Building Product Company" style="width:400px;">
                            </td>
                        </tr>
                    </table>
                </cfform>
            </div>
        </div>
    </cfmodule>