<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.*"%>
<%@page import="Connection.Connect"%>
<%@page import="java.sql.ResultSetMetaData"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>ATTAINMENT</title>
		<script src="js/jquery-3.2.1.min.js"></script>
	</head>
	<body>
		<a href="addCo.jsp">Add CO</a><br/>
		<a href="addExam.jsp">Add Exam</a><br/>
		<a href="addQue.jsp">Add Question</a><br/>
		<a href="addMarks.jsp">Add Marks</a><br/>
		<a href="calculateAttainment.jsp">Calculate Attainment</a><br/>
		<br/><br/>
		<form method="POST">
			SubjectID:<input type="number" name="subject1"/><br/>
			Batch:<input type="number" name="batch1"/><br/><br/>
			<button name="viewattain" value="viewattain">View Attainment</button><br/>
		</form>
		<%
			Connect con=null;
			ResultSet rs=null;
			ResultSet rs2=null;
			ResultSet rs3=null;
			ResultSetMetaData mtdt=null;


			if(request.getParameter("viewattain")!=null){
				rs=con.SelectData("select examtypeID,typeDescription,count(em.examID) as colspan from examtype_master etm,exam_master em,question_master qm where qm.examID=em.examID and etm.examtypeID=em.examtypeID and em.subjectID="+request.getParameter("subject1")+" and batch="+request.getParameter("batch1")+" group by typeDescription order by examtypeID;");
				out.println("<table border='1'><tr><th rowspan='3'>Enrollment</th>");
				while(rs.next()){
					out.println("<th colspan='"+rs.getInt("colspan")+"'>"+rs.getString("typeDescription")+"</th>");
				}
				out.println("</tr><tr>");
				rs2=con.SelectData("select examName,count(em.examID) as colspan, examtypeID from exam_master em,question_master qm where em.subjectID="+request.getParameter("subject1")+" and batch="+request.getParameter("batch1")+" group by em.examID order by;");
				while(rs.next()){
					out.println("<th colspan='"+rs.getInt("colspan")+"'>"+rs.getString("examName")+"</th>");
				}
			}
		%>


	</body>
</html>