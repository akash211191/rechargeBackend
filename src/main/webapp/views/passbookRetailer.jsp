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
      <script src = "/js/moment.min.js"></script>
	  <script src ="/js/datetime-moment.js"></script>
    <title>PassBook</title>
  </head>
  <body>    
    <jsp:include page="commonRetailer.jsp"></jsp:include>
      <div class = "container">
         <div style = "margin-top:40px"></div>
         <div class = "row">
            <div class = "col-lg-12">
               <div class = "rechargeBoxHeader" style = "background-color:white;padding:1%">
               	<div class = "row">
               		<div class = "col-lg-11 col-md-11 col-sm-11">
               		 <span style = "font-weight:700">PassBook</span>
               		</div>
               		<div class = "col-lg-1 col-md-1 col-sm-1">
               		<!-- <a class = "btn-outline-primary" id = "addUserButton" data-toggle="modal" data-target="#myModal"> Add User </a> -->
               		</div>
               	</div>
               </div>
               <div class = "recentRecharge" id = "recentRecharge"  style = "background-color:#FFF;padding:5px;" >
                  <div style = "overflow:auto">
                     <table id="userPassbook" class="display" style="width: 100%"></table>
                  </div>
               </div>
            </div>
         </div>
      </div>      
   </body>
   <script>
      $(document).ready(function() {
    	  var userId = $("#userSessionId").val();
    	  if(userId == ""){
					alert("session is expired");
					window.location.replace("http://localhost:8081/Recharge/login");
        	  }
    	  console.log(userId);         	  
          	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
          		$("#userBalanceDisplay").html(data+ " &#8377;");
          		$("#userBalance").html(data+ " &#8377;");      		
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
      		$('#userPassbook').DataTable({
      		"aaSorting": [],
      		pageLength : 10,
      		ajax : {
      			url : 'http://localhost:8081/getUserPassbook/'+userId,
      			dataSrc : ''
      		},
      		columns : [ {
      			title : 'Passbook Id',
      			data : '0',
      			
      		},
      		{
      			title : 'Transaction Type',
      			data : '1',
      			render: (data,type,row) => {
                  	if(data == "Debit"){
      					return '<span style = "color:red">Debit</span>';
      	            	}
                  	else{
                  		return '<span style = "color:green">Credit</span>';
      	            	}
      			}
      		}, {
      			title : 'Old Balance',
      			data : '2',
      			render: $.fn.dataTable.render.number(',', '.', 2)
      		},{
      			title : 'Amount',
      			data : '3',
      			render: $.fn.dataTable.render.number(',', '.', 2)
      		},
      		{
      			title : 'New Balance',
      			data : '4',
      			render: $.fn.dataTable.render.number(',', '.', 2)
      		},
      		{
      			title : 'Remarks',
      			data : '5'
      		},{
      			title : 'Transaction Date',
      			data : '6',
      			render: (data,type,row) => {
      				return moment(data).format('DD/MM/YYYY hh:mm:ss A');					
          			}
      		}
      		]
      	});
      		 		 	
      });
      	
   </script>
</html>

