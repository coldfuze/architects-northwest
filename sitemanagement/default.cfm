<cfsetting enablecfoutputonly="no" requesttimeout="1000">
<cftry>
<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Site Management - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Site Management - Your Family Architect - Architects Northwest";		
	}
</cfscript>

<cfscript>
	VARIABLES.tpi = Application.PlanService.getPickList();
	VARIABLES.planCount = Application.PlanService.getTotalPlansLoaded();
	VARIABLES.buildingProductCompanies = Application.BuildingProductCompanyService.getBuildingProductCompanyPicklist();
	VARIABLES.professionalAssociations = Application.ProfessionalAssociationService.getProfessionalAssociationPicklist();
	VARIABLES.infoRequest = Application.InfoRequestService.getInfoRequestPicklist();
	VARIABLES.builders = Application.BuilderService.getAllBuildersSorted();
	VARIABLES.InactivePlans = Application.PlanService.getInactivePlans();
	if (IsDefined("URL.ddPGT")) {
		Application.PlanToGarageTypeService.deleteDuplicates();	
	}
	
	if (IsDefined("updateXML")) {
		Application.PlanImageService.generateSSPXML();
	}
	VARIABLES.administrators = Application.AdminService.getAdminPicklist();
	
	VARIABLES.AdminId = Session.AdminId;
	VARIABLES.PermissionLevelId = Session.PermissionLevelId;
</cfscript>

<cfsavecontent variable="head">
	<script type="text/javascript">
		$( document ).ready(function() {
			$("body").on("click", "#displayInactivePlans", function() {
				if ($("#inactivePlansContainer").css("display") == "none") {
					$("#inactivePlansContainer").show(1000);
					$("#displayInactivePlans").html("Hide Inactive Plans");	
				}
				else {
					$("#inactivePlansContainer").hide(1000);
					$("#displayInactivePlans").html("Display Inactive Plans");	
				}
			});
		});
	</script>
</cfsavecontent>
<cfhtmlhead text="#head#">

