<cfcomponent extends="ProfessionalAssociationGateway">
	<cffunction name="getProfessionalAssociations" access="public" returntype="query" hint="This method returns Professional Associations sorted by Professional Association Type and Professional Association">
    	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT 	a.ProfessionalAssociation,
            		a.Website,
                    b.ProfessionalAssociationType
            FROM 	ProfessionalAssociation a
            		INNER JOIN ProfessionalAssociationType b ON a.ProfessionalAssociationTypeId = b.ProfessionalAssociationTypeId
            ORDER BY b.ProfessionalAssociationType, a.ProfessionalAssociation
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getProfessionalAssociationPicklist" access="public" roles="admin" returntype="query" hint="This method returns professional associations sorted by company for use in a picklist">
    	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT 	a.ProfessionalAssociationId,
            		a.ProfessionalAssociation
            FROM 	ProfessionalAssociation a
            ORDER BY a.ProfessionalAssociation
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
</cfcomponent>