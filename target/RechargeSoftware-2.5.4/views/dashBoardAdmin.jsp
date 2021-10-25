<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/custom.css" rel="stylesheet">
	<script src = "/js/jquery.min.js" type = "text/javascript"></script>
	<script src = "/js/bootstrap.bundle.min.js" type = "text/javascript"></script>
	<script src = "/js/bootstrap.min.js" type = "text/javascript"></script>
    <title>Dashboard</title>
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
                <a class="nav-link active" href="dashBoardAdmin">Dashboard</a>
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
                     <a class="nav-link " href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
               <a id = "userBalanceDisplay" class="logoutButton"></a><div id = "sessionDiv" style = "display:none"><input type = "text" id = "userSessionId" value = "${sessionScope.userId}"></input></div>
               &nbsp;&nbsp;            <a class="logoutButton">Logout</a>
               </form>
            </div>
         </div>
      </nav>
			
			<div class = "container">
				<div style = "margin-top:40px"></div>
				<div class = "row">
					<div class = "col-lg-12">
				          <div class = "rechargeBoxHeader"  style = "background-color:#FFF">
				            <ul id="menu" style = "margin-top:13px">
				              <li><a id = "rechargeMenu">Live Recharges</a></li>
				            </ul>
				          </div>
				          <div class = "recentRecharge" id = "recentRecharge"  style = "background-color:#FFF">
				            <div style = "padding:30px">
				              recharge data
				            </div>
          				</div>
        			</div>
				</div>
			</div>
    </body>
    <script>
    $(document).ready(function(){
    	 var userId = $("#userSessionId").val();		
         console.log(userId);         	  
         	$.get("http://localhost:8081/userApi/getUserAccountBalance/"+userId, function(data, status){
         		$("#userBalanceDisplay").html(data+ " &#8377;");
         		$("#userBalance").html(data+ " &#8377;");      		
           });
        });
    </script>
    </html>