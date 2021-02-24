class Company{
    // static _table = 'part_experiences';

    constructor(
    ){
        // // Position on a company
        this.positions = [];
    }

    /**
     * Retrive list Companies from table cv_experiences
     * @param {*} idCv 
     * @param {*} idLang 
     * @returns {Array<Experiences>}
     */
    static getListCompaniesFromDbByCv(idCv, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../Configs/Databases/db.config");
            const sql = `
                SELECT 
                    /* cv_experiences.id_cv,
                    cv_experiences.id_experience, */

                    /* part_experiences.id AS idExperience,
                    part_experiences.id_user ,
                    part_experiences.id_company,
                    part_experiences.id_company_position ,
                    part_experiences.slug AS slugExperience, 
                    part_experiences.date_begin,
                    part_experiences.date_end, */

                    /* company_positions.id AS idCompanyPosition,
                    company_positions.slug AS slugCompanyPosition, */

                    /* company_positions_lang.id_lang, 
                    company_positions_lang.title AS titleCompanyPosition,
                    company_positions_lang.description AS descriptionCompanyPosition, */

                    companies_lang.id_company AS idCompany,
                    companies_lang.name AS nameCompany,
                    companies_lang.description AS descriptionCompany

                FROM cv_experiences 
                JOIN part_experiences 
                    ON part_experiences.id = cv_experiences.id_cv 
                JOIN company_positions
                    ON company_positions.id = part_experiences.id_company_position
                JOIN company_positions_lang
                    ON company_positions_lang.id_company_positions = company_positions.id
                JOIN companies_lang
                    ON companies_lang.id_company = part_experiences.id_company 
                WHERE cv_experiences.id_cv = ${idCv} 
                    AND company_positions_lang.id_lang = ${idLang} 
            `;

            connMysql.query(sql, (error, listExperiencesResult, fields) => {
                if(error) throw error;
                if(Array.isArray(listExperiencesResult) && listExperiencesResult.length > 0) {
                    const listCompanies = [];
                    listExperiencesResult.forEach(element => {
                        listCompanies.push(new Experiences(...Object.values(element)));
                    });
                    resolve(listCompanies);
                }else{
                    reject({
                        message: "Experiences::getListExperiencesFromDbByCv::listExperiencesResult null",
                        error: [listExperiencesResult, error]
                    });
                }
            });
        });
    }

}

module.exports = Company;