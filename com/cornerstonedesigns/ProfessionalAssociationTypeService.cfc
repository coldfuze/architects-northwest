<cfcomponent extends="ProfessionalAssociationTypeGateway">
	<cffunction name="getProfessionalAssociationTypesSorted" access="public" roles="admin" returntype="query" hint="This method returns a query that contains sorted professional association types">
    	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT  *
            FROM    ProfessionalAssociationType
            ORDER BY ProfessionalAssociationType ASC
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
</cfcomponent>