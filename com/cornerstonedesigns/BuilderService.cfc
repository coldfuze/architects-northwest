<cfcomponent extends="BuilderGateway">
	<cffunction name="getAllBuildersSorted" access="public" returntype="query" hint="This method returns a query of builders, sorted ascending by Builder">
    	<cfscript>
			VARIABLES.bi = Application.BuilderService.getAllAsQuery();
		</cfscript>
        
        <cfquery dbtype="query" name="gi">
        	SELECT 	*
            FROM 	VARIABLES.bi
            ORDER BY Builder
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
</cfcomponent>