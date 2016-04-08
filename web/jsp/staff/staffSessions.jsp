<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
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
	<%@ include file="staffHeader.jsp"%>
	<!-- End of Header -->

	<!-- Container -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">
					<small><a href="coordinatorSeminars.jsp">Seminar Name</a>
						/ </small> Sessions
				</h1>

				<!-- Content -->
				<div class="content">
				
					<div class="row options">
			 			<!-- Filter Data -->
						<div class="col-sm-2">
							<form action="">
								<div class="input-group">
									<div class="bfh-selectbox" data-name="filterUsers" data-value="All" id="filterUsers">
										<div data-value="All">All</div>
										<div data-value="ongoing">Ongoing</div>
										<div data-value="completed">Completed</div>
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
			 		</div>
			 		
			 		<br>
			 		
					<div class="row" id="ssList">
						<%
							ResultSet rs = (ResultSet) session.getAttribute("session");
							ResultSet rs2 = (ResultSet) session.getAttribute("venue");
							ResultSet rs3 = (ResultSet) session.getAttribute("speakers");
							int sessions = 0;
							DateFormat format = new SimpleDateFormat("h:mm a");
							DateFormat df = new SimpleDateFormat("MM/dd/yyyy");

							while (rs.next()) {
								String str = format.format(rs.getTime(8));
								String str2 = format.format(rs.getTime(9));
								String editDate = df.format(rs.getDate(7));
						%>
						<div class="col-sm-6 col-md-3">
							<% if (rs.getInt(11) == 1) { %>
								<button class="thumbnail" data-toggle="popover" data-trigger="focus" 
									data-html="true" data-placement="bottom" data-content="
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='staffManageParticipants.jsp'>Manage Participants</a>
  										</div>
  									">

									<div class="caption complete">
										<div class="sessionTitle">
											<h3><%=rs.getString(3)%></h3>
										</div>
										<p>
											<strong>Time:</strong> <%=str%> - <%=str2%>
											<br>
  											<strong>Date:</strong> <%=rs.getDate(7)%>
  											<br>
  											<strong>Venue:</strong> <%=rs.getString(5)%>, <%=rs.getString(4)%>
  											<br>
  											<strong>Speaker:</strong> <%=rs.getString(13)%>, <%=rs.getString(14)%> <%=rs.getString(15)%>
  											<br>
  											<strong>Capacity:</strong> <%=rs.getInt(6)%>
											<br>	
											<strong>Status:</strong> <span>COMPLETED</span>
										</p>
									</div>
								</button>
								
							<% } else { %>
								<button class="thumbnail" data-toggle="popover" data-trigger="focus" 
									data-html="true" data-placement="bottom" data-content="
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='staffManageParticipants.jsp'>View Participants</a>
  										</div>
  									">

									<div class="caption">
										<div class="sessionTitle">
											<h3><%=rs.getString(3)%></h3>
										</div>
										<p>
											<strong>Time:</strong> <%=str%> - <%=str2%>
											<br>
  											<strong>Date:</strong> <%=rs.getDate(7)%>
  											<br>
  											<strong>Venue:</strong> <%=rs.getString(5)%>, <%=rs.getString(4)%>
											<br>
  											<strong>Speaker:</strong> <%=rs.getString(13)%>, <%=rs.getString(14)%> <%=rs.getString(15)%>
  											<br>
											<strong>Capacity:</strong> <%=rs.getInt(6)%>
											<br>
											<strong>Status:</strong> <span>ONGOING</span>
										</p>
									</div>
								</button>
							<% } %>
						</div>

						<%
							sessions++;
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