/**
 * 
 */

$(function() {

	if ($("#post_in_userid").val() == $("#user_id").val()) {
		$("#modifyButton").css("visibility", "visible");
		$("#deleteButton").css("visibility", "visible");
	}
	else
		{
		$("#modifyButton").css("visibility", "hidden");
		$("#deleteButton").css("visibility", "hidden");
		}

	$("#modifyButton").click(function() {
		location.href = "postModify?post_id="+$("#post_id").val();
	});
	$("#deleteButton").click(function() {
		location.href ="deletePost?post_id="+$("#post_id").val();
	});
});