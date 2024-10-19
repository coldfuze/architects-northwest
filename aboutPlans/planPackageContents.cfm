<!--- Commonly used code snippets used throughout the site --->
	<cfinclude template="../CommonScripts.cfm">

<cfscript>	
	if (CGI.HTTP_HOST CONTAINS "CornerStone") {
		VARIABLES.pageTitle = "Plan Package Contents - About Plans - Stock Home Plans for Every Style - CornerStone Designs";	
	}
	else {
		VARIABLES.pageTitle = "Plan Package Contents - About Plans - Your Family Architect - Architects Northwest";		
	}
	
	// Architectural Style Links
	VARIABLES.ArchitecturalStyleLinks = Application.PlanSearchService.getSideBarLinks(1);
	
	// Popular Search Links
	VARIABLES.PopularSearchLinks = Application.PlanSearchService.getSideBarLinks(2);
	
	// Popular Search Links
	VARIABLES.HousePlanCollectionLinks = Application.PlanSearchService.getSideBarLinks(3);
</cfscript>

<!--- Get Quick Search Business Logic --->
	<cfinclude template="../includes/quickSearchBusinessLogic.cfm">
    <cfmodule template="#Application.CTPath#layout.cfm" title="#VARIABLES.pageTitle#" recentlyviewedplans="#VARIABLES.RecentlyViewedPlans#">
        <div id="copyrightMainContainer">            
            <div style="position:absolute;top:0px;left:10px;height:1225px;width:164px;padding:10px 10px 10px 10px;line-height:17px;font-size:12px;background-color:#caccbb;text-align:left;margin-bottom:10px;">
            	<cfoutput>#VARIABLES.PopularSearchLinks#</cfoutput>
                <cfoutput>#VARIABLES.ArchitecturalStyleLinks#</cfoutput>
                <cfoutput>#VARIABLES.HousePlanCollectionLinks#</cfoutput>
            </div>
            
            <div id="copyrightContainer">
            	<div id="titleBar">
                	PLAN PACKAGE CONTENTS
                </div>
                
                <cfif CGI.HTTP_HOST CONTAINS "cornerstone">
                <div style="margin-bottom:20px;text-align:left;">
                <strong>Cover Sheet</strong><br />
				The cover sheet includes the general notes and building code information, design standards and structural materials specifications required to construct your home.  <a class="planSpecNoWrap" href="/assets/pdf/CornerStoneDesignsCoverSheet.pdf" target="_blank">Select here to view a Cover Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
				<strong>Schedule Sheet</strong><br />
				The schedule sheet includes the window, roof and foundation ventilation schedules, insulation and vapor barrier specifications, and exhaust fan ventilation schedule.  <a class="planSpecNoWrap" href="/assets/pdf/CornerStoneDesignsScheduleSheet.pdf" target="_blank">Select here to view a Schedule Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
				<strong>Detail Sheet</strong><br />
				The detail sheet shows building components at large scale as required to explain construction of footings, foundation walls, concrete slabs, framed floors and walls, posts, beams, insulation, eaves, roofs, vents, stairs, skylights, and connections.  <a class="planSpecNoWrap" href="/assets/pdf/CornerStoneDesignsDetailSheet.pdf" target="_blank">Select here to view a Detail Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
				<strong>Foundation Plan Sheet</strong><br />
				The foundation plan sheet shows the layout of the crawl space, walk-out basement or slab foundation.   The foundation plan includes all necessary notes, dimensions, concrete walls, footing pads, posts, beams, bearing walls, crawlspace vents, footing schedule, steel reinforcing, and structural information.  If you require a different foundation type, please contact us for modifications to your plan.  <a class="planSpecNoWrap" href="/assets/pdf/CornerStoneDesignsFoundationPlanSheet.pdf" target="_blank">Select here to view a Foundation Plan Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
				<strong>Floor Plan Sheet</strong><br />
				Floor plans are horizontal cuts through each floor level of the home, usually at 5' above the floor.  The floor plan shows the location of interior and exterior walls, doors, windows, stairs, closets, cabinets, flooring, appliances, plumbing fixtures, fireplaces, posts and beams.  Floor plans also indicate vaulted, coffered, or box beam ceilings, cased openings and areas with ceiling soffits.  <a class="planSpecNoWrap" href="/assets/pdf/CornerStoneDesignsFloorPlanSheet.pdf" target="_blank">Select here to view a Floor Plan Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
				<strong>Roof Framing Plan Sheet</strong><br />
				The roof framing plan shows the geometry of the hips, ridges, valleys, dormers, roof pitches, wall and plate heights, and overhangs.  The plan also shows all individual roof framing members, trusses, rafters, beams, skylights, roof vents, gutters, downspouts, skylights, bearing walls under framing members, and point loads.  <a class="planSpecNoWrap" href="/assets/pdf/CornerStoneDesignsRoofFramingPlanSheet.pdf" target="_blank">Select here to view a Roof Framing Plan Sheet</a>.
                </div>
                <div style="margin-bottom:20px;text-align:left;">
