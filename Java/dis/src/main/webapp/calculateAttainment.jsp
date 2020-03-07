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
			ResultSet rs6=null;
			ResultSet rs7=null;
			ResultSetMetaData mtdt=null;
			int coCounter=0;
			int i=1;
			con=new Connect();

			if(request.getParameter("viewattain")!=null){
				out.println("<table border='1' ><tr><th rowspan='4' bgcolor='#e1e19b'>Enrollment</th>");
				rs0=con.SelectData("select coSrNo,count(coSrNo)*2 as colspan from question_master,exam_master,examtype_master,co_master where question_master.coID=co_master.coID	AND exam_master.examID=question_master.examID AND examtype_master.examTypeID=exam_master.examTypeID AND exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and question_master.questionID in (select distinct questionID from marks_obtained_master) group by coSrNo order by coSrNo,typeDescription,examName,queDesc;");
				while(rs0.next()){
					out.println("<th colspan='"+rs0.getInt("colspan")+"' bgcolor='lightgrey'>CO-"+rs0.getInt("coSrNo")+"</th>");
					out.println("<th rowspan='4' bgcolor='pink'>Total</th>");
					coCounter++;
				}
				out.println("<th rowspan='4' bgcolor='silver'>Overall Total</th>");
				out.println("</tr><tr>");
				rs=con.SelectData("select typeDescription,examName,coSrNo,count(typeDescription)*2 as colspan from exam_master,examtype_master,question_master,co_master where exam_master.examID=question_master.examID and question_master.coID=co_master.coID and exam_master.examtypeID=examtype_master.examTypeID and exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and coSrNo group by coSrNo,examtype_master.examTypeID order by coSrNo,typeDescription;");
				while(rs.next()){
					out.println("<th colspan='"+rs.getInt("colspan")+"' bgcolor='silver'>"+rs.getString("typeDescription")+"</th>");
				}
				out.println("</tr><tr>");
				rs2=con.SelectData("select examName,exam_master.examID,count(exam_master.examtypeID)*2 as colspan from exam_master,examtype_master,question_master,co_master where exam_master.examID=question_master.examID and question_master.coID=co_master.coID and exam_master.examtypeID=examtype_master.examTypeID and exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and coSrNo group by coSrNo,examtype_master.examTypeID,examName order by coSrNo,typeDescription;");
				while(rs2.next()){
					out.println("<th colspan='"+rs2.getInt("colspan")+"' bgcolor='gold'>"+rs2.getString("examName")+"</th>");
				}
				out.println("</tr><tr>");
				rs3=con.SelectData("select queDesc from exam_master,examtype_master,question_master,co_master where exam_master.examID=question_master.examID and question_master.coID=co_master.coID and exam_master.examtypeID=examtype_master.examTypeID and exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and coSrNo group by coSrNo,examtype_master.examTypeID,exam_master.examID,questionID order by coSrNo,typeDescription;");
				while(rs3.next()){
					out.println("<th colspan='2' bgcolor='lightblue'>"+rs3.getString("queDesc")+"</th>");
				}	
				out.println("</tr>");
				rs4=con.SelectData("select enrollmentno from student_master where batch="+request.getParameter("batch1")+";");
				while(rs4.next()){
					out.println("<tr>");
					out.println("<td bgcolor='#e1e19b'>"+rs4.getString("enrollmentno")+"</td>");
					rs6=con.SelectData("select sum(obtainedWeighMarks) from (select coSrNo,queDesc,obtainedMarks,obtainedWeighMarks from exam_master,examtype_master,question_master,co_master,marks_obtained_master where marks_obtained_master.questionID=question_master.questionID and exam_master.examID=question_master.examID and question_master.coID=co_master.coID and exam_master.examtypeID=examtype_master.examTypeID and exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and enrollmentno='"+rs4.getString("enrollmentno")+"' group by coSrNo,examtype_master.examTypeID,examName,question_master.questionID order by coSrNo,typeDescription) as t1 group by coSrNo;");
					i=1;
					while(i<=coCounter){
						rs5=con.SelectData("select coSrNo,queDesc,obtainedMarks,obtainedWeighMarks from exam_master,examtype_master,question_master,co_master,marks_obtained_master where marks_obtained_master.questionID=question_master.questionID and exam_master.examID=question_master.examID and question_master.coID=co_master.coID and exam_master.examtypeID=examtype_master.examTypeID and exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and enrollmentno='"+rs4.getString("enrollmentno")+"' and coSrNo="+i+" group by coSrNo,examtype_master.examTypeID,examName,question_master.questionID order by coSrNo,typeDescription;");
						while(rs5.next()){
							out.println("<td>"+rs5.getFloat("obtainedMarks")+"</td><td>"+rs5.getFloat("obtainedWeighMarks")+"</td>");
						}
						i++;
						rs6.next();
						out.println("<td bgcolor='pink'>"+rs6.getFloat("sum(obtainedWeighMarks)")+"</td>");
					}
					rs7=con.SelectData("select sum(sumObtWei) from (select sum(obtainedWeighMarks) as sumObtWei from (select coSrNo,queDesc,obtainedMarks,obtainedWeighMarks from exam_master,examtype_master,question_master,co_master,marks_obtained_master where marks_obtained_master.questionID=question_master.questionID and exam_master.examID=question_master.examID and question_master.coID=co_master.coID and exam_master.examtypeID=examtype_master.examTypeID and exam_master.subjectID="+request.getParameter("subject1")+" and exam_master.batch="+request.getParameter("batch1")+" and enrollmentno='"+rs4.getString("enrollmentno")+"' group by coSrNo,examtype_master.examTypeID,examName,question_master.questionID order by coSrNo,typeDescription) as t1 group by coSrNo) as t2;");
					if(rs7.next()){
						out.println("<td bgcolor='silver'>"+rs7.getFloat("sum(sumObtWei)")+"</td>");
					}
					out.println("</tr>");
				}

				out.println("</table>");
			}
		%>

		</form>
	</body>
</html>