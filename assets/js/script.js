<!--

function newImage(arg) {
	if (document.images) {
		rslt = new Image();
		rslt.src = arg;
		return rslt;
	}
}

function changeImages() {
	if (document.images && (preloadFlag == true)) {
		for (var i=0; i<changeImages.arguments.length; i+=2) {
			document[changeImages.arguments[i]].src = changeImages.arguments[i+1];
		}
	}
}

var preloadFlag = false;
function preloadImages() {
	if (document.images) {
		home_over = newImage("/shellimages/home-over.gif");
		newplans_over = newImage("/shellimages/newplans-over.gif");
		searchplans_over = newImage("/shellimages/searchplans-over.gif");
		customdesign_over = newImage("/shellimages/customdesign-over.gif");
		platdesign_over = newImage("/shellimages/platdesign-over.gif");
		photogallery_over = newImage("/shellimages/photogallery-over.gif");
		awards_over = newImage("/shellimages/awards-over.gif");
		animations_over = newImage("/shellimages/animations-over.gif");
		events_over = newImage("/shellimages/events-over.gif");
		links_over = newImage("/shellimages/links-over.gif");
		faqs_over = newImage("/shellimages/faqs-over.gif");
		employment_over = newImage("/shellimages/employment-over.gif");
		map_over = newImage("/shellimages/map-over.gif");
		aboutus_over = newImage("/shellimages/aboutus-over.gif");
		contactus_over = newImage("/shellimages/contactus-over.gif");
		myaccount_over = newImage("/shellimages/myaccount-over.gif");
		myfavorites_over = newImage("/shellimages/myfavorites-over.gif");
		viewcart_over = newImage("/shellimages/viewcart-over.gif");
		checkout_over = newImage("/shellimages/checkout-over.gif");
		preloadFlag = true;
	}
}

function openWin( windowURL, windowName, windowFeatures ) { 
		return window.open( windowURL, windowName, windowFeatures ) ; 
	}


// -->