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
	<%@ include file="coordinatorHeader.jsp"%>
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
									<span class="input-group-btn">
										<a class="btn btn-default" href="../../dbcontrol?requestType=goToCoordinatorSeminar"><span class="glyphicon glyphicon-refresh"></span></a>
									</span>
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
							<div class="panel panel-default" id="dataContent_<%= rs.getInt(1)%>" data-semname="<%=rs.getString(3)%>" 
									data-semtopic="<%=desc %>" data-semid="<%=rs.getInt(1) %>">
								<div class="panel-body">
									<div class="seminarTitle">
										<h3><%=rs.getString(3)%></h3>
									</div>
								</div>
									
								<ul class="list-group">
								<%if (rs.getInt(6) == 1) { %>
									<li class="list-group-item status complete">
										<p><span>COMPLETE</span></p>
									</li>
								<% } else { %>
									<li class="list-group-item status">
										<p><span>ONGOING</span></p>
									</li>
								<% } %>
									<li class="list-group-item status">
										<p><strong>Date Created:</strong> <%=TimeDateConverterClass.convertToStringDate(editDate)%><br></p>
									</li>
									<li class="list-group-item">
										<button class="btn btn-link" data-toggle="popover" data-trigger="focus" data-html="true" 
												data-placement="bottom" data-content="
											<p><strong>Description:</strong></p>
											<p><%=rs.getString(4)%></p>
  										">More Info</button>
  									</li>
									<li class="list-group-item setting1">
  										<a href="../../dbcontrol?requestType=goToCoordinatorSession&seminarID=<%=rs.getInt(1)%>&seminarName=<%=rs.getString(3)%>">View Sessions</a>
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
	
</body>

<script src="../../js/jquery.js"></script>
<script src="../../js/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>

<script type="text/javascript" src="../../js/jPages.js"></script>
<script type="text/javascript" src="../../js/myscript.js"></script>

<script type="text/javascript" src="../../js/datacontrol.js"></script>

</html>