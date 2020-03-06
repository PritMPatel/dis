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
			<button name="viewattain" value="viewattain">View Attainment</button><br/><br/>
		
		<%
			Connect con=null;
			ResultSet rs0=null;
			ResultSet rs=null;
			ResultSet rs2=null;
			ResultSet rs3=null;
			ResultSet rs4=null;
			ResultSet rs5=null;
			ResultSetMetaData mtdt=null;
			con=new Connect();

			if(request.getParameter("viewattain")!=null){
				out.println("<table border='1'><tr><th rowspan='4'>Enrollment</th>");
				rs0=con.SelectData("select coSrNo,count(coSrNo)*2 as colspan from question_master,exam_master,examtype_master,co_master where question_master.coID=co_master.coID	AND exam_master.examID=question_master.examID AND examtype_master.examTypeID=exam_master.examTypeID AND exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and question_master.questionID in (select distinct questionID from marks_obtained_master) group by coSrNo order by coSrNo,typeDescription,examName,queDesc;");
				while(rs0.next()){
					out.println("<th colspan='"+rs0.getInt("colspan")+"'>CO-"+rs0.getInt("coSrNo")+"</th>");
				}
				out.println("</tr><tr>");
				rs=con.SelectData("select typeDescription,count(exam_master.examtypeID)*2 as colspan from question_master,exam_master,examtype_master,co_master where question_master.coID=co_master.coID	AND exam_master.examID=question_master.examID AND examtype_master.examTypeID=exam_master.examTypeID AND exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and question_master.questionID in (select distinct questionID from marks_obtained_master) group by coSrNo order by coSrNo,typeDescription,examName,queDesc;");
				while(rs.next()){
					out.println("<th colspan='"+rs.getInt("colspan")+"'>"+rs.getString("typeDescription")+"</th>");
				}
				out.println("</tr><tr>");
				rs2=con.SelectData("select examName,count(exam_master.examID)*2 as colspan from question_master,exam_master,examtype_master,co_master where question_master.coID=co_master.coID	AND exam_master.examID=question_master.examID AND examtype_master.examTypeID=exam_master.examTypeID AND exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" group by coSrNo order by coSrNo,typeDescription,examName,queDesc;");
				while(rs2.next()){
					out.println("<th colspan='"+rs2.getInt("colspan")+"'>"+rs2.getString("examName")+"</th>");
				}
				out.println("</tr><tr>");
				rs3=con.SelectData("select coSrNo,typeDescription,examName,queDesc from question_master,exam_master,examtype_master,co_master where question_master.coID=co_master.coID	AND exam_master.examID=question_master.examID AND examtype_master.examTypeID=exam_master.examTypeID AND exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and question_master.questionID in (select distinct questionID from marks_obtained_master) order by coSrNo,typeDescription,examName,queDesc;");
				while(rs3.next()){
					out.println("<th colspan='2'>"+rs3.getString("queDesc")+"</th>");
				}	
				out.println("</tr>");
				rs4=con.SelectData("select enrollmentno from student_master where batch="+request.getParameter("batch1")+";");
				while(rs4.next()){
					out.println("<tr>");
					out.println("<td>"+rs4.getString("enrollmentno")+"</td>");
					rs5=con.SelectData("select enrollmentno,coSrNo,typeDescription,examName,queDesc,question_master.questionID,obtainedMarks,obtainedWeighMarks from question_master,exam_master,examtype_master,co_master,marks_obtained_master where marks_obtained_master.questionID=question_master.questionID and question_master.coID=co_master.coID	AND exam_master.examID=question_master.examID AND examtype_master.examTypeID=exam_master.examTypeID AND exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and enrollmentno="+rs4.getString("enrollmentno")+" and question_master.questionID in (select distinct questionID from marks_obtained_master) order by enrollmentno,coSrNo,typeDescription,examName,queDesc;");
					while(rs5.next()){
						out.println("<td>"+rs5.getFloat("obtainedMarks")+"</td><td>"+rs5.getFloat("obtainedWeighMarks")+"</td>");
					}
					out.println("</tr>");
				}

				out.println("</table>");
			}
		%>

		</form>
	</body>
</html>