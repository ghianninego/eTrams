<!-- Participant Header -->

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
				
				
				<% if (x.equals("participantHome.jsp")) { %>
                 	<li class="active"><a href="../../dbcontrol?requestType=home">Home</a></li>
               	<% } else { %>
					<li><a href="../../dbcontrol?requestType=home">Home</a></li>
				<% } %>
				
				<% if (x.equals("participantSeminars.jsp") || x.equals("participantSessions.jsp")) { %>
                 	<li class="active"><a href="../../dbcontrol?requestType=goToSeminar">Seminars & Sessions</a></li>
               	<% } else { %>
					<li><a href="../../dbcontrol?requestType=goToSeminar">Seminars & Sessions</a></li>
				<% } %>
				
			</ul>

			<ul class="nav navbar-nav navbar-right">
					
				<% if (x.equals("participantAccount_Profile.jsp") || x.equals("participantAccount_Attendance.jsp")) { %>
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
				
				<li><a href="../../index.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- End of Participant Header -->