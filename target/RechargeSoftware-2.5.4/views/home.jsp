

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
    <nav class="navbar navbar-expand-lg navbar-dark">
      <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="home">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="recharge">Recharge</a>
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
      var userId = $("#userSessionId").val();		
      console.log(userId);         	  
      	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
      		$("#userBalanceDisplay").html(data+ " &#8377;");
      		$("#userBalance").html(data+ " &#8377;");      		
        });
    }); 
  </script>
</html>

