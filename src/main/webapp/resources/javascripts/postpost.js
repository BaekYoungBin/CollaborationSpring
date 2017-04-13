/**
 * 
 */

$(function(){
	
	var user_id = ${user_id};
	var puser_id = ${post.user_id};
	alert(user_id + puser_id);

	if(user_id == puser_id){
		$("#insertButton").css("visibility","visible");
		$("#deleteButton").css("visibility","visible");
	}	
	
	$("#insertButton").click(function(){
		alert("수정");
	});
	$("#deleteButton").click(function(){
		alert("삭제");
	});
});