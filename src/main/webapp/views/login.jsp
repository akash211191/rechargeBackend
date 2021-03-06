<html>
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Recharge Software</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">            
	  <link href="/css/bootstrap.min.css" rel="stylesheet">
      <script type="text/javascript" src="/js/jquery.min.js"></script>
      <link href="/css/style.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
      <script src = "/js/bootstrap.bundle.min.js" type = "text/javascript"></script>
      <script src = "/js/bootstrap.min.js" type = "text/javascript"></script>
      <link href="/css/jquery.dataTables.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <script src="/js/jquery.dataTables.min.js" type="text/javascript"></script>	
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>	
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
    </head>
    <style>
    .jconfirm .jconfirm-box{
    padding:0px;
    }
    .jconfirm-title-c{
    	background-color:#2980b9;
    	padding:8px;
    	font-size:16px !important;
    	line-height:14px !important;
    	color:white;
    	font-weight:bold;
    	
    }
    .jconfirm-content{
    padding:10px;
    }
    </style>
    <body>
     <div class="container" style = "margin-top:100px">
            <!-- Codrops top bar -->
            <div class="codrops-top">
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->           
            <section>	
                <div id="container_demo" >
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form   autocomplete="off"> 
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Username </label>
                                    <input id="user_mobile" name="usermobile" required="required" type="text" placeholder="Enter Mobile No as Username" autocomplete = "off" />
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Password </label>
                                    <input id="user_password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" autocomplete = "off" /> 
                                </p>
                                <p class="login button"> 
                                    <input type="button"  id = "validateLogin" value="Login" /> 
								</p>
								<p>
									<span id ="validationError"></span>
								</p>
                                <!-- <p class="change_link">
									Not a member yet ?
									<a href="register">Join us</a>
								</p> -->
                            </form>
                        </div>                
                    </div>
                </div>  
            </section>              
        </div>
    </body>
    <script>
	$(document).ready(function() {	
	//start of login form validate
	 $("#otpModal").show();
	 $("#validateLogin").click(function (event) {
		 if( $("#user_mobile").val() == "" || $("#user_password").val() == ""){
				$("#validationError").html("User Name or Password is blank ").css("color", "red");
				} 
				else {
					var formData = {
							  userMobile:$("#user_mobile").val(),
						      userPassword:$("#user_password").val()
						    };
							var requestJSON = JSON.stringify(formData);
							console.log(requestJSON);
						    $.ajax({
						      type: "POST",
						      url: "http://localhost:8081/validateLogin",
						      headers: {
						    	  "Content-Type" : "application/json"
						      },
						      data: requestJSON,
						      encode: true,
						    }).done(function (data) {
						      console.log(data);		      
						      
						      if(data == ""){
						    	  $("#validationError").html("Invalid Login Credentials").css("color","red");	
							      }
						      else{
							      var keyvariable;
							      var keyData;
							      var roleName;
						    	  for( var keyVar in data) {
							    	  keyVariable = data[keyVar];
							    	  console.log(keyVariable);
							    	 	  for (keyData in keyVariable)
							    	 		 roleName = keyVariable[3];
								        }
							      if(roleName == "Admin"){
								      console.log("login to admin dashboard");
								      $.confirm({
								   	    title: 'Admin Pin',
								   	    content: '' +
								   	    '<form action="" class="formName">' +
								   	    '<div class="form-group">' +
								   	    '<label>Pin</label>' +
								   	    '<input type="text" id = "user_pin" placeholder="Enter Pin" class="user_pin form-control" autocomplete = "off" required />' +
								   	    '</div>' +
								   	    '</form>',
								   	    buttons: {
								   	        formSubmit: {
								   	            text: 'Submit',
								   	            btnClass: 'btn-blue',
								   	            action: function () {
								   	               var pin = this.$content.find('.user_pin').val();
								   	               var userMobile = $("#user_mobile").val();
								   	           		if(!pin){
							   	                    $.alert('Pin cannot be blank');
							   	                    return false;
							   	                	}
								   	          	    $.get("http://localhost:8081/userApi/getAdminPin/"+userMobile, function(data, status){
								     	      		var adminPin = data;
								     	      		if(pin != adminPin){
								   	                	$.alert('Invalid Pin');
								   	                    return false;
								   	 	                }	
								     	      		else{
								     	      			window.location.href="http://localhost:8081/Recharge/dashBoardAdmin";
									     	      		}
								     	       		 });
								   	               								   	            }
								   	        },
								   	        cancel: function () {
								   	            //close
								   	        },
								   	    },
								   	    onContentReady: function () {
								   	        // bind to events
								   	        var jc = this;
								   	        this.$content.find('form').on('submit', function (e) {
								   	            // if the user submits the form by pressing enter in the field.
								   	            e.preventDefault();
								   	            jc.$$formSubmit.trigger('click'); // reference the button and click it
								   	        });
								   	    }
								   	});
								      
								      } 
							      if(roleName == "Distributor" || roleName == "Master Distributor"){
								      console.log("login to admin dashboard");
								      window.location.href="http://localhost:8081/Recharge/dashBoardDistributor";
								      }   
							      if(roleName == "Retailer") {
										console.log("login to home");
										window.location.href="http://localhost:8081/Recharge/homeRetailer";
									   }
						      }
						      });
						    event.preventDefault();
					}	 
		  });
	//end of user form submit
	});
	</script >
</html>