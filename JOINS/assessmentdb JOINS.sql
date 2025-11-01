USE assessmentdb;

-- JOIN PERFORMED ON questionbank , evaluationcriterias and subjects Table FROM assessmentdb DATABASE.
SELECT s.id, s.title,ec.id,ec.title,qb.id,qb.title, qb.a,qb.b,qb.c,qb.d,qb.answerkey
FROM questionbank qb
JOIN evaluationcriterias ec ON ec.id = qb.evaluationcriteriaid
JOIN subjects s ON s.id=qb.subjectid;

-- JOIN PERFORMED ON userroles , users and roles Table FROM assessmentdb DATABASE.
SELECT u.id AS userid,CONCAT(u.firstname," ",u.lastname) AS name,r.id AS roleid,r.lob,ur.id AS userroleid
FROM users u
JOIN userroles ur ON u.id = ur.userid
JOIN roles r ON r.id = ur.roleid;

-- JOIN PERFORMED ON candidatetestresults , tests , subjects FROM assessmentdb DATABASE.
SELECT candidatetestresults.score,subjects.title,tests.id
from candidatetestresults 
JOIN tests ON tests.id=candidatetestresults.testid 
JOIN subjects ON subjects.id=tests.subjectid 
WHERE candidatetestresults.candidateid=2
AND year(teststarttime)=2015;

-- write a join on test table .

-- JOIN PERFORMED ON subject , employees , subjectmatterexpert , tests Table FROM assessmentdb DATABASE.
SELECT s.id AS subjectid,s.title AS subjecttitle,sme.id AS subjectmatterexpert,sme.certificationdate,e.id AS employeeid,CONCAT(e.firstname," ",e.lastname) AS name ,t.duration,
t.creationdate,t.modificationdate,t.scheduleddate,t.passinglevel
FROM tests t
JOIN subjects s ON s.id = t.subjectid
JOIN subjectmatterexperts sme ON sme.id = t.smeid
JOIN employees e ON e.id = sme.employeeid;





