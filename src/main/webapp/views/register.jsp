<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Recharge Software</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">            
        <link rel = 'stylesheet' type="text/css" href='/css/style.css' />
		<link rel = 'stylesheet' type="text/css" href='/css/animate-custom.css'/>
		<script src = '/js/bootstrap.js' type = 'javascript'></script>
		<script  type="text/javascript" src="/js/jquery.min.js"></script>	
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">	
    </head>
    <body>
     <div class="container" style = "margin-top:20px">
            <!-- Codrops top bar -->
            <div class="codrops-top">
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->           
            <section>	
                <div id="container_demo" >
                    <div id="wrapper">
                        <div id="register">
                            <form  action="mysuperscript.php" autocomplete="on"> 
                                <h1> Sign up </h1> 
                                <p> 
                                    <label for="user_first_name" class="uname" data-icon="u">First Name</label>
                                    <input id="user_name" name="user_first_name" required="required" type="text" placeholder="Enter first name" />
                                </p>
                                <p> 
                                    <label for="user_name" class="uname" data-icon="u">Last Name</label>
                                    <input id="user_last_name" name="last_name" required="required" type="text" placeholder="Enter last name" />
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > E-mail</label>
                                    <input id="user_email" name="emailsignup" required="required" type="email" placeholder="Enter email"/> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="mobile" data-icon="p">Mobile No</label>
                                    <input id="user_mobile" name="passwordsignup" required="required" type="text" placeholder="Enter mobile number "/>
                                </p>
                                <p> 
                                    <label for="address" class="address" >Address</label>
                                    <input  id="user_address" name="" required="required" type="text" placeholder="Address"></input>
                                </p>
                                <p class="signin button"> 
									<input id = "submitUser" type="button" value="Sign up"/> 
								</p>
								<p>
								<span id = "validationError"></span>
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="login"> Go and log in </a>
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
    </body>
    <script>
	$(document).ready(function() {
	//start of user form submit
	 $("#submitUser").click(function (event) {
			if( $("#user_name").val() == "" || $("#user_email").val() == "" || $("#user_mobile").val() == "" || $("#user_address").val() == ""){
				$("#validationError").html("All Fields Are Compulsory").css("color", "red");
				} 
				else {
					 var formData = {
						      userName: $("#user_name").val(),
						      userLastName: $("#user_last_name").val(),
						      userEmail: $("#user_email").val(),
						      userMobile:$("#user_mobile").val(),
						      userAddress:$("#user_address").val()
						    };
							var requestJSON = JSON.stringify(formData);
							console.log(requestJSON);
						    $.ajax({
						      type: "POST",
						      url: "http://localhost:8081/userApi/addUser",
						      headers: {
						    	  "Content-Type" : "application/json"
						      },
						      data: requestJSON,
						      encode: true,
						    }).done(function (data) {
						      console.log(data);
						      if (data == "Mobile Already Exists"){
						    	  $("#validationError").html(data).css("color", "red");
							  } else {
								  $("#validationError").html(data).css("color", "green");
							  }						      
						    });
						    event.preventDefault();
					}
		  });
	//end of user form submit
	});
	</script>
   </html>