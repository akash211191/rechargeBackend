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
    <title>DashBoard</title>
  </head>
  <body>
    <jsp:include page="commonAdmin.jsp"></jsp:include>
			<div class = "container">
				<div style = "margin-top:40px"></div>
				<div class = "row">
					<div class = "col-lg-12">
				          <div class = "rechargeBoxHeader"  style = "background-color:#FFF;">
				            <ul id="menu" style = "margin-top:13px">
				              <li><a id = "rechargeMenu">Live Recharges</a>
				              	<img id = "loadingImage" src = "/images/loading.gif" style = "width:5%"/>
				              </li>
				            </ul>
				          </div>
				          <div class = "recentRecharge" id = "recentRecharge"  style = "background-color:#FFF;padding:0px !important">
				           <div style = "padding:0px">
				              <div style = "overflow:auto">
				                  <table id="recentRechargeTable" class="display" style="width: 100%"></table>
				              </div>
				            </div>
          				</div>
        			</div>
				</div>
			</div>
    </body>
    <script>
    $(document).ready(function(){
        $("#dashBoardAdmin").addClass("active");
    	 var userId = $("#userSessionId").val();		
         console.log(userId);         	  
         	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
         		$("#userBalanceDisplay").html(data.toFixed(2)+ " &#8377;");
         		$("#userBalance").html(data.toFixed(2)+ " &#8377;");      		
           });

    $.fn.dataTable.moment( 'h:mm:ss A');
		var table = $('#recentRechargeTable').DataTable({
		"aaSorting": [],
		 "bPaginate": false,
	    "bLengthChange": false,
	    "bFilter": false,
	    "bInfo": false,
		pageLength : 20,
		ajax : {
			url : 'http://localhost:8081/getAllRechargeReport/',
			dataSrc : ''
		},
		columns : [ {
			title : 'Id',
			data : '0',
			
		},
		{
			title : 'User Name',
			data : '1',
			render: function (data,type,row) {
	            return data + '<br>/' +row[3];
	        }
			
		} , {
			title : 'Number',
			data : '4'
		},{
			title : 'Operator',
			data : '5'
		},
		{
			title : 'Amount',
			data : '6',
			render: $.fn.dataTable.render.number(',', '.', 2)
		},
		{
			title : 'ApiName',
			data : '7'
		},
		{
			title : 'Balance',
			data : '12',
			render: $.fn.dataTable.render.number(',', '.', 2)
		},
		{
			title : 'Transaction Date',
			data : '8',
			render: (data,type,row) => {
				return moment(data).format('DD/MM/YYYY hh:mm:ss A');					
  			}
		},
		{
			title : 'Status',
			data : '11',
			render: (data,type,row) => {
          	if(data == "N"){
					return '<span style = "color:red">Failed</span>';
	            	}
          	else{
          		return '<span style = "color:green">Success</span>';
	            	}
			}
		}
		]
		});
		$("#loadingImage").show();
		 setInterval( function () {
			$("#loadingImage").hide();
			setInterval( function () {
				$("#loadingImage").show();
			},22000);
			console.log(table);
		    table.ajax.reload();
		}, 25000 );
    });

    </script>
    </html>