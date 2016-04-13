<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="eTrams.utilities.helperClasses.TimeDateConverterClass" %>
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
				<h1 class="page-header">
					<small><a href="participantSeminars.jsp"><%=(String) session.getAttribute("seminarName")%></a>
						/ </small> Sessions
				</h1>

				<!-- Content -->
				<div class="content">
				
				<%
					ResultSet rs = (ResultSet) session.getAttribute("session");
					ResultSet rs2 = (ResultSet) session.getAttribute("venue");
					ResultSet rs3 = (ResultSet) session.getAttribute("speakers");
					int sessions = 0;
					DateFormat format = new SimpleDateFormat("h:mm a");
					DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
					boolean isNotEmpty = rs.next();
					if (!isNotEmpty) {
				%>
					<div style="padding: 5px 0px;">
						<h4>There are currently no sessions for this seminar.</h4>
					</div>
				<% } else { %>
					<div class="row options">
			 			<!-- Filter Data -->
						<div class="col-sm-2">
						
								<div class="input-group">
									<div class="bfh-selectbox" data-name="filterData" data-value="All" id="filterData">
										<div data-value="All">All</div>
										<div data-value="Ongoing">Ongoing</div>
										<div data-value="Complete">Complete</div>
									</div>
									<span class="input-group-btn">
										<button class="btn btn-default" id="filterDataBtn">Filter</button>
									</span>
								</div>
							
						</div>
						<!-- End of Filter -->
						
						<!-- Other Filter Data -->
						<div class="col-sm-3">

								<div class="input-group">
									<div class="bfh-selectbox" data-name="sortData" data-value="AlphabeticalAsc" id="sortData">
										<div data-value="AlphabeticalAsc">By Alphabetical (Asc)</div>
										<div data-value="AlphabeticalDesc">By Alphabetical (Desc)</div>
										<div data-value="DateAsc">By Date (Asc)</div>
										<div data-value="DateDesc">By Date (Desc)</div>
									</div>
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit" onclick="sort('sortData')">Sort</button>
									</span>
								</div>

						</div>
						<!-- End of Other Filter -->
			 		</div>
			 		
			 		<br>
			 		
					<div class="row" id="ssList">
						<%
							while (isNotEmpty) {
								String str = format.format(rs.getTime(8));
								String str2 = format.format(rs.getTime(9));
								String dateDisplay = df2.format(rs.getDate(7));
						%>
						<div class="col-sm-6 col-md-3" id="datavalues">
							<span class="hidden" id="alpha"><%=rs.getString(3) %></span>
							<span class="hidden" id="date"><%=rs.getDate(7)%></span>
								
							<div class="panel panel-default" id="dataContent">
									
								<div class="panel-body">
									<div class="sessionTitle">
										<h3><%=rs.getString(3)%></h3>
									</div>
								</div>
									
							<% if (rs.getInt(11) == 1) { %>
								<ul class="list-group">
									<li class="list-group-item status complete">
										<p><span>COMPLETE</span></p>
									</li>
									<li class="list-group-item">
										<button class="btn btn-link" data-toggle="popover" data-trigger="focus" data-html="true" 
												data-placement="bottom" data-content="
  											<p><strong>Time:</strong> <%=str%> - <%=str2%></p>
  											<p><strong>Date:</strong> <%=TimeDateConverterClass.convertToStringDate(dateDisplay)%></p>
			  								<p><strong>Venue:</strong> <%=rs.getString(4)%> <em><%=rs.getString(5)%></em>
											<p><strong>Speaker:</strong> <%=rs.getString(13)%>, <%=rs.getString(14)%> <%=rs.getString(15)%></p>
											<p><strong>Capacity:</strong> <%=rs.getInt(6)%></p>
  										">More Info</button>
									</li>
									<li class="list-group-item">
										 &bull;  &bull;  &bull;
									</li>
								</ul>
							<% } else { %>
								
								<ul class="list-group">
									<li class="list-group-item status">
										<p><span>ONGOING</span></p>
									</li>
									<li class="list-group-item">
										<button class="btn btn-link" data-toggle="popover" data-trigger="focus" data-html="true" 
												data-placement="bottom" data-content="
  											<p><strong>Time:</strong> <%=str%> - <%=str2%></p>
  											<p><strong>Date:</strong> <%=TimeDateConverterClass.convertToStringDate(dateDisplay)%></p>
			  								<p><strong>Venue:</strong> <%=rs.getString(4)%> <em><%=rs.getString(5)%></em>
											<p><strong>Speaker:</strong> <%=rs.getString(13)%>, <%=rs.getString(14)%> <%=rs.getString(15)%></p>
											<p><strong>Capacity:</strong> <%=rs.getInt(6)%></p>
  										">More Info</button>
  									</li>
									<li class="list-group-item setting1">
										<% //if (registered) { %>
  											<a href="#" data-toggle="modal" data-target="#registrationModal" data-sessionid="<%= rs.getInt(1)%>" data-register="0">Unregister</a>
  										<% // } else { %>
  											<a href="#" data-toggle="modal" data-target="#registrationModal" data-sessionid="<%= rs.getInt(1)%>" data-register="1">Register</a>
										<% //} %>
									</li>
								</ul>
							<% } %>
								
							</div>
						</div>

						<%
							sessions++;
							isNotEmpty = rs.next();
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
					
					<% } %>
					
				</div>
				<!-- End of Content -->

			</div>
		</div>
	</div>
	<!-- End of Container -->

	<!-- Footer -->
	<%@ include file="../footer.jsp"%>
	<!-- End of Footer -->
	
	<!-- REGISTRATION MODAL -->
	<div class="modal fade registrationModal" id="registrationModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="../../dbcontrol" method="post">
				<div class="modal-content">
					<div class="modal-body text-center">
						<p id="myText">Are you sure you want to register to this session?</p>
						
						<div class="someButton text-center">
							<input type="hidden" name="requestType" value="register" />
							<input type="hidden" id="register" name="register" value="" />
							<input type="hidden" id="sessionID" name="sessionID" value="" />
							
							<button type="submit" class="btn btn-default">Yes</button>
							<button type="button" class="btn btn-gray" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- REGISTRATION MODAL -->
	
</body>

<script src="../../js/jquery.js"></script>
<script src="../../js/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>

<script type="text/javascript" src="../../js/jPages.js"></script>
<script type="text/javascript" src="../../js/myscript.js"></script>

<!-- FOR SESSION MODAL -->
<script type="text/javascript" src="../../js/sessionModal.js"></script>
<script type="text/javascript" src="../../js/datacontrol.js"></script>

<script type="text/javascript">
	$(".registrationModal").on("show.bs.modal", function(event) {
		var url = $(event.relatedTarget);
		var sessionID = url.data("sessionid");
		var register = url.data("register");
					
		var modal = $(this);
					
		if(register == "1"){
			modal.find("#myText").text("Are you sure you want to register to this session?");
		}else if(register == "0"){
			modal.find("#myText").text("Are you sure you want to unregister to this session?");
		}
		
		modal.find("#register").val(register);
		modal.find("#sessionID").val(sessionID);
	
		})
</script>

</html>