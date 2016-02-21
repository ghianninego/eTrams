<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="../css/index.css" />
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		
		<script src="../js/jquery.js"></script>
		<script src="../js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="../js/myscript.js"></script>
		
		<title>UST eTrams</title>
	</head>
	
	<body>
		<div class="wrapper">
			
			<div class="outer">
				<div class="middle">
					<div class="inner">
					
						<!-- System Title -->
						<div class="indexLogo">
							<img src="../img/system title.jpg" alt="e-Training Registration & Attendance Monitoring System">
						</div>
						<!-- End of System Title -->
						
						<!-- Login Form-->
						<form class="form login" action="admin/adminHome.jsp" method="">
							<div class="form-group">
								<input type="text" class="form-control" id="username" name="username" 
									required="required" placeholder="Username">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password" name="password" 
									required="required" placeholder="Password">
							</div>
							<button type="submit" class="btn btn-yellow">Login</button>
						</form>
						<!-- End of Login Form -->
						
						<!-- Footer -->
						<div class="indexFooter">
							<p>© 2016 University of Santo Tomas. All Rights Reserved.</p>
						</div>
						<!-- End of Footer -->
						
					</div>
				</div>				
			</div>
			
		</div>
	</body>
</html>