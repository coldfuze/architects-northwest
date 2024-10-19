<cfcomponent extends="InfoRequestTypeGateway">
	<cffunction name="getInfoRequestType" access="public" returntype="string" hint="This method returns the InfoRequestType that corresponds to numeric InfoRequestTypeId">
    	<cfargument name="Id" required="yes" type="numeric" hint="This argument expects a numeric InfoRequestTypeId">
        
        <cfscript>
			VARIABLES.irt = Application.InfoRequestTypeService.getById(Id);
		</cfscript>
        
        <cfreturn VARIABLES.irt.InfoRequestType>
    </cffunction>
</cfcomponent>