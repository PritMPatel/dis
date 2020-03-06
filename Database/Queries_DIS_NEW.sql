SELECT * FROM finalyearproject.marks_obtained_master, question_master where marks_obtained_master.questionID=question_master.questionID and coID=2;

SELECT distinct enrollmentno FROM finalyearproject.marks_obtained_master, question_master where marks_obtained_master.questionID=question_master.questionID and coID=2;

/*FIND BATCH PRESENT IN DB*/
select distinct batch from student_master;


select * from exam_master em, question_master qm where em.examID=qm.examID and qm.coID=2 and batch=2017;

select coID,sum(queMaxWeighMarks) from exam_master em, question_master qm where em.examID=qm.examID and batch=2017 and subjectID=1 group by coID order by coID;

select sum(queMaxWeighMarks) from exam_master em, question_master qm where em.examID=qm.examID and batch=2017 and subjectID=1;

select enrollmentno,question_master.coID, sum(obtainedWeighMarks) from marks_obtained_master,question_master,exam_master where marks_obtained_master.questionID=question_master.questionID and question_master.examID = exam_master.examID and batch=2017 and exam_master.subjectID=1 group by enrollmentno,coID order by enrollmentno; 

SELECT * FROM finalyearproject.marks_obtained_master, question_master where marks_obtained_master.questionID=question_master.questionID and coID=2;

select enrollmentno,t1.typeDescription,t1.examName,qm.queDesc,coSrNo,obtainedWeighMarks from marks_obtained_master mm,question_master qm,co_master cm,(select examID,typeDescription,examName from examtype_master etm,exam_master em where etm.examtypeID=em.examtypeID) as t1 where qm.examID=t1.examID and mm.questionID=qm.questionID and qm.coID=cm.coID and mm.questionID in(select questionID from question_master where examID in (select examID from exam_master where batch=2017 and subjectID=1)) order by enrollmentno,typeDescription,examName,queDesc; 

select examID,typeDescription,examName from examtype_master etm,exam_master em where etm.examtypeID=em.examtypeID and em.subjectID=1 and batch=2017;

select typeDescription,count(em.examID) as colspan from examtype_master etm,exam_master em,question_master qm where qm.examID=em.examID and etm.examtypeID=em.examtypeID and em.subjectID=1 and batch=2017 group by typeDescription;
select examName,count(em.examID) as colspan from exam_master em,question_master qm where em.subjectID=1 and batch=2017 group by em.examID;

/*Calculates Total Weighted Marks CO Wise and Attainment of that in Percentage for each student*/
SELECT 
    enrollmentno,
    table1.coSrNo,
    TotalObtWeiMarks,
    MaxTotalWeighMarks,
    (TotalObtWeiMarks * 100 / MaxTotalWeighMarks) AS CO_ATTAINMENT
FROM
    (SELECT 
        enrollmentno,
            coSrNo,
            SUM(obtainedWeighMarks) AS TotalObtWeiMarks
    FROM
        marks_obtained_master, question_master, exam_master, co_master
    WHERE
        marks_obtained_master.questionID = question_master.questionID
			AND question_master.coID = co_master.coID
            AND question_master.examID = exam_master.examID
            AND batch = 2017
            AND exam_master.subjectID = 1
            AND enrollmentno = 1
    GROUP BY enrollmentno , question_master.coID
    ORDER BY enrollmentno) AS table1,
    (SELECT 
        qm.coID,coSrNo, SUM(queMaxWeighMarks) AS MaxTotalWeighMarks
    FROM
        exam_master em, question_master qm, co_master cm
    WHERE
        em.examID = qm.examID AND qm.coID = cm.coID AND batch = 2017 AND em.subjectID = 1
    GROUP BY qm.coID) AS table2
WHERE
    table1.coSrNo = table2.coSrNo
ORDER BY enrollmentno , table1.coSrNo;

/*CO WISE AVG ATTAINMENT OF CLASS*/
SELECT 
    coID, AVG(CO_ATTAINMENT)
FROM
    (SELECT 
        enrollmentno,
            table1.coID,
            TotalObtWeiMarks,
            MaxTotalWeighMarks,
            (TotalObtWeiMarks * 100 / MaxTotalWeighMarks) AS CO_ATTAINMENT
    FROM
        (SELECT 
        enrollmentno,
            question_master.coID,
            SUM(obtainedWeighMarks) AS TotalObtWeiMarks
    FROM
        marks_obtained_master, question_master, exam_master
    WHERE
        marks_obtained_master.questionID = question_master.questionID
            AND question_master.examID = exam_master.examID
            AND batch = 2017
            AND exam_master.subjectID = 1
    GROUP BY enrollmentno , coID
    ORDER BY enrollmentno) AS table1, (SELECT 
        coID, SUM(queMaxWeighMarks) AS MaxTotalWeighMarks
    FROM
        exam_master em, question_master qm
    WHERE
        em.examID = qm.examID AND batch = 2017
            AND subjectID = 1
    GROUP BY coID) AS table2
    WHERE
        table1.coID = table2.coID
    ORDER BY enrollmentno , table1.coID) AS t3
