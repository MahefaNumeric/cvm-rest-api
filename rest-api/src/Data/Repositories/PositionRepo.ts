import BaseRepo from './BaseRepo';
import Position from '../Models/Position';
import ControllerTools from '../../Utils/ControllerTools';
const connMysql = require("../../Configs/Databases/db.config");

export default class PositionRepo extends BaseRepo<Position> {
    
    static getListPositionByCv(idCv: number, idCompany: number, idLang: number): Promise<Array<Position>>{
        return new Promise((resolve, reject) => {
            const sql = /* sql */`
                SELECT 
                    company_positions.id AS idPosition,
                    company_positions.slug AS slugPosition,
                    company_positions_lang.title AS titlePosition,
                    company_positions_lang.description AS descriptionPosition, 
                    part_experiences_lang.description as descriptionExperiencePosition,
                    DATE_FORMAT(part_experiences.date_begin, '%Y-%m') as date_begin,
                    DATE_FORMAT(part_experiences.date_end, '%Y-%m') as date_end

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
            // console.log("Position::getListPositionByCv::sql", sql);
            connMysql.query(sql, (error: any, listPositionsResult: any[], fields: any) => {
                // ControllerTools.render(null, ["PositionRepo::getListPositionByCv", idCv, idLang, listPositionsResult, sql ]); return;
                if(error) reject({
                    message: "Position::getListPositionByCv::error",
                    data: error
                });
                if(Array.isArray(listPositionsResult) && listPositionsResult.length > 0) {
                    const listPositions: Position[] = [];
                    listPositionsResult.forEach(element => {
                        listPositions.push(Position.createFromObj(element));
                    });
                    resolve(listPositions);
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