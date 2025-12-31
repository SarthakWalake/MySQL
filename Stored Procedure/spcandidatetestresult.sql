USE assessmentdb;

DELIMITER $$

CREATE PROCEDURE spcandidatetestresult(IN pcandidateId INT , IN passessmentId INT , OUT pscore INT)
BEGIN
DECLARE totalMarks INT;
SELECT COUNT(CASE WHEN candidateanswers.answerkey = questionbank.answerkey THEN 1 ELSE NULL END) AS score 
INTO totalMarks FROM candidateanswers
INNER JOIN testquestions on testquestions.id = candidateanswers.testquestionid
INNER JOIN   questionbank on questionbank.id=testquestions.questionbankid
INNER JOIN tests on tests.id=testquestions.testid
INNER JOIN assessments on assessments.test_id=tests.id
WHERE candidateanswers.candidateid = pcandidateId AND assessments.id = passessmentId;
set pscore=totalMarks;
Update candidatetestresults  set score =pscore where candidateid= pcandidateId and assessmentid= passessmentId;
END $$

DELIMITER ;


call spcandidatetestresult(2,2,@pscore);
select(@pscore);
