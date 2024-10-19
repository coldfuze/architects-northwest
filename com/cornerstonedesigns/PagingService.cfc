<cfcomponent>
	<cffunction name="generatePaging" access="public" hint="This method generates a paging display for a given recordset" returntype="struct">
		<cfargument name="pi" type="struct" hint="This argument expects a structure containing paging data">
		
        <cfscript>
			// Calculate the total number of pages
			VARIABLES.TotalPages = Ceiling(pi.totalrecords/pi.recordsPerPage);
			VARIABLES.PreviousPage = pi.currentPage - 1;
			VARIABLES.NextPage = pi.currentPage + 1;
		</cfscript>
        
        <cfif VARIABLES.TotalPages EQ 1>
        	<cfsavecontent variable="paging">
            	<u>1</u>
            </cfsavecontent>
        <cfelse>
        	<cfscript>
				// Determine the start and end page to display in the paging
				VARIABLES.EndPage = pi.currentPage + (pi.linksPerPage - 1);
				
				if (VARIABLES.EndPage GT VARIABLES.TotalPages) {
					VARIABLES.EndPage = VARIABLES.TotalPages;
				}
				
				VARIABLES.StartPage = VARIABLES.EndPage - (pi.linksPerPage - 1);
				
				if (VARIABLES.StartPage LT 1) {
					VARIABLES.StartPage = 1;
				}
			</cfscript>
            <cfsavecontent variable="paging">
                <cfif pi.currentpage NEQ 1>
					<cfoutput>
                    	<a class="#pi.pnCssClass#"  href="#CGI.SCRIPT_NAME#?page=1" title="Go to first group of records"><img src="/assets/images/firstArrow.gif" width="12" height="11" alt="Go to the first page" border="0"></a>
                    	<a class="#pi.pnCssClass#" href="#CGI.SCRIPT_NAME#?page=#VARIABLES.PreviousPage#" title="Go to previous group of records"><img src="/assets/images/previousArrow.gif" style="padding-top:6px;" width="10" height="11" alt="Go to the previous page" border="0"></a>
                    </cfoutput>
                </cfif>
                <cfloop from="#VARIABLES.StartPage#" to="#VARIABLES.EndPage#" step=1 index="i">
                	<cfif i GT VARIABLES.TotalPages><cfbreak></cfif>
                	<cfoutput><cfif i EQ pi.currentPage><u>#i#</u><cfelse><a class="paging" href="#CGI.SCRIPT_NAME#?page=#i#">#i#</a></cfif></cfoutput>
                </cfloop>
                <cfif pi.currentPage NEQ VARIABLES.TotalPages>
					<cfif VARIABLES.TotalPages GT pi.currentPage>
                        <cfoutput>
                        	<a class="#pi.pnCssClass#" href="#CGI.SCRIPT_NAME#?page=#VARIABLES.NextPage#" title="Go to next group of records"><img src="/assets/images/nextArrow.gif" style="padding-top:6px;" width="10" height="11" alt="Go to the next page" border="0"></a>
                        	<a class="#pi.pnCssClass#" href="#CGI.SCRIPT_NAME#?page=#VARIABLES.TotalPages#" title="Go to last group of records"><img src="/assets/images/lastArrow.gif" style="padding-top:6px;" width="12" height="11" alt="Go to the last page" border="0"></a>
                        </cfoutput>
                    </cfif>
                </cfif>
            </cfsavecontent>
        </cfif>
        
        <cfscript>
			pi = StructNew();
			pi.paging = paging;
			pi.TotalPages = VARIABLES.TotalPages;
		</cfscript>
        
		<cfreturn pi>
	</cffunction>
</cfcomponent>