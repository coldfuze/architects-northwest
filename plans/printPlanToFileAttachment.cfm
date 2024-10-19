<cfif IsDefined("URL.PlanId")>
	<cfif IsNumeric(URL.PlanId)>
		<cfscript>
            Session.PlanId = URL.PlanId;
        </cfscript>
    </cfif>
</cfif>

<!--- Convert Session to Local Variables --->
	<cfscript>
        VARIABLES.PlanId = Session.PlanId;
    </cfscript>
    
<!--- Get Plan Information --->
	<cfscript>
		VARIABLES.PlanInfo = Application.PlanService.getPlanInfo(VARIABLES.PlanId);
		VARIABLES.RelatedPlans = Application.RelatedPlanService.getRelatedPlansForPlan(VARIABLES.PlanId);
		VARIABLES.architecturalStyles = Application.SearchSubGroupingService.getArchitecturalStylesforPlan(VARIABLES.PlanId);
		VARIABLES.garageTypes = Application.GarageTypeService.getGarageTypesForPlan(VARIABLES.PlanId);
		VARIABLES.designFeatures = Application.PlanService.getPlanDesignFeatures(VARIABLES.PlanId);
		VARIABLES.PlanLabel = Application.PlanService.getPlanTitleWithTitleFirst(VARIABLES.PlanId);
		VARIABLES.Media = Application.PlanService.doesPlanHaveMedia(VARIABLES.PlanId);
		VARIABLES.hasMainFloorPlan = 0;
		VARIABLES.hasUpperFloorPlan = 0;
		VARIABLES.hasLowerFloorPlan = 0;
		VARIABLES.hasThirdFloorPlan = 0;
	
		// Determine which floor plans to display
		VARIABLES.mainFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/MainFloorPlan.gif';
		VARIABLES.mainFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/MainFloorPlan.gif';
		VARIABLES.mainFloorPlanAbsolutePath = ExpandPath(VARIABLES.mainFloorPlanPath);
		if (FileExists(VARIABLES.mainFloorPlanAbsolutePath)) {
			VARIABLES.hasMainFloorPlan = 1;	
		}
		VARIABLES.upperFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/UpperFloorPlan.gif';
		VARIABLES.upperFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/UpperFloorPlan.gif';
		VARIABLES.upperFloorPlanAbsolutePath = ExpandPath(VARIABLES.upperFloorPlanPath);
		if (FileExists(VARIABLES.upperFloorPlanAbsolutePath)) {
			VARIABLES.hasUpperFloorPlan = 1;	
		}
		VARIABLES.lowerFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/LowerFloorPlan.gif';
		VARIABLES.lowerFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/LowerFloorPlan.gif';
		VARIABLES.lowerFloorPlanAbsolutePath = ExpandPath(VARIABLES.lowerFloorPlanPath);
		if (FileExists(VARIABLES.lowerFloorPlanAbsolutePath)) {
			VARIABLES.hasLowerFloorPlan = 1;	
		}
		VARIABLES.thirdFloorPlanPath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normal/ThirdFloorPlan.gif';
		VARIABLES.thirdFloorPlanReversePath = '/assets/floorPlans/' & VARIABLES.PlanId & '/normalReverse/ThirdFloorPlan.gif';
		VARIABLES.thirdFloorPlanAbsolutePath = ExpandPath(VARIABLES.thirdFloorPlanPath);
		if (FileExists(VARIABLES.thirdFloorPlanAbsolutePath)) {
			VARIABLES.hasThirdFloorPlan = 1;	
		}
		
		VARIABLES.PlanImage = Application.PlanImageService.getPlanImageForPrintPlan(VARIABLES.PlanId);
	</cfscript>
    
