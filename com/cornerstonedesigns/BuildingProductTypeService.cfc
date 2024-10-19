<cfcomponent extends="BuildingProductTypeGateway">
	<cffunction name="getBuildingProductTypesSorted" access="public" roles="admin" returntype="query" hint="This method returns a query that contains sorted building product types">
    	<cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT  *
            FROM    BuildingProductType
            ORDER BY BuildingProductType ASC
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
</cfcomponent>