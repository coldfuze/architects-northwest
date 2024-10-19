<cfcomponent extends="DesignerGateway">
	<cffunction name="getDesigners" access="public" returntype="query" hint="This method returns a list of designers that are associated with one or more plans" >
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT DISTINCT Designer, a.DesignerId
  			FROM Designer a
  			INNER JOIN [Plan] b ON a.DesignerId = b.DesignerId
        </cfquery>
        
        <cfreturn gi>
    </cffunction>
    
    <cffunction name="getDesignerInfo" access="public" returntype="string" hint="This method returns the designer's name when a DesignerId is passed">
    	<cfargument name="DesignerId" type="numeric" required="yes" hint="This argument expects a numeric DesignerId">
        
    	<cfquery datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#" name="gi">
        	SELECT Designer
  			FROM Designer
  			WHERE DesignerId = <cfqueryparam cfsqltype="cf_sql_tinyint" value="#ARGUMENTS.DesignerId#">
        </cfquery>
        
        <cfreturn gi.Designer>
    </cffunction>
</cfcomponent>