<cfdocument format="pdf" name="planPDF" margintop="0.25" marginbottom="0.6" marginright="1" marginleft="1" overwrite="yes" name fontembed="no">
	<html>
    	<head>
            <style>
				BODY {
					background:white;	
					margin:0;
					text-align:left;
					color:black;
				}
				.descriptionHeading {
					line-height:26px;
					font-family:"Times New Roman",arial,sans-serif;
					font-style:italic;
					font-size: 28px;
					font-weight:bold;
					text-align:justify;
				}
				.planDetailsContentLeft {
					float:left;	
				}
				
				.planDetailsContentRight {
					float:right;	
					text-align:right;
				}
				
				.clearFloat {
					clear:both;
					margin:0;
					padding:0;
				}
			</style>
        </head>
        <body>
            <cfdocumentitem type="footer">
                <div style="font-size:9px;font-family:calibri,verdana,arial,sans-serif;color:black;">
                <strong>COPYRIGHT NOTICE:</strong> It is illegal to build this plan without a legally obtained set of prints. It is illegal to copy or redraw these plans. 
                Violation of U.S. Copyright Laws are punishable with fines up to $150,000. <cfif CGI.HTTP_HOST CONTAINS "cornerstone">After the purchase of plans, changes may be made by a qualified professional.</cfif>
                </div>
                <div style="font-size:9px;font-family:calibri,verdana,arial,sans-serif;color:black;margin-top:0.1in;">
                	<cfoutput>#VARIABLES.PlanLabel#</cfoutput> ::: 
                	<cfoutput>Page #cfdocument.currentpagenumber# of #cfdocument.totalPageCount#</cfoutput>
                </div>
            </cfdocumentitem>
            <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                    <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                </div>
            <cfelse>
                <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                    <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                </div>
            </cfif>
            <table border="0" cellpadding=10 cellspacing=0 style="width:100%;background-color:#caccbb;margin:0.05in 0 0 0;padding:0;">
                <tr>
                    <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;" valign="top">
                        <table border=0 cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Total Area:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.TotalSF# sq. ft.</cfoutput>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Garage Area:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.GarageSF# sq. ft.</cfoutput>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Garage Area:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.GarageSF# sq. ft.</cfoutput>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Garage Size:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.GarageSizeAbbr#</cfoutput>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Stories:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.Stories#</cfoutput>
                                </td>
                            </tr>
                            <cfif IsNumeric(VARIABLES.PlanInfo.Bedroom)>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Bedrooms:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.Bedroom#</cfoutput>
                                </td>
                            </tr>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.FullBathroom)>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Full Baths:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.FullBathroom#</cfoutput>
                                </td>
                            </tr>
                            </cfif>
                            <cfif IsNumeric(VARIABLES.PlanInfo.HalfBathroom)>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Half Baths:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.HalfBathroom#</cfoutput>
                                </td>
                            </tr>
                            </cfif>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Width:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthIn#</cfoutput>&quot;
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Depth:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthIn#</cfoutput>&quot;
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Height:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightIn#</cfoutput>&quot;
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    Foundation:
                                </td>
                                <td style="font-family:arial,verdana,sans-serif;font-size:12px;color:black;">
                                    <cfoutput>#VARIABLES.PlanInfo.FoundationType#</cfoutput>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="right" valign="top">
                        <cfoutput><img src="#VARIABLES.PlanImage#"></cfoutput>
                    </td>
                </tr>
            </table>
            
            <div style="margin-top:20px;font-family:verdana,arial,sans-serif;font-size:14px;">
            <cfif LEN(TRIM(VARIABLES.PlanInfo.PlanDescription)) GT 0>
                <cfoutput>#Replace(Replace(VARIABLES.PlanInfo.PlanDescription,'<p>','','All'),'</p>','','All')#</cfoutput>
            </cfif>
            </div>
            
            <cfif VARIABLES.hasMainFloorPlan EQ 1>
                <cfdocumentitem type="pagebreak" />
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                    <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                <cfelse>
                    <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                </cfif>
            	<div align="center" style="margin-top:0.1in;">
            	<strong style="text-decoration:underline;font-size:14px;">MAIN FLOOR</strong><br />
               	<cfoutput><img src="#VARIABLES.mainFloorPlanPath#" alt="Main Floor Plan" /></cfoutput>
				</div>                
            </cfif>
            <cfif VARIABLES.hasUpperFloorPlan EQ 1>
                <cfdocumentitem type="pagebreak" />
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                    <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                <cfelse>
                    <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                </cfif>
            	<div align="center" style="margin-top:0.1in;">
            	<strong style="text-decoration:underline;font-size:14px;">UPPER FLOOR</strong><br />
               	<cfoutput><img src="#VARIABLES.UpperFloorPlanPath#" alt="Upper Floor Plan" /></cfoutput>
				</div>                
            </cfif>
            <cfif VARIABLES.hasLowerFloorPlan EQ 1>
                <cfdocumentitem type="pagebreak" />
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                    <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                <cfelse>
                    <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                </cfif>
            	<div align="center" style="margin-top:0.1in;">
            	<strong style="text-decoration:underline;font-size:14px;">LOWER FLOOR</strong><br />
               	<cfoutput><img src="#VARIABLES.LowerFloorPlanPath#" alt="Lower Floor Plan" /></cfoutput>
				</div>                
            </cfif>
            <cfif VARIABLES.hasThirdFloorPlan EQ 1>
                <cfdocumentitem type="pagebreak" />
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                    <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                <cfelse>
                    <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                </cfif>
            	<div align="center" style="margin-top:0.1in;">
            	<strong style="text-decoration:underline;font-size:14px;">THIRD FLOOR</strong><br />
               	<cfoutput><img src="#VARIABLES.ThirdFloorPlanPath#" alt="Third Floor Plan" /></cfoutput>
				</div>                
            </cfif>
            <cfdocumentitem type="pagebreak" />
                <cfif CGI.HTTP_HOST CONTAINS "CornerStone">
                    <a href="http://www.cornerstonedesigns.com"><img src="/assets/printPlanImages/CornerStoneDesignsHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                <cfelse>
                    <a href="http://www.architectsnw.com"><img src="/assets/printPlanImages/ArchitectsNorthwestHeader.png" border=0 width="100%"></a>
                    <div style="font-size:18px;text-transform:uppercase;font-weight:bold;margin-top:0.05in;padding:0.025in;text-align:center;height:21px;background-color:#caccbb;">
                        <cfoutput>#UCASE(VARIABLES.PlanLabel)#</cfoutput>
                    </div>
                </cfif>
            	<div align="center" style="margin-top:0.1in;">
            		<strong style="text-decoration:underline;font-size:18px;">PLAN DETAILS</strong>
                </div>
                <div style="position:relative;margin-top:0.1in;">
                    <div style="position:absolute;left:0;width:2.25in;">
                        <strong style="text-decoration:underline;">Area Summary</strong><br />
                        <div class="planDetailsContentLeft">Total Area:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.TotalSF#</cfoutput> sq. ft.</div>
                        <div class="clearFloat"></div>
                        
                        <cfif VARIABLES.PlanInfo.MainFloorSF GT 0>
                            <div class="planDetailsContentLeft">Main Floor:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.MainFloorSF#</cfoutput> sq. ft.</div>
                            <div class="clearFloat"></div>
                        </cfif>
                        <cfif VARIABLES.PlanInfo.UpperFloorSF GT 0>
                            <div class="planDetailsContentLeft">Upper Floor:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.UpperFloorSF#</cfoutput> sq. ft.</div>
                            <div class="clearFloat"></div>
                        </cfif>
                        <cfif VARIABLES.PlanInfo.ThirdFloorSF GT 0>
                            <div class="planDetailsContentLeft">3rd Floor:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.ThirdFloorSF#</cfoutput> sq. ft.</div>
                            <div class="clearFloat"></div>
                        </cfif>
                        <cfif VARIABLES.PlanInfo.LowerFloorSF GT 0>
                            <div class="planDetailsContentLeft">Lower Floor:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.LowerFloorSF#</cfoutput> sq. ft.</div>
                            <div class="clearFloat"></div>
                        </cfif>
                        <cfif VARIABLES.PlanInfo.GarageSF GT 0>
                            <div class="planDetailsContentLeft">Garage Floor:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.GarageSF#</cfoutput> sq. ft.</div>
                            <div class="clearFloat"></div>
                        </cfif>
                        <br />
                        <strong style="text-decoration:underline;">General Information</strong><br />
                        <div class="planDetailsContentLeft">Stories:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.Stories#</cfoutput></div>
                        <div class="clearFloat"></div>
                        
                        <div class="planDetailsContentLeft">Width:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionWidthIn#</cfoutput>&quot;</div>
                        <div class="clearFloat"></div>
                        
                        <div class="planDetailsContentLeft">Depth:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionDepthIn#</cfoutput>&quot;</div>
                        <div class="clearFloat"></div>
                        
                        <div class="planDetailsContentLeft">Height:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightFt#</cfoutput>&#39;-<cfoutput>#VARIABLES.PlanInfo.HouseDimensionHeightIn#</cfoutput>&quot;</div>
                        <div class="clearFloat"></div>
                        <br>
                        <strong style="text-decoration:underline;">Architectural Style</strong><br />
                        <cfoutput query="VARIABLES.architecturalStyles">#SearchSubGrouping#<cfif VARIABLES.architecturalStyles.currentRow LT VARIABLES.architecturalStyles.recordCount><br /></cfif></cfoutput>
                        <br /><br />
                        <strong style="text-decoration:underline;">Number of Rooms</strong><br />
                        <cfif IsNumeric(VARIABLES.PlanInfo.Bedroom)>
                            <div class="planDetailsContentLeft">Bedrooms:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.Bedroom#</cfoutput></div>
                            <div class="clearFloat"></div>
                        </cfif>
                        <cfif IsNumeric(VARIABLES.PlanInfo.FullBathroom)>
                        <div class="planDetailsContentLeft">Full Baths:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.FullBathroom#</cfoutput></div>
                        <div class="clearFloat"></div>
                        </cfif>
                        <cfif IsNumeric(VARIABLES.PlanInfo.HalfBathroom)>
                        <div class="planDetailsContentLeft">Half Baths:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.HalfBathroom#</cfoutput></div>
                        <div class="clearFloat"></div>
                        </cfif>
                        <br>
                        <cfif VARIABLES.PlanInfo.GarageSizeId GT 1>
                            <strong style="text-decoration:underline;">Garage</strong><br />
                            <div class="planDetailsContentLeft">Garage Size:</div>
                            <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.GarageSizeAbbr#</cfoutput></div>
                            <div class="clearFloat"></div>
                            <cfif LEN(VARIABLES.PlanInfo.GarageDoorLocationAbbr) GT 0>
                                <div class="planDetailsContentLeft">Garage Door Location:</div>
                                <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.GarageDoorLocationAbbr#</cfoutput></div>
                                <div class="clearFloat"></div>
                            </cfif>
                            <cfif VARIABLES.garageTypes.recordCount GT 0>
                                <div class="planDetailsContentLeft">Garage Type:</div>
                                <div class="planDetailsContentRight"><cfoutput query="VARIABLES.garageTypes">#GarageType#</cfoutput></div>
                                <div class="clearFloat"></div>
                            </cfif>
                        <cfelse>
                            <div class="planDetailsContentLeft"><strong style="text-decoration:underline;">Garage</strong></div>
                            <div class="planDetailsContentRight">No Garage</div>
                            <div class="clearFloat"></div>
                        </cfif>
                        <br />
                        <strong style="text-decoration:underline;">Roof Pitches</strong><br />
                        <div class="planDetailsContentLeft">Primary:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofPrimary#</cfoutput>:12</div>
                        <div class="clearFloat"></div>
                        <cfif IsNumeric(VARIABLES.PlanInfo.RoofSecondary)>
                        <div class="planDetailsContentLeft">Secondary:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofSecondary#</cfoutput>:12</div>
                        <div class="clearFloat"></div>
                        </cfif>
                        <br />
                        <strong style="text-decoration:underline;">Wall Heights</strong><br />
                        <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightMainFloor)>
                        <div class="planDetailsContentLeft">Main:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightMainFloor#</cfoutput>&#39;-0&quot;</div>
                        <div class="clearFloat"></div>
                        </cfif>
                        <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightUpperFloor)>
                        <div class="planDetailsContentLeft">Upper:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightUpperFloor#</cfoutput>&#39;-0&quot;</div>
                        <div class="clearFloat"></div>
                        </cfif>
                        <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightThirdFloor)>
                        <div class="planDetailsContentLeft">3rd Floor:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightThirdFloor#</cfoutput>&#39;-0&quot;</div>
                        <div class="clearFloat"></div>
                        </cfif>
                        <cfif IsNumeric(VARIABLES.PlanInfo.CeilingHeightLowerFloor)>
                        <div class="planDetailsContentLeft">Lower:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.CeilingHeightLowerFloor#</cfoutput>&#39;-0&quot;</div>
                        <div class="clearFloat"></div>
                        </cfif>
                    </div>
                    
                    <div style="position:absolute;right:0;width:2.25in;">
                    	<strong style="text-decoration:underline;">Foundation Type</strong><br />
						<cfoutput>#VARIABLES.PlanInfo.FoundationType#</cfoutput>
                        <br /><br />
                        <strong style="text-decoration:underline;">Roof Framing</strong><br />
                        <cfoutput>#VARIABLES.PlanInfo.RoofFraming#</cfoutput>
                        <br /><br />
                        <strong style="text-decoration:underline;">Floor Load</strong><br />
                        <div class="planDetailsContentLeft">Live (lbs):</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.FloorLive#</cfoutput> PSF</div>
                        <div class="clearFloat"></div>
                        <div class="planDetailsContentLeft">Dead (lbs):</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.FloorDead#</cfoutput> PSF</div>
                        <div class="clearFloat"></div>
                        <br />
                        <strong style="text-decoration:underline;">Roof Load</strong><br />
                        <div class="planDetailsContentLeft">Live (lbs):</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofLive#</cfoutput> PSF</div>
                        <div class="clearFloat"></div>
                        <div class="planDetailsContentLeft">Dead (lbs):</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.RoofDead#</cfoutput> PSF</div>
                        <div class="clearFloat"></div>
                        <div class="planDetailsContentLeft">Wind:</div>
                        <div class="planDetailsContentRight"><cfoutput>#VARIABLES.PlanInfo.MaxWind#</cfoutput> PSF</div>
                        <div class="clearFloat"></div>
                        <br>
						<strong style="text-decoration:underline;">Design Features</strong>
						<cfoutput>#VARIABLES.designFeatures#</cfoutput>
                    </div>
                </div>
        </body>
    </html>
</cfdocument>