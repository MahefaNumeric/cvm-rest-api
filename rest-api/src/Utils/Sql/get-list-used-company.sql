-- Get list used company
SELECT 
	companies_lang.id_company AS id,
	companies.slug AS slug,
	companies_lang.name AS name, 
	companies_lang.description AS description
FROM companies
JOIN cv_experiences 
	ON cv_experiences.id_cv = 1 
JOIN part_experiences 
	ON part_experiences.id = cv_experiences.id_experience 
JOIN companies_lang
	ON companies_lang.id_company = part_experiences.id_company
WHERE 
	companies.id = companies_lang.id_company AND 
	companies_lang.id_lang = 1
GROUP BY companies.id ASC
ORDER BY part_experiences.date_begin DESC