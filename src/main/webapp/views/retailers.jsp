<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="/css/bootstrap.min.css" rel="stylesheet">
      <link href="/css/custom.css" rel="stylesheet">
      <link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet">
      <script type="text/javascript" src="/js/jquery.min.js"></script>
      <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js" type="text/javascript"></script>    
      <script src = "/js/bootstrap.bundle.min.js" type = "text/javascript"></script>
      <script src = "/js/bootstrap.min.js" type = "text/javascript"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">
      <script src = "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js" ></script>
	  <script src ="https://cdn.datatables.net/plug-ins/1.10.11/sorting/datetime-moment.js" ></script>
      <title>Users</title>
   </head>
   <body style = "background-color:#F8F8F8">
    <jsp:include page="commonDistributor.jsp"></jsp:include>
      <div class = "container">
         <div style = "margin-top:40px"></div>
         <div class = "row">
            <div class = "col-lg-12">
               <div class = "rechargeBoxHeader" style = "background-color:white;padding:1%">
               	<div class = "row">
               		<div class = "col-lg-11 col-md-11 col-sm-11">
               		 <span style = "font-weight:700">User List</span>
               		</div>
               		<div class = "col-lg-1 col-md-1 col-sm-1">
               		<a class = "btn-outline-primary" id = "addUserButton" data-toggle="modal" data-target="#myModal"> Add User </a>
               		</div>
               	</div>
               </div>
               <div class = "recentRecharge" id = "recentRecharge"  style = "background-color:#FFF;padding:5px;" >
                  <div style = "overflow:auto">
                     <table id="userList" class="display" style="width: 100%"></table>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="modal fade" id="myModal" role="dialog">
         <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
               <div class="modal-header box_header">
                  Add User
               </div>
               <div class ="modal-body">
                  <div class = "box_content" style = "padding:2%">
                     <form >
                        <div class = "row">
                           <div class = "col-lg-4 col-md-4 col-sm-4 ">
                              <input type = "hidden" id = "role_id" />
                              <div class="form-group">
                                 <label for="">User Name (Mobile Number)</label>
                                 <input type="text" class="form-control" id="user_mobile" placeholder="UserName">
                              </div>
                           </div>
                           <div class = "col-lg-4 col-md-4 col-sm-4 ">                              
                              <div class="form-group">
                                 <label for="">	Owner Name</label>
                                 <input type="text" class="form-control" id="user_name" placeholder="OwnerName">
                              </div>
                           </div>
                           <div class = "col-lg-4 col-md-4 col-sm-4 ">
                              <div class="form-group">
                                 <label for="">Firm Name</label><br>
                                 <input type="text" class="form-control" id="user_firm_name" placeholder="FirmName">
                              </div>
                           </div>                           
                        </div>
                        <div class = "row">
                           <div class = "col-lg-4 col-md-4 col-sm-4 ">
                              <input type = "hidden" id = "user_id" />
                              <div class="form-group">
                                 <label for="">Email Address</label>
                                 <input type="text" class="form-control" id="user_email" placeholder="EmailAddress">
                              </div>
                           </div>
                           <div class = "col-lg-4 col-md-4 col-sm-4 ">                              
                              <div class="form-group">
                                 <label for="">	Pan Card</label>
                                 <input type="text" class="form-control" id="user_pancard" placeholder="Pancard">
                              </div>
                           </div>
                           <div class = "col-lg-4 col-md-4 col-sm-4 ">
                              <div class="form-group">
                                 <label for="">Area</label><br>
                                 <input type="text" class="form-control" id="user_area" placeholder="Area">
                              </div>
                           </div>                           
                        </div>
                        <div class = "row">
                        	<div class = "col-lg-4 col-md-4 col-sm-4 ">
                              <div class="form-group">
                                 <label for="">Scheme</label>
                                <div id = "schemeData"></div>
                              </div>
                           </div>
                           <div class = "col-lg-8 col-md-8 col-sm-8 ">
                              <div class="form-group">
                                 <label for="">Address</label>
                                 <input type="text" class="form-control" id="user_address" placeholder="Address">
                              </div>
                           </div>
                        </div>
                        <input type="button"  class="btn btn-success" id = "saveUser" value="Save" />
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <p style = "margin-top:10px"><span id ="validationError"></span></p>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </body>
   <script>
      $(document).ready(function() {
          $("#manageUsers").addClass("active");
    	  var userId = $("#userSessionId").val();
    	  if(userId == ""){
					alert("session is expired");
					window.location.replace("http://localhost:8081/Recharge/login");
        	  }
    	  console.log(userId);         	  
          	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
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
          	$.fn.dataTable.moment( 'h:mm:ss A');
      		$('#userList').DataTable({
      		pageLength : 10,
      		ajax : {
      			url : 'http://localhost:8081/userApi/getAllUnderUserList/'+userId,
      			dataSrc : ''
      		},
      		columns : [ {
      			title : 'Id',
      			data : '18'
      		},
      		{
      			title : 'Owner Name',
      			data : '1'
      		}, {
      			title : 'Firm Name',
      			data : '15'
      		},{
      			title : 'User Name',
      			data : '2'
      		},{
      			title : 'Add Date',
      			data : '5',
      			render: (data,type,row) => {
      				return moment(data).format('DD/MM/YYYY hh:mm:ss A');					
          			}
      		},{
      			title : 'Scheme Name',
      			data : '9'
      		},{
      			title : 'Balance',
      			data : '10'
      		},{ 
                  title: 'Status',
                  data : '7',
                  render: (data,type,row) => {
                  	if(data == "Y"){
      					return '<span id="statusButtonSuccess">Active</span>';
      	            	}
                  	else{
                  		return '<span id="statusButtonWarning">DeActive</span>';
      	            	}
                  }
               },
      		/* { 
                  mData: '',
                  data : '0',
                  render: (data,type,row) => {		          
                    return '<a id= "userEdit"  data-toggle="modal" data-target="#myModal" class = "btn"><i class="fa fa-edit"></i><span style = "display:none">'+data+'</span></a>';
                  }
               } */
      		]
      		
      	});
      
      	
      	$('#addUserButton').on('click',function(){
      		var userId = $("#userSessionId").val();
      		var keyData;
       		var value;
       		var roleId;
       		var selectedSchemeId;
       		$.get("http://localhost:8081/userApi/getUserById/"+userId, function(data, status){
        		console.log(data);
        		for(var key in data){
            		keyData = data[key];
            		for( value in keyData){      
            		    roleId = keyData[16];            		   
        	      		}	      			
            		} 
        		$("#role_id").val(roleId);
              $.get("http://localhost:8081/getSchemeUnderRole/"+roleId, function(data, status){
                 var schemeId;
                 var schemeName;
                 var underRoleId;
                 var $select = $('<select class="form-control" id="scheme_id"></select>');
                 var $option;
          		 console.log(data);
          		 for(var key in data){
              		keyData = data[key];
              		for( value in keyData){
              			schemeId = keyData[0];
              			schemeName = keyData[1]; 
              			underRoleId = keyData[2];
              			$option = $('<option value="' + schemeId + '">' + schemeName + '</option>');
          	      		}
              		$select.append($option);	              		      			
              		}   
          		$("#role_id").val(underRoleId);      	    
				$("#schemeData").html($select);
				});
        	  });
      	  });
      
      	 $("#saveUser").click(function (event) {
      			if( $("#user_name").val() == "" || $("#user_name").val() == "" || $("#user_firm_name").val() == "" || $("#user_are").val() == ""
          			|| $("#user_address").val() == ""){
      				$("#validationError").html("All Fields Are Compulsory").css("color", "red").show().delay(2000).fadeOut();
      				} 
      				else {
      					var status = 'Y';      					       											
      					 var formData = {
      							    userMobile: $("#user_mobile").val(),
			             			schemeId: $("#scheme_id").val(),
			             		    userName: $("#user_name").val(),
			             		    isActiveUser: status,
			             		    userArea: $("#user_area").val(),
			             		    userAddress: $("#user_address").val(),
			             		    userPancard: $("#user_pancard").val(),
			             		    userFirmName: $("#user_firm_name").val(),
			             		    roleId: $("#role_id").val(),
			             		    underUserId: $("#userSessionId").val(),
			             		    userEmail: $("#user_email").val(),
			             		    schemeName: $("#scheme_id option:selected").text()			             		    		     						      						      
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
      						       if (data == "User created successfully !!!"){							       
      						    	 $("#validationError").html('<div class="alert alert-success"><strong>Success!"'+data+'"</strong></div>');
      						    	setTimeout(function(){ window.location.reload();}, 1000);      						    	
      							  }
      							if (data == "User not added"){							       
     						    	 $("#validationError").html('<div class="alert alert-danger"><strong>Error! User cannot be added , contact distributor</strong></div>');
     						    	setTimeout(function(){ window.location.reload();}, 1000);      						    	
     							  }
      						     if (data == "Mobile Already Exists"){ 							       
      						    	 $("#validationError").html('<div class="alert alert-danger"><strong>Error!"'+data+'"</strong></div>').show().delay(2000).fadeOut();
      							  }
     							   if (data == "Insufficient Balance"){
      								$("#validationError").html('<div class="alert alert-danger"><strong>Error!"'+data+'"</strong></div>').show().delay(2000).fadeOut();				
          							  }
       							  if(data == "Insert error") {
      								$("#validationError").html('<div class="alert alert-danger"><strong>Error! Issue while inserting</strong></div>').show().delay(2000).fadeOut();;		
      							  }		 
      						    });
      						    event.preventDefault(); 
      					}		   
      		 		 });      	
	 		 	
      });
      	
   </script>
</html>

