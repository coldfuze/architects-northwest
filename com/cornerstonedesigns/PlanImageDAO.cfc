<cfcomponent output="false">
	<cffunction name="read" output="false" access="public" returntype="com.cornerstonedesigns.PlanImage">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="#Application.DSN#" username="#Application.LimitedUser#" password="#Application.LimitedPassword#">
			select 	ImageId, PlanId, ImageFile, Caption, displayInGallery, isPlanThumbnail, 
					isGalleryThumbnail, DisplayOrder
			from dbo.PlanImage
			where ImageId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "com.cornerstonedesigns.PlanImage").init();
			obj.setImageId(qRead.ImageId);
			obj.setPlanId(qRead.PlanId);
			obj.setImageFile(qRead.ImageFile);
			obj.setCaption(qRead.Caption);
			obj.setdisplayInGallery(qRead.displayInGallery);
			obj.setisPlanThumbnail(qRead.isPlanThumbnail);
			obj.setisGalleryThumbnail(qRead.isGalleryThumbnail);
			obj.setDisplayOrder(qRead.DisplayOrder);
			return obj;
		</cfscript>
	</cffunction>

	<cffunction name="create" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanImage">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getPlanId()>
		<cfset var local2=arguments.bean.getImageFile()>
		<cfset var local3=arguments.bean.getCaption()>
		<cfset var local4=arguments.bean.getdisplayInGallery()>
		<cfset var local5=arguments.bean.getisPlanThumbnail()>
		<cfset var local6=arguments.bean.getisGalleryThumbnail()>
		<cfset var local7=arguments.bean.getDisplayOrder()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="getId">
				insert into dbo.PlanImage(PlanId, ImageFile, Caption, displayInGallery, isPlanThumbnail, isGalleryThumbnail, DisplayOrder)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_BIT" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_BIT" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_BIT" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_TINYINT" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setImageId(getID.IDENTITYCOL);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="update" output="false" access="public" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanImage">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			update dbo.PlanImage
			set PlanId = <cfqueryparam value="#arguments.bean.getPlanId()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getPlanId() eq ""), de("yes"), de("no"))#" />,
				ImageFile = <cfqueryparam value="#arguments.bean.getImageFile()#" cfsqltype="CF_SQL_VARCHAR" />,
				Caption = <cfqueryparam value="#arguments.bean.getCaption()#" cfsqltype="CF_SQL_VARCHAR" />,
				displayInGallery = <cfqueryparam value="#arguments.bean.getdisplayInGallery()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getdisplayInGallery() eq ""), de("yes"), de("no"))#" />,
				isPlanThumbnail = <cfqueryparam value="#arguments.bean.getisPlanThumbnail()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getisPlanThumbnail() eq ""), de("yes"), de("no"))#" />,
				isGalleryThumbnail = <cfqueryparam value="#arguments.bean.getisGalleryThumbnail()#" cfsqltype="CF_SQL_BIT" null="#iif((arguments.bean.getisGalleryThumbnail() eq ""), de("yes"), de("no"))#" />,
				DisplayOrder = <cfqueryparam value="#arguments.bean.getDisplayOrder()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getDisplayOrder() eq ""), de("yes"), de("no"))#" />
			where ImageId = <cfqueryparam value="#arguments.bean.getImageId()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="void" roles="admin">
		<cfargument name="bean" required="true" type="com.cornerstonedesigns.PlanImage">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="#Application.DSN#" username="#Application.UserName#" password="#Application.Password#" result="status">
			delete
			from dbo.PlanImage
			where ImageId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getImageId()#" />
		</cfquery>

	</cffunction>
</cfcomponent>