<!--- Get Quick Search Business Logic --->
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#">
        <div id="mainManagePlanImagesContainer">
            <h1 id="sm">Site Management</h1>
            
            <div class="smBreadcrumb">
                <a href="/default.cfm">Home</a> &gt; Site Management
            </div>
            
            <cfif IsDefined("URL.ddPGT")>
            	<div class="loadPlanSuccessMessage">
                    <strong>Duplicate plan to garage type mappings deleted successfully</strong>
                </div>
            </cfif>
            
            <div class="smNormal">
                <cfif Hour(Now()) LT 12>Good Morning<cfelseif Hour(Now()) GTE 12 AND Hour(Now()) LT 18>Good Afternoon<cfelse>Good Evening</cfif><cfif IsDefined("Cookie.AdminFName")><cfoutput> #Cookie.AdminFName# </cfoutput></cfif> and welcome back to the site management section of your web site. Please choose a task to perform from the list below.
                
                <cfoutput><h3 class="sm">Manage Plans <span style="font-weight:normal;color:red;font-size:12px;">(#VARIABLES.planCount# Total Plans)</span></h3></cfoutput>
                <ul type="square" style="font-size:12px;">
                    <li><a href="addplan.cfm">Add a Plan</a></li>
                    <li>
                        <cfform action="updatePlan.cfm" method="get" name="up">
                            Update Plan <cfselect name="PlanId" query="VARIABLES.tpi" display="PlanTitle" value="PlanId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                    <li>
                        <cfform action="relatedPlans.cfm" method="get" name="up">
                            Identify Related Plans for <cfselect name="PlanId" query="VARIABLES.tpi" display="PlanTitle" value="PlanId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                    <li>
                        <cfform action="managePlanImages.cfm" method="get" name="up">
                            Load Images for Plan <cfselect name="PlanId" query="VARIABLES.tpi" display="PlanTitle" value="PlanId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                    <li>
                        <cfform action="deletePlan.cfm" method="get" name="up">
                            Delete Plan <cfselect name="PlanId" query="VARIABLES.tpi" display="PlanTitle" value="PlanId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                    <li style="margin-top:10px;"><a href="javascript:void(0);" id="displayInactivePlans">Display Inactive Plans</a></li>
                    <div id="inactivePlansContainer">
                    	<table style="margin-top:20px;border:thin solid 1px;" cellpadding="3" cellspacing="0">
                        	<thead>
                            	<tr bgcolor="#8EAC93">
                                	<th>Plan Number</th>
                                    <th>Plan Title</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<cfscript>
									VARIABLES.bg = 1;
								</cfscript>
                            	<cfloop query="VARIABLES.InactivePlans">
									<cfif VARIABLES.bg EQ 1>
                                        <tr bgcolor="#eee">
                                            <td><cfoutput><a href="updatePlan.cfm?PlanId=#PlanId#">#PlanNumber#</a></cfoutput></td>
                                            <td><cfoutput>#PlanTitle#</cfoutput></td>
                                        </tr>
                                    <cfelse>
                                        <tr bgcolor="#ddd">
                                            <td><cfoutput>#PlanNumber#</cfoutput></td>
                                            <td><cfoutput>#PlanTitle#</cfoutput></td>
                                        </tr>
                                    </cfif>
                                </cfloop>
                            </tbody>
                        </table>
                    </div>
                </ul>
                
                 <h3 class="sm">Manage Builder Links</h3>
                <ul type="square">
                    <li><a href="addBuilderLink.cfm">Add a Builder Link</a></li>
                    <li>
                        <cfform action="updateBuilderLink.cfm" method="get" name="up">
                            Update a Builder Link <cfselect name="BuilderId" query="VARIABLES.builders" display="Builder" value="BuilderId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                    <li>
                        <cfform action="deleteBuilderLink.cfm" method="get" name="up">
                            Delete a Builder Link <cfselect name="BuilderId" query="VARIABLES.builders" display="Builder" value="BuilderId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                </ul>
                
                <h3 class="sm">Manage Building Product Company Links</h3>
                <ul type="square">
                    <li><a href="addBuildingProductCompanyLink.cfm">Add a Building Product Company Link</a></li>
                    <li>
                        <cfform action="updateBuildingProductCompanyLink.cfm" method="get" name="up">
                            Update Building Product Company <cfselect name="BuildingProductCompanyId" query="VARIABLES.buildingProductCompanies" display="BuildingProductCompany" value="BuildingProductCompanyId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                    <li>
                        <cfform action="deleteBuildingProductCompanyLink.cfm" method="get" name="up">
                            Delete a Building Product Company <cfselect name="BuildingProductCompanyId" query="VARIABLES.buildingProductCompanies" display="BuildingProductCompany" value="BuildingProductCompanyId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                </ul>
                
                <h3 class="sm">Manage Professional Association Links</h3>
                <ul type="square">
                    <li><a href="addProfessionalAssociationLink.cfm">Add a Professional Association Link</a></li>
                    <li>
                        <cfform action="updateProfessionalAssociationLink.cfm" method="get" name="up">
                            Update Professional Association <cfselect name="ProfessionalAssociationId" query="VARIABLES.professionalAssociations" display="ProfessionalAssociation" value="ProfessionalAssociationId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                    <li>
                        <cfform action="deleteProfessionalAssociationLink.cfm" method="get" name="up">
                            Delete a Professional Association <cfselect name="ProfessionalAssociationId" query="VARIABLES.professionalAssociations" display="ProfessionalAssociation" value="ProfessionalAssociationId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                </ul>
                
                <cfif VARIABLES.PermissionLevelId EQ 1>
                <h3 class="sm">Manage/View Site Administrator Access</h3>
                <ul type="square">
                    <li><a href="addAdmin.cfm">Add a Site Administrator</a></li>
                    <li>
                        <cfform action="manageAdmin.cfm" method="post" name="up">
                            Update Site Administrator Information/Manage Access <cfselect name="AdminId" query="VARIABLES.administrators" display="AdminName" value="AdminId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                    <li>
                        <cfform action="viewAdminActivity.cfm" method="get" name="up">
                            View Site Administration Activity for 
                            <cfselect name="AdminViewedId" query="VARIABLES.administrators" display="AdminName" queryPosition="below" value="AdminId">
                            	<option value="0">All Administrators</option>
                            </cfselect>
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                </ul>
                </cfif>
                
                <h3 class="sm">View Information Requests</h3>
                <ul type="square">
                    <li>
                        <cfform action="viewInfoRequest.cfm" method="get" name="up">
                            View Information Request from <cfselect name="InfoRequestId" query="VARIABLES.infoRequest" display="InfoRequest" value="InfoRequestId" />
                            <cfinput type="submit" name="submit" value="Go!">
                        </cfform>
                    </li>
                </ul>
                
                <h3 class="sm">Other Tasks</h3>
                <ul type="square">
                	<cfif VARIABLES.PermissionLevelId EQ 1><li><a href="default.cfm?ddPGT=1">Delete duplicate plan to garage type mappings</a></li></cfif>
                    <li><a href="default.cfm?logout">Log-out</a></li>
                </ul>
            </div>
        </div>
    </cfmodule>
    <cfcatch type="any">
    	<cfscript>
			writeDump(cfcatch);
		</cfscript>
    </cfcatch>
</cftry>