/**
 * 
 */

$(function() {
	$(".prj").dblclick(function() {
		/*
		 * $.ajax({ url : 'goMain', type : 'GET', data : { 'project_id' :
		 * this.id }, success : function(result) { console.log(result);
		 * alert(result); location.href("main?project_id="+this.id); }
		 */
		//location.href("goMain?project_id=" );
		location.href="goMain?project_id="+this.id;

	});
	$(".join").click(function(){
		location.href="goMain?project_id=" + $(this).parent().attr('id');
	});
	$("#projectButton").click(function(){
		
	});
	$("#goCommunity").click(function(){
		location.href ="goPost";
	});
	$("#mypageButton").click(function(){
		
	});
});
