DELIMITER $$
CREATE PROCEDURE spinterviewdetails(IN pinterviewId INT)
BEGIN
    SELECT 
        interviews.id,
        interviews.interviewdate,
        interviews.interviewtime,
        interviews.smeid,
        CONCAT(employees.firstname, " ", employees.lastname) AS SmeName,
        CONCAT(candidates.firstname, " ", candidates.lastname) AS CandidateName,
        subjects.title AS Subject
    FROM 
        interviews
    INNER JOIN 
        subjectmatterexperts ON interviews.smeid = subjectmatterexperts.id
    INNER JOIN 
        employees ON subjectmatterexperts.employeeid = employees.id
    LEFT JOIN 
        employees AS candidates ON interviews.candidateid = candidates.id
    LEFT JOIN 
        subjects ON subjectmatterexperts.subjectid = subjects.id
    WHERE 
        interviews.id = pinterviewId;

    SELECT 
        concepts.id, 
        concepts.title 
    FROM 
        interviews
    INNER JOIN 
        interviewcriterias ON interviews.id = interviewcriterias.interviewid
    INNER JOIN 
        concepts ON interviewcriterias.conceptid = concepts.id
    WHERE 
        interviews.id = pinterviewId;

END $$

DELIMITER ;

CALL spinterviewdetails(1);
