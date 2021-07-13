
function deleteUser(e) {
	
  if (confirm('Are u Sure?')) {
		
	    var url=$(this).attr('href');
	    console.log(url);
	    $.ajax({
	        url: url,
	        type: "GET",
	        success: function (result) {
	            alert("User Deleted");
	            window.location.href = "/user";
	        },
	        error: function (result) {
	            alert("an error has occurred.");
	        } 
	    });
	} else {
		e.preventDefault();
	    alert('You refused to delete.');
	}
}


$("#create").click(function (e) {
        
        e.preventDefault();
if($('#form1').isValid){
	
	
	$.ajax({
            url: "user/signUp",
            type: "POST",
            data: $(form).serialize(),
            success: function (result) {
                alert("User Created");
                window.location.href = "/user";
            },
            error: function (result) {
                alert("an error has occurred.");
            }            
        });
	
	
}
        


    });




