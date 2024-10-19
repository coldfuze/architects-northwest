/* Quick Search JavaScript Document
Created by Leon O'Daniel - O'Daniel Designs
Created on December 21, 2022 */

$(document).ready(function () {
	getQuickSearchResults();
	
	$("#qsPlanTypeId").change(function() {
		getQuickSearchResults();
	});
	
	$("#qsSquareFootageLow").change(function () {
		getQuickSearchResults();
	});
	
	$("#qsSquareFootageHigh").change(function () {
		getQuickSearchResults();
	});
	
	$("#qsBedrooms").change(function () {
		getQuickSearchResults();
	});
	
	$("#qsBathrooms").change(function () {
		getQuickSearchResults();
	});
	
	function getQuickSearchResults() {
		$.post('/quicksearchplans.cfm',$("#sbps").serialize(),function(data){
			$("#qsPlanCount").html(data);
		});
	}
});