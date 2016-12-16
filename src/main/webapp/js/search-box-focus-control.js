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
});