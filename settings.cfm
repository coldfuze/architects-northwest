<cfscript>
	// Local machine or a machine on local network
	if ((CGI.REMOTE_ADDR IS "127.0.0.1") OR (CGI.REMOTE_ADDR CONTAINS "192.168") OR CGI.REMOTE_ADDR IS "::1") {
		Application.StartPath = "/";
	// Production machine
	} else {
		Application.StartPath = "/";
	}
	
	if (CGI.HTTP_HOST CONTAINS "cornerstone") {
		Application.BasePath = "http://www.cornerstonedesigns.com";
		Application.AltBasePath = "http://www.cornerstonedesigns.com";
	}
	else {
		Application.BasePath = "http://www.architectsnw.com";
		Application.AltBasePath = "http://www.architectsnw.com";
	}
	Application.CTPath = Application.StartPath & 'assets/customtags/';
	Application.ImagePath = Application.StartPath & 'assets/images';
	Application.CSSPath = Application.StartPath & 'assets/css/';
	Application.JSPath = Application.StartPath & 'assets/js/';
	Application.SWFPath = Application.StartPath & 'assets/swf/';
	Application.PDFPath = Application.StartPath & 'assets/pdf/';
	
	Application.DSN = "cornerstone";
	Application.UserName = "cornerstoneRW";
	Application.Password = "!~K0RNer8721^";
	Application.LimitedUser = "cornerstoneLimited";
	Application.LimitedPassword = "tx*71-fQR$";
	Application.SiteManagementPath = Application.BasePath & '/sitemanagement';
	
	// CF ProFlshUpload Path
	Application.ProFlashUploadPath = Application.SiteManagementPath & '/dccom/components/proflashupload/uploadfile.cfm';
	
	// Set the Google Maps API Key
	if (CGI.HTTP_HOST CONTAINS "Cornerstone") {
		Application.GoogleMapKey = "ABQIAAAAeFNZ-VAFD84csyKRjnQGOxTHA8fRyC1PaesYAL3Fyv3-B0rh_xRI_B0TBQ87e8QDNJW0NEAtApFHGQ";
	}
	else {
		Application.GoogleMapKey =  "ABQIAAAAeFNZ-VAFD84csyKRjnQGOxTOfyosjKz9OlAP-yqg4DpEHxfx8xRBHY-PQGW-YzGKzZcQ_i-Q4-0RdQ";
	}
	
	// Authorize.net Information
		Application.Gateway = "https://secure.authorize.net/gateway/transact.dll";
		Application.TestGateway = "https://certification.authorize.net/gateway/transact.dll";
		Application.Tran_Key = "";	
		Application.APILoginId = "";
		Application.DuplicateWindow = "120"; // value in seconds to not allow duplicate transactions
</cfscript>
     
<!--- Turn on or off debugging --->
	<cfsetting showdebugoutput="no">