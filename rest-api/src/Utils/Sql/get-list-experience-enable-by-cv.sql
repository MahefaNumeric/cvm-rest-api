SELECT part_experiences.* 
FROM part_experiences
-- JOIN cv_experiences
-- 	ON cv_experiences.id_experience = part_experiences.id
--     AND cv_experiences.enable = 1
--     AND cv_experiences.id_cv = 1		-- Technical Lead
--     AND part_experiences.id_user = 1	-- Mahefa
ORDER BY date_begin DESC