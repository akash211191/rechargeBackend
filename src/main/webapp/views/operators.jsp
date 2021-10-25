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
      <link href="/css/jquery.dataTables.min.css" rel="stylesheet">
      <link href="/css/jquery.dataTables.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
      <script type="text/javascript" src="/js/jquery.min.js"></script>
      <script src="/js/jquery.dataTables.min.js" type="text/javascript"></script>
      <title>Operators</title>
   </head>
   <body>
      <jsp:include page="commonAdmin.jsp"></jsp:include>
      <div class = "container" style = "margin-top:50px">
         <div class = "row">
            <div class = "col-md-12">
               <div class = "box_header">
                  Add Operator
               </div>
               <div class = "box_content" style = "padding:1.5rem">
                  <form >
                     <div class = "row">
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                        	<input type = "hidden" id = "operator_id" />
                           <div class="form-group">
                              <label for="exampleInputPassword1">Name</label>
                              <input type="text" class="form-control" id="operator_name" placeholder="Name">
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleFormControlSelect2">Service</label>
                              <select class="form-control" id="service_id">
                                 <c:forEach var="item" items="${serviceList}">
                                    <option value="${item[0]}">${item[1]}</option>
                                 </c:forEach>
                              </select>
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleFormControlSelect1">Status</label>
                              <select class="form-control" id="status">                                 
                                 <option>Active</option>
                                 <option>DeActive</option>
                              </select>
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleInputPassword1">SMS code</label>
                              <input type="text" class="form-control" id="sms_code" placeholder="SMS code">
                           </div>
                        </div>
                     </div>
                     <div class = "row">
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleInputPassword1">Admin Commission</label>
                              <input type="number" class="form-control" id="admin_commission" placeholder="Admin Commission">
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleInputPassword1">Minimum Recharge Amount</label>
                              <input type="number" class="form-control" id="minimum_recharge_amount" placeholder="Minimum Recharge Amount">
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleInputPassword1">Maximum Recharge Amount</label>
                              <input type="number" class="form-control" id="maximum_recharge_amount" placeholder="Maximum Recharge Amount">
                           </div>
                        </div>
                     </div>
                     <input type="button"  class="btn btn-success" id = "saveOperator" value="Save" />
                     <input type="button"  class="btn btn-primary" id = "resetButton" value="Reset" /> 
                     <p style = "margin-top:10px"><span id ="validationError"></span></p>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <div class = "container">
         <div style = "margin-top:40px"></div>
         <div class = "row">
             <div class = "col-lg-12">
               <div class = "box_header">
                  Operator List
               </div>
               <div class = "recentRecharge" id = "recentRecharge"  style = "background-color:#FFF;padding:5px;" >
               <div style = "overflow:auto">
                  <table id="operatorList" class="display" style="width: 100%;"></table>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </body>
   
