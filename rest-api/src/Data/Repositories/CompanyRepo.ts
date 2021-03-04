import BaseRepo from './BaseRepo';
import Company from '../Models/Company';
import Position from '../Models/Position';
import PositionRepo from './PositionRepo';
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
                    companies_lang.description AS description

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
            connMysql.query(sql, async (error: any, listCompaniesResult: any[], fields: any) => {
                if(error) throw error;
                if(Array.isArray(listCompaniesResult)) {
                    if(listCompaniesResult.length > 0){
                        const listCompanies: Company[] = [];
                        // ControllerTools.render(null, ["CompanyRepo::getListCompaniesFromDbByCv", idCv, idLang, listCompaniesResult, listCompanies ]); return;
                        for (let element of listCompaniesResult) {
                            const company = Company.createFromObj(element);
                            company.positions = await PositionRepo.getListPositionByCv(idCv, company.id, idLang);
                            listCompanies.push(company);
                        };
                        // ControllerTools.render(null, ["CompanyRepo::getListCompaniesFromDbByCv", idCv, idLang, listCompaniesResult, listCompanies ]); return;
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
    
}