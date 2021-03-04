import Address from "../Models/Address";
import Cv from "../Models/Cv";
import Education from "../Models/Education";
import Experiences from "../Models/Experience";
import Project from "../Models/Project";
import Skill from "../Models/Skill";
import SkillGroupRepo from './SkillGroupRepo';
import SkillGroup from '../Models/SkillGroup';
import AddressRepo from "./AddressRepo";

export default class CvRepo {
    static MSG_NO_CV_GIVEN_ID = "NO_CV_GIVEN_ID";
    
    /**
     * 
     * @param {number} idCv 
     * @param {number} idLang 
     * @returns {Promise<Cv>} The Promise of Cv requested
     */
    static createFromDbById(idCv: number, idLang: number){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT 
                    cv.id, 
                    cv.id_template, 
                    /* cv.id_user, */
                    cv.slug, 
                    cv.id_address,
                    cv_lang.title_backend,
                    cv_lang.title_frontend,
                    cv_lang.auto_biography
                FROM cv 
                JOIN cv_lang 
                    ON cv.id=cv_lang.id_cv 
                WHERE id = ${idCv} 
                    AND cv_lang.id_lang = ${idLang}
                LIMIT 1
            `;
            connMysql.query(sql, (error: any, cvResult: Array<any>, fields: any) => {
                // console.log("Cv::createFromDbById, cvResult:", cvResult);
                if(error) throw error;
                if(Array.isArray(cvResult) && cvResult.length > 0){
                    const cv = Cv.createFromObj(cvResult[0]);
                    AddressRepo.createFromDbById(cv.id_address, idLang).then((address: Address) => {
                        cv.address = address;
                        Education.getListEducationFromDbByIdCv(cv.id, idLang).then((listEducation: Array<Education>) => {
                            cv.educations = listEducation;
                            Skill.getListSkillsFromDbByCv(cv.id, idLang).then((listSkills: Skill[]) => {
                                cv.skills = listSkills;
                                SkillGroupRepo.getListUsedSkillsGroupFromDbByCv(cv.id, idLang).then((listGroupSkills: SkillGroup[]) => {
                                    cv.skillsGroup = listGroupSkills;
                                    Experiences.buildExperienceByIdCv(cv.id, idLang).then((experiences: Experiences) => {
                                        cv.experiences = experiences;
                                        Project.getListProjectFromDbByCv(cv.id, idLang).then(projects => {
                                            cv.projects = projects;
                                            resolve(cv);
                                        });
                                    }).catch(error => reject(error));
                                }).catch(error => reject(error));
                            }).catch(error => reject(error));
                        }).catch(error => reject(error));
                    }).catch(error => reject(error));
                }else{
                    reject({
                        message: `Cv::createFromDbById::cvResult::error, idCv:${idCv} does not exist`,
                        code: CvRepo.MSG_NO_CV_GIVEN_ID,
                        data: [cvResult, error]
                    });
                }
            });
        });
    }
}