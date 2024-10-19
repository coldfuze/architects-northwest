/* Advanxced Plan Search JavaScript Document
Created by Leon O'Daniel - O'Daniel Designs
Created on December 21, 2022 */

$(document).ready(function () {
	getAdvancedSearchResults();
	
	$("#PlanTypeId").change(function() {
		getAdvancedSearchResults();
	});
	
	$("#SquareFootageLow").blur(function () {
		getAdvancedSearchResults();
	});
	
	$("#SquareFootageHigh").blur(function () {
		getAdvancedSearchResults();
	});
	
	$("#houseWidthLow").blur(function () {
		getAdvancedSearchResults();
	});
	
	$("#houseWidthHigh").blur(function () {
		getAdvancedSearchResults();
	});
	
	$("#houseDepthLow").blur(function () {
		getAdvancedSearchResults();
	});
	
	$("#houseDepthHigh").blur(function () {
		getAdvancedSearchResults();
	});
	
	$("#houseHeightLow").blur(function () {
		getAdvancedSearchResults();
	});
	
	$("#houseHeightHigh").blur(function () {
		getAdvancedSearchResults();
	});
	
	$("#BedroomId").change(function () {
		getAdvancedSearchResults();
	});
	
	$("#FullBathId").change(function () {
		getAdvancedSearchResults();
	});
	
	$("#CoveredPorchId").change(function() {
		getAdvancedSearchResults();
	});
	
	$("#GarageSizeId").change(function() {
		getAdvancedSearchResults();
	});
	
	$("#GarageDoorLocationId").change(function() {
		getAdvancedSearchResults();
	});
	
	$("#GarageTypeId").change(function() {
		getAdvancedSearchResults();
	});
	
	$("#bonusSpaceLocation").change(function() {
		getAdvancedSearchResults();
	});
	
	$("#LivingArrangementId").change(function() {
		getAdvancedSearchResults();
	});
	
	function getAdvancedSearchResults() {
		$.post('/plans/advancedPlanSearchCounter.cfm',$("#sbf").serialize(),function(data){
			$("#PlanCount").html(data);
		});
	}
});