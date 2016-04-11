<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
	<%@ include file="adminHeader.jsp"%>
	<!-- End of Header -->

	<!-- Container -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">Seminars</h1>

				<!-- Content -->
				<div class="content">
				
				<%
					ResultSet rs = (ResultSet) session.getAttribute("seminars");
					int seminars = 0;
					boolean isNotEmpty= rs.next();
					if (!isNotEmpty) {
				%>
					<div style="padding: 5px 0px;">
						<h4>There are no seminars.</h4>
					</div>
				<% } else { %>
			 		<div class="row options">
			 			<!-- Filter Data -->
						<div class="col-sm-2">
						
								<div class="input-group">
									<div class="bfh-selectbox" data-name="filterData" data-value="All" id="filterData">
										<div data-value="All">All</div>
										<div data-value="Ongoing">Ongoing</div>
										<div data-value="Completed">Completed</div>
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
										<button class="btn btn-default" onclick="sort('sortData')">Sort</button>
									</span>
								</div>
							
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
							while (isNotEmpty) {
								String desc = rs.getString(4);
								desc = desc.replaceAll("<br />","");
								
								SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
								String editDate = df.format(rs.getDate(5));
						%>
						<div class="col-sm-6 col-md-3" id="datavalues">
							<%if (rs.getInt(6) == 1) { %>
							<span class="hidden" id="alpha"><%=rs.getString(3) %></span>
							<span class="hidden" id="date"><%=rs.getDate(5)%></span>
							<span class="hidden" id="status">COMPLETED</span>
								<button class="thumbnail complete" id="buttonDivContainer" data-toggle="popover"
									data-trigger="focus" data-html="true" data-placement="auto" 
									data-content="
										<span id='dataContent_<%= rs.getInt(1)%>' data-semname='<%=rs.getString(3) %>' data-semtopic='<%=desc %>' data-semid='<%=rs.getInt(1) %>'></span>
  										<p><%=rs.getString(4)%></p><br>
  										<div class='btn-group btn-group-justified' role='group' aria-label='...'>
  											<a class='btn btn-gray' data-toggle='modal' data-target='#editSeminarModal' data-sid='<%= rs.getInt(1)%>'>Edit</a>
  											<a class='btn btn-gray' data-toggle='modal' data-target='#deleteModal' data-sid='<%= rs.getInt(1)%>'>Delete</a>
										</div>
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='../../dbcontrol?requestType=goToAdminSession&seminarID=<%=rs.getInt(1)%>&seminarName=<%=rs.getString(3)%>'>View Sessions</a>
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
							<span class="hidden" id="alpha"><%=rs.getString(3) %></span>
							<span class="hidden" id="date"><%=rs.getDate(5)%></span>
							<span class="hidden" id="status">ONGOING</span>
								<button class="thumbnail" id="buttonDivContainer" data-toggle="popover"
									data-trigger="focus" data-html="true" data-placement="auto"
									data-content="
										<span id='dataContent_<%= rs.getInt(1)%>' data-semname='<%=rs.getString(3) %>' data-semtopic='<%=desc %>' data-semid='<%=rs.getInt(1) %>'></span>
  										<p><%=rs.getString(4)%></p><br>
  										<div class='btn-group btn-group-justified' role='group' aria-label='...'>
  											<a class='btn btn-gray' data-toggle='modal' data-target='#editSeminarModal' data-sid='<%= rs.getInt(1)%>'>Edit</a>
  											<a class='btn btn-gray' data-toggle='modal' data-target='#deleteModal' data-sid='<%= rs.getInt(1)%>'>Delete</a>
										</div>
  										<div class='someButton'>
  											<a class='btn btn-yellow btn-block' href='../../dbcontrol?requestType=goToAdminSession&seminarID=<%=rs.getInt(1)%>&seminarName=<%=rs.getString(3)%>'>View Sessions</a>
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
							
							<div class="panel panel-default" id="dataContent_<%= rs.getInt(1)%>" data-semname="<%=rs.getString(3)%>" 
									data-semtopic="<%=desc %>" data-semid="<%=rs.getInt(1) %>">
								<div class="panel-body">
									<div class="seminarTitle">
										<h3><%=rs.getString(3)%></h3>
									</div>
								</div>
									
								<ul class="list-group">
									<li class="list-group-item status">
										<p><strong>Date Created:</strong> <%=TimeDateConverterClass.convertToStringDate(editDate)%><br></p>
									</li>
								<%if (rs.getInt(6) == 1) { %>
									<li class="list-group-item status complete">
										<p><span>COMPLETE</span></p>
									</li>
								<% } else { %>
									<li class="list-group-item status">
										<p><span>ONGOING</span></p>
									</li>
								<% } %>
									<li class="list-group-item">
										<button class="btn btn-link" data-toggle="popover" data-trigger="focus" data-html="true" 
												data-placement="bottom" data-content="
											<p><strong>Description:</strong></p>
											<p><%=rs.getString(4)%></p>
  										">More Info</button> &bull; 
  										<button class="btn btn-link" data-toggle="modal" data-target="#editSeminarModal" data-sid="<%= rs.getInt(1)%>">Edit</button>
  										 &bull; 
  										<button class="btn btn-link" data-toggle='modal' data-target='#deleteModal' data-sid="<%= rs.getInt(1)%>">Delete</button>
									</li>
									<li class="list-group-item setting1">
  										<a href="../../dbcontrol?requestType=goToAdminSession&seminarID=<%=rs.getInt(1)%>&seminarName=<%=rs.getString(3)%>">View Sessions</a>
									</li>
								</ul>
							</div>
						</div>


						<%
							seminars++;
							isNotEmpty =rs.next();
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
					
					<% } }%>
					<br>
					<div class="someButton">
						<button type="button" class="btn btn-yellow" data-toggle="modal"
							data-target="#seminarModal">
							<span class="glyphicon glyphicon-plus"></span> New Seminar
						</button>
					</div>
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
	
	<!-- EDIT SEMINAR MODAL -->
	<div class="modal fade editSeminarModal" id="editSeminarModal"
		tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">Edit Seminar</h4>
				</div>
				<form class="form-horizontal" action="../../dbcontrol" method="post">
					<div class="modal-body">

						<!-- Seminar Name -->
						<div class="form-group">
							<label for="Seminar Name" class="col-sm-2 control-label">Seminar
								Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="seminarName"
									name="seminarName" value="" required />
							</div>
						</div>

						<!-- Seminar Topic -->
						<div class="form-group">
							<label for="Topic" class="col-sm-2 control-label">Seminar
								Topic</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="seminarTopic"
									id="seminarTopic" rows="5" required></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-yellow pull-left">Save
							Changes</button>
						<button type="button" class="btn btn-gray pull-left"
							data-dismiss="modal">Cancel</button>
					</div>
			<input type="hidden" name="seminarID" id="seminarID" value="" /> <input
				type="hidden" name="requestType" value="editSeminar" />
			</form>
			</div>
		</div>
	</div>
	<!-- EDIT SEMINAR MODAL -->
	<!-- DELETE MODAL -->
	<div class="modal fade deleteModal" id="deleteModal" tabindex="-1"
		role="dialog" aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="../../dbcontrol" method="post">
				<div class="modal-content">
					<div class="modal-body text-center">
						<p>Are you sure you want to delete this item?</p>
						<div class="someButton text-center">
							<input type="hidden" name="seminarID" id="seminarID" value="" />
							<input type="hidden" name="requestType" value="deleteSeminar" />
							<button type="submit" class="btn btn-default">Yes</button>
							<button type="button" class="btn btn-gray" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- DELETE MODAL -->
					<!-- Modals -->
				<%@ include file="../modals/SeminarsAndSessionsModals.jsp"%>
				<!--INCREMENT DITO -->
	
</body>

<script src="../../js/jquery.js"></script>
<script src="../../js/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>

<script type="text/javascript" src="../../js/jPages.min.js"></script>
<script type="text/javascript" src="../../js/myscript.js"></script>

<!-- FOR SESSION MODAL -->
<script type="text/javascript" src="../../js/sessionModal.js"></script>
<script type="text/javascript" src="../../js/datacontrol.js"></script>

<script type="text/javascript">
	$(".editSeminarModal").on("show.bs.modal", function(event) {
		var event = $(event.relatedTarget);
		id = event.data("sid");
		var url = $("#dataContent_" + id);
		var semName = url.data("semname");
		var semTopic = url.data("semtopic");
		var semID = url.data("semid");

		
		var modal = $(this);
		modal.find("#seminarName").val(semName);
		modal.find("#seminarID").val(semID);
		modal.find("#seminarTopic").text(semTopic);

	});

	$(".deleteModal").on("show.bs.modal", function(event) {
		var event = $(event.relatedTarget);
		id = event.data("sid");
		var url = $("#dataContent_" + id);
		var semID = url.data("semid");
		
		var modal = $(this);
		modal.find("#seminarID").val(semID);

	});
</script>
</html>