<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.*"%>
<%@page import="Connection.Connect"%>
<%@page import="java.sql.ResultSetMetaData"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>ADD QUESTION</title>
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
            <div id="selectexam">
            SubjectID:<input type="number" name="subjectid"/><br/> 
            Batch:<input type="number" name="batch1"/><br/> 
            <button name="examselect" value="examselect">Select Exam</button><br/>
            </div>
            <%
                Connect con=null;
                ResultSet rs=null;
                ResultSet rs2=null;
                ResultSetMetaData mtdt=null;
                con=new Connect();
                if(request.getParameter("examselect")!=null){
                        rs=con.SelectData("select * from exam_master where subjectID="+request.getParameter("subjectid")+" and batch="+request.getParameter("batch1")+";");
                        out.println("SubjectID:<input type='number' name='subject_id' value='"+request.getParameter("subjectid")+"'/><br/> ");
                        out.println("Batch:<input type='number' name='batch' value='"+request.getParameter("batch1")+"'/><br/> ");
                        out.println("ExamID:<select id='exam_id'><br/>");
                        while(rs.next()){
                            out.println("<option value='"+rs.getInt("examID")+"'>"+rs.getInt("examID")+" - "+rs.getString("examName")+"</option>");
                        }
                        out.println("</select>");
                    }
            %>
            No of QUESTION:  <input type="number" name="qno" id="quNo"/><br/>
            <input onclick="addRow(this.form);" type="button" name="addbut" value="Add"><br/>
            :::Question Normalized Max Marks Calculated From Multiply QuesMarks with exam_master nMaxMarks/MaxMarks:::<br/><br/>
            :::Question Weighted Max Marks Calculated From Multiply nQuesMarks with exam_master maxWeighMarks/nMaxMarks:::<br/><br/>
            <div id="ques">
            </div>
            <button type="submit" name="submit" value="submit">Submit</button>
        </form>
    </body>
    <script type="text/javascript">
        function addRow(frm) {
            var qno = frm.qno.value;
            var n = 1;
            while(n<=qno){
                jQuery('#ques').append('QuesDesc:<input type="text" id="q'+(n)+'"><br/>QuesMarks:<input type="text" id="qMarks'+(n)+'"><br/>QuesCoID:<select name="qCo_id"><%if(request.getParameter("addbut")!=null){rs2=con.SelectData("select * from co_master where subjectID="+request.getParameter("subjectid")+";");while(rs2.next()){out.print("<option value='"+rs.getInt("coID")+"'>CO "+rs.getInt("coSrNo")+" - "+rs.getString("coStatement")+"</option>");}}%></select><br/><br/>');
                n++;
            }
            frm.addbut.disabled="true";
        }
    </script>
</html>