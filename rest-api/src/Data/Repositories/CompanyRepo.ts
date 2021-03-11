import BaseRepo from './BaseRepo';
import Company from '../Models/Company';
import PositionRepo from './PositionRepo';
import LanguageRepo from './LanguageRepo';
import ControllerTools from '../../Utils/ControllerTools';

export default class CompanyRepo extends BaseRepo<Company> {

    static MSG_NO_COMPANY = "NO_COMPANY";
    static MSG_ERROR_RETRIVE_COMPANY = "ERROR_RETRIVE_COMPANY";
    
    /**
     * Retrive list Companies from table cv_experiences
     * @param {*} idCv 
     * @param {*} idLang 
     * @returns {Array<Company>}
     */
    static getListCompaniesFromDbByCv(idCv: number, idLang: number): Promise<Array<Company>>{
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
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
                    ON cv_experiences.id_cv = ${idCv} 
                    -- AND cv_experiences.enable = 1   -- Not needed for this request
                JOIN part_experiences 
                    ON part_experiences.id = cv_experiences.id_experience 
                JOIN company_positions
                    ON company_positions.id = part_experiences.id_company_position
                JOIN company_positions_lang
                    ON company_positions_lang.id_company_positions = company_positions.id
                    AND company_positions_lang.id_lang = ${idLang} 
                JOIN companies_lang
                    ON companies_lang.id_company = part_experiences.id_company
                    AND companies_lang.id_lang = company_positions_lang.id_lang
                    AND companies_lang.id_company = companies.id
                -- WHERE
                GROUP BY part_experiences.id_company
                ORDER BY experience_dateBegin DESC   -- What is really need (For change order of company)
            `;
            connMysql.query(sql, (error: any, listCompaniesResult: any[], fields: any) => {
                if(error) throw error;
                if(Array.isArray(listCompaniesResult)) {
                    if(listCompaniesResult.length > 0){
                        LanguageRepo.createFromDbById(idLang).then(async language => {
                            const listCompanies: Company[] = [];
                            for (let element of listCompaniesResult) {
                                const company = Company.createFromObj(element, language?.code_iso);

                                // Don't work, it's took me many time (Not knwo why it's not working)
                                // PositionRepo.getListPositionByCv(idCv, company.id, idLang).then(positions => {
                                //     company.positions = positions;
                                //     listCompanies.push(company);
                                // }).catch(error => {
                                //     ControllerTools.render(null, [error]);
                                //     reject(error)
                                // });

                                // Work
                                company.positions = await PositionRepo.getListPositionByCv(idCv, company.id, idLang);
                                listCompanies.push(company);
                            }
                            resolve(listCompanies);
                        }).catch(error => reject(error));
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
    
}