<!-- SEMINAR_MODAL --> <!-- DITO--> 
<div class="modal fade" id="seminarModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">New Seminar</h4>
			</div>
		<form class="form-horizontal" action="../../dbcontrol" method="post">
            <div class="modal-body">
            
            	<!-- Seminar Name -->
            	<div class="form-group">
            		<label for="Seminar_Name" class="col-sm-2 control-label">Seminar Name</label>
            		<div class="col-sm-10">
            			<input type="text" class="form-control" id="seminar_name" name="seminar_name" placeholder="Seminar Name" required /> <!-- SEMINAR PLACEHOLDER HERE (put ${bean.seminarName} in the placeholder -->
            		</div>
            	</div>
            	
            	<!-- Seminar Topic -->
            	<div class="form-group">
            		<label for="Topic" class="col-sm-2 control-label">Seminar Topic</label>
            		<div class="col-sm-10">
            			<textarea class="form-control" name="seminar_topic" id="seminar_topic" rows="5" required></textarea> <!-- SEMINAR PLACEHOLDER HERE (put ${bean.seminarDescription} in the placeholder -->
            		</div>
            	</div>
            </div>
            <div class="modal-footer">
				<!-- <text type="hidden" name="seminarID" value="${bean.seminarID}" -->
            	<button type="submit" class="btn btn-yellow pull-left">Submit</button>
            	<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
            </div>
            <input type="hidden" name="requestType" value="createSeminar" />
        </div>
		</form>
	</div>
</div>
<!-- SEMINAR_MODAL -->


<!-- EDIT SEMINAR_MODAL -->
<div class="modal fade" id="editSeminarModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
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
                        <input type="text" class="form-control" id="seminar_name" name="seminar_name" value="Seminar Name" required />
                        </div>
                    </div>
                    
                    <!-- Seminar Topic -->
                    <div class="form-group">
                        <label for="Topic" class="col-sm-2 control-label">Seminar Topic</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" name="seminar_topic" id="seminar_topic" rows="5" required>something something</textarea>
                        </div>
                    </div>
            </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-yellow pull-left">Save Changes</button>
                    <button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
                </div>
            </div>
		</form>
	</div>
</div>
<!-- EDIT SEMINAR_MODAL -->


<!-- SESSION_MODAL -->
<div class="modal fade" id="sessionModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
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
                    
                    <!-- Session Venue Remarks -->
                    <div class="form-group">
                    	<label for="Remarks" class="col-sm-3 control-label">Remarks</label>
                    	<div class="col-sm-9">
                    		<textarea class="form-control" id="venueRemarks" name="venueRemarks" placeholder="Venue Remarks" rows="3"></textarea>
                    	</div>
                    </div>
                    
                    <!-- Capacity -->
                    <div class="form-group">
                        <label for="Capacity" class="col-sm-2 control-label">Capacity</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" name="capacity" id="capacity" placeholder="Number of Participants allowed" required />
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


<!-- EDIT SESSION_MODAL -->
<div class="modal fade" id="editSessionModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
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
                        <input type="text" class="form-control" id="session_name" name="session_name" value="Session Name" required />
                        </div>
                    </div>
                    
                    <!-- Session Description -->
                    <div class="form-group">
                        <label for="Description" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" name="session_desc" id="session_desc" rows="5" required >Something something</textarea>
                        </div>
                    </div>
                    
                    <!-- Session Date Time-->
                     <div class="form-group">
                        <label for="Session_Date" class="col-sm-2 control-label">Date</label>
                        <div class="col-sm-4">
                        	<div class="bfh-datepicker" date-close="false" id="session_date" data-name="session_date" data-value=""></div>
                        </div>
                        <label for="Session_Time" class="col-sm-2 control-label">Time</label>
                        <div class="col-sm-4">
                        	<div class="bfh-timepicker" data-mode="12h" id="session_time" data-name="session_time" data-value=""></div>
                        </div>
                    </div>

                    <!-- Session Venue -->
                    <div class="form-group">
                        <label for="Session_Venue" class="col-sm-2 control-label">Venue</label>
                        <div class="col-sm-10">
                            <div class="bfh-selectbox" data-name="session_venue" id="session_venue" data-value="1" data-filter="true">
                               	<div data-value="1">Option 1</div>
                               	<div data-value="2">Option 2</div>
                    			<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags -->
                            </div>                        
                        </div>
                    </div>
                    
                    <!-- Session Venue Remarks -->
                    <div class="form-group">
                    	<label for="Remarks" class="col-sm-3 control-label">Remarks</label>
                    	<div class="col-sm-9">
                    		<textarea class="form-control" id="venueRemarks" name="venueRemarks" placeholder="Venue Remarks" rows="3"></textarea>
                    	</div>
                    </div>
                    
                    <!-- Capacity -->
                    <div class="form-group">
                        <label for="Capacity" class="col-sm-2 control-label">Capacity</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" name="capacity" id="capacity" placeholder="Number of Participants allowed" required />
                        </div>
                    </div>

                    <!-- Session Speaker -->
                    <div class="form-group">
                        <label for="Session_Speaker" class="col-sm-2 control-label">Speaker</label>
                        <div class="col-sm-10">
                            <div class="bfh-selectbox" data-name="session_speaker" id="session_speaker" data-value="1" data-filter="true">
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
                    
                    <!-- Session Status -->
                    <div class="form-group">
                        <label for="Session_Speaker" class="col-sm-2 control-label">Session Status</label>
                        <div class="col-sm-10">
                            <div class="bfh-selectbox" data-name="session_speaker" id="session_speaker" data-value="1">
                               	<div data-value="1">Completed</div>
                               	<div data-value="2">Ongoing</div>
                            </div>                        
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
<!-- EDIT SESSION_MODAL -->


<!-- ATTENDANCE_MODAL -->
<div class="modal fade" id="attendanceModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
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


<!-- SET STATUS MODAL -->
<div class="modal fade" id="setStatusModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Set Status</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            
            	<!-- Status -->
            	<div class="form-group">
            		<label for="status" class="col-sm-3 control-label">Status</label>
            		<div class="col-sm-8">
            			<div class="bfh-selectbox" data-name="status" id="status" data-value="--">
            				<div data-value="1">Complete</div>
            				<div data-value="2">Incomplete</div>
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
<!-- SET STATUS MODAL -->