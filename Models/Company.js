const CompanyPosition = require("./CompanyPosition");

class Company{
    static _table = 'companies';

    constructor(
        id,
        slug,
        name,
        description
    ){
        this.id = id;
        this.slug = slug;
        this.name = name;
        this.description = description;

        // // Position on a company
        this.positions = [];
    }

    /**
     * Retrive list Companies from table cv_experiences
     * @param {*} idCv 
     * @param {*} idLang 
     * @returns {Array<Company>}
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
                    companies.slug AS slugCompany,
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
                JOIN companies
                    ON companies.id = companies_lang.id_company 
                WHERE cv_experiences.id_cv = ${idCv} 
                    AND company_positions_lang.id_lang = ${idLang} 
                    AND company_positions_lang.id_lang = companies_lang.id_lang
            `;

            connMysql.query(sql, (error, listCompaniesResult, fields) => {
                if(error) throw error;
                if(Array.isArray(listCompaniesResult) && listCompaniesResult.length > 0) {
                    const listCompanies = [];
                    listCompaniesResult.forEach(element => {
                        const company = new Company(...Object.values(element));
                        // It is a problem, to corrige
                        CompanyPosition.getListCompanyPositionByCv(idCv, idLang).then((listPositions) => {
                            company.positions = listPositions;
                            listCompanies.push(company);
                        });
                    });
                    resolve(listCompanies);
                }else{
                    reject({
                        message: "Company::getListCompaniesFromDbByCv::listCompaniesResult null",
                        error: [listCompaniesResult, error]
                    });
                }
            });
        });
    }

}

module.exports = Company;