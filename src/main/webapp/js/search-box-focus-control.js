$(function() {
	$("#searchInput").focus(function(){
		if($("#searchInput").val() == "More than 3 million books are available") {
			$("#searchInput").val("");
		}
		$("#searchInput").css("color", "black");	
	});
	
	$("#searchInput").blur(function(){
		if($("#searchInput").val() == "") {
			$("#searchInput").val("More than 3 million books are available");
			$("#searchInput").css("color", "rgb(180,180,180)");
		}
	});
	
	
	$("#searchInput_2").focus(function(){
		if($("#searchInput_2").val() == "More than 3 million books are available") {
			$("#searchInput_2").val("");
		}
		$("#searchInput_2").css("color", "black");	
	});
	
	$("#searchInput_2").blur(function(){
		if($("#searchInput_2").val() == "") {
			$("#searchInput_2").val("More than 3 million books are available");
			$("#searchInput_2").css("color", "rgb(180,180,180)");
		}
	});
});