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
    <title>Retail</title>
  </head>
  <body style = "background-color:#F8F8F8">  
  <nav class="navbar navbar-expand-lg navbar-light" style = "border-bottom:1px solid rgba(0, 40, 100, 0.12);background-color:#FFF">
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#">Logo</a>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      </ul>
      <form class="d-flex">
            <button id = "userBalanceDisplay" class="btn btn-outline-success" type="button"></button><div id = "sessionDiv" style = "display:none"><input type = "text" id = "userSessionId" value = "${sessionScope.userId}"></input></div>        
          </form>
    </div>
  </div>
</nav>
<nav class="navbar navbar-expand-lg navbar-dark" >
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="home">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="recharge">Recharge</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " aria-current="page" href="reports">Reports</a>
            </li>
            <li class="nav-item">
              <a class="nav-link"  href="settings">Settings</a>
            </li>
          </ul>      
    </div>
   </div>
</nav>
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
	      		$("#userBalanceDisplay").html(data+ " &#8377;");
	      		$("#userBalance").html(data+ " &#8377;");      		
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
			    	 $("#validationErrorForRecharge").html("All Fields are Complusory");
				     } 	
			     if (accountBalance < amountForRecharge){
						$("#validationErrorForRecharge").html("Insufficient Balance");
				     }
			     else {
			    	 var formData = {
			    			 mobileNumber: $("#number_for_recharge").val(),							 
			    			 rechargeAmount:  $("#amount_for_recharge").val(),
  						   	 userId: $("#userSessionId").val(),
  						   	 operatorId: operatorForRecharge,
  							 status: "Y",
  							 rechargeId:recharge_id						     						      						      
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
  						       if (data == "Recharge Done"){
  						    	 $("#validationError").html('<div class="alert alert-success"><strong>Success!"'+data+'"</strong></div>');
  						    	 var formData = {
  						    	 userAmount: -Math.abs($("#amount_for_recharge").val()),
   						    	 transactionType: 'Debit',	
  						    	 userId: $("#userSessionId").val()
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
  							    });	 
  							var userId = $("#userSessionId").val();
  					      	$.get("http://localhost:8081/rechargeApi/creditCommissionToUser/"+userId, function(data, status){
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
  										    	 userAmount: profitAmount,
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
  										      window.location.reload();
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
  							  } else {
  								$("#validationError").html('<div class="alert alert-danger"><strong>Error! Issue while inserting</strong></div>');		
  							  }		 
  						    });
  						    event.preventDefault();
				     }	     
			     });
     		});
	</script>
</html>
