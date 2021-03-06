


<!-- EDIT FACULTY MODAL -->
<div class="modal fade" id="editFacultyModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit College</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            	<!-- College Name-->
            	<div class="form-group">
            		<label for="college" class="col-sm-3 control-label">College Name</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="college" name="college" value="Faculty/College/Institute" required />
                    </div>
            	</div>
            </div>
            
            <div class="modal-footer">
            	<button type="submit" class="btn btn-yellow pull-left">Submit</button>
            	<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
            </div>
        </div>
		</form>
	</div>
</div>
<!-- EDIT FACULTY MODAL -->


<!-- NEW VENUE MODAL -->
<div class="modal fade" id="newVenueModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Create New Venue</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol?requestType=createVenue" method="post">
            <div class="modal-body">
            
            	<!-- Venue Name-->
            	<div class="form-group">
            		<label for="venue" class="col-sm-3 control-label">Venue Building</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="venue" name="venue" placeholder="Venue Name" pattern="[a-zA-Z0-9 ]+" required />
                    </div>
            	</div>
            </div>
            
            <div class="modal-footer">
            	<button type="submit" class="btn btn-yellow pull-left">Submit</button>
            	<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
            </div>
		</div>
		</form>
	</div>
</div>
<!-- NEW VENUE MODAL -->


<!-- EDIT VENUE MODAL -->
<div class="modal fade" id="editVenueModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Venue</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            
            	<!-- Venue Name-->
            	<div class="form-group">
            		<label for="venue" class="col-sm-3 control-label">Venue Building</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="venue" name="venue" value="Venue Name" required />
                    </div>
            	</div>
            </div>
            
            <div class="modal-footer">
            	<button type="submit" class="btn btn-yellow pull-left">Submit</button>
            	<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
            </div>
		</div>
		</form>
	</div>
</div>
<!-- EDIT VENUE MODAL -->