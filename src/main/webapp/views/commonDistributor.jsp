<nav class="navbar navbar-expand-lg navbar-light" style = "border-bottom:1px solid rgba(0, 40, 100, 0.12);background-color:#FFF;padding:0px">
      <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <img src = "/images/rechargeLogo.png" style = "width:11%"></img>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          </ul>
          <button id = "userBalanceDisplay" class="btn btn-outline-success" type="button"></button><div id = "sessionDiv" style = "display:none"><input type = "text" id = "userSessionId" value = "${sessionScope.userId}"></input></div> 
          <form class="d-flex">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          	         <li class="nav-item dropdown" style = "width:170px">
                     <a role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     <img src = "/images/userLogo.png" style = "height:45px;width:45px" align = "left"></img> <span id = "userName"></span><br><span id = "roleName"></span>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="logout">Logout</a></li>                        
                     </ul>
                     </a>
            		</li>
             </ul>
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
              <a class="nav-link" id = "home" aria-current="page" href="home">Home</a>
            </li>
            <li class="nav-item dropdown">
                     <a class="nav-link" href="users" id="funds" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Funds
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="fundTransfer">Funds Transfer</a></li>                        
                     </ul>
            </li>
            <li class="nav-item dropdown">
                     <a class="nav-link" href="users" id="reports" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Reports
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="passbookDistributor">PassBook</a></li>                        
                     </ul>
            </li>
            <li class="nav-item dropdown">
                     <a class="nav-link" href="users" id="manageUsers" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                     Manage Users
                     </a>
                     <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item" href="retailers">Users</a></li>                        
                     </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link"  href="settings">Settings</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>