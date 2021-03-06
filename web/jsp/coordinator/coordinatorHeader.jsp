<!-- coordinator Header -->

<nav class="navbar navbar-static-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" >
        		<img alt="eTrams logo" src="../../img/logo.png">
      		</a>
		</div>
		
		<%
			String servletPath=request.getServletPath();
			String x = servletPath.substring(servletPath.lastIndexOf("/")+1, servletPath.length());
		%>
				
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				
				<% if (x.equals("coordinatorHome.jsp")) { %>
                 	<li class="active"><a href="../../dbcontrol?requestType=home">Home</a></li>
               	<% } else { %>
					<li><a href="../../dbcontrol?requestType=home">Home</a></li>
				<% } %>
				
				<% if (x.equals("coordinatorSeminars.jsp") || x.equals("coordinatorSessions.jsp") || 
						x.equals("coordinatorManageParticipants.jsp") || x.equals("coordinatorManageCertification.jsp")) {
				%>
                 	<li class="active"><a href="../../dbcontrol?requestType=goToCoordinatorSeminar">Seminars & Sessions</a></li>
               	<% } else { %>
					<li><a href="../../dbcontrol?requestType=goToCoordinatorSeminar">Seminars & Sessions</a></li>
				<% } %>
				
				<% if (x.equals("coordinatorReports.jsp")) { %>
                 	<li class="active"><a href="../../dbcontrol?requestType=goToCoordinatorReports">Reports</a></li>
               	<% } else { %>
					<li><a href="../../dbcontrol?requestType=goToCoordinatorReports">Reports</a></li>
				<% } %>
				
				<% if (x.equals("coordinatorUsers.jsp") || x.equals("coordinatorManageUsers.jsp")) { %>
                 	<li class="active dropdown">
                 		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Others<span class="caret"></span></a>
        				<ul class="dropdown-menu">
            				<li><a href="../../dbcontrol?requestType=coordinatorUser">All Users</a></li>
          				</ul>
        			</li>
               	<% } else { %>
					<li class="dropdown">
        				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Others<span class="caret"></span></a>
        				<ul class="dropdown-menu">
            				<li><a href="../../dbcontrol?requestType=coordinatorUser">All Users</a></li>
          				</ul>
        			</li>
				<% } %>
				
			</ul>

			<ul class="nav navbar-nav navbar-right">
				
				<% if (x.equals("coordinatorAccount_Profile.jsp") || x.equals("coordinatorAccount_Attendance.jsp")) { %>
					<li class="active dropdown">
                 		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                 			<span class="glyphicon glyphicon-user"></span> My Account<span class="caret"></span>
                 		</a>
        				<ul class="dropdown-menu">
            				<li><a href="../../dbcontrol?requestType=myAccount">Profile</a></li>
            				<li role="separator" class="divider"></li>
            				<li><a href="../../dbcontrol?requestType=myHistory">Attendance History</a></li>
          				</ul>
        			</li>
               	<% } else { %>
               		<li class="dropdown">
                 		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                 			<span class="glyphicon glyphicon-user"></span> My Account<span class="caret"></span>
                 		</a>
        				<ul class="dropdown-menu">
            				<li><a href="../../dbcontrol?requestType=myAccount">Profile</a></li>
            				<li role="separator" class="divider"></li>
            				<li><a href="../../dbcontrol?requestType=myHistory">Attendance History</a></li>
          				</ul>
        			</li>
				<% } %>
				
				<li><a href="../../dbcontrol?requestType=logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</div>
</nav>