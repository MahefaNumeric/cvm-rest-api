DROP FUNCTION IF EXISTS getPositionLatestInfo;

-- ----------------------------------------------------

DELIMITER //
CREATE FUNCTION 
	getPositionLatestInfo (columnName_param TEXT, id_cv_param INT, id_company_param INT, id_lang_param INT)
RETURNS TEXT
BEGIN

	DECLARE experience_id INT;
    DECLARE experience_slug TEXT;
    DECLARE experience_dateBegin DATE;
    
    --  Get latest position
	SELECT 
		part_experiences.id,
        part_experiences.slug,
        part_experiences.date_begin
    INTO 
    	experience_id,
        experience_slug,
        experience_dateBegin
	FROM companies
	JOIN cv_experiences 
		ON cv_experiences.id_cv = id_cv_param
	JOIN part_experiences 
		ON part_experiences.id = cv_experiences.id_experience 
	JOIN company_positions
		ON company_positions.id = part_experiences.id_company_position
	JOIN company_positions_lang
		ON company_positions_lang.id_company_positions = company_positions.id
		AND company_positions_lang.id_lang = id_lang_param
	JOIN companies_lang
		ON companies_lang.id_company = part_experiences.id_company
	WHERE  
		company_positions_lang.id_lang = companies_lang.id_lang
		AND companies.id = companies_lang.id_company
		AND companies.id = id_company_param
	ORDER BY part_experiences.date_begin DESC
	LIMIT 1;
    
    -- RETURN IF(columnName_param = "experience_id", experience_id, experience_slug);
    RETURN CASE
		WHEN columnName_param = "experience_id" THEN experience_id
		WHEN columnName_param = "experience_slug" THEN experience_slug
		WHEN columnName_param = "experience_dateBegin" THEN experience_dateBegin
		-- ELSE result
	END;
END//
DELIMITER ;

-- ----------------------------------------------------

SELECT 
	getPositionLatestInfo("experience_id", 1, 1, 1) AS experience_id,
	getPositionLatestInfo("experience_slug", 1, 1, 1) AS experience_slug,
    getPositionLatestInfo("experience_dateBegin", 1, 1, 1) AS experience_dateBegin; 