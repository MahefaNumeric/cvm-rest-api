import Address from "../Models/Address";
import Cv from "../Models/Cv";
import Education from "../Models/Education";
import Skill from "../Models/Skill";
import SkillGroupRepo from './SkillGroupRepo';
import SkillGroup from '../Models/SkillGroup';
import AddressRepo from "./AddressRepo";
import BaseRepo from './BaseRepo';
import EducationRepo from './EducationRepo';
import SkillRepo from "./SkillRepo";
import ExperienceRepo from './ExperienceRepo';
import ProjectRepo from "./ProjectRepo";
import ControllerTools from '../../Utils/ControllerTools';
import Experience from '../Models/Experience';

export default class CvRepo extends BaseRepo<Cv> {
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
                    cv_lang.auto_biography,
                    cv_lang.skill_description
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
                        EducationRepo.getListEducationFromDbByIdCv(cv.id, idLang).then((listEducation: Array<Education>) => {
                            cv.educations = listEducation;
                            SkillRepo.getListSkillsFromDbByCv(cv.id, idLang).then((listSkills: Skill[]) => {
                                cv.skills = listSkills;
                                SkillGroupRepo.getListUsedSkillsGroupFromDbByCv(cv.id, idLang).then((listGroupSkills: SkillGroup[]) => {
                                    cv.skillsGroup = listGroupSkills;
                                    ExperienceRepo.buildExperienceByIdCv(cv.id, idLang).then((experiences: Experience) => {
                                        cv.experiences = experiences;
                                        ProjectRepo.getListProjectFromDbByCv(cv.id, idLang).then(projects => {
                                            cv.projects = projects;
                                            resolve(cv);
                                        }).catch(error => reject(error));
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