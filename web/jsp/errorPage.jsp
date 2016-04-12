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
						
						<!-- Error Message-->
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2">
								<%if (session.getAttribute("errorMessage") == null) {%>
								<h2>Oops! Something went wrong with the system.</h2>
								<% } else { %>
								<h2> <%=session.getAttribute("errorMessage") %></h2> 
								
								<% } session.setAttribute("errorMessage", null); %>
								<h4>Click <a href="../index.jsp">here</a> to redirect to the index page.</h4>
								<br>
								<h4>Or contact us: (contact numbers here)</h4>
								<br><br><br>
							</div>
						</div>
						<!-- End of Error Message -->
						
						<!-- Footer -->
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3 indexFooter">
								<p>© 2016 University of Santo Tomas. All Rights Reserved.</p>
							</div>
						</div>
						<!-- End of Footer -->
						
					</div>
				</div>				
			</div>
			
		</div>
	</body>
</html>