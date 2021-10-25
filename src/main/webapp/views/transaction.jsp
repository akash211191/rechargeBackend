<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/custom.css" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>	    
	<script src = "/js/bootstrap.bundle.min.js" type = "text/javascript"></script>
	<script src = "/js/bootstrap.min.js" type = "text/javascript"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js" defer></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <title>Transactions</title>
  </head>
  <body> 
<jsp:include page="commonAdmin.jsp"></jsp:include>  
<div class = "container" style = "margin-top:80px">
   <div class = "row">
      <div class = "col-md-8">
         <div class = "box_header">
         Transaction
         </div>
            <div class = "box_content"  style = "padding:30px">
            	<div style = "margin-bottom:20px">
            	<ul class="nav nav-tabs">
            		  <li class="nav-item">
            		  	<a class = "activeNav" id = "actualBalanceButton" style = "margin-right:20px;cursor:pointer;text-decoration:none;color:black"> Actual Balance </a>               	
            		  </li>
            		    <li class="nav-item">
            		    <a  id = "virtualBalanceButton" style = "cursor:pointer;text-decoration:none;color:black"> Virtual Balance</a>            	
            		  </li>
            	</ul>
            	</div>
               <form id = "actualBalanceForm">                   
                  <div class="form-group">
                     <label for="exampleFormControlSelect2">User</label><br>
                     <select class="form-control" id="user_id_actual" style = "width:100%;">
                    	<option value = "" selected>Select User</option>	
					    <c:forEach var="item" items="${userList}">
					        <option value="${item[0]}">${item[1]} ${item[2]} ${item[15]}</option>
					    </c:forEach>
					</select>
					<p id = "userBalanceActual"></p>					
                  </div>
                   <div class="form-group">
                     <label for="exampleInputPassword1">Amount</label>
                     <input type="text" class="form-control" id="user_amount_actual" placeholder="Amount" autocomplete = "off">
                  </div>
                  <!-- <div class="form-group">
                     <label for="exampleInputPassword1">Virtual Amount</label>
                     <input type="text" class="form-control" id="virtual_balance" placeholder="Virtual Amount " autocomplete = "off">
                  </div> -->
                  <div class="form-group">
                     <label for="exampleInputPassword1">Pin</label>
                     <input type="text" class="form-control" id="user_transaction_pin_actual" placeholder="Pin" autocomplete = "off">
                  </div>
                  <div class="form-group">
                     <label for="exampleFormControlSelect1">Transaction Type</label>
                     <select class="form-control" id="transaction_type_actual">
                     	<option value = "0" selected>Select Transaction Type</option>
                        <option value = "Debit">Debit</option>
                        <option value = "Credit">Credit</option>
                     </select>
                  </div>
                  <input type="button" id="sendTransactionActual" value = "submit" class="btn btn-primary"/>
                  <p style = "margin-top:10px"><span id ="validationErrorActual"></span></p>                  
               </form>
               
               
               <form id = "virtualBalanceForm">                   
                  <div class="form-group">
                     <label for="exampleFormControlSelect2">User</label><br>
                     <select class="form-control" id="user_id_virtual" style = "width:100%;">
                    	<option value = "" selected>Select User</option>	
					    <c:forEach var="item" items="${userList}">
					        <option value="${item[0]}">${item[1]} ${item[2]} ${item[15]}</option>
					    </c:forEach>
					</select>
					<p id = "userBalanceVirtual"></p>					
                  </div>
                   <!-- <div class="form-group">
                     <label for="exampleInputPassword1">Amount</label>
                     <input type="text" class="form-control" id="user_amount_virtual" placeholder="Amount" autocomplete = "off">
                  </div> -->
                  <div class="form-group">
                     <label for="exampleInputPassword1">Virtual Amount</label>
                     <input type="text" class="form-control" id="virtual_balance" placeholder="Virtual Amount " autocomplete = "off">
                  </div>
                  <div class="form-group">
                     <label for="exampleInputPassword1">Pin</label>
                     <input type="text" class="form-control" id="user_transaction_pin_virtual" placeholder="Pin" autocomplete = "off">
                  </div>
                  <div class="form-group">
                     <label for="exampleFormControlSelect1">Transaction Type</label>
                     <select class="form-control" id="transaction_type_virtual">
                     	<option value = "0" selected>Select Transaction Type</option>
                        <option value = "Debit">Debit</option>
                        <option value = "Credit">Credit</option>
                     </select>
                  </div>
                  <input type="button" id="sendTransactionVirtual" value = "submit" class="btn btn-primary"/>
                  <p style = "margin-top:10px"><span id ="validationErrorVirtual"></span></p>                  
               </form>
            </div>
      </div>
   </div>
