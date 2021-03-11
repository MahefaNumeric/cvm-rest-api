import BaseRepo from './BaseRepo';
import Position from '../Models/Position';
import ControllerTools from '../../Utils/ControllerTools';
import LanguageRepo from './LanguageRepo';
const connMysql = require("../../Configs/Databases/db.config");

export default class PositionRepo extends BaseRepo<Position> {
    
    static getListPositionByCv(idCv: number, idCompany: number, idLang: number): Promise<Array<Position>>{
        return new Promise((resolve, reject) => {
            const sql = /* sql */`
                SELECT 
                    company_positions.id                    AS id,
                    company_positions.slug                  AS slug,
                    company_positions_lang.title            AS title,
                    company_positions_lang.description      AS description, 
                    part_experiences_lang.description       AS descriptionExperiencePosition,
                    DATE_FORMAT(part_experiences.date_begin, '%Y-%m')   AS experienceDateBegin,
                    DATE_FORMAT(part_experiences.date_end, '%Y-%m')     AS experienceDateEnd
                    -- part_experiences.actual
                    -- CASE
                    --     WHEN part_experiences.actual = 1
                    --     THEN true
                    --     ELSE false
                    -- END AS actual
                FROM cv_experiences 
                JOIN part_experiences 
                    ON part_experiences.id = cv_experiences.id_experience
                    AND part_experiences.id_company = ${idCompany}
                JOIN company_positions
                    ON company_positions.id = part_experiences.id_company_position
                JOIN company_positions_lang
                    ON company_positions_lang.id_company_positions = company_positions.id
                    AND company_positions_lang.id_lang = ${idLang} 
                JOIN companies_lang
                    ON companies_lang.id_company = part_experiences.id_company 
                JOIN companies
                    ON companies.id = companies_lang.id_company 
                JOIN part_experiences_lang
                    ON part_experiences_lang.id_part_experiences = part_experiences.id
                WHERE cv_experiences.id_cv = ${idCv} 
                    AND company_positions_lang.id_lang = companies_lang.id_lang
                    AND part_experiences_lang.id_lang = companies_lang.id_lang
                    AND cv_experiences.enable = 1
                ORDER BY 
                    part_experiences.date_begin DESC;
            `;
            const sqlData: any[] = [];
            connMysql.query(sql, sqlData, (error: any, listPositionsResult: any, fields: any) => {
                if(error) reject({
                    message: "Position::getListPositionByCv::error",
                    data: error
                });
                if(Array.isArray(listPositionsResult) && listPositionsResult.length > 0) {
                    LanguageRepo.createFromDbById(idLang).then(async language => {
                        const listPositions: Position[] = [];
                        listPositionsResult.forEach(element => {
                            listPositions.push(Position.createFromObj(element, language.code_iso));
                        });
                        resolve(listPositions);
                    }).catch(errorLanguageCreateFromDbById => {
                        reject({
                            message: "Position::getListPositionByCv::LanguageRepo.createFromDbById::catch",
                            data: {errorLanguageCreateFromDbById}
                        });
                    });
                }else{
                    reject({
                        message: "Position::getListPositionByCv::listPositionsResult null",
                        data: {listPositionsResult, error}
                    });
                }
            });
        });
    }

}