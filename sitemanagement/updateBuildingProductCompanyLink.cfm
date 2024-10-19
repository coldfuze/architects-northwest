<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Update a Building Product Company Link - Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Update a Building Product Company Link - Site Management - Your Family Architect - Architects Northwest";		
	}
</cfscript>

<cfif IsDefined("URL.BuildingProductCompanyId")>
	<cfscript>
        Session.BuildingProductCompanyId = URL.BuildingProductCompanyId;
    </cfscript>
</cfif>

<cfscript>
	VARIABLES.BuildingProductCompanyId = Session.BuildingProductCompanyId;
</cfscript>

<cfif VARIABLES.BuildingProductCompanyId EQ 0>
	<cflocation url="default.cfm">
</cfif>

<cfscript>
	if (IsDefined("Form.BuildingProductTypeId")) {
		bpc = CreateObject("component","com.cornerstonedesigns.BuildingProductCompany").init();
		bpc.BuildingProductTypeId = Form.BuildingProductTypeId;
		bpc.BuildingProductCompany = Form.BuildingProductCompany;
		bpc.BuildingProductCompanyId = VARIABLES.BuildingProductCompanyId;
		bpc.WebSite = Form.WebSite;
		VARIABLES.newBPC = Application.BuildingProductCompanyService.save(bpc);
	}
	VARIABLES.buildingProductType = Application.buildingProductTypeService.getBuildingProductTypesSorted();
	VARIABLES.bpci = Application.BuildingProductCompanyService.getById(VARIABLES.BuildingProductCompanyId);
</cfscript>

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            <h2 id="sm">Update Building Product Company Link</h2>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; <a href="default.cfm">Site Management</a> &gt; Update a Building Product Company Link
            </div>
            
            <cfif IsDefined("VARIABLES.newBPC")>
                <div class="loadPlanSuccessMessage">
                    <strong>Building product company information updated successfully!</strong>
                </div>
            </cfif>
              
            <div class="smNormal">
                <cfif Hour(Now()) LT 12>Good Morning<cfelseif Hour(Now()) GTE 12 AND Hour(Now()) LT 18>Good Afternoon<cfelse>Good Evening</cfif><cfif IsDefined("Cookie.AdminFName")><cfoutput> #Cookie.AdminFName# </cfoutput></cfif> and welcome back to the site management section of your web site. Update Building Product Company Information for <cfoutput><strong>#VARIABLES.bpci.BuildingProductCompany#</strong></cfoutput> by completing the information in the form below, then click the <strong style="white-space:nowrap;">Update Building Product Company</strong> link.
                
                <cfform action="#CGI.SCRIPT_NAME#" name="abpc" method="post">
                    <table border="0" cellpadding=5 cellspacing=0 style="width:500px;margin-top:10px;">
                        <tr class="planMainRow">
                            <td>
                                Building Product Company Type
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfselect name="BuildingProductTypeId" selected="#VARIABLES.bpci.BuildingProductTypeId#" query="VARIABLES.buildingProductType" display="BuildingProductType" value="BuildingProductTypeId" style="font-size:12px;margin-top:0px;width:450px;"></cfselect>
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Company Name
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="BuildingProductCompany" value="#VARIABLES.bpci.BuildingProductCompany#" required="yes" validate="noblanks" maxlength="75" message="Please enter the company name for this company - thanks" type="text" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td>
                                Web Site
                            </td>
                        </tr>
                        <tr class="planDataRow">
                            <td>
                                <cfinput name="WebSite" required="yes" maxlength="75" validate="url" message="Please enter the web site for this company - thanks" type="text" value="#VARIABLES.bpci.WebSite#" size="40" style="width:450px;">
                            </td>
                        </tr>
                        <tr class="planMainRow">
                            <td align="center">
                                <cfinput type="submit" name="ap" value="Update Building Product Company" style="width:400px;">
                            </td>
                        </tr>
                    </table>
                </cfform>
            </div>
        </div>
    </cfmodule>