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
      <script type="text/javascript" src="/js/jquery.min.js"></script>
      <script src="/js/jquery.dataTables.min.js" type="text/javascript"></script>
      <title>Scheme</title>
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
                     <a class="nav-link active" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                     <a class="nav-link" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
      <div class = "container" style = "margin-top:50px">
         <div class = "row">
            <div class = "col-md-12">
               <div class = "box_header">
                  Add Scheme
               </div>
               <div class = "box_content">
                  <form >
                     <div class = "row">
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                        	<input type = "hidden" id = "scheme_id" />
                           <div class="form-group">
                              <label for="exampleInputPassword1">Name</label>
                              <input type="text" class="form-control" id="scheme_name" placeholder="">
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleInputPassword1">Scheme Description</label>
                              <input type="text" class="form-control" id="scheme_description" placeholder="">
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleInputPassword1">Amount</label>
                              <input type="number" class="form-control" id="scheme_amount" placeholder="">
                           </div>
                        </div>
                        <div class = "col-lg-3 col-md-3 col-sm-5 ">
                           <div class="form-group">
                              <label for="exampleFormControlSelect2">User Type</label>
                              <select class="form-control" id="role_id">
                                 <c:forEach var="item" items="${roleList}">
                                    <option value="${item[0]}">${item[1]}</option>
                                 </c:forEach>
                              </select>
                           </div>
                        </div>
                       </div>                                             
                     <input type="button"  class="btn btn-success" id = "saveScheme" value="Save" />
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
                  Scheme List
               </div>
               <div class = "recentRecharge" id = "recentRecharge"  style = "background-color:#FFF;padding:5px;" >
               	<div style = "overflow:auto">
                  <table id="schemeList" class="display" style="width: 100%"></table>
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
	
	
	 $("#saveScheme").click(function (event) {
			if( $("#scheme_name").val() == "" || $("#scheme_description").val() == "" || $("#scheme_amount").val() == ""){
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
		                      schemeId: $("#scheme_id").val(),							 
						      schemeName: $("#scheme_name").val(),
						      schemeDescription: $("#scheme_description").val(),
						      schemeAmount: $("#scheme_amount").val(),
						      roleId: $("#role_id").val(),						      
						    };
							var requestJSON = JSON.stringify(formData);
							console.log(requestJSON);
						    $.ajax({
						      type: "POST",
						      url: "http://localhost:8081/schemeApi/addScheme",
						      headers: {
						    	  "Content-Type" : "application/json"
						      },
						      data: requestJSON,
						      encode: true,
						    }).done(function (data) {
						      console.log(data);
						       if (data == "Scheme Added"){							       
						    	 $("#validationError").html('<div class="alert alert-success"><strong>Success!"'+data+'"</strong></div>');
						    	 window.location.reload();
						    	    $("#schme_id").val("");		
						      		$("#scheme_name").val("");		      			
							        $("#scheme_description").val("");
							        $("#status").val("Active");								    
							        $("#role_id").val(1);
							        $("#scheme_amount").val("");
							        $("#saveScheme").val("Save");
							  } else {
								$("#validationError").html('<div class="alert alert-danger"><strong>Error! Issue while inserting</strong></div>');		
							  }		 
						    });
						    event.preventDefault(); 
					} 		 
		   
		  });
	//end of user form submit
	 $('#schemeList').DataTable({
			pageLength : 10,
			ajax : {
				url : 'http://localhost:8081/getSchemeList',
				dataSrc : ''
			},
			columns : [ { 
	            title: 'Scheme Name',
	            data : '1',
	            render: (data,type,row) => {	            	
						return '<span id="operatorValue">'+data+'</span>';
	            }
	         }, {
				title : 'Scheme Desription',
				data : '2'
			}, {
				title : 'Amount',
				data : '3'
			},
			{ 
	            mData: '',
	            data : '0',
	            render: (data,type,row) => {		          
	              return '<a href="#" id= "schemeEdit" class = "btn"><i class="fa fa-edit"></i><span style = "display:none">'+data+'</span></a>';
	            }
	         }
	         
			]
			
		});	 
	 $('#schemeList').on('click', '#schemeEdit', function(){
		 		var schemeEditValue = $(this).text();
		 		var schemeName;
		 		var schemeDescription;
		 		var roleId;
		 		var keyData;
		 		var value;
		 		$.get("http://localhost:8081/getSchemeListById/"+schemeEditValue, function(data, status){
	      		console.log(data);
	      		for(var key in data){
		      		keyData = data[key];
		      		for( value in keyData){
			      		schemeId = schemeEditValue;
		      			schemeName = keyData[1];
		      			schemeDescription = keyData[2];
		      			schemeAmount = keyData[3],
		      		    roleId = keyData[7];
		      		   
			      		}	      			
		      		}  
	      		$("#scheme_id").val(schemeId);		
	      		$("#scheme_name").val(schemeName);		      			
		        $("#scheme_description").val(schemeDescription);
		        $("#scheme_amount").val(schemeAmount);
		        $("#role_id").val(roleId);
		        $("#saveScheme").val("Update");			
		});
 	});	
		$("#resetButton").click(function(){
			 $("#schme_id").val("");		
	      		$("#scheme_name").val("");		      			
		        $("#scheme_description").val("");
		        $("#status").val("Active");								    
		        $("#role_id").val(1);
		        $("#scheme_amount").val("");
		        $("#saveScheme").val("Save");
			});
	 
	});
	</script>
   
</html>

