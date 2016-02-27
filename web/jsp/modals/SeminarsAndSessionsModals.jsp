<!-- SEMINAR MODAL -->
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
            		<label for="Seminar Name" class="col-sm-2 control-label">Seminar Name</label>
            		<div class="col-sm-10">
            			<input type="text" class="form-control" id="seminarName" name="seminarName" placeholder="Seminar Name" required />
            		</div>
            	</div>
            	
            	<!-- Seminar Topic -->
            	<div class="form-group">
            		<label for="Topic" class="col-sm-2 control-label">Seminar Topic</label>
            		<div class="col-sm-10">
            			<textarea class="form-control" name="seminarTopic" id="seminarTopic" rows="5" required></textarea>
            		</div>
            	</div>
            </div>
            <div class="modal-footer">
            	<button type="submit" class="btn btn-yellow pull-left">Submit</button>
            	<button type="button" class="btn btn-gray pull-left" data-dismiss="modal">Cancel</button>
            </div>
            <input type="hidden" name="requestType" value="createSeminar" />
        </div>
		</form>
	</div>
</div>
<!-- SEMINAR_MODAL -->


<!-- EDIT SEMINAR MODAL -->
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
                        <label for="Seminar Name" class="col-sm-2 control-label">Seminar Name</label>
                        <div class="col-sm-10">
                        <input type="text" class="form-control" id="seminarName" name="seminarName" value="Seminar Name" required />
                        </div>
                    </div>
                    
                    <!-- Seminar Topic -->
                    <div class="form-group">
                        <label for="Topic" class="col-sm-2 control-label">Seminar Topic</label>
                        <div class="col-sm-10">
                        <textarea class="form-control" name="seminarTopic" id="seminarTopic" rows="5" required>something something</textarea>
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
<!-- EDIT SEMINAR MODAL -->


<!-- SESSION MODAL -->
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
            		<label for="Session Name" class="col-sm-2 control-label">Session Name</label>
            		<div class="col-sm-10">
            			<input type="text" class="form-control" id="sessionName" name="sessionName" placeholder="Session Name" required />
            		</div>
            	</div>
            	
            	<!-- Session Date -->
            	<div class="form-group">
            		<label for="Session Date" class="col-sm-2 control-label">Date</label>
            		<div class="col-sm-10">
            			<div class="bfh-datepicker" date-close="false" id="sessionDate" data-name="sessionDate"></div>
            		</div>
            	</div>
            	
            	<!-- Session Time -->
            	<div class="form-group">
            		<label for="Session Time In" class="col-sm-2 control-label">Time In</label>
            		<div class="col-sm-4">
            			<div class="bfh-timepicker" data-mode="12h" id="sessionTimeIn" data-name="sessionTimeIn"></div>
            		</div>
            		<label for="Session Time Out" class="col-sm-2 control-label">Time Out</label>
            		<div class="col-sm-4">
            			<div class="bfh-timepicker" data-mode="12h" id="sessionTimeOut" data-name="sessionTimeOut"></div>
            		</div>
            	</div>
            	
            	<!-- Session Venue -->
            	<div class="form-group">
            		<label for="Session Venue" class="col-sm-2 control-label">Venue</label>
            		<div class="col-sm-10">
            			<div class="bfh-selectbox" data-name="sessionVenue" id="sessionVenue" data-value="--" data-filter="true">
            				<div data-value="--">--</div>
            				<div data-value="1">Option 1</div>
            				<div data-value="2">Option 2</div>
            				<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags -->
            			</div>
            		</div>
            		<div class="col-sm-offset-2 col-sm-10">
            			<textarea class="form-control" id="venueRemarks" name="venueRemarks" placeholder="Venue Remarks" rows="3"></textarea>
            		</div>
            	</div>
            	
            	<!-- Capacity -->
            	<div class="form-group">
            		<label for="Capacity" class="col-sm-2 control-label">Capacity</label>
            		<div class="col-sm-10">
            			<input type="number" class="form-control" name="capacity" id="capacity" placeholder="Number of Participants allowed" required />
            		</div>
            	</div>
            	
            	<!-- Session Speaker -->
            	<div class="form-group">
            		<label for="Session Speaker" class="col-sm-2 control-label">Speaker</label>
            		<div class="col-sm-10">
            			<div class="bfh-selectbox" data-name="sessionSpeaker" id="sessionSpeaker" data-value="--" data-filter="true">
            				<div data-value="--">--</div>
            				<div data-value="1">Option 1 asdsssssssssssssssssssssssssssssssssssssss asdssssssssssssssssssssssssssss</div>
            				<div data-value="2">Option 2</div>
            				<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags -->
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
<!-- SESSION MODAL -->


