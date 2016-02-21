<!-- MODALS -->

<!-- ANNOUNCEMENT_MODAL -->
<div class="modal fade announcementModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">New Announcement</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            		
                    <!-- Announcement Title -->
                    <div class="form-group">
                        <label for="Title" class="col-sm-2 control-label">Title</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="announcement_title" name="announcement_title" placeholder="Title" required />
                        </div>
                    </div>

                    <!-- Announcement Content -->
                    <div class="form-group">
                        <label for="Content" class="col-sm-2 control-label">Content</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" name="announcement_content" id="announcement_content" rows="5" required></textarea>
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
<!-- ANNOUNCEMENT_MODAL -->


<!-- SEMINAR_MODAL -->
<div class="modal fade seminarModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">New Seminar</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            
                    <!-- Seminar Name -->
                    <div class="form-group">
                        <label for="Seminar_Name" class="col-sm-2 control-label">Seminar Name</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="seminar_name" name="seminar_name" placeholder="Seminar Name" required />
                        </div>
                    </div>
                    
                    <!-- Seminar Topic -->
                    <div class="form-group">
                        <label for="Topic" class="col-sm-2 control-label">Seminar Topic</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" name="seminar_topic" id="seminar_topic" rows="5" required></textarea>
                        </div>
                    </div>
                    
                    <!-- Target Dates -->
                     <div class="form-group">
                        <label for="Target_Dates" class="col-sm-2 control-label">Target Dates</label>
                        <div class="col-sm-10">
                        	<div class="row dateList">
                            	<div id="group_1">
                                    <div class="col-sm-2">
                                        <label class="control-label">Day 1</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <div class="bfh-datepicker" data-min="today" date-close="false" id="seminar_date_1" data-name="seminar_date_1"></div>
                                            <div class="input-group-addon"><button type="button" onclick="return addDate()" class="glyphicon glyphicon-plus"></button>
                                            <button type="button" onclick="return removeDate()" class="glyphicon glyphicon-remove"></button></div>
                                        </div>
                                    </div>
                                </div>
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
<!-- SEMINAR_MODAL -->


<!-- SESSION_MODAL -->
<div class="modal fade sessionModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">New Session</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">

                    <!-- Session Name -->
                    <div class="form-group">
                        <label for="Session_Name" class="col-sm-2 control-label">Session Name</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="session_name" name="session_name" placeholder="Session Name" required />
                        </div>
                    </div>
                    
                    <!-- Session Description -->
                    <div class="form-group">
                        <label for="Description" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" name="session_desc" id="session_desc" rows="5" required ></textarea>
                        </div>
                    </div>
                    
                    <!-- Session Date Time-->
                     <div class="form-group">
                        <label for="Session_Date" class="col-sm-2 control-label">Date</label>
                        <div class="col-sm-4">
                        	<div class="bfh-datepicker" date-close="false" id="session_date" data-name="session_date"></div>
                        </div>
                        <label for="Session_Time" class="col-sm-2 control-label">Time</label>
                        <div class="col-sm-4">
                        	<div class="bfh-timepicker" data-mode="12h" id="session_time" data-name="session_time"></div>
                        </div>
                    </div>

                    <!-- Session Venue -->
                    <div class="form-group">
                        <label for="Session_Venue" class="col-sm-2 control-label">Venue</label>
                        <div class="col-sm-10">
                            <div class="bfh-selectbox" data-name="session_venue" id="session_venue" data-value="--" data-filter="true">
                                <div data-value="--">--</div>
                               	<div data-value="1">Option 1</div>
                               	<div data-value="2">Option 2</div>
                    			<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags -->
                            </div>                        
                        </div>
                    </div>

                    <!-- Session Speaker -->
                    <div class="form-group">
                        <label for="Session_Speaker" class="col-sm-2 control-label">Speaker</label>
                        <div class="col-sm-10">
                            <div class="bfh-selectbox" data-name="session_speaker" id="session_speaker" data-value="--" data-filter="true">
                                <div data-value="--">--</div>
                               	<div data-value="1">Option 1 asdssssssssssssssssssssssssssssssssssssssssssssssssssss asdssssssssssssssssssssssssssssssssssssssssssssssssssss</div>
                               	<div data-value="2">Option 2</div>
                    			<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags -->
                            </div>                        
                        </div>
                    </div>
                    
                    <!-- Session Coordinator -->
                    <div class="form-group">
                        <label for="Session_Coordinator" class="col-sm-2 control-label">Coordinator</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="session_coordinator" name="session_coordinator" placeholder="Coordinator" pattern="[A-Za-z\.]*" required >
                        </div>
                    </div>
            </div>
                <div class="modal-footer">
                    <button type="submit" onclick="return checkSelect()" class="btn btn-yellow pull-left">Submit</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
<!-- SESSION_MODAL -->


<!-- ATTENDANCE_MODAL -->
<div class="modal fade attendanceModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Set Attendance</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            		
                    <!-- Time In -->
                    <div class="form-group">
                        <label for="Time In" class="col-sm-2 control-label">Time In</label>
                        <div class="col-sm-10">
                        	<div class="bfh-timepicker" data-mode="12h" id="time_in" data-name="time_in"></div>
                        </div>
                    </div>

                    <!-- Time Out -->
                    <div class="form-group">
                        <label for="Time Out" class="col-sm-2 control-label">Time Out</label>
                        <div class="col-sm-10">
                        	<div class="bfh-timepicker" data-mode="12h" id="time_out" data-name="time_out"></div>
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
<!-- ATTENDANCE_MODAL -->


<!-- NEW_USER_MODAL -->
<div class="modal fade newAccountModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
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
            		<label for="User_Name" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                    	<input type="text" class="form-control" id="user_name" name="user_name" placeholder="Name" required />
                    </div>
            	</div>
            	
            	<!-- Email -->
            	<div class="form-group">
            		<label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                    	<input type="email" class="form-control" id="email" name="email" placeholder="Email" required />
                    </div>
            	</div>
            	
            	<!-- College -->
            	<div class="form-group">
            		<label for="college" class="col-sm-2 control-label">College</label>
                    <div class="col-sm-10">
                    	<input type="text" class="form-control" id="college" name="college" placeholder="Faculty/College/Institute" required />
                    </div>
            	</div>
            	
            	<!-- Department -->
            	<div class="form-group">
            		<label for="department" class="col-sm-2 control-label">Department</label>
                    <div class="col-sm-10">
                    	<input type="text" class="form-control" id="department" name="department" placeholder="Department" required />
                    </div>
            	</div>
            	
            	<!-- User Type -->
            	<div class="form-group">
            		<label for="role" class="col-sm-2 control-label">User Type</label>
                    <div class="col-sm-10">
                    	<input type="text" class="form-control" id="role" name="role" placeholder="Role" required />
                    </div>
            	</div>
                    
                <div class="modal-footer">
                    <button type="submit" onclick="return checkSelect()" class="btn btn-yellow pull-left">Submit</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
</div>
<!-- NEW_USER_MODAL -->


<!-- NEW_FACULTY_MODAL -->

<div class="modal fade newFacultyModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
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
                    	<input type="text" class="form-control" id="coordinator" name="coordinator" placeholder="Coordinator" required />
                    </div>
            	</div>
                    
                <div class="modal-footer">
                    <button type="submit" onclick="return checkSelect()" class="btn btn-yellow pull-left">Submit</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
</div>
<!-- NEW_FACULTY_MODAL -->