</div>
</body>
<script>
	$(document).ready(function() {
	//start of user form submit
	$("#settings").addClass("active");
	$('#user_id_actual').select2();
	$('#user_id_virtual').select2();
	var sessionUserId = $("#userSessionId").val();
	var userBalanceActual = 0;
	var sessionUserName;
      console.log(sessionUserId);         	  
      	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+sessionUserId, function(data, status){
      		$("#userBalanceDisplay").html(data.toFixed(2)+ " &#8377;");	
        });
      	$.get("http://localhost:8081/userApi/getUserNameById/"+sessionUserId, function(data, status){
      		sessionUserName = data;
      		console.log(sessionUserName);
        });
        
	 $("#sendTransactionActual").click(function (event) {
			if( $("#user_id_actual_actual").val() == "" || $("#user_transaction_pin_actual").val() == "" || $("#transaction_type_actual").val() == "" ||  $("#user_amount_actual").val() == ""){
				$("#validationErrorActual").html("All Fields Are Compulsory").css("color", "red");
				}
				else {			
					var userAmount =  $("#user_amount_actual").val();
					var initialUserAmount =  Number($("#user_amount_actual").val());
					var transactionType = $("#transaction_type_actual").val();
					var virtualBalance = Number($("#virtual_balance").val());
					var totalBalance = initialUserAmount + virtualBalance;
					console.log(transactionType);
					var userName = $("#user_id_actual option:selected").text();
					var description;
					if(transactionType == "Debit")
						{
						 userAmount = -Math.abs(userAmount);
						 	description = totalBalance+"debited by "+sessionUserName;
						}
					if(transactionType == "Credit")
						{
							description = totalBalance+" credited by "+sessionUserName;
						}
						console.log(userAmount);					
						 var formData = {
						      userId: $("#user_id_actual").val(),
						      userAmount: userAmount,
						      userPin:$("#user_transaction_pin_actual").val(),
						      transactionType: transactionType,
						      description: description,
						      sessionUserId: sessionUserId,
						      userName: userName
						    };
							var requestJSON = JSON.stringify(formData);
							console.log(requestJSON);
							$.confirm({
							    title: 'Confirm!',
							    content: 'Are you sure you want to<br>'+transactionType+' '+userAmount+' actual balance to '+userName,
							    buttons: {
							        confirm: function () {
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
										    	   var userId =  $("#user_id_actual").val();
										    	   $.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
										    		   $("#validationErrorActual").html('<div class="alert alert-success"><strong>Transaction Done ! "'+userName+ '" balance is "'+data.toFixed(2)+'" &#8377;</strong></div>').show().delay(2000).fadeOut();
													});							       
										    	  $("#user_id_actual").val("");
										    	  $("#userBalanceActual").html("");
										    	  $("#user_amount_actual").val("");
										    	  $("#user_transaction_pin_actual").val("");
										    	  $("#select_transaction_type_actual").val("");
										    	  setTimeout(function(){
										    		  window.location.reload();
										    		}, 2000);
										    	  
											  } else if(data == "Insufficient Balance"){
												  $("#validationErrorActual").html('<div class="alert alert-danger"><strong>Error! Insufficient Balance</strong></div>').show().delay(1500).fadeOut();		
													$("#user_id_actual").val("");
											    	  $("#userBalanceActual").html("");
											    	  $("#user_amount_actual").val("");
											    	  $("#user_transaction_pin_actual").val("");
											    	  $("#select_transaction_type_actual").val(0);
												  }
											  else if(data == "Balance Cannot Be Negative"){
												  $("#validationErrorActual").html('<div class="alert alert-danger"><strong>Error! Balance Cannot Be Negative</strong></div>').show().delay(1500).fadeOut();		
													$("#user_id_actual").val("");
											    	  $("#userBalanceActual").html("");
											    	  $("#user_amount_actual").val("");
											    	  $("#user_transaction_pin_actual").val("");
											    	  $("#select_transaction_type_actual").val(0);
												  }
												  else {
									       		  $("#validationErrorActual").html('<div class="alert alert-danger"><strong>Error! Invalid Pin</strong></div>').show().delay(1500).fadeOut();		
												  $("#user_id_actual").val("");
										    	  $("#userBalanceActual").html("");
										    	  $("#user_amount_actual").val("");
										    	  $("#user_transaction_pin_actual").val("");
										    	  $("#select_transaction_type_actual").val(0);
												  }		 
										    });
										    event.preventDefault();
							        },
							        cancel: function () {
							            $.alert('Cancelled!');
							        }
							      }
							});						    
					} 		 
		  });
	//end of user form submit
	
	$("#sendTransactionVirtual").click(function (event) {
			if( $("#user_id_actual_virtual").val() == "" || $("#user_transaction_pin_virtual").val() == "" || $("#transaction_type_virtual").val() == "" ||  $("#user_amount_virtual").val() == ""){
				$("#validationErrorVirtual").html("All Fields Are Compulsory").css("color", "red");
				}
				else {										
					var userAmount =  $("#user_amount_virtual").val();
					var initialUserAmount =  Number($("#user_amount_virtual").val());
					var transactionType = $("#transaction_type_virtual").val();
					var virtualBalance = Number($("#virtual_balance").val());
					var totalBalance = initialUserAmount + virtualBalance;
					console.log(transactionType);
					var userName = $("#user_id_virtual option:selected").text();
					var description;
					if(transactionType == "Debit")
						{
						 userAmount = -Math.abs(userAmount);
						 	description = virtualBalance+"debited by "+sessionUserName;
						}
					if(transactionType == "Credit")
						{
							description = virtualBalance+" credited by "+sessionUserName;
						}
						console.log(userAmount);					
						 var formData = {
						      userId: $("#user_id_virtual").val(),
						      userPin:$("#user_transaction_pin_virtual").val(),
						      transactionType: transactionType,
						      description: description,
						      sessionUserId: sessionUserId,
						      userName: userName,
						      virtualBalance: virtualBalance
						    };
							var requestJSON = JSON.stringify(formData);
							console.log(requestJSON);
							$.confirm({
							    title: 'Confirm!',
							    content: 'Are you sure you want to<br>'+transactionType+' '+virtualBalance+' virtual balance to '+userName,
							    buttons: {
							        confirm: function () {
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
										    	   var userId =  $("#user_id_virtual").val();
										    	   $.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
										    		   $("#validationErrorVirtual").html('<div class="alert alert-success"><strong>Transaction Done ! "'+userName+ '" balance is "'+data.toFixed(2)+'" &#8377;</strong></div>').show().delay(2000).fadeOut();
													});							       
										    	  $("#user_id_virtual").val("");
										    	  $("#userBalanceVirtual").html("");
										    	  $("#user_amount_virtual").val("");
										    	  $("#user_transaction_pin_virtual").val("");
										    	  $("#select_transaction_type_virtual").val("");
										    	  setTimeout(function(){
										    		  window.location.reload();
										    		}, 2000);
										    	  
											  } else if(data == "Insufficient Balance"){
												  $("#validationErrorVirtual").html('<div class="alert alert-danger"><strong>Error! Insufficient Balance</strong></div>').show().delay(1500).fadeOut();		
													  $("#user_id_virtual").val("");
											    	  $("#userBalanceVirtual").html("");
											    	  $("#user_amount_virtual").val("");
											    	  $("#user_transaction_pin_virtual").val("");
											    	  $("#select_transaction_type_virtual").val(0);
												  }
											  else if(data == "Balance Cannot Be Negative"){
												  $("#validationErrorVirtual").html('<div class="alert alert-danger"><strong>Error! Balance Cannot Be Negative</strong></div>').show().delay(1500).fadeOut();		
													$("#user_id_virtual").val("");
											    	  $("#userBalanceVirtual").html("");
											    	  $("#user_amount_virtual").val("");
											    	  $("#user_transaction_pin_virtual").val("");
											    	  $("#select_transaction_type_virtual").val(0);
												  }
												  else {
									       		  $("#validationErrorVirtual").html('<div class="alert alert-danger"><strong>Error! Invalid Pin</strong></div>').show().delay(1500).fadeOut();		
												  $("#user_id_virtual").val("");
										    	  $("#userBalanceVirtual").html("");
										    	  $("#user_amount_virtual").val("");
										    	  $("#user_transaction_pin_virtual").val("");
										    	  $("#select_transaction_type_virtual").val(0);
												  }		 
										    });
										    event.preventDefault();
							        },
							        cancel: function () {
							            $.alert('Cancelled!');
							        }
							      }
							});
					} 		 
		  });
	//end of user form submit
		$("#user_id_actual").on('change',function(){
			var userId = $(this).val();
			$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
	      		$("#userBalanceActual").html( "Balance :" +data.toFixed(2)+ " &#8377;").css({'color':'green','font-weight':'700'});
			});		
		});
		
		$("#user_id_virtual").on('change',function(){
			var userId = $(this).val();
			$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
	      		$("#userBalanceVirtual").html( "Balance :" +data.toFixed(2)+ " &#8377;").css({'color':'green','font-weight':'700'});
			});		
		});	

		$("#virtualBalanceForm").hide();
		$("#actualBalanceButton").click(function(){
			$(this).addClass("activeNav");
			$("#virtualBalanceButton").removeClass("activeNav");
			$("#virtualBalanceForm").hide();
			$("#actualBalanceForm").show();
			});
		$("#virtualBalanceButton").click(function(){
			$(this).addClass("activeNav");
			$("#actualBalanceButton").removeClass("activeNav");
			$("#virtualBalanceForm").show();
			$("#actualBalanceForm").hide();
		});
	});	
	</script>

</html>