<!-- EDIT SESSION MODAL -->
<div class="modal fade" id="editSessionModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="gridSystemModalLabel">Edit Session</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            
            	<!-- Session Name -->
            	<div class="form-group">
            		<label for="Session Name" class="col-sm-2 control-label">Session Name</label>
            		<div class="col-sm-10">
            			<input type="text" class="form-control" id="sessionName" name="sessionName" value="Session Name" required />
            		</div>
            	</div>
            	
            	<!-- Session Date -->
            	<div class="form-group">
            		<label for="Session Date" class="col-sm-2 control-label">Date</label>
            		<div class="col-sm-10">
            			<div class="bfh-datepicker" date-close="false" id="sessionDate" data-name="sessionDate"></div>
            		</div>
            	</div>
            	
            	<!-- Session Time -->
            	<div class="form-group">
            		<label for="Session Time In" class="col-sm-2 control-label">Time In</label>
            		<div class="col-sm-4">
            			<div class="bfh-timepicker" data-mode="12h" id="sessionTimeIn" data-name="sessionTimeIn"></div>
            		</div>
            		<label for="Session Time Out" class="col-sm-2 control-label">Time Out</label>
            		<div class="col-sm-4">
            			<div class="bfh-timepicker" data-mode="12h" id="sessionTimeOut" data-name="sessionTimeOut"></div>
            		</div>
            	</div>
            	
            	<!-- Session Venue -->
            	<div class="form-group">
            		<label for="Session Venue" class="col-sm-2 control-label">Venue</label>
            		<div class="col-sm-10">
            			<div class="bfh-selectbox" data-name="sessionVenue" id="sessionVenue" data-value="1" data-filter="true">
            				<div data-value="--">--</div>
            				<div data-value="1">Venue 1</div>
            				<div data-value="2">Option 2</div>
            				<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags -->
            			</div>
            		</div>
            		<div class="col-sm-offset-2 col-sm-10">
            			<textarea class="form-control" id="venueRemarks" name="venueRemarks" placeholder="Venue Remarks" rows="3">These are remarks blabla.</textarea>
            		</div>
            	</div>
            	
            	<!-- Capacity -->
            	<div class="form-group">
            		<label for="Capacity" class="col-sm-2 control-label">Capacity</label>
            		<div class="col-sm-10">
            			<input type="number" class="form-control" name="capacity" id="capacity" placeholder="Number of Participants allowed" value="50" required />
            		</div>
            	</div>
            	
            	<!-- Session Speaker -->
            	<div class="form-group">
            		<label for="Session Speaker" class="col-sm-2 control-label">Speaker</label>
            		<div class="col-sm-10">
            			<div class="bfh-selectbox" data-name="sessionSpeaker" id="sessionSpeaker" data-value="2" data-filter="true">
            				<div data-value="--">--</div>
            				<div data-value="1">Option 1 asdsssssssssssssssssssssssssssssssssssssss asdssssssssssssssssssssssssssss</div>
            				<div data-value="2">Speaker ito</div>
            				<!-- USE <div data-value="(value)">(NAME)</div> instead of <option> tags -->
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
<!-- EDIT SESSION MODAL -->


<!-- ADD PARTICIPANTS_MODAL -->
<div class="modal fade addParticipantsModal" id="addParticipantsModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Add Participants</h4>
			</div>
		<form class="form-horizontal" action="modals.html" method="post">
            <div class="modal-body">
            		
				<div class="form-group">
					<label for="Participant Names" class="col-sm-2 control-label" id="participantLabel" >Participants (1)</label>
					<div class="col-sm-10">
                    
                    	<!-- MUST STORE ALL NAMES FROM DATABASE TO HIDDEN SELECT -->
                    	<select class="participantLists hidden">
                        	<option value="James Suarez"></option>
                        	<option value="Marie Rosalado"></option>
                        	<option value="Shiarra Go"></option>
                        	<option value="Nil Carpio"></option>
                        	<option value="Mark Cabe"></option>
                        	<option value="Cedrick Cancio"></option>
                        	<option value="Epsilon Sta. Ana"></option>
                        	<option value="Gabriel Centeno"></option>
                        	<option value="Lyn Frias"></option>
                        </select>
                    	<!-- MUST STORE ALL NAMES FROM DATABASE TO HIDDEN SELECT -->

                        
						<div class="row participantList">
							<div id="participantGroup_1">
								<div class="col-sm-2">
									<label class="control-label">Participant 1</label>
								</div>
								<div class="col-sm-10">
									<div class="input-group ui-widget">
										<input type="text" id="participant_1" name="participants" class="form-control" placeholder="Please type the participant's name here" required />
										<div class="input-group-addon"><button type="button" onclick="return addParticipant()" class="glyphicon glyphicon-plus"></button></div>
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
<!-- ADD PARTICIPANTS MODAL -->


<!-- ATTENDANCE MODAL -->
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
            			<div class="bfh-timepicker" data-mode="12h" id="timeIn" data-name="timeIn"></div>
            		</div>
            	</div>
            	
            	<!-- Time Out -->
            	<div class="form-group">
            		<label for="Time Out" class="col-sm-2 control-label">Time Out</label>
            		<div class="col-sm-10">
            			<div class="bfh-timepicker" data-mode="12h" id="timeOut" data-name="timeOut"></div>
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
<!-- ATTENDANCE MODAL -->


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
