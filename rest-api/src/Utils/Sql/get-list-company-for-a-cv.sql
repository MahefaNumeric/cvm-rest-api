SELECT 
    companies_lang.id_company AS id,
    companies.slug AS slug,
    companies_lang.name AS name,
    companies_lang.description AS description,
    -- getPositionLatestInfo("experience_id", cv_experiences.id_cv, companies.id, companies_lang.id_lang) AS experience_id,  -- Need just for visualisation
    -- getPositionLatestInfo("experience_slug", cv_experiences.id_cv, companies.id, companies_lang.id_lang) AS experience_slug,  -- Need just for visualisation
    getPositionLatestInfo("experience_dateBegin", cv_experiences.id_cv, companies.id, companies_lang.id_lang) AS experience_dateBegin  -- What is really need
FROM companies
JOIN cv_experiences 
    ON cv_experiences.id_cv = 1
JOIN part_experiences 
    ON part_experiences.id = cv_experiences.id_experience 
JOIN company_positions
    ON company_positions.id = part_experiences.id_company_position
JOIN company_positions_lang
    ON company_positions_lang.id_company_positions = company_positions.id
JOIN companies_lang
    ON companies_lang.id_company = part_experiences.id_company
WHERE company_positions_lang.id_lang = 1
    AND company_positions_lang.id_lang = companies_lang.id_lang
    AND companies.id = companies_lang.id_company
GROUP BY part_experiences.id_company
ORDER BY experience_dateBegin ASC   -- What is really need