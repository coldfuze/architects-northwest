<cfcomponent extends="WashingtonStateZipCodeGateway">
	<cffunction name="isWashingtonStateZipCode" access="public" returntype="boolean" hint="This method determines if a zip code is, or is not from Washington State">
    	<cfargument name="ZipCode" type="string" required="yes" hint="This arguments expects a US Zip Code">
        
        <cfquery datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" name="gi">
        	SELECT 	City
            FROM	WashingtonStateZipCode
            WHERE 	ZipCode = <cfqueryparam cfsqltype="cf_sql_varchar" maxlength="5" value="#ARGUMENTS.ZipCode#">
        </cfquery>
        
        <cfscript>
			if (gi.recordCount EQ 1) {
				VARIABLES.isWashingtonStateZipCode = 'true';
			}
			else {
				VARIABLES.isWashingtonStateZipCode = 'false';	
			}
		</cfscript>
        
        <cfreturn VARIABLES.isWashingtonStateZipCode>
    </cffunction>
</cfcomponent>