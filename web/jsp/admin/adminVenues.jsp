<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link type="text/css" rel="stylesheet" href="../../css/style.css" />
<link type="text/css" rel="stylesheet"
	href="../../css/headerAndFooter.css" />
<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../../css/bootstrap-formhelpers.css" rel="stylesheet"
	type="text/css" />

<title>UST eTrams - Venues</title>
</head>

<body>

	<!-- Header -->
	<%@ include file="adminHeader.jsp"%>
	<!-- End of Header -->

	<!-- Container -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">Venues</h1>

				<!-- Content -->
				<div class="content">
					<table class="table table-condensed table-striped table-hover ">
						<thead>
							<tr>
								<th>Venue ID #</th>
								<th>Building</th>
								<th></th>
							</tr>
						</thead>

						<tbody>
							<%
								ResultSet rs = (ResultSet) session.getAttribute("venue");
								int venues = 0;
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getInt(1)%></td>
								<td><%=rs.getString(2)%></td>
								<td><a href="#" data-toggle="modal"
									data-target="#editVenueModal" data-venue="<%=rs.getString(2)%>"
									data-venueid="<%=rs.getInt(1)%>">Edit</a> - <a href="#" data-toggle="modal" data-target="#deleteModal"
									data-venueid="<%=rs.getInt(1)%>">Delete</a></td>
							</tr>



							<%
								venues++;
								}
								rs.first();
								rs.previous();
							%>
						</tbody>
					</table>

					<br>
					<div class="someButton">
						<button type="button" class="btn btn-yellow" data-toggle="modal"
							data-target="#newVenueModal">
							<span class="glyphicon glyphicon-plus"></span> Add New Venue
						</button>
					</div>

				</div>
				<!-- End of Content -->


			</div>
		</div>
	</div>
	<!-- End of Container -->

	<!-- Footer -->
	<%@ include file="../footer.jsp"%>
	<!-- End of Footer -->
	<!-- EDIT VENUE MODAL -->
	<div class="modal fade editVenueModal" id="editVenueModal" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">Edit Venue</h4>
				</div>
				<form class="form-horizontal" action="../../dbcontrol" method="post">
					<div class="modal-body">

						<!-- Venue Name-->
						<div class="form-group">
							<label for="venue" class="col-sm-3 control-label">Venue
								Building</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="venue" name="venue"
									value="" required />
							</div>
						</div>
						<br>
					</div>

					<input type="hidden" name="venueID" id="venueID" value="" /> <input
						type="hidden" name="requestType" value="editVenue" />

					<div class="modal-footer">
						<button type="submit" class="btn btn-yellow pull-left">Submit</button>
						<button type="button" class="btn btn-gray pull-left"
							data-dismiss="modal">Cancel</button>
					</div>
			</div>
			</form>
		</div>
	</div>
	<!-- EDIT VENUE MODAL -->

	<!-- DELETE MODAL -->
	<div class="modal fade deleteModal" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="../../dbcontrol" method="post">
				<div class="modal-content">
					<div class="modal-body text-center">
						<p>Are you sure you want to delete this item?</p>
						<div class="someButton text-center">
							<input type="hidden" name="requestType" value="deleteVenue" /> <input
								type="hidden" name="venueID" id="venueID" value="" />
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
				<%@ include file="../modals/othersModals.jsp"%>
				<!-- End of Modals -->
</body>

<script src="../../js/jquery.js"></script>
<script src="../../js/bootstrap/bootstrap.js"></script>
<script type="text/javascript"
	src="../../js/bootstrap/bootstrap-formhelpers-min.js"></script>

<script type="text/javascript" src="../../js/jquery.bootpag.min.js"></script>
<script type="text/javascript" src="../../js/myscript.js"></script>
<script type="text/javascript">
		$(".editVenueModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var venue = url.data("venue");
					var venueID = url.data("venueid");
					
					var modal = $(this);
					modal.find("#venue").val(venue);
					modal.find("#venueID").val(venueID);

		});
		
		$(".deleteModal").on(
				"show.bs.modal",
				function(event) {
					var url = $(event.relatedTarget);
					var venueID = url.data("venueid");

					var modal = $(this);
					modal.find("#venueID").val(venueID);
	
		});
		

	</script>
</html>