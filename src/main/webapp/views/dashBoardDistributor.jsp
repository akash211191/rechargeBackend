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
    <jsp:include page="commonDistributor.jsp"></jsp:include>
    <div class = "container">
      <div class = "row">
        <div class = "col-lg-2">
          <div style = "margin-top:25px"></div>
          <div class = "balanceAmount" id = "balanceAmount"  style = "background-color:#FFF">
            <div style = "padding:30px">
              <span id = "userBalance" style = "font-size: 29px;"></span><br>Balance
            </div>
          </div>
        </div>
        <div class = "col-lg-2">
          <div style = "margin-top:25px"></div>
          <div class = "successTransaction" id = "successTransaction"  style = "background-color:#FFF">
            <div style = "padding:30px">
              0 Rs<br>Success Transaction
            </div>
          </div>
        </div>
        <div class = "col-lg-2">
          <div style = "margin-top:25px"></div>
          <div class = "failedTransaction" id = "failedTransaction"  style = "background-color:#FFF">
            <div style = "padding:30px">
              0 Rs<br>Failed Transaction
            </div>
          </div>
        </div>
        <div class = "col-lg-2">
          <div style = "margin-top:25px"></div>
          <div class = "pendingTransaction" id = "pendingTransaction"  style = "background-color:#FFF">
            <div style = "padding:30px">
              0 Rs<br>Pending Transaction
            </div>
          </div>
        </div>
      </div>
      <div class = "row">
        <div style = "margin-top:25px"></div>
        <div class = "col-lg-7">
          <div class = "rechargeBoxHeader"  style = "background-color:#FFF">
            <ul id="menu" style = "margin-top:13px">
              <li><a id = "rechargeMenu">Recent Recharge</a></li>
            </ul>
          </div>
          <div class = "recentRecharge" id = "recentRecharge"  style = "background-color:#FFF">
            <div style = "padding:30px">
              No recharge Available
            </div>
          </div>
        </div>
        <div class = "col-lg-1"></div>
        <div class = "col-lg-4">
          <div class = "rechargeBoxHeader"  style = "background-color:#FFF">
            <ul id="menu" style = "margin-top:13px">
              <li><a id = "rechargeMenu">Recent Recharge</a></li>
            </ul>
          </div>
          <div class = "recentRechargePercentage" id = "recentRechargePercentage"  style = "background-color:#FFF">
            <div style = "padding:30px">
              Success 0%
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script>
    $(document).ready(function() {    
        $("#home").addClass("active");
      var userId = $("#userSessionId").val();		
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
    }); 
  </script>
</html>

