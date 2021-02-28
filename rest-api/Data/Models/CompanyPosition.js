
class CompanyPosition{

    constructor(
        id,
        slug,
        title,
        description,
        descriptionExperiencePosition,
        experienceDateBegin,
        experienceDateEnd
    ){
        this.id = id;
        this.slug = slug;
        this.title = title;
        this.description = description;
        this.descriptionExperiencePosition = descriptionExperiencePosition;
        this.experienceDateBegin = experienceDateBegin;
        this.experienceDateEnd = experienceDateEnd;
    }

    static getListPositionByCv(idCv, idCompany, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT 
                    /* cv_experiences.id_cv,
                    cv_experiences.id_experience, */

                    /* part_experiences.id AS idExperience,
                    part_experiences.id_user ,
                    part_experiences.id_company,
                    part_experiences.id_company_position ,
                    part_experiences.slug AS slugExperience, */

                    company_positions.id AS idPosition,
                    company_positions.slug AS slugPosition,
                    company_positions_lang.title AS titlePosition,
                    company_positions_lang.description AS descriptionPosition, 
                    part_experiences_lang.description as descriptionExperiencePosition,
                    DATE_FORMAT(part_experiences.date_begin, '%Y-%m') as date_begin,
                    DATE_FORMAT(part_experiences.date_end, '%Y-%m') as date_end

                    /* companies_lang.id_company AS idCompany,
                    companies.slug AS slugCompany,
                    companies_lang.name AS nameCompany,
                    companies_lang.description AS descriptionCompany */

                FROM cv_experiences 
                JOIN part_experiences 
                    ON part_experiences.id = cv_experiences.id_experience
                JOIN company_positions
                    ON company_positions.id = part_experiences.id_company_position
                JOIN company_positions_lang
                    ON company_positions_lang.id_company_positions = company_positions.id
                JOIN companies_lang
                    ON companies_lang.id_company = part_experiences.id_company 
                JOIN companies
                    ON companies.id = companies_lang.id_company 
                JOIN part_experiences_lang
                    ON part_experiences_lang.id_part_experiences = part_experiences.id
                WHERE cv_experiences.id_cv = ${idCv} 
                    AND company_positions_lang.id_lang = ${idLang} 
                    AND company_positions_lang.id_lang = companies_lang.id_lang
                    AND part_experiences_lang.id_lang = companies_lang.id_lang
                    AND part_experiences.id_company = ${idCompany}
            `;
            // console.log("CompanyPosition::getListPositionByCv::sql", sql);
            connMysql.query(sql, (error, listPositionsResult, fields) => {
                if(error) reject({
                    message: "CompanyPosition::getListPositionByCv::error",
                    data: error
                });
                if(Array.isArray(listPositionsResult) && listPositionsResult.length > 0) {
                    const listPositions = [];
                    listPositionsResult.forEach(element => {
                        listPositions.push(new CompanyPosition(...Object.values(element)));
                    });
                    resolve(listPositions);
                }else{
                    reject({
                        message: "CompanyPosition::getListPositionByCv::listPositionsResult null",
                        data: {listPositionsResult, error}
                    });
                }
            });
        });
    }

}

module.exports = CompanyPosition;