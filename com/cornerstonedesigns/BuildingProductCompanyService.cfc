<cfcomponent extends="BuildingProductCompanyGateway">
	<cffunction name="getBuildingProductCompanies" access="public" returntype="query" hint="This method returns Building Product Companies sorted by Building Product Type and Company Name">
    	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT 	a.BuildingProductCompany,
            		a.Website,
                    b.BuildingProductType
            FROM 	BuildingProductCompany a
            		INNER JOIN BuildingProductType b ON a.BuildingProductTypeId = b.BuildingProductTypeId
            ORDER BY b.BuildingProductType, a.BuildingProductCompany
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getBuildingProductCompanyPicklist" access="public" roles="admin" returntype="query" hint="This method returns a building product companies sorted by company for use in a picklist">
    	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT 	a.BuildingProductCompanyId,
            		a.BuildingProductCompany
            FROM 	BuildingProductCompany a
            ORDER BY a.BuildingProductCompany
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
</cfcomponent>