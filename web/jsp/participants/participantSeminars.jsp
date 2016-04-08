<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link type="text/css" rel="stylesheet" href="../../css/style.css" />
	<link type="text/css" rel="stylesheet" href="../../css/headerAndFooter.css" />
	<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../../css/bootstrap-formhelpers.css" rel="stylesheet" type="text/css" />

	<title>UST eTrams - Seminars & Sessions</title>
</head>

<body>

	<!-- Header -->
	<%@ include file="participantHeader.jsp"%>
	<!-- End of Header -->

	<!-- Container -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">Seminars</h1>

				<!-- Content -->
				<div class="content">
				
			 		<div class="row options">
			 			<!-- Filter Data -->
						<div class="col-sm-2">
							<form action="">
								<div class="input-group">
									<div class="bfh-selectbox" data-name="filterUsers" data-value="All" id="filterUsers">
										<div data-value="All">All</div>
										<div data-value="Ongoing">Ongoing</div>
										<div data-value="Completed">Completed</div>
									</div>
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit">Filter</button>
									</span>
								</div>
							</form>
						</div>
						<!-- End of Filter -->
						
						<!-- Other Filter Data -->
						<div class="col-sm-3">
							<form action="">
								<div class="input-group">
									<div class="bfh-selectbox" data-name="filterUsers" data-value="All" id="filterUsers">
										<div data-value="AlphabeticalAsc">By Alphabetical (Asc)</div>
										<div data-value="AlphabeticalDesc">By Alphabetical (Desc)</div>
										<div data-value="DateAsc">By Date (Asc)</div>
										<div data-value="DateAsc">By Date (Desc)</div>
									</div>
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit">Filter</button>
									</span>
								</div>
							</form>
						</div>
						<!-- End of Other Filter -->
						
						<!-- Search -->
						<div class="col-sm-offset-4 col-sm-3">
							<form method="post" action="../../dbcontrol">
								<input type="hidden" name="requestType" value="searchSeminar">
								<div class="input-group">
									<input name="search" type="text" class="form-control" placeholder="Search">
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
									</span>
								</div>
							</form>
						</div>
						<!-- End of Search -->
							
			 		</div>
			 		
			 		<br>
			 		
					<div class="row" id="ssList">
						<%
							ResultSet rs = (ResultSet) session.getAttribute("seminars");
							int seminars = 0;
							
							while (rs.next()) {
						%>
						<div class="col-sm-6 col-md-3">
							
							<%if (rs.getInt(6) == 1) { %>
								<button class="thumbnail complete" id="buttonDivContainer" data-toggle="popover"
									data-trigger="focus" data-html="true" data-placement="auto"
									data-content="
										<span id='dataContent_<%= rs.getInt(1)%>' data-semname='<%=rs.getString(3) %>' data-semtopic='<%=rs.getString(4) %>' data-semid='<%=rs.getInt(1) %>'></span>
  										<p> <%=rs.getString(4)%> </p><br>
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='participantSessions.jsp'>View Sessions</a>
  										</div>
  									">
									<div class="caption complete">
										<div class="seminarTitle">
											<h3><%=rs.getString(3)%></h3>
										</div>
										<p>
											<strong>Date Created:</strong>
											<%=rs.getDate(5)%>
										</p>
										<p>
											<strong>Status:</strong>
											<span>COMPLETED</span>
										</p>
									</div>
								</button>
							<% } else { %>
								<button class="thumbnail" id="buttonDivContainer" data-toggle="popover"
									data-trigger="focus" data-html="true" data-placement="auto"
									data-content="
										<span id='dataContent_<%= rs.getInt(1)%>' data-semname='<%=rs.getString(3) %>' data-semtopic='<%=rs.getString(4) %>' data-semid='<%=rs.getInt(1) %>'></span>
  										<p> <%=rs.getString(4)%> </p><br>
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='participantSessions.jsp'>View Sessions</a>
  										</div>
  									">
									<div class="caption">
										<div class="seminarTitle">
											<h3><%=rs.getString(3)%></h3>
										</div>
										<p>
											<strong>Date Created:</strong>
											<%=rs.getDate(5)%>
										</p>
										<p>
											<strong>Status:</strong>
											<span>ONGOING</span>
										</p>
									</div>
								</button>
							<% } %>
						</div>

						<%
							seminars++;
							}
							rs.first();
							rs.previous();
						%>
					</div>
					
					<!-- Announcements pagination -->
					<p id="legend1"></p>
					<br><br>
					<div class="holder">
   					</div>
					<!-- End of Announcements pagination -->
					
				</div>
				<!-- End of Content -->

				<!-- End of Modals -->

			</div>
		</div>
	</div>
	<!-- End of Container -->

	<!-- Footer -->
	<%@ include file="../footer.jsp"%>
	<!-- End of Footer -->
	
</body>

<script src="../../js/jquery.js"></script>
<script src="../../js/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>

<script type="text/javascript" src="../../js/jPages.min.js"></script>
<script type="text/javascript" src="../../js/myscript.js"></script>

</html>