<script>

	// we need for live transactions
	/* $(document).ajaxStop(function(){
    	window.location.reload();
	}); */
	$(document).ready(function() {
		//start of user form submit
		
	var userId = $("#userSessionId").val();
		var accountBalance = 0;		
	      	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
	      		accountBalance = data; 
	      		$("#userBalanceDisplay").html(data+ " &#8377;");
	      		$("#userBalance").html(data+ " &#8377;");      		
	        });
	
	 $("#saveOperator").click(function (event) {
			if( $("#operator_name").val() == "" || $("#service_id").val() == "" || $("#sms_code").val() == ""
				|| $("#admin_commission").val() == "" || $("#minimum_recharge_amount").val() == "" || $("#maximum_recharge_amount").val() == ""
				){
				$("#validationError").html("All Fields Are Compulsory").css("color", "red");
				} 
			else if ($("#admin_commission").val() > 10){
				$("#validationError").html("Maximum commission allowed is 10").css("color", "red").show().delay(2000).fadeOut();
				$("#operator_id").val("");		
	      		$("#operator_name").val("");		      			
		        $("#service_id").val(1);
		        $("#status").val("Active");								    
		        $("#sms_code").val("");
		        $("#admin_commission").val("");
		        $("#minimum_recharge_amount").val("");
		        $("#maximum_recharge_amount").val("");
		        $("#saveOperator").val("Save");
				}
				else {
					var status = $("#status").val();
					if(status == "Active"){
						status = "Y";
						}
					else
						{
							status = "N";
						}									
					 var formData = {
		                      operatorId: $("#operator_id").val(),							 
						      operatorName: $("#operator_name").val(),
						      serviceId: $("#service_id").val(),
						      status: status,
						      smsCode:  $("#sms_code").val(),
						      adminCommission:  $("#admin_commission").val(),
						      minimumRechargeAmount:  $("#minimum_recharge_amount").val(),
						      maximumRechargeAmount:  $("#maximum_recharge_amount").val(),						      
						    };
							var requestJSON = JSON.stringify(formData);
							console.log(requestJSON);
						    $.ajax({
						      type: "POST",
						      url: "http://localhost:8081/operatorApi/addOperator",
						      headers: {
						    	  "Content-Type" : "application/json"
						      },
						      data: requestJSON,
						      encode: true,
						    }).done(function (data) {
						      console.log(data);
						       if (data == "Operator Added"){							       
						    	 $("#validationError").html('<div class="alert alert-success"><strong>Success!"'+data+'"</strong></div>');
						    	 window.location.reload();
						    	 $("#operator_id").val("");		
						      		$("#operator_name").val("");		      			
							        $("#service_id").val(1);
							        $("#status").val("Active");								    
							        $("#sms_code").val("");
							        $("#admin_commission").val("");
							        $("#minimum_recharge_amount").val("");
							        $("#maximum_recharge_amount").val("");
							        $("#saveOperator").val("Save");
							  }
						       else if(data == "Commission already consumed"){
						    	    $("#validationError").html('<div class="alert alert-danger"><strong>Error! Commission is already consumed by operator you cannot reduce it </strong></div>').show().delay(2000).fadeOut();
									$("#operator_id").val("");		
						      		$("#operator_name").val("");		      			
							        $("#service_id").val(1);
							        $("#status").val("Active");								    
							        $("#sms_code").val("");
							        $("#admin_commission").val("");
							        $("#minimum_recharge_amount").val("");
							        $("#maximum_recharge_amount").val("");
							        $("#saveOperator").val("Save");
							       }
							        else {
								$("#validationError").html('<div class="alert alert-danger"><strong>Error! Issue while inserting</strong></div>').show().delay(2000).fadeOut();
								$("#operator_id").val("");		
					      		$("#operator_name").val("");		      			
						        $("#service_id").val(1);
						        $("#status").val("Active");								    
						        $("#sms_code").val("");
						        $("#admin_commission").val("");
						        $("#minimum_recharge_amount").val("");
						        $("#maximum_recharge_amount").val("");
						        $("#saveOperator").val("Save");		
							  }		 
						    });
						    event.preventDefault(); 
					} 		 
		   
		  });
	//end of user form submit
	 $('#operatorList').DataTable({
		 fixedColumns:   {
	            heightMatch: 'none'
	        },
			pageLength : 10,
			ajax : {
				url : 'http://localhost:8081/getOperatorList',
				dataSrc : ''
			},
			columns : [ { 
	            title: 'Operator Name',
	            data : '2',
	            render: (data,type,row) => {	            	
						return '<span id="operatorValue">'+data+'</span>';
	            }
	         }, {
				title : 'Service',
				data : '9'
			}, {
				title : 'SMS code',
				data : '3'
			}, {
				title : 'Admin Commission',
				data : '5',
				render: $.fn.dataTable.render.number(',', '.', 2)
			},
			{
				title : 'Min. Recharge Amount',
				data : '6',
				render: $.fn.dataTable.render.number(',', '.', 2)
			},
			{
				title : 'Max. Recharge Amount',
				data : '7',
				render: $.fn.dataTable.render.number(',', '.', 2)
			},
			{ 
	            title: 'Status',
	            data : '4',
	            render: (data,type,row) => {
	            	if(data == "Y"){
						return '<span id="statusButtonSuccess">Active</span>';
		            	}
	            	else{
	            		return '<span id="statusButtonWarning">DeActive</span>';
		            	}
	            }
	         },
			{ 
	            mData: '',
	            data : '0',
	            render: (data,type,row) => {		          
	              return '<a href="#" id= "operatorEdit" class = "btn"><i class="fa fa-edit"></i><span style = "display:none">'+data+'</span></a>';
	            }
	         }
	         /* { 
		            mData: '',
		            data : '0',
		            render: (data,type,row) => {
		              return '<a  id="'+data+'" class = "btn"><i class="fa fa-trash"></i></a>';
		            }
		         } */
			]
			
		});	 
	 $('#operatorList').on('click', '#operatorEdit', function(){
		 		var operatorEditValue = $(this).text();
		 		var operatorName;
		 		var serviceId;
		 		var status;
		 		var smsCode;
		 		var keyData;
		 		var adminCommission;
		 		var minAmount;
		 		var maxAmount;
		 		var value;
		 		$.get("http://localhost:8081/getOperatorListById/"+operatorEditValue, function(data, status){
	      		console.log(data);
	      		for(var key in data){
		      		keyData = data[key];
		      		for( value in keyData){
			      		operatorId = operatorEditValue;
		      			operatorName = keyData[2];
		      			serviceId = keyData[1];
		      		    status = keyData[4];
		      		    smsCode = keyData[3];
		      		    adminCommission = keyData[5];
		      		    minAmount = keyData[6];
		      		    maxAmount = keyData[7];
			      		}	      			
		      		}      
	      		console.log(operatorName);
	      		$("#operator_id").val(operatorId);		
	      		$("#operator_name").val(operatorName);		      			
		        $("#service_id").val(serviceId);
		        if(status == "Y"){
		        	$("#status").val("Active");
			        }
		        else{
		        	$("#status").val("DeActive");
			        }
		        $("#sms_code").val(smsCode);
		        $("#admin_commission").val(adminCommission);
		        $("#minimum_recharge_amount").val(minAmount);
		        $("#maximum_recharge_amount").val(maxAmount);
		        $("#saveOperator").val("Update");			
		});
 	});	
	 	$("#resetButton").click(function(){
	 		$("#operator_id").val("");		
      		$("#operator_name").val("");		      			
	        $("#service_id").val(1);
	        $("#status").val("Active");								    
	        $("#sms_code").val("");
	        $("#admin_commission").val("");
	        $("#minimum_recharge_amount").val("");
	        $("#maximum_recharge_amount").val("");
	        $("#saveOperator").val("Save");
		 	});

	 	
	});
	</script>
   
</html>

