/**
 * 
 */
function doLike(postId, userId,temp)
{
	// Disable the button to prevent multiple clicks
	    $(temp).prop('disabled', true);
	
	const dataObj = {
		uid:userId,
		pid:postId,
		operation:'like'
	}
	$.ajax({
		url:"LikeServlet",
		data:dataObj,
		success:function(data,textStatus, jqXHR){
			
			if(data.trim()=="true")
				{
					$('.like-btn').removeClass('fa fa-thumbs-o-up');
					$('.like-btn').addClass('fa fa-thumbs-up');
					let count = $('.like-counter').html();
					
		
					count++;
					$('.like-counter').html(count);
				}
				else {
				                // If the like action fails, re-enable the button
				                $(temp).prop('disabled', false);
				            }
		},
		error:function(jqXHR,textStatus,errorThrown){
			console.log("Error occured");
			$(temp).prop('disabled', false);
		}
		
	})
}