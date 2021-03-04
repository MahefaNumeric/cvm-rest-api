import BaseRepo from './BaseRepo';
import Language from '../Models/Language';
import Education from '../Models/Education';
import LanguageRepo from './LanguageRepo';
import ControllerTools from '../../Utils/ControllerTools';
const connMysql = require("../../Configs/Databases/db.config");

export default class EducationRepo extends BaseRepo<Education> {
    static ERROR_RETRIVE_EDUCATION = "ERROR_RETRIVE_EDUCATION";

    /**
     * 
     * @param {number} idEducation
     * @returns {Education}
     */
    static createFromDbById(idEducation: number, idLang: number){
        return new Promise((resolve, reject) => {
            const sql = /* sql */`
                SELECT 
                    part_educations.*
                FROM part_educations
                JOIN part_educations_lang
                    ON part_educations.id = part_educations_lang.id_part_educations
                WHERE id = ${idEducation}
                    AND part_educations_lang.id_lang = ${idLang}
                LIMIT 1
            `;
            connMysql.query(sql, (error: any, educationResult: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(educationResult) && educationResult.length > 0) {
                    LanguageRepo.createFromDbById(idLang).then((language: Language) => {
                        const education = Education.createFromObj(language.code_iso, educationResult[0]);
                        resolve(education);
                    }).catch((error: any) => {
                        console.log("Education::createFromDbById::catch", error);
                        reject({message: "Education::createFromDbById::catch"});
                    });
                }else{
                    console.log("Education::createFromDbById::educationResult", educationResult, error);
                    reject({message: "Education::createFromDbById::educationResult null"});
                }
            });
        });
    }
    
    /**
     * 
     * @param {number} idCv 
     * @param {number} idLang 
     * @returns {Promise<Array<Education>>}
     */
    static getListEducationFromDbByIdCv(idCv: number, idLang: number): Promise<Array<Education>>{
        return new Promise((resolve, reject) => {
            const sql = /* sql */`
                SELECT 
                    part_educations.*,
                    part_educations_lang.title,
                    part_educations_lang.description,
                    DATE_FORMAT(date_begin, '%Y-%m') as date_begin,
                    DATE_FORMAT(date_end, '%Y-%m') as date_end
                FROM cv_educations
                JOIN part_educations
                    ON part_educations.id = cv_educations.id_education
                JOIN part_educations_lang
                    ON part_educations.id = part_educations_lang.id_part_educations 
                WHERE id_cv = ?
                    AND part_educations_lang.id_lang = ?
            `;

            const sqlParams = [idCv, idLang];
            connMysql.query(sql, sqlParams, (error: any, listEducationResult: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(listEducationResult)) {
                    if(listEducationResult.length > 0){
                        LanguageRepo.createFromDbById(idLang).then((language: Language) => {
                            const listEducation: Education[] = [];
                            listEducationResult.forEach((element: any) => {
                                listEducation.push(Education.createFromObj(language.code_iso, element));
                            });
                            resolve(listEducation);
                        }).catch((error) => {
                            reject({
                                message: "Education::getListEducationFromDbByIdCv::catch language empty",
                                code: LanguageRepo.MSG_NO_LANGUAGE,
                                data: [error]
                            });
                        });
                    }else{
                        resolve([]);
                    }
                }else{
                    reject({
                        message: "Education::getListEducationFromDbByIdCv::listEducationResult not an array",
                        code: this.ERROR_RETRIVE_EDUCATION,
                        data: [listEducationResult, error]
                    });
                }
            }); 
        });
    }

}