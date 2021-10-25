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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
    <title>Retail</title>
  </head>
  <body style = "background-color:#F8F8F8">  
 <jsp:include page="commonRetailer.jsp"></jsp:include>
	<div class = "container">
	<div class = "row">
		<div style = "margin-top:25px"></div>
		<div class = "col-lg-5">
			<div class = "rechargeBoxHeader"  style = "background-color:#FFF">
				<ul id="menu" style = "margin-top:13px">
		  			<li><a id = "rechargeMenu">Recharge</a></li>
		  			<li><a id = "dthMenu">Dth</a></li>
		 			<li><a id = "postpaidMenu">Postpaid</a></li>
		  		</ul>  
			</div>
			<div class = "rechargeBoxContentForRecharge" id = "rechargeBoxContentForRecharge"  style = "background-color:#FFF">
				<form style = "padding:25px">
                   <div class="form-group">
                   <label for="">Number</label>
                   <table style = "width: 138%;">
                   <tr>
                   <td><input type="text" class="form-control" id="number_for_recharge" placeholder="Enter number"></td>
                   <td><span><input value = "GET R-OFFER" class = "btn btn-primary" style = "width:45%"></input></span></td>
                   </tr>
                   </table>
                  </div>
                  <div class="form-group">
                     <label for="exampleFormControlSelect1">Operator</label>
                     <select class="form-control" id="operator_id_for_recharge">
                    	<option value = "" selected>Select Option</option>	
					    <c:forEach var="item" items="${operatorList}">
					        <option value="${item[0]}">${item[2]}</option>
					    </c:forEach>
					</select>
                  </div>
                  <div class="form-group">
                     <label for="exampleFormControlSelect1">Circle</label>
                     <select class="form-control" id="circle_for_recharge">
                        <option>Debit</option>
                        <option>Credit</option>
                     </select>
                  </div>
                  <div class="form-group">
                   <label for="exampleInputPassword1">Amount</label>
                   <table style = "width: 138%;">
                   <tr>
                   <td><input type="number" class="form-control" id="amount_for_recharge" placeholder="Enter amount"></td>
                   <td><span><input value = "Browse Plan" class = "btn btn-primary" style = "width:45%"></input></span></td>
                   </tr>
                   </table>
                  </div>
                   <input type="button"  class="btn btn-success" id = "submitTransactionForRecharge" value="Submit"/>
                   <p id = "validationErrorForRecharge"></p>
               </form>  
			</div>
			<div class = "rechargeBoxContentForDth" id = "rechargeBoxContentForDth"  style = "background-color:#FFF">
				<form style = "padding:25px">
                  <div class="form-group">
                     <label for="exampleFormControlSelect1">Operator</label>
                     <select class="form-control" id="operator_for_dth">
                        <option>Debit</option>
                        <option>Credit</option>
                     </select>
                  </div>
                  <div class="form-group">
                   <label for="exampleInputPassword1">Number</label>
                   <table style = "width: 138%;">
                   <tr>
                   <td><input type="number" class="form-control" id="recharge_number_for_dth" placeholder="Enter number"></td>
                   <td><span><input value = "Browse Plan" class = "btn btn-primary" style = "width:45%"></input></span></td>
                   </tr>
                   </table>
                  </div>
                  <div class="form-group">
                   <label for="">Amount</label>
                   <table style = "width: 138%;">
                   <tr>
                   <td><input type="text" class="form-control" id="recharge_amount_for_dth" placeholder="Enter amount"></td>
                   <td><span><input value = "GET R-OFFER" class = "btn btn-primary" style = "width:45%"></input></span></td>
                   </tr>
                   </table>
                  </div>
                  <button id="sendTransaction" class="btn btn-primary">Submit</button>
               </form>  
			</div>
			<div class = "rechargeBoxContentForPostpaid" id = "rechargeBoxContentForPostpaid"  style = "background-color:#FFF">
				<form style = "padding:25px">
                  <div class="form-group">
                     <label for="exampleFormControlSelect1">Operator</label>
                     <select class="form-control" id="operator_for_postpaid">
                        <option>Debit</option>
                        <option>Credit</option>
                     </select>
                  </div>
                  <div class="form-group">
                   <label for="exampleInputPassword1">Number</label>
                   <input type="number" class="form-control" id="recharge_for_postpaid" placeholder="Enter number">
                   </div>
                  <div class="form-group">
                   <label for="">Amount</label>
                   <input type="text" class="form-control" id="recharge_amount_for_postpaid" placeholder="Enter amount">
                   
                  </div>
                  <button id="sendTransaction" class="btn btn-primary">Submit</button>
               </form>  
			</div>					
		</div>
		<div class = "col-lg-1"></div>
		<div class = "col-lg-6">
			<div class="accordion" id="accordionExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        Combo
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			   		 <div class="alert alert-danger" role="alert">No Plans Found</div>  </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingTwo">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			        R-Offer
			      </button>
			    </h2>
			    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        <div class="alert alert-danger" role="alert">Enter mobile number to get R-Offer</div>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingThree">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
			        Top Up
			      </button>
			    </h2>
			    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        <div class="alert alert-danger" role="alert">No Plans Found</div>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingFour">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
			        3G / 4G
			      </button>
			    </h2>
			    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        <div class="alert alert-danger" role="alert">No Plans Found</div>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingfive">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsefive" aria-expanded="false" aria-controls="collapsefive">
			        Rate Cutter
			      </button>
			    </h2>
			    <div id="collapsefive" class="accordion-collapse collapse" aria-labelledby="headingfive" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        <div class="alert alert-danger" role="alert">No Plans Found</div>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingSix">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
			        SMS
			      </button>
			    </h2>
			    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        <div class="alert alert-danger" role="alert">No Plans Found</div>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingSeven">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
			        Roaming
			      </button>
			    </h2>
			    <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        <div class="alert alert-danger" role="alert">No Plans Found</div>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingEight">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
			        Full Talktime
			      </button>
			    </h2>
			    <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			       <div class="alert alert-danger" role="alert">No Plans Found</div>			        
			      </div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
	</div>
	</body>
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script>
	$(document).ready(function() {

		var userId = $("#userSessionId").val();
		var accountBalance = 0;		
	      	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
	      		accountBalance = data; 
	      		$("#userBalanceDisplay").html(data.toFixed(2)+ " &#8377;");
	      		$("#userBalance").html(data.toFixed(2)+ " &#8377;");      		
	        });
	      	$.get("http://localhost:8081/userApi/getUserById/"+userId, function(data, status){
	          	console.log(data);
	          	var userName;
	          	var roleName;
	          	for(var key in data)
	              	{
	              	var keyData = data[key];
	          		for(var value in keyData){
	          			userName = keyData[1];
	                  	roleName = keyData[9];              		
	              		}
	                }
	            $("#userName").text(userName);
	            $("#roleName").text(roleName);      		
	        });   
			$("#rechargeBoxContentForDth").hide();
			$("#rechargeBoxContentForPostpaid").hide();

			$( "#rechargeMenu" ).click(function() {
				$("#rechargeBoxContentForRecharge").show();
				$("#rechargeBoxContentForDth").hide();
				$("#rechargeBoxContentForPostpaid").hide();
				});

			$( "#dthMenu" ).click(function() {
				$("#rechargeBoxContentForDth").show();
				$("#rechargeBoxContentForRecharge").hide();
				$("#rechargeBoxContentForPostpaid").hide();
				});
		
			$( "#postpaidMenu" ).click(function() {
				$("#rechargeBoxContentForPostpaid").show();
				$("#rechargeBoxContentForRecharge").hide();
				$("#rechargeBoxContentForDth").hide();
				});			 

		     $("#submitTransactionForRecharge").click(function(){
			     var numberForRecharge = $("#number_for_recharge").val();
			     var operatorForRecharge = $("#operator_id_for_recharge").val();
			     var amountForRecharge = $("#amount_for_recharge").val();
			     var recharge_id = 1;			        
			     if(numberForRecharge == "" || operatorForRecharge == "" || amountForRecharge == ""){
			    	 $("#validationErrorForRecharge").html('<div class="alert alert-danger"><strong>Error! All Fields are compulsory</strong></div>');
				    	 } 	
			      else {
			    	  if (accountBalance < amountForRecharge){
					    	 $("#validationErrorForRecharge").html('<div class="alert alert-danger"><strong>Error! Insufficient Balance</strong></div>');
						    	 }
			    	  else{
			    		  var formData = {
					    			 mobileNumber: $("#number_for_recharge").val(),							 
					    			 rechargeAmount:  $("#amount_for_recharge").val(),
		  						   	 userId: $("#userSessionId").val(),
		  						   	 operatorId: $("#operator_id_for_recharge").val(),
		  							 status: "Y",
		  							 description:  $("#amount_for_recharge").val()+"Rs. recharge successfully done",
		  							 rechargeId:recharge_id,
		  							 rechargeApiId: "1"						     						      						      
		  						    };
		  							var requestJSON = JSON.stringify(formData);
		  							console.log(requestJSON);
		  						    $.ajax({
		  						      type: "POST",
		  						      url: "http://localhost:8081/rechargeTransaction/addTransactionForRecharge",
		  						      headers: {
		  						    	  "Content-Type" : "application/json"
		  						      },
		  						      data: requestJSON,
		  						      encode: true,
		  						    }).done(function (data) {
		  						      console.log(data);
		  						       if (data != null ){
		  						    	 $("#validationErrorForRecharge").html('<div class="alert alert-success"><strong>Success!Recharge Done"</strong></div>');
		  						    	 var formData = {
		  						    	 virtualBalance: -Math.abs($("#amount_for_recharge").val()),
		   						    	 transactionType: 'Debit',	
		  						    	 userId: $("#userSessionId").val(),
		  						    	 rechargeTransactionId: data
		  						    	 }
		  						    	var requestJSON = JSON.stringify(formData);
		  								console.log(requestJSON);
		  							    $.ajax({
		  							      type: "POST",
		  							      url: "http://localhost:8081/transactionApi/rechargeTransactionDebit",
		  							      headers: {
		  							    	  "Content-Type" : "application/json"
		  							      },
		  							      data: requestJSON,
		  							      encode: true,
		  							    }).done(function (data) {
		  							      console.log(data);
		  							    });	 
		  							var userId = $("#userSessionId").val();
		  							var operatorId = $("#operator_id_for_recharge").val();
		  					      	$.get("http://localhost:8081/rechargeApi/creditCommissionToUser/"+userId+"/"+operatorId, function(data, status){
		  						      	var keyData;
		  						      	var keyValue;
		  						      	var keyDataValueUserId;
		  						      	var keyDataValueUserCommission;
		  						      	var profitAmount;
		  						      	for(var key in data){
		  				      	      		keyData = data[key];
		  				      	      		for(value in keyData){
		  				      		      		keyDataValue = keyData[0];
		  				      		      	    keyDataValueUserCommission = keyData[1];	
		  				      		      	    rechargeAmount = $("#amount_for_recharge").val();
		  				      		      	    profitAmount =  (rechargeAmount * keyDataValueUserCommission) / 100;     		      	
		  				      		      		}	      			
		  						      	      	var formData = {
		  										    	 userId: keyDataValue,
		  										    	 virtualBalance: profitAmount,
		  										    	 transactionType: 'Credit'
		  										    	 }
		  					     		     	 var requestJSON = JSON.stringify(formData);
		  					     		     	 console.log(requestJSON);
		  					     		     	$.ajax({
		  										      type: "POST",
		  										      url: "http://localhost:8081/transactionApi/rechargeTransaction",
		  										      headers: {
		  										    	  "Content-Type" : "application/json"
		  										      },
		  										      data: requestJSON,
		  										      encode: true,
		  										    }).done(function (data) {  										    	
		  										      console.log(data);
		  										      $("#validationErrorForRecharge").html('<div class="alert alert-success"><strong>Success! Recharge Done</strong></div>');
		  										      setTimeout(function(){window.location.reload();}, 2000);
		  										    });     
		  						          		}		      			
		  					        });		
		  								var accountBalance = 0;
		  								userId: $("#userSessionId").val(),		
		  							      	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
		  							      		accountBalance = data; 
		  							      		$("#userBalanceDisplay").html(data+ " &#8377;");
		  							      		$("#userBalance").html(data+ " &#8377;");      		
		  							        });
		  							  } else if(data == "Recharge Failed"){
		  								$("#validationErrorForRecharge").html('<div class="alert alert-danger"><strong>Recharge Failed !!! Contact Distributor</strong></div>');
		  								setTimeout(function(){window.location.reload();}, 2000);
			  							  } 
		  							  else{
		  								$("#validationErrorForRecharge").html('<div class="alert alert-danger"><strong>Error! Issue while inserting</strong></div>');		
		  								setTimeout(function(){window.location.reload();}, 2000);
		    							 }		 
		  						    });
		  						    event.preventDefault();
										
				    	  }
			    	 }	     
			     });
     		});
	</script>
</html>
