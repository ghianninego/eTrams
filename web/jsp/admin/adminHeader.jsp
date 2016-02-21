<!-- Admin Header -->

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
				
				
				<% if (x.equals("adminHome.jsp")) { %>
                 	<li class="active"><a href="adminHome.jsp">Home</a></li>
               	<% } else { %>
					<li><a href="adminHome.jsp">Home</a></li>
				<% } %>
				
				<% if (x.equals("adminSeminars.jsp") || x.equals("adminSessions.jsp") || x.equals("adminManageParticipants.jsp")) { %>
                 	<li class="active"><a href="adminSeminars.jsp">Seminars & Sessions</a></li>
               	<% } else { %>
					<li><a href="adminSeminars.jsp">Seminars & Sessions</a></li>
				<% } %>
				
				<% if (x.equals("adminReports.jsp")) { %>
                 	<li class="active"><a href="adminReports.jsp">Reports</a></li>
               	<% } else { %>
					<li><a href="adminReports.jsp">Reports</a></li>
				<% } %>
				
				<% if (x.equals("adminUsers.jsp") || x.equals("adminColleges.jsp")|| x.equals("adminManageUsers.jsp")) { %>
                 	<li class="active dropdown">
                 		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Others<span class="caret"></span></a>
        				<ul class="dropdown-menu">
            				<li><a href="adminUsers.jsp">Users</a></li>
            				<li role="separator" class="divider"></li>
            				<li><a href="adminColleges.jsp">Faculties/Colleges/Institutes</a></li>
          				</ul>
        			</li>
               	<% } else { %>
					<li class="dropdown">
        			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Others<span class="caret"></span></a>
        				<ul class="dropdown-menu">
            				<li><a href="adminUsers.jsp">All Users</a></li>
            				<li role="separator" class="divider"></li>
            				<li><a href="adminColleges.jsp">Faculties/Colleges/Institutes</a></li>
          				</ul>
        			</li>
				<% } %>
				
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<% if (x.equals("adminAccount.jsp")) { %>
                 	<li class="active"><a href="adminAccount.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
               	<% } else { %>
					<li><a href="adminAccount.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
				<% } %>
				
				<li><a href="../index.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</div>
</nav>