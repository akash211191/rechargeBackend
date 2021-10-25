

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
      <title>Recharge Api</title>
   </head>
   <body>
      <jsp:include page="commonAdmin.jsp"></jsp:include>
      <div class = "container">
         <div style = "margin-top:40px"></div>
         <div class = "row">
            <div class = "col-lg-12">
               <div class = "box_header">
                  Recharge Api List
               </div>
               <div class = "recentRecharge" id = "recentRecharge"  style = "background-color:#FFF;padding:5px;" >
                  <div style = "overflow:auto">
                     <table id="rechargeApiList" class="display" style="width: 100%"></table>
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
                  Update Recharge Api
               </div>
               <div class ="modal-body">
                  <div class = "box_content" style = "padding:2%">
                     <form >
                        <div class = "row">
                           <div class = "col-lg-3 col-md-3 col-sm-5 ">
                              <input type = "hidden" id = "recharge_api_id" />
                              <div class="form-group">
                                 <label for="exampleInputPassword1">Name</label>
                                 <input type="text" class="form-control" id="recharge_api_name" placeholder="">
                              </div>
                           </div>
                           <div class = "col-lg-3 col-md-3 col-sm-5 ">
                              <input type = "hidden" id = "recharge_api_id" />
                              <div class="form-group">
                                 <label for="exampleInputPassword1">Username</label>
                                 <input type="text" class="form-control" id="recharge_username" placeholder="">
                              </div>
                           </div>
                           <div class = "col-lg-3 col-md-3 col-sm-5 ">
                              <div class="form-group">
                                 <label for="exampleInputPassword1">Password</label>
                                 <input type="text" class="form-control" id="recharge_api_password" placeholder="">
                              </div>
                           </div>
                        </div>
                        <div class = "row">
                        </div>
                        <input type="button"  class="btn btn-success" id = "updaterechargeApi" value="Update" />
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
      		$('#rechargeApiList').DataTable({
      		pageLength : 10,
      		ajax : {
      			url : 'http://localhost:8081/getRechargeApiList',
      			dataSrc : ''
      		},
      		columns : [ {
      			title : 'Name',
      			data : '1'
      		}, {
      			title : 'UserName',
      			data : '6'
      		}, {
      			title : 'Password',
      			data : '2'
      		}, { 
                  title: 'Status',
                  data : '3',
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
                    return '<a id= "rechargeApiEdit"  data-toggle="modal" data-target="#myModal" class = "btn"><i class="fa fa-edit"></i><span style = "display:none">'+data+'</span></a>';
                  }
               }
      		]
      		
      	});
      
      	
      	$('#rechargeApiList').on('click', '#rechargeApiEdit', function(){
      		var rechargeApiEditValue = $(this).text();
       		var rechargeApiName;
       		var rechargeApiUsername;
       		var rechargeApiPassword;
       		var status;
       		var keyData;
       		var value;
       		$.get("http://localhost:8081/getRechargeApiListById/"+rechargeApiEditValue, function(data, status){
        		console.log(data);
        		for(var key in data){
            		keyData = data[key];
            		for( value in keyData){
            			rechargeApiId = rechargeApiEditValue;
            			rechargeApiName = keyData[1];
            			rechargeApiUsername = keyData[6];
            			rechargeApiPassword = keyData[2]
            		    status = keyData[3];
        	      		}	      			
            		}      
        		$("#recharge_api_id").val(rechargeApiId);		
        		$("#recharge_api_name").val(rechargeApiName);		      			
              $("#recharge_api_password").val(rechargeApiPassword);
              $("#recharge_username").val(rechargeApiUsername);
              if(status == "Y"){
              	$("#status").val("Active");
      	        }
              else{
              	$("#status").val("DeActive");
      	        } 
        	  });
      	});
      
      	 $("#updaterechargeApi").click(function (event) {
      			if( $("#recharge_api_name").val() == "" || $("#recharge_api_password").val() == "" || $("#status").val() == ""){
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
      							 rechargeApiId: $("#recharge_api_id").val(),							 
      							 rechargeApiName: $("#recharge_api_name").val(),
      							 rechargeApiPassword:  $("#recharge_api_password").val(),
      							 rechargeApiUsername: $("#recharge_username").val()						     						      						      
      						    };
      							var requestJSON = JSON.stringify(formData);
      							console.log(requestJSON);
      						    $.ajax({
      						      type: "POST",
      						      url: "http://localhost:8081/rechargeApi/addRechargeApi",
      						      headers: {
      						    	  "Content-Type" : "application/json"
      						      },
      						      data: requestJSON,
      						      encode: true,
      						    }).done(function (data) {
      						      console.log(data);
      						       if (data == "Recharge API updated"){							       
      						    	 $("#validationError").html('<div class="alert alert-success"><strong>Success!"'+data+'"</strong></div>');
      						    	 window.location.reload();
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

