<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="/css/bootstrap.min.css" rel="stylesheet">
      <link href="/css/custom.css" rel="stylesheet">
      <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
      
      <script type="text/javascript" src="/js/jquery.min.js"></script>
      <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js" type="text/javascript"></script>    
      <script src = "/js/bootstrap.bundle.min.js" type = "text/javascript"></script>
      <script src = "/js/bootstrap.min.js" type = "text/javascript"></script>
      <script src = "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js" ></script>
	  <script src ="https://cdn.datatables.net/plug-ins/1.10.11/sorting/datetime-moment.js" ></script>
	  <script src = "https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js" defer></script>
      <title>Fund Transfer</title>
   </head>
   <body style = "background-color:#F8F8F8">
    <jsp:include page="commonDistributor.jsp"></jsp:include>
   <div class = "container" style = "margin-top:50px">
   <div class = "row">
      <div class = "col-md-12">
         <div class = "rechargeBoxHeader"  style = "background-color:#FFF;padding:1%;border:1px solid rgba(0, 40, 100, 0.12)">
         Transaction
         </div>
            <div class = "box_content" style = "background-color:#FFF;padding:3%;border:1px solid rgba(0, 40, 100, 0.12)">
               <form >                   
                  <div class="form-group">
                     <label for="exampleFormControlSelect2">User</label><br>
                    <select class="form-control" id="user_id" style = "width:50%">
                    	<option value = "" selected>Select User</option>	
					    <c:forEach var="item" items="${userList}">
					        <option value="${item[0]}">${item[1]}</option>
					    </c:forEach>
					</select>
					<p id = "userBalance"></p>					
                  </div>
                   <div class="form-group">
                     <label for="exampleInputPassword1">Amount</label>
                     <input type="text" class="form-control" id="user_amount" placeholder="Amount" autocomplete = "off" style = "width:50%">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputPassword1">Description</label>
                     <textarea class="form-control rounded-0" id="user_description" rows="3"></textarea>
                  </div>
                  <input type="button" id="sendTransaction" value = "submit" class="btn btn-primary"/>
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
	  $('#user_id').select2();
	//start of user form submit
	  var sessionUserId = $("#userSessionId").val();
  	  if(sessionUserId == ""){
					alert("session is expired");
					window.location.replace("http://localhost:8081/Recharge/login");
      	  }
  	console.log(sessionUserId);         	  
	var userBalance = 0;
	var sessionUserName;
      console.log(sessionUserId);         	  
      	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+sessionUserId, function(data, status){
      		$("#userBalanceDisplay").html(data.toFixed(2)+ " &#8377;");	
        });
      	$.get("http://localhost:8081/userApi/getUserNameById/"+sessionUserId, function(data, status){
      		sessionUserName = data;
      		console.log(sessionUserName);
        });
	 $("#sendTransaction").click(function (event) {
			if( $("#user_id").val() == "" || $("#user_amount").val() == ""){
				$("#validationError").html("All Fields Are Compulsory").css("color", "red");
				}
				else {					
					var userAmount =  $("#user_amount").val();
					var initialUserAmount =  $("#user_amount").val();
					var transactionType = "Debit"
					console.log(transactionType);
					var userName = $("#user_id option:selected").text();
					var description = $("#user_description").val();
						console.log(userAmount);					
						 var formData = {
						      userId: sessionUserId,
						      virtualBalance: -userAmount,
						      transactionType: transactionType,
						      description: description,
						      toUserId: $("#user_id").val(),
						      sessionUserId: sessionUserId,
						      userName: userName
						    };
							var requestJSON = JSON.stringify(formData);
							console.log(requestJSON);
						    $.ajax({
						      type: "POST",
						      url: "http://localhost:8081/transactionApi/fundTransfer",
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
						    	  $("#user_description").val("");
						    	  setTimeout(function(){
						    		  window.location.reload();
						    		}, 2000);
						    	  
							  } else if(data == "Insufficient Balance"){
								  $("#validationError").html('<div class="alert alert-danger"><strong>Error! Insufficient Balance</strong></div>').show().delay(1500).fadeOut();		
								      $("#user_id").val("");
							    	  $("#userBalance").html("");
							    	  $("#user_amount").val("");
							    	  $("#user_description").val("");
							    	  setTimeout(function(){
							    		  window.location.reload();
							    		}, 2000);
								  }
							  else if(data == "Balance Cannot Be Negative"){
								  $("#validationError").html('<div class="alert alert-danger"><strong>Error! Balance Cannot Be Negative</strong></div>').show().delay(1500).fadeOut();		
									$("#user_id").val("");
							    	  $("#userBalance").html("");
							    	  $("#user_amount").val("");
							    	  $("#user_description").val("");	
							    	  setTimeout(function(){
							    		  window.location.reload();
							    		}, 2000);						    	  
								  }
								  else {
					       		  $("#validationError").html('<div class="alert alert-danger"><strong>Error! Invalid Pin</strong></div>').show().delay(1500).fadeOut();		
								  $("#user_id").val("");
						    	  $("#userBalance").html("");
						    	  $("#user_amount").val("");
						    	  $("#user_transaction_pin").val("");
						    	  $("#select_transaction_type").val(0);
						    	  setTimeout(function(){
						    		  window.location.reload();
						    		}, 2000);
								  }		 
						    });
						    event.preventDefault(); 
					} 		 
		  });
	//end of user form submit
		$("#user_id").on('change',function(){
			var userId = $(this).val();
			$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
	      		$("#userBalance").html( "Balance :" +data.toFixed(2)+ " &#8377;").css({'color':'green','font-weight':'700'});
			});		
		});			
	  });	
	</script>

</html>


