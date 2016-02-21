<!-- Staff Header -->

<nav class="navbar navbar-static-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" >
        		<img alt="eTrams logo" src="../img/logo.png">
      		</a>
		</div>
		
		<%
			String servletPath=request.getServletPath();
			String x = servletPath.substring(servletPath.lastIndexOf("/")+1, servletPath.length());
		%>
				
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				
				<% if (x.equals("staffHome.jsp")) { %>
                 	<li class="active"><a href="staffHome.jsp">Home</a></li>
               	<% } else { %>
					<li><a href="staffHome.jsp">Home</a></li>
				<% } %>
				
				<% if (x.equals("staffSeminars.jsp") || x.equals("staffSessions.jsp") || x.equals("staffManageParticipants.jsp")) { %>
                 	<li class="active"><a href="staffSeminars.jsp">Seminars & Sessions</a></li>
               	<% } else { %>
					<li><a href="staffSeminars.jsp">Seminars & Sessions</a></li>
				<% } %>
				
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<% if (x.equals("staffAccount.jsp")) { %>
                 	<li class="active"><a href="staffAccount.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
               	<% } else { %>
					<li><a href="staffAccount.jsp"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
				<% } %>
				
				<li><a href="../index.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- End of Staff Header -->