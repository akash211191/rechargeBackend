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
      <script src = "/js/moment.min.js" ></script>
	  <script src ="/js/datetime-moment.js" ></script>
      <title>Manage Users</title>
   </head>
   <body>
     <jsp:include page="commonAdmin.jsp"></jsp:include>
      <div class = "container">
         <div style = "margin-top:40px"></div>
         <div class = "row">
            <div class = "col-lg-12">
               <div class = "box_header">
                  User List
               </div>
               <div class="form-group" style= "background-color:#FFF;padding:25px;">
                     <select class="form-control" id="filter_role_id" style = "width:20%;">
                    	<option value = "" selected>Select Role</option>	
					    <c:forEach var="item" items="${roleList}">
					        <option value="${item[0]}">${item[1]}</option>
					    </c:forEach>
					</select>
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
                  Update User
               </div>
               <div class ="modal-body">
                  <div class = "box_content" style = "padding:2%">
                     <form >
                        <div class = "row">
                           <div class = "col-lg-3 col-md-3 col-sm-5 ">
                              <input type = "hidden" id = "user_id" />
                              <div class="form-group">
                                 <label for="">User Name</label>
                                 <input type="text" class="form-control" id="user_user_name" placeholder="">
                              </div>
                           </div>
                           <div class = "col-lg-3 col-md-3 col-sm-5 ">                              
                              <div class="form-group">
                                 <label for="">User Type</label><br>
                                 <label id = "user_type" style = "margin-top:2px;font-weight:bold"></label>                                 
                              </div>
                           </div>
                           <div class = "col-lg-3 col-md-3 col-sm-3 ">
                              <div class="form-group">
                                 <label for="">Parent</label><br>
                                 <label id = "user_parent" style = "margin-top:2px;font-weight:bold"></label>
                              </div>
                           </div>
                           <div class = "col-lg-3 col-md-3 col-sm-3 ">
                              <div class="form-group">
                                 <label id = "unique_user_id" style = "margin-top:2px;font-weight:bold;color:red"></label><br>
                                 <label id = "user_balance" style = "font-weight:bold;color:red"></label>
                                 <label id = "virtual_balance" style = "font-weight:bold;color:red"></label>
                              </div>
                           </div>
                        </div>
                        <div class = "row">
                        <div class = "col-lg-3 col-md-3 col-sm-3 ">
                              <div class="form-group">
                                 <label for="">Scheme</label>
                                <div id = "schemeData"></div>
                              </div>
                           </div>
                           <div class = "col-lg-3 col-md-3 col-sm-3 ">
                              <div class="form-group">
                                 <label for="">Password</label>
                                 <input type="text" class="form-control" id="user_password" placeholder="">
                              </div>
                           </div>
                           <div class = "col-lg-6 col-md-6 col-sm-6 ">
                              <div class="form-group">
                                 <label for="">Name</label>
                                 <input type="text" class="form-control" id="user_name" placeholder="">
                              </div>
                           </div>                           
                        </div>
                        <div class = "row">
                        	<div class = "col-lg-6 col-md-6 col-sm-6 ">
                              <div class="form-group">
                                 <label for="">Firm Name</label>
                                 <input type="text" class="form-control" id="user_firm_name" placeholder="">
                              </div>
                           </div>
                           <div class = "col-lg-6 col-md-6 col-sm-6 ">
                              <div class="form-group">
                                 <label for="">PAN Card</label>
                                 <input type="text" class="form-control" id="user_pancard" placeholder="">
                              </div>
                           </div>
                        </div>
                        <div class = "row">
                        	<div class = "col-lg-4 col-md-4 col-sm-4 ">
                              <div class="form-group">
                                 <label for="">Area</label>
                                 <input type="text" class="form-control" id="user_area" placeholder="">
                              </div>
                           </div>
                           <div class = "col-lg-2 col-md-2 col-sm-2 ">
                              <div class="form-group">
                                 <label for="">Expiry Date</label><br>
                                 <label id = "expiry_date" style = "margin-top:2px;font-weight:bold"></label> 
                              </div>
                           </div>
                           <div class = "col-lg-6 col-md-6 col-sm-6 ">                              
                              <div class="form-check">
								  <input class="form-check-input" type="checkbox" id="status">
								  <label class="form-check-label" for="flexCheckDefault">
								    Active
								  </label>
								</div>                            
                           </div>                           
                        </div>
                        <div class = "row">
                        <div class = "col-lg-12 col-md-12 col-sm-12 ">
                              <div class="form-group">
                                 <label for="">Address</label>
                                 <input type="text" class="form-control" id="user_address" placeholder="">
                              </div>
                           </div>
                        </div>
                        <input type="button"  class="btn btn-success" id = "updateUser" value="Update" />
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
          	$("#users").addClass("active");
    	    $.fn.dataTable.moment( 'h:mm:ss A');
    	    $("#filter_role_id").change(function(){
        	    var roleId = $(this).val();
    	    	$('#userList').DataTable({
        	    	destroy: true,
    	      		pageLength : 10,
    	      		ajax : {
    	      			url : 'http://localhost:8081/userApi/getAllUserList/'+roleId,
    	      			dataSrc : ''
    	      		},
    	      		columns : [ {
    	      			title : 'Name',
    	      			data : '1'
    	      		}, {
    	      			title : 'UserName',
    	      			data : '2'
    	      		}, {
    	      			title : 'Password',
    	      			data : '3'
    	      		}, {
    	      			title : 'UserType',
    	      			data : '4'
    	      		},  {
    	      			title : 'CreatedDate',
    	      			data : '5',
    	      			render: (data,type,row) => {
    	      				return moment(data).format('DD/MM/YYYY hh:mm:ss A');					
    	          			}
    	      		},  {
    	      			title : 'LastUpdatedDate',
    	      			data : '6',
    	      			render: (data,type,row) => {
    	      				return moment(data).format('DD/MM/YYYY hh:mm:ss A');					
    	          			}
    	      		},  {
    	      			title : 'Parent',
    	      			data : '8'
    	      		},  {
    	      			title : 'Scheme Name',
    	      			data : '9'
    	      		},{
    	      			title : 'Balance',
    	      			data : '10',
    	      			render: $.fn.dataTable.render.number(',', '.', 2)
    	      		}
    	         	,{ 
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
    	      		{ 
    	                  mData: '',
    	                  data : '0',
    	                  render: (data,type,row) => {		          
    	                    return '<a id= "userEdit"  data-toggle="modal" data-target="#myModal" class = "btn"><i class="fa fa-edit"></i><span style = "display:none">'+data+'</span></a>';
    	                  }
    	               }
    	      		]
    	      		
    	      	});
    	      
    	      	
    	      	$('#userList').on('click', '#userEdit', function(){
    	      		var userEditValue = $(this).text();
    	       		var userName;
    	       		var userUsername;
    	       		var userPassword;
    	       		var status;
    	       		var keyData;
    	       		var value;
    	       		var roleId;
    	       		var selectedSchemeId;
    	       		$.get("http://localhost:8081/userApi/getUserById/"+userEditValue, function(data, status){
    	        		console.log(data);
    	        		for(var key in data){
    	            		keyData = data[key];
    	            		for( value in keyData){
    	            			userId = userEditValue;
    	            			userMobile = keyData[2];
    	            			userPassword = keyData[3];
    	            		    role_name = keyData[4];
    	            		    parent = keyData[8];
    	            		    scheme = keyData[9];
    	            		    userName = keyData[1];
    	            		    status = keyData[7];
    	            		    userArea = keyData[11];
    	            		    userAddress = keyData[12];
    	            		    userPancard = keyData[13];
    	            		    expiryDate = keyData[14];
    	            		    userFirmName = keyData[15];
    	            		    roleId = keyData[16];
    	            		    selectedSchemeId = keyData[17];
    	            		    userBalance = keyData[19];
    	            		    uniqueUserId = keyData[18];
    	            		    virtualBalance = keyData[20];
    	        	      		}	      			
    	            		}      
    	        		$("#user_id").val(userId);		
    	        		$("#user_user_name").val(userMobile);		      			
    	                $("#user_password").val(userPassword);
    	                $("#user_type").text(role_name);
    	                $("#user_parent").text(parent);
    	                $("#user_scheme").val(scheme);
    	                $("#user_name").val(userName);
    	                $("#status").val(status);
    	                $("#user_area").val(userArea);
    	                $("#user_address").val(userAddress);
    	                $("#user_pancard").val(userPancard);
    	                $("#expiry_date").text(expiryDate);
    	                $("#user_firm_name").val(userFirmName);
    	                $("#user_balance").html("Balance: "+userBalance.toFixed(2)+"&#8377;");
    	                $("#virtual_balance").html("Virtual Balance: "+virtualBalance.toFixed(2)+"&#8377;");
    	                $("#unique_user_id").html(uniqueUserId);
    	              if(status == "Y"){
    	              	$("#status").val("Active");
    	              	$("#status").attr("checked",'checked');
    	      	        }
    	              else{
    	              	$("#status").val("DeActive");
    	      	        } 
    	              $.get("http://localhost:8081/getSchemeForRole/"+roleId, function(data, status){
    	                 var schemeId;
    	                 var schemeName;
    	                 var $select = $('<select class="form-control" id="scheme_id"></select>');
    	                 var $option;
    	          		 console.log(data);
    	          		 for(var key in data){
    	              		keyData = data[key];
    	              		for( value in keyData){
    	              			schemeId = keyData[0];
    	              			schemeName = keyData[1]; 
    	              			$option = $('<option value="' + schemeId + '">' + schemeName + '</option>');
    	          	      		}
    	              		$select.append($option);	              		      			
    	              		}         	    
    					$("#schemeData").html($select);
    					$("#scheme_id").val(selectedSchemeId);
    					});
    	        	  });
    	      	  });
    	      
    	      	 $("#updateUser").click(function (event) {
    	      			if( $("#user_name").val() == "" || $("#user_password").val() == "" || $("#status").val() == ""){
    	      				$("#validationError").html("All Fields Are Compulsory").css("color", "red");
    	      				} 
    	      				else {
    	      					var status = $("#status").val();
    	      					 if ($("#status").prop("checked")) {
    	      						status = "Y";
    	      				    }
    	      					 else{
    	      						status = "N";
    	          					 }      											
    	      					 var formData = {
    	      							    userId: $("#user_id").val(),
    				             			userMobile: $("#user_user_name").val(),
    				             			userPassword: $("#user_password").val(),
    				             		    schemeId: $("#scheme_id").val(),
    				             		    userName: $("#user_name").val(),
    				             		    isActiveUser: status,
    				             		    userArea: $("#user_area").val(),
    				             		    userAddress: $("#user_address").val(),
    				             		    userPancard: $("#user_pancard").val(),
    				             		    userFirmName: $("#user_firm_name").val()		     						      						      
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
    	      						       if (data == "User updated successfully !!!"){							       
    	      						    	 $("#validationError").html('<div class="alert alert-success"><strong>Success!"'+data+'"</strong></div>');
    	      						    	setTimeout(function(){ window.location.reload();}, 1000);
    	      						    	
    	      							  } else {
    	      								$("#validationError").html('<div class="alert alert-danger"><strong>Error! Issue while inserting</strong></div>');		
    	      							  }		 
    	      						    });
    	      						    event.preventDefault(); 
    	      					}		   
    	      		 		 });
  		             	});      		      		
      });
      	
   </script>
</html>