<strong>Elevation Sheet</strong><br />
Exterior elevations show all four sides of the house, describing the roofing, siding, and trim materials, doors, windows, roof pitches, skylights, gutters, chimneys, wall heights, finish grade and overall building height.  <a class="planSpecNoWrap" href="/assets/pdf/CornerStoneDesignsElevationSheet.pdf" target="_blank">Select here to view an Elevation Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
				<strong>Building Section Sheet</strong><br />
				Building sections are vertical cuts through the house from the roof to the foundation.  The sections illustrate the construction sequence from bottom to top starting with excavation, proceeding up through the foundation, drainage, wall and floor framing, stair framing, roof framing, windows, doors, venting, and exterior and interior finishes.  Wall plate heights for each floor are also delineated.  <a class="planSpecNoWrap" href="/assets/pdf/CornerStoneDesignsBuildingSectionSheet.pdf" target="_blank">Select here to view a Building Section Sheet</a>.
                </div>
                <cfelse>
                <div style="margin-bottom:20px;text-align:left;">
					<strong>Cover Sheet</strong><br />
					The cover sheet includes the general notes and building code information, design standards and structural materials specifications required to construct your home.  
                    <a class="planSpecNoWrap" href="/assets/pdf/ANWCoverSheet.pdf" target="_blank">Select here to view a Cover Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
					<strong>Schedule Sheet</strong><br />
					The schedule sheet includes the window, roof and foundation ventilation schedules, insulation and vapor barrier specifications, exhaust fan ventilation schedule, and Washington State Energy Code compliance.  <a class="planSpecNoWrap" href="/assets/pdf/ANWScheduleSheet.pdf" target="_blank">Select here to view a Schedule Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
					<strong>Detail Sheet</strong><br />
					The detail sheet shows building components at large scale as required to explain construction of footings, foundation walls, concrete slabs, framed floors and walls, posts, beams, insulation, eaves, roofs, vents, stairs, skylights, and connections.  <a class="planSpecNoWrap" href="/assets/pdf/ANWDetailSheet.pdf" target="_blank">Select here to view a Detail Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
					<strong>Foundation Plan Sheet</strong><br />
					The foundation plan sheet shows the layout of the crawl space, walk-out basement or slab foundation.   The foundation plan includes all necessary notes, dimensions, concrete walls, footing pads, posts, beams, bearing walls, crawlspace vents, footing schedule, steel reinforcing, and structural information.  If you require a different foundation type, please contact us for modifications to your plan.  <a class="planSpecNoWrap" href="/assets/pdf/ANWFoundationPlanSheet.pdf" target="_blank">Select here to view a Foundation Plan Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
					<strong>Floor Plan Sheet</strong><br />
					Floor plans are horizontal cuts through each floor level of the home, usually at 5&#39; above the floor.  The floor plan shows the location of interior and exterior walls, doors, windows, stairs, closets, cabinets, flooring, appliances, plumbing fixtures, fireplaces, posts and beams.  Floor plans also indicate vaulted, coffered, or box beam ceilings, cased openings and areas with ceiling soffits.  <a class="planSpecNoWrap" href="/assets/pdf/ANWFloorPlanSheet.pdf" target="_blank">Select here to view a Floor Plan Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
					<strong>Roof Framing Plan Sheet</strong><br />
					The roof framing plan shows the geometry of the hips, ridges, valleys, dormers, roof pitches, wall and plate heights, and overhangs.  The plan also shows all individual roof framing members, trusses, rafters, beams, skylights, roof vents, gutters, downspouts, skylights, bearing walls under framing members, and point loads.  Select here to view a <a class="planSpecNoWrap" href="/assets/pdf/ANWRoofFramingSheet.pdf" target="_blank">Roof Framing Plan Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
					<strong>Elevation Sheet</strong><br />
					Exterior elevations show all four sides of the house, describing the roofing, siding, and trim materials, doors, windows, roof pitches, skylights, gutters, chimneys, wall heights, finish grade and overall building height.  <a class="planSpecNoWrap" href="/assets/pdf/ANWElevationSheet.pdf" target="_blank">Select here to view an Elevation Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
					<strong>Building Section Sheet</strong><br />
					Building sections are vertical cuts through the house from the roof to the foundation.  The sections illustrate the construction sequence from bottom to top starting with excavation, proceeding up through the foundation, drainage, wall and floor framing, stair framing, roof framing, windows, doors, venting, and exterior and interior finishes.  Wall plate heights for each floor are also delineated.  <a class="planSpecNoWrap" href="/assets/pdf/ANWBuildingSectionSheet.pdf" target="_blank">Select here to view a Building Section Sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
					<strong>Beam Calculations</strong><br />
					Beam calculations typically include floor beams, roof beams, window and door header sizes, and whether they are nominal, glue lam, or laminated veneer lumber.  <a class="planSpecNoWrap" href="/assets/pdf/ANWBeamCalculationCoverSheet.pdf" target="_blank">Select here to view a Beam Calculation cover sheet</a>.
				</div>
                <div style="margin-bottom:20px;text-align:left;">
					<strong>Lateral Engineering</strong><br />
					Typical PE-stamped lateral engineering calculations for wind and seismic in Washington State.  Additional engineering may be required and is not included in the price such as: retaining walls and basement foundations, pilings and shoring, and steel structural items (beams, columns, and moment frames).
				</div>
                </cfif>
            </div>
            
            <cfinclude template="../assets/includes/commonRightSideBar.cfm">
        </div>
    </cfmodule>