<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/custom.css" rel="stylesheet">
	<script src = "/js/bootstrap.bundle.min.js" type = "text/javascript"></script>
	<script src = "/js/bootstrap.min.js" type = "text/javascript"></script>
    <title>Transactions</title>
  </head>
  <body>
    
		<nav class="navbar navbar-expand-lg navbar-dark">
         <div class="container">           
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarScroll">
               <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav" style="--bs-scroll-height: 100px;">
               <li class="nav-item">
                <a class="nav-link" href="dashBoardAdmin">Dashboard</a>
               </li>
                  <li class="nav-item dropdown">
                     <a class="nav-link" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Master
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="operators">Operators</a></li>
                        <li>
                           <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="smsapi">SMS Api</a></li>
                        <li>
                           <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">City</a></li>
                        <li>
                           <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="scheme">Scheme</a></li>
                        <li>
                           <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="rechargeApi">Recharge Api</a></li>
                     </ul>
                  </li>
                  <li class="nav-item dropdown">
                     <a class="nav-link active" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Settings
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="commission">Commission API</a></li>
                        <li>
                           <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="transaction">Transactions</a></li>
                     </ul>
                  </li>
                  <li class="nav-item dropdown">
                     <a class="nav-link" href="users" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Users
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="manageUser">Manage User</a></li>
                        <li>
                           <hr class="dropdown-divider">
                        </li>
                     </ul>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="#">Reports</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" href="#">Profile</a>			        
               </ul>
               <form class="d-flex">
                 <a id = "userBalanceDisplay" class="logoutButton"></a><div id = "sessionDiv" style = "display:none"><input type = "text" id = "userSessionId" value = "${sessionScope.userId}"></input></div>
               &nbsp;&nbsp;<a class="logoutButton">Logout</a>
               </form>
            </div>
         </div>
      </nav> 

<div class = "container" style = "margin-top:50px">
   <div class = "row">
      <div class = "col-md-12">
         <div class = "box_header">
         Transaction
         </div>
            <div class = "box_content">
               <form >                   
                  <div class="form-group">
                     <label for="exampleFormControlSelect2">User</label>
                    <select class="form-control" id="user_id">
                    	<option value = "" selected>Select Option</option>	
					    <c:forEach var="item" items="${userList}">
					        <option value="${item[0]}">${item[1]}</option>
					    </c:forEach>
					</select>
					<p = id = "userBalance"></p>					
                  </div>
                   <div class="form-group">
                     <label for="exampleInputPassword1">Amount</label>
                     <input type="text" class="form-control" id="user_amount" placeholder="" autocomplete = "off">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputPassword1">Pin</label>
                     <input type="text" class="form-control" id="user_transaction_pin" placeholder="" autocomplete = "off">
                  </div>
                  <div class="form-group">
                     <label for="exampleFormControlSelect1">Transaction Type</label>
                     <select class="form-control" id="transaction_type">
                     	<option value = "0" selected>Select Transaction Type</option>
                        <option value = "Debit">Debit</option>
                        <option value = "Credit">Credit</option>
                     </select>
                  </div>
                  <button id="sendTransaction" class="btn btn-primary">Submit</button>
                  <p style = "margin-top:10px"><span id ="validationError"></span></p>                  
               </form>
            </div>
      </div>
   </div>
</div>
</body>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script>
	$(document).ready(function() {
	//start of user form submit
	var sessionUserId = 12;
	var userBalance = 0;
      console.log(sessionUserId);         	  
      	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+sessionUserId, function(data, status){
      		$("#userBalanceDisplay").html(data+ " &#8377;");	
        });
	 $("#sendTransaction").click(function (event) {
			if( $("#user_id").val() == "" || $("#user_transaction_pin").val() == "" || $("#transaction_type").val() == "" || $("#user_amount").val() == ""){
				$("#validationError").html("All Fields Are Compulsory").css("color", "red");
				}
				else {					
					var userAmount =  $("#user_amount").val();
					var transactionType = $("#transaction_type").val();
					console.log(transactionType);
					var userName = $("#user_id option:selected").text()
					if(transactionType == "Debit")
						{
						 userAmount = -Math.abs(userAmount);
						}
					console.log(userAmount);					
					 var formData = {
						      userId: $("#user_id").val(),
						      userAmount: userAmount,
						      userPin:$("#user_transaction_pin").val(),
						      transactionType: transactionType,
						      sessionUserId: sessionUserId
						    };
							var requestJSON = JSON.stringify(formData);
							console.log(requestJSON);
						    $.ajax({
						      type: "POST",
						      url: "http://localhost:8081/transactionApi/transaction",
						      headers: {
						    	  "Content-Type" : "application/json"
						      },
						      data: requestJSON,
						      encode: true,
						    }).done(function (data) {
						      console.log(data);
						       if (data == "Transaction Done"){
						    	   var userId =  $("#user_id").val();
						    	   $.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
						    		   $("#validationError").html('<div class="alert alert-success"><strong>Transaction Done ! "'+userName+ '" balance is "'+data+'" &#8377;</strong></div>').show().delay(2000).fadeOut();
									});							       
						    	  $("#user_id").val("");
						    	  $("#userBalance").html("");
						    	  $("#user_amount").val("");
						    	  $("#user_transaction_pin").val("");
						    	  $("#select_transaction_type").val("");
						    	  setTimeout(function(){
						    		  window.location.reload();
						    		}, 2000);
						    	  
							  } else if(data == "Insufficient Balance"){
								  $("#validationError").html('<div class="alert alert-danger"><strong>Error! Insufficient Balance</strong></div>').show().delay(1500).fadeOut();		
									$("#user_id").val("");
							    	  $("#userBalance").html("");
							    	  $("#user_amount").val("");
							    	  $("#user_transaction_pin").val("");
							    	  $("#select_transaction_type").val(0);
								  }
							  else if(data == "Balance Cannot Be Negative"){
								  $("#validationError").html('<div class="alert alert-danger"><strong>Error! Balance Cannot Be Negative</strong></div>').show().delay(1500).fadeOut();		
									$("#user_id").val("");
							    	  $("#userBalance").html("");
							    	  $("#user_amount").val("");
							    	  $("#user_transaction_pin").val("");
							    	  $("#select_transaction_type").val(0);
								  }
								  else {
								$("#validationError").html('<div class="alert alert-danger"><strong>Error! Invalid Pin</strong></div>').show().delay(1500).fadeOut();		
								$("#user_id").val("");
						    	  $("#userBalance").html("");
						    	  $("#user_amount").val("");
						    	  $("#user_transaction_pin").val("");
						    	  $("#select_transaction_type").val(0);
								  }		 
						    });
						    event.preventDefault(); 
					} 		 
		   
		  });
	//end of user form submit
		$("#user_id").on('change',function(){
			var userId = $(this).val();
			$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
	      		$("#userBalance").html( "Balance :" +data+ " &#8377;").css({'color':'green','font-weight':'700'});
			});		
		});	
	});

	
	</script>

</html>


