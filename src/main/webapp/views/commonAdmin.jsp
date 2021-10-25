<nav class="navbar navbar-expand-lg navbar-dark">
         <div class="container">           
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarScroll">
               <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav" style="--bs-scroll-height: 100px;">
               <li class="nav-item">
                <a class="nav-link" id = "dashBoardAdmin" href="dashBoardAdmin" aria-current="page" >Dashboard</a>
               </li>
                  <li class="nav-item dropdown">
                     <a class="nav-link" href="#" id="master" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Master
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" id = "operators" href="operators">Operators</a></li>
                        <li>
                           <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" id = "smsapi" href="smsapi">SMS Api</a></li>
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
                     <a class="nav-link" href="#" id="settings" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                     <a class="nav-link" href="users" id="users" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Users
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="manageUser">Manage User</a></li>
                        <li>
                           <hr class="dropdown-divider">
                        </li>
                     </ul>
                  </li>
                   <li class="nav-item dropdown">
                     <a class="nav-link" href="users" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Reports
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="passbook">PassBook</a></li>                        
                     </ul>
            	   </li>			        
               </ul>
               <a id = "userBalanceDisplay" class="logoutButton"></a><div id = "sessionDiv" style = "display:none"><input type = "text" id = "userSessionId" value = "${sessionScope.userId}"></input></div>
               <form class="d-flex">                                
               <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav" style="--bs-scroll-height: 100px;">
               		<li class="nav-item dropdown">
                     <a class="nav-link active" href="users" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Administator
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                     <li>
                     	<a class="dropdown-item" id = "profile" href="profile">Profile</a>
                        <a href = "logout" class="dropdown-item">Logout</a> 
                     </li>                      
                     </ul>
            	   </li>
            	   </ul>
               </form>
            </div>
         </div>
      </nav>      