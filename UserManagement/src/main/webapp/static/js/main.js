$(".btn-danger").click(function (e) {
	if (confirm('Are u Sure?')) {
		
		e.preventDefault();
	    var url=$(this).attr('title');
	    console.log($(this).attr('title'));
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
	    alert('You refused to delete.');
	}
    
    
});


$('#form1').validate({

    submitHandler: function(form) {
        $.ajax({
            url: "/user/signUp",
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