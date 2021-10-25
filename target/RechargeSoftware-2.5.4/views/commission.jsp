

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="/css/bootstrap.min.css" rel="stylesheet">
      <script type="text/javascript" src="/js/jquery.min.js"></script>
      <link href="/css/custom.css" rel="stylesheet">
      <script src = "/js/bootstrap.bundle.min.js" type = "text/javascript"></script>
      <script src = "/js/bootstrap.min.js" type = "text/javascript"></script>
      <link href="/css/jquery.dataTables.min.css" rel="stylesheet">
      <link href="/css/jquery.dataTables.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <script src="/js/jquery.dataTables.min.js" type="text/javascript"></script>
      <title>Commission</title>
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
                        <li><a class="dropdown-item" href="smsApi">SMS Api</a></li>
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
                  <a class="logoutButton">Logout</a>
               </form>
            </div>
         </div>
      </nav>
      <div class = "container" style = "margin-top:80px">
         <div class = "row">
            <div class = "col-md-12">
               <div class = "box_header">
                  Add Commission
               </div>
               <div class = "box_content">
                  <form >
                     <div class = "row">
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleFormControlSelect2">Scheme Type</label>
                              <select class="form-control" id="scheme_id">
                                 <c:forEach var="item" items="${schemeList}">
                                    <option value="${item[0]}">${item[1]}</option>
                                 </c:forEach>
                              </select>
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleFormControlSelect2">Api</label>
                              <select class="form-control" id="recharge_api_id">
                                 <c:forEach var="item" items="${rechargeApiList}">
                                    <option value="${item[0]}">${item[1]}</option>
                                 </c:forEach>
                              </select>
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleFormControlSelect2">Operator</label>
                              <select class="form-control" id="operator_id">
                                 <c:forEach var="item" items="${operatorList}">
                                    <option value="${item[0]}">${item[2]}</option>
                                 </c:forEach>
                              </select>
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleInputPassword1">Commission</label>
                              <input type="number" class="form-control" id="commission" placeholder="">
                           </div>
                        </div>
                     </div>
                     <input type="button"  class="btn btn-success" id = "saveCommission" value="Save" /> 
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
                  Commission List
               </div>
               <div class = "recentRecharge" id = "recentRecharge"  style = "background-color:#FFF;padding:5px;" >
               	<div style = "overflow:auto">
                  <table id="commissionList" class="display" style="width: 100%;"></table>
                  </div>
               </div>
            </div>
         </div>
         <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-lg">
               <!-- Modal content-->
               <div class="modal-content">
                  <div class="modal-header box_header">
                     Edit Commission
                  </div>
                  <div class="modal-body">
                     <div class = "box_content" style = "padding:2%">
                        <form >
                           <div class = "row">
                              <div class = "col-lg-3 col-md-3 col-sm-5 ">
                                 <div class="form-group">
                                    <input type = "hidden" id = "selected_commission_id" />
                                    <label for="exampleFormControlSelect2">Scheme Type</label>
                                    <select class="form-control" id="selected_scheme_id">
                                       <c:forEach var="item" items="${schemeList}">
                                          <option value="${item[0]}">${item[1]}</option>
                                       </c:forEach>
                                    </select>
                                 </div>
                              </div>
                              <div class = "col-lg-3 col-md-3 col-sm-5 ">
                                 <div class="form-group">
                                    <label for="exampleFormControlSelect2">Api</label>
                                    <select class="form-control" id="selected_recharge_api_id">
                                       <c:forEach var="item" items="${rechargeApiList}">
                                          <option value="${item[0]}">${item[1]}</option>
                                       </c:forEach>
                                    </select>
                                 </div>
                              </div>
                              <div class = "col-lg-3 col-md-3 col-sm-5 ">
                                 <div class="form-group">
                                    <label for="exampleFormControlSelect2">Operator</label>
                                    <select class="form-control" id="selected_operator_id">
                                       <c:forEach var="item" items="${operatorList}">
                                          <option value="${item[0]}">${item[2]}</option>
                                       </c:forEach>
                                    </select>
                                 </div>
                              </div>
                              <div class = "col-lg-3 col-md-3 col-sm-5 ">
                                 <div class="form-group">
                                    <label for="exampleInputPassword1">Commission</label>
                                    <input type="number" class="form-control" id="selected_commission" placeholder="">
                                 </div>
                              </div>
                           </div>
                           <input type="button"  class="btn btn-success" id = "updateCommission" value="Update" /> 
                           <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                           <p style = "margin-top:10px"><span id ="selectedValidationError"></span></p>
                        </form>
                     </div>
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
      	$("#customModal").hide();
      	//start of user form submit
      
      
       $("#saveCommission").click(function (event) {
      		if( $("#commission").val() == ""){
      			$("#validationError").html("All Fields Are Compulsory").css("color", "red");
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
      					      rechargeApiId: $("#recharge_api_id").val(),
      					      schemeId: $("#scheme_id").val(),
      					      commissionAmount:  $("#commission").val()					      
      					    };
      						var requestJSON = JSON.stringify(formData);
      						console.log(requestJSON);
      					    $.ajax({
      					      type: "POST",
      					      url: "http://localhost:8081/commissionApi/addCommission",
      					      headers: {
      					    	  "Content-Type" : "application/json"
      					      },
      					      data: requestJSON,
      					      encode: true,
      					    }).done(function (data) {
      					      console.log(data);
      					       if (data == "Commission Added"){							       
      					    	 $("#validationError").html('<div class="alert alert-success"><strong>Success!"'+data+'"</strong></div>');
      					    	 window.location.reload();						    	    
      						  } else if(data == "Scheme Already Exists"){
      							  $("#validationError").html('<div class="alert alert-danger"><strong>Error! Scheme Already Exists ,change commission from commission list</strong></div>').show().delay(2000).fadeOut();
      							  } else if (data == "Commission amount exceeded please reduce"){
      								  $("#validationError").html('<div class="alert alert-danger"><strong>Error! Commission amount exceeded please reduce</strong></div>').show().delay(2000).fadeOut();;
      								  } else {
      							$("#validationError").html('<div class="alert alert-danger"><strong>Error! Issue while inserting</strong></div>').show().delay(2000).fadeOut();		
      						  }		 
      					    });
      					    event.preventDefault(); 
      				} 		 
      	   
      	  });
      //end of user form submit
       $('#commissionList').DataTable({
      		pageLength : 10,
      		ajax : {
      			url : 'http://localhost:8081/getCommissionList',
      			dataSrc : ''
      		},
      		columns : [ { 
                  title: 'Operator Name',
                  data : '2',
                  render: (data,type,row) => {	            	
      					return '<span id="operatorValue">'+data+'</span>';
                  }
               }, {
      			title : 'Api',
      			data : '4'
      		}, {
      			title : 'Commission',
      			data : '7',
      		    render: $.fn.dataTable.render.number(',', '.', 2)
      		}, {
      			title : 'Scheme Type',
      			data : '6'
      		},			
                 { 
      	            mData: '',
      	            data : '0',
      	            render: (data,type,row) => {		          
      	              return '<a id = "commissionEdit" data-toggle="modal" data-target="#myModal"  class = "btn"><i class="fa fa-edit"></i><span style = "display:none">'+data+'</span></a>';
      	            }
      	         }
      		]
      		
      	});	 
       $('#commissionList').on('click', '#commissionEdit', function(){
      	        var commissionEditValue = $(this).text();
      	 		var operatorId;
      	 		var schemeId;
      	 		var rechargeApiId;
      	 		var commission;
      	 		$.get("http://localhost:8081/getCommissionListById/"+commissionEditValue, function(data, status){
            		console.log(data);
            		for(var key in data){
      	      		keyData = data[key];
      	      		for( value in keyData){
      		      		commissionId = commissionEditValue;
      		      		operatorId = keyData[1];
      	      			rechargeApiId = keyData[3];
      	      		    schemeId = keyData[5];
      	      		    commissionAmount = keyData[7];
      		      		}	      			
      	      		}      
            		$("#selected_commission_id").val(commissionId);
            		$("#selected_operator_id").val(operatorId).attr('disabled','disabled');		
            		$("#selected_scheme_id").val(schemeId).attr('disabled','disabled');		      			
      	        $("#selected_recharge_api_id").val(rechargeApiId).attr('disabled','disabled');	
      	        $("#selected_commission").val(commissionAmount);		
      	});
      	});	
      		$("#closeModal").click(function(){
      			$("#customModal").hide();
      			});
      
      		$("#updateCommission").click(function (event) {
      					var status = $("#status").val();
      					if(status == "Active"){
      						status = "Y";
      						}
      					else
      						{
      							status = "N";
      						}
  						if($("#selected_scheme_id").val() == null){
  						  $("#selectedValidationError").html('<div class="alert alert-danger"><strong>Error!Admin Commission cannot be edited </strong></div>').show().delay(2000).fadeOut();
  	  						} else {
  	  						var formData = {
        							  commissionId: $("#selected_commission_id").val(),
        		                      operatorId: $("#selected_operator_id").val(),							 
        						      rechargeApiId: $("#selected_recharge_api_id").val(),
        						      schemeId: $("#selected_scheme_id").val(),
        						      commissionAmount:  $("#selected_commission").val()					      
        						    };
        							var requestJSON = JSON.stringify(formData);
        							console.log(requestJSON);
        						    $.ajax({
        						      type: "POST",
        						      url: "http://localhost:8081/commissionApi/updateCommission",
        						      headers: {
        						    	  "Content-Type" : "application/json"
        						      },
        						      data: requestJSON,
        						      encode: true,
        						    }).done(function (data) {
        						      console.log(data);
        						       if (data == "Commission Updated"){							       
        						    	 $("#selectedValidationError").html('<div class="alert alert-success"><strong>Success!"'+data+'"</strong></div>');
        						    	 window.location.reload();						    	    
        							  } else if(data == "Scheme Already Exists"){
        								  $("#selectedValidationError").html('<div class="alert alert-danger"><strong>Error! Scheme Already Exists ,change commission from commission list</strong></div>').show().delay(2000).fadeOut();
        								  }  else if (data == "Commission amount exceeded please reduce"){
        								  $("#selectedValidationError").html('<div class="alert alert-danger"><strong>Error! Commission amount exceeded please reduce</strong></div>').show().delay(2000).fadeOut();
        								  } else {
        							$("#selectedValidationError").html('<div class="alert alert-danger"><strong>Error! Issue while inserting</strong></div>').show().delay(2000).fadeOut();
        							  }		 
        						    });
        						    event.preventDefault();
  	  	  						}								
      		  });
      	});
      
      
   </script>
</html>

