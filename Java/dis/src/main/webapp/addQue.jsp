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
                String s = "";
                con=new Connect();
                if(request.getParameter("examselect")!=null){
                        rs=con.SelectData("select * from exam_master where subjectID="+request.getParameter("subjectid")+" and batch="+request.getParameter("batch1")+";");
                        out.println("SubjectID:<input type='number' name='subject_id' value='"+request.getParameter("subjectid")+"'/><br/> ");
                        out.println("Batch:<input type='number' name='batch' value='"+request.getParameter("batch1")+"'/><br/> ");
                        out.println("ExamID:<select name='exam_id'><br/>");
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
            <%
            if(request.getParameter("submit")!=null){
                int qunos = Integer.parseInt(request.getParameter("qno"));
                ResultSet rs3 = con.SelectData("select * from exam_master where examID="+request.getParameter("exam_id")+";")
                float nFact = 0;
                float wFact = 0;
                nFact = rs3.getFloat("nMaxMarks")/rs3.getFloat("maxMarks");
                wFact = rs3.getFloat("weighMaxMarks")/rs3.getFloat("nMaxMarks");
                int x=1;
                while(x<=qunos){
                    if(con.Ins_Upd_Del("insert into question_master(queDesc,queMaxMarks,nQueMaxMarks,qMaxWeighMarks,examID,coID) values('"+request.getParameter("q"+x)+"',"+request.getParameter("qMarks"+x)+","+(request.getParameter("qMarks"+x)*nFact)+","+(request.getParameter("qMarks"+x)*nFact*wFact)+","+request.getParameter("exam_id")+","+request.getParameter("qCoId"+x)+");")){
                        out.println("<script>alert('Question "+x+" inserted......');</script>");
                    }
                    else{
                        out.println("<script>alert('Question "+x+" was not inserted......');</script>");
                    }
                }
            }
            %>


        </form>
    </body>
    
    <script type="text/javascript">
        
        var st = '<%
            if(request.getParameter("examselect")!=null){
                    rs2=con.SelectData("select * from co_master where subjectID="+request.getParameter("subjectid")+";");
                    while(rs2.next()){
                        s = s +"<option value=\""+rs2.getInt("coID")+"\">CO "+rs2.getInt("coSrNo")+" - "+rs2.getString("coStatement")+"</option>";
                    }
                    out.print(s);
                }
        %>';
        function addRow(frm) {
            var qno = frm.qno.value;
            var n = 1;
            while(n<=qno){
                jQuery('#ques').append('Ques'+n+' Desc:<input type="text" name="q'+(n)+'"><br/>Ques'+n+' Marks:<input type="number" name="qMarks'+(n)+'"><br/>Ques'+n+' Co:<select name="qCoId'+(n)+'">'+st+'</select><br/><br/>');
                n++;
            }
            frm.addbut.disabled="true";
        }
    </script>
</html>