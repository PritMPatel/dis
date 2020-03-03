<%
	String userRole = new String("SUPERSTAR");
	
	if(session.getAttribute("role") != null){
		userRole = (String)session.getAttribute("role");
	}
	if(userRole.equals("faculty")){
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.*"%>
<%@page import="Connection.Connect"%>
<title>Home</title>
<jsp:include page="headerFaculty.jsp" />
<body style="height: vh;">
		<div class="header" style="width: 100%; z-index: 980;" uk-sticky="">
	        <h1 class="uk-heading-divider"></h1>
	        <h1 class="uk-heading-line uk-text-center"><span>Department Information System</span></h1>
	        <h1 class="uk-heading-divider"></h1>
	    </div>

	<div class="page" style="padding: 0px; margin: 0px; height: -webkit-fill-available; background-color: #edf2fa;">
		<div class="container" style="padding: 0px; margin: 0px; height: -webkit-fill-available;">
			<div class="row" style="height: -webkit-fill-available; width: 100%;padding: 0px; margin: 0px;">
				<div class="col-sm-4 col-md-3 col-lg-2"
					style="padding: 10px; margin-top: 0px; background-color: #b3d9ff; height: 100vh;">
					<div class="col-lg order-lg-first">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a href="./facultyHome.jsp" class="nav-link active"><i class="fe fe-home"></i> Home</a>
							</li>
							<li class="nav-item">
								<a href="facultyAddExam.jsp" class="nav-link"><i class="fe fe-plus"></i> Add Exam</a>
							</li>
							<li class="nav-item">
								<a href="facultyAddCo.jsp" class="nav-link"><i class="fe fe-plus"></i> Add CO</a>
							</li>
							<li class="nav-item">
								<a href="facultyAddMarks.jsp" class="nav-link"><i class="fe fe-plus"></i> Add Marks</a>
							</li>
							<li class="nav-item">
								<a href="facultyVeiwStats.jsp" class="nav-link"><i class="fe fe-check-circle"></i> View Statistics</a>
							</li>
							<!-- <li class="nav-item">
								<a href="facultyLeaveRequests.jsp" class="nav-link"><i class="fe fe-check-circle"></i>
									Your Leaves</a>
							</li>
							<li class="nav-item">
								<a href="" class="nav-link"><i class="fe fe-file"></i> View Report</a>
							</li> -->
							<li class="nav-item">
								<a href="facultyEditProfile.jsp" class="nav-link"><i class="fe fe-user"></i> Edit
									Profile</a>
							</li>

							<li class="nav-item">
								<a href="facultyChangePassword.jsp" class="nav-link"><i class="fe fe-lock"></i> Change
									Password</a>
							</li>
							<li class="nav-item">
								<a href="logout.jsp" class="nav-link"><i class="fe fe-minus"></i> Logout</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-sm col-md col-lg" style="margin: 0px; padding: 0px; width: 100%; height: max-content;">


				</div>
				<!-- 			</div>
							</div>
						</div>
					</div>

				</div> -->
			</div>
		</div>
	</div>
</body>


</html>
<%
	}
	else{
		out.println("<script>alert('SESSION INVALID!!! PLEASE LOGIN AGAIN!!!!!');</script>");
		response.sendRedirect("login.jsp");
	}
%>