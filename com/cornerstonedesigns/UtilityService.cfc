<cfcomponent>
	<cffunction name="getGreeting" access="public" returntype="string" hint="This method returns a greeting based on time of day">
    	<cfscript>	
			if (Hour(Now()) LT 12) {
				VARIABLES.greeting = "Good Morning";	
			}
			if (Hour(Now()) GTE 12 AND Hour(Now()) LT 18) {
				VARIABLES.greeting = "Good Afternoon";
			}
			if (Hour(Now()) GTE 18) {
				VARIABLES.greeting = "Good Evening";	
			}
		</cfscript>
        
        <cfreturn VARIABLES.greeting>
    </cffunction>
</cfcomponent>