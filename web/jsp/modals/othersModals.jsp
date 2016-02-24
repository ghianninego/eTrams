<!-- For Adding Modals -->

<!-- NEW USER MODAL -->
<div class="modal fade" id="newAccountModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Create New Account</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            	<!-- Name -->
            	<div class="form-group">
            		<label for="User_Name" class="col-sm-3 control-label">Name</label>
                    <div class="col-sm-8">
                    	<input type="text" class="form-control" id="user_name" name="user_name" placeholder="Name" required />
                    </div>
            	</div>
            	
            	<!-- Email -->
            	<div class="form-group">
            		<label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-8">
                    	<input type="email" class="form-control" id="email" name="email" placeholder="Email" required />
                    </div>
            	</div>
            	
            	<!-- College -->
            	<div class="form-group">
            		<label for="college" class="col-sm-3 control-label">Faculty/College/Institute</label>
            		<div class="col-sm-8">
            			<div class="bfh-selectbox" data-name="college" id="college" data-value="--" data-filter="true">
            				<div data-value="--">--</div>
            				<div data-value="1">College 1 </div>
            				<div data-value="2">College 2</div>
            			</div>
            		</div>
            	</div>
            	
            	<!-- Department -->
            	<div class="form-group">
            		<label for="department" class="col-sm-3 control-label">Department</label>
            		<div class="col-sm-8">
            			<div class="bfh-selectbox" data-name="department" id="department" data-value="--" data-filter="true">
            				<div data-value="--">--</div>
            				<div data-value="1">Department 1 </div>
            				<div data-value="2">Department 2</div>
            			</div>
            		</div>
            	</div>
            	
            	<!-- User Type -->
            	<div class="form-group">
            		<label for="role" class="col-sm-3 control-label">User Type</label>
            		<div class="col-sm-8">
            			<div class="bfh-selectbox" data-name="role" id="role" data-value="--">
            				<div data-value="--">--</div>
            				<div data-value="2">Coordinator</div>
            				<div data-value="2">Staff</div>
            				<div data-value="1">Participant</div>
            			</div>
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
<!-- NEW USER MODAL -->


<!-- NEW FACULTY MODAL -->
<div class="modal fade" id="newFacultyModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Create New College</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            	<!-- College Name-->
            	<div class="form-group">
            		<label for="college" class="col-sm-3 control-label">College Name</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="college" name="college" placeholder="Faculty/College/Institute" required />
                    </div>
            	</div>
            	
            	<!-- Coordinator -->
            	<div class="form-group">
            		<label for="coordinator" class="col-sm-3 control-label">Coordinator</label>
            		<div class="col-sm-9">
            			<div class="bfh-selectbox" data-name="coordinator" id="coordinator" data-value="--" data-filter="true">
            				<div data-value="--">--</div>
            				<div data-value="1">Coordinator 1</div>
            				<div data-value="2">Coordinator 2</div>
            				<div data-value="3">Coordinator 3</div>
            			</div>
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
<!-- NEW FACULTY MODAL -->


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
            	
            	<!-- Coordinator -->
            	<div class="form-group">
            		<label for="coordinator" class="col-sm-3 control-label">Coordinator</label>
            		<div class="col-sm-9">
            			<div class="bfh-selectbox" data-name="coordinator" id="coordinator" data-value="1" data-filter="true">
            				<div data-value="1">Coordinator 1</div>
            				<div data-value="2">Coordinator 2</div>
            				<div data-value="3">Coordinator 3</div>
            			</div>
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
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            
            	<!-- Venue Name-->
            	<div class="form-group">
            		<label for="venue" class="col-sm-3 control-label">Venue Building</label>
                    <div class="col-sm-9">
                    	<input type="text" class="form-control" id="venue" name="venue" placeholder="Venue Name" required />
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