const CompanyPosition = require("./CompanyPosition");
const DateUtils = require("../../Utils/DateUtils");

class Company{
    static _table = 'companies';

    static MSG_NO_COMPANY = "NO_COMPANY";
    static MSG_ERROR_RETRIVE_COMPANY = "ERROR_RETRIVE_COMPANY";

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
        this.positionsValue = [];   // Private

        this.dateStart = null;  // Calculate from this.positions
        this.dateEnd = null;  // Calculate from this.positions
    }
    
    set positions(value) {
        this.positionsValue = value;
        this.setupPositionsBeganEnd();
    }

    get positions() {
        return this.positionsValue;
    }

    /**
     * Retrive list Companies from table cv_experiences
     * @param {*} idCv 
     * @param {*} idLang 
     * @returns {Array<Company>}
     */
    static getListCompaniesFromDbByCv(idCv, idLang){
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
                    part_experiences.slug AS slugExperience, 
                    part_experiences.date_begin,
                    part_experiences.date_end, */

                    /* company_positions.id AS idPosition,
                    company_positions.slug AS slugPosition,
                    company_positions_lang.id_lang AS idLangPosition, 
                    company_positions_lang.title AS titlePosition,
                    company_positions_lang.description AS descriptionPosition, */

                    companies_lang.id_company AS idCompany,
                    companies.slug AS slugCompany,
                    companies_lang.name AS nameCompany,
                    companies_lang.description AS descriptionCompany

                FROM companies
                JOIN cv_experiences 
                    ON cv_experiences.id_cv = ${idCv} 
                JOIN part_experiences 
                    ON part_experiences.id = cv_experiences.id_experience 
                JOIN company_positions
                    ON company_positions.id = part_experiences.id_company_position
                JOIN company_positions_lang
                    ON company_positions_lang.id_company_positions = company_positions.id
                JOIN companies_lang
                    ON companies_lang.id_company = part_experiences.id_company
                WHERE company_positions_lang.id_lang = ${idLang} 
                    AND company_positions_lang.id_lang = companies_lang.id_lang
                    AND companies.id = companies_lang.id_company
                GROUP BY part_experiences.id_company
            `;
            // console.log("CompanyPosition::getListCompaniesFromDbByCv::sql", sql);
            connMysql.query(sql, async (error, listCompaniesResult, fields) => {
                if(error) throw error;
                if(Array.isArray(listCompaniesResult)) {
                    if(listCompaniesResult.length > 0){
                        const listCompanies = [];
                        for (let element of listCompaniesResult) {
                            const company = new Company(...Object.values(element));
                            company.positions = await CompanyPosition.getListPositionByCv(idCv, company.id, idLang);
                            listCompanies.push(company);
                        };
                        resolve(listCompanies);
                    }else{
                        resolve([]);
                    }
                }else{
                    reject({
                        message: "Company::getListCompaniesFromDbByCv::listCompaniesResult null",
                        code: this.MSG_ERROR_RETRIVE_COMPANY,
                        data: [listCompaniesResult, error]
                    });
                }
            });
        });
    }

    setupPositionsBeganEnd(){
        if(Array.isArray(this.positions) == false) return false;
        if(this.positions.length == 0) return false;

        let dateMin = this.positions[0].experienceDateBegin,
            dateMax = this.positions[0].experienceDateEnd;
        this.positions.forEach(element => {
            if(DateUtils.compareDateAB(element.experienceDateBegin, dateMin) == -1)
                dateMin = element.experienceDateBegin;
            if(DateUtils.compareDateAB(element.experienceDateEnd, dateMax) == 1)
                dateMax = element.experienceDateEnd;
        });
        this.dateStart = dateMin;
        this.dateEnd = dateMax;
    }

}

module.exports = Company;