GROUP BY coID
ORDER BY coID;

/*Weightage of Each CO*/
SELECT 
	coID,
    (COWiseMax * 100 / TotalAllCO) AS WeightageOfCo
FROM
    (SELECT 
        coID, SUM(queMaxWeighMarks) AS COWiseMax
    FROM
        exam_master em, question_master qm
    WHERE
        em.examID = qm.examID AND batch = 2017
            AND subjectID = 1
    GROUP BY coID) AS t1,
    (SELECT 
        SUM(queMaxWeighMarks) AS TotalAllCO
    FROM
        exam_master em, question_master qm
    WHERE
        em.examID = qm.examID AND batch = 2017
            AND subjectID = 1) AS t2
ORDER BY coID;

/*CO WISE ATTAINMENT FOR EACH ENROLLMENT*/
select 
	enrollmentno,t0.coID,t0.CO_ATTAINMENT,t00.WeightageOfCo,(t0.CO_ATTAINMENT*t00.WeightageOfCo/100) as COWiseAttainment
from (SELECT 
    enrollmentno,
    table1.coID,
    TotalObtWeiMarks,
    MaxTotalWeighMarks,
    (TotalObtWeiMarks * 100 / MaxTotalWeighMarks) AS CO_ATTAINMENT
FROM
    (SELECT 
        enrollmentno,
            question_master.coID,
            SUM(obtainedWeighMarks) AS TotalObtWeiMarks
    FROM
        marks_obtained_master, question_master, exam_master
    WHERE
        marks_obtained_master.questionID = question_master.questionID
            AND question_master.examID = exam_master.examID
            AND batch = 2017
            AND exam_master.subjectID = 1
    GROUP BY enrollmentno , coID
    ORDER BY enrollmentno) AS table1,
    (SELECT 
        coID, SUM(queMaxWeighMarks) AS MaxTotalWeighMarks
    FROM
        exam_master em, question_master qm
    WHERE
        em.examID = qm.examID AND batch = 2017 AND subjectID = 1
    GROUP BY coID) AS table2
WHERE
    table1.coID = table2.coID
ORDER BY enrollmentno , table1.coID) as t0,
(SELECT 
	coID,
    (COWiseMax * 100 / TotalAllCO) AS WeightageOfCo
FROM
    (SELECT 
        coID, SUM(queMaxWeighMarks) AS COWiseMax
    FROM
        exam_master em, question_master qm
    WHERE
        em.examID = qm.examID AND batch = 2017
            AND subjectID = 1
    GROUP BY coID) AS t1,
    (SELECT 
        SUM(queMaxWeighMarks) AS TotalAllCO
    FROM
        exam_master em, question_master qm
    WHERE
        em.examID = qm.examID AND batch = 2017
            AND subjectID = 1) AS t2
ORDER BY coID) as t00 where t0.coID = t00.coID order by enrollmentno,t0.coID; 

/*ENROLLMENT NO WISE ATTAINMENT OF SUBJECT*/
select enrollmentno, sum(COWiseAttainment) as OverallAttainment from (select 
	enrollmentno,t0.coID,t0.CO_ATTAINMENT,t00.WeightageOfCo,(t0.CO_ATTAINMENT*t00.WeightageOfCo/100) as COWiseAttainment
from (SELECT 
    enrollmentno,
    table1.coID,
    TotalObtWeiMarks,
    MaxTotalWeighMarks,
    (TotalObtWeiMarks * 100 / MaxTotalWeighMarks) AS CO_ATTAINMENT
FROM
    (SELECT 
        enrollmentno,
            question_master.coID,
            SUM(obtainedWeighMarks) AS TotalObtWeiMarks
    FROM
        marks_obtained_master, question_master, exam_master
    WHERE
        marks_obtained_master.questionID = question_master.questionID
            AND question_master.examID = exam_master.examID
            AND batch = 2017
            AND exam_master.subjectID = 1
    GROUP BY enrollmentno , coID
    ORDER BY enrollmentno) AS table1,
    (SELECT 
        coID, SUM(queMaxWeighMarks) AS MaxTotalWeighMarks
    FROM
        exam_master em, question_master qm
    WHERE
        em.examID = qm.examID AND batch = 2017 AND subjectID = 1
    GROUP BY coID) AS table2
WHERE
    table1.coID = table2.coID
ORDER BY enrollmentno , table1.coID) as t0,
(SELECT 
	coID,
    (COWiseMax * 100 / TotalAllCO) AS WeightageOfCo
FROM
    (SELECT 
        coID, SUM(queMaxWeighMarks) AS COWiseMax
    FROM
        exam_master em, question_master qm
    WHERE
        em.examID = qm.examID AND batch = 2017
            AND subjectID = 1
    GROUP BY coID) AS t1,
    (SELECT 
        SUM(queMaxWeighMarks) AS TotalAllCO
    FROM
        exam_master em, question_master qm
    WHERE
        em.examID = qm.examID AND batch = 2017
            AND subjectID = 1) AS t2
ORDER BY coID) as t00 where t0.coID = t00.coID order by enrollmentno,t0.coID) as t000 group by enrollmentno; 