const Address = require("./Address");
const Template = require("./Template");
const Education = require("./Education");
const Skill = require("./Skill");
const SkillGroup = require("./SkillGroup");

class Cv{
    /**
     * 
     * @param {number} id 
     * @param {Template} template 
     * @param {string} slug 
     * @param {Address} address 
     * @param {string} title 
     * @param {string} auto_biography 
     * @param {Date} date_add 
     * @param {Date} date_update 
     */
    constructor(
        id,
        id_template,
        slug,
        id_address,
        date_add,
        date_update,
        title_backend,
        title_frontend,
        auto_biography
    ){
        this.id = id;
        this.id_template = id_template;
        this.slug = slug;
        this.id_address = id_address;
        this.title_backend = title_backend;
        this.title_frontend = title_frontend;
        this.date_add = date_add;
        this.date_update = date_update;
        this.auto_biography = auto_biography;

        this.template = null;
        this.address = null;
        this.educations = null;
        this.experiences = null;
        this.projects = null;
        this.skills = null;
    }

    /**
     * 
     * @param {number} idUser 
     * @returns {User}
     */
    static createFromDbById(idCv, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../Configs/Databases/db.config");
            const Address = require("../Models/Address");
            const sql = `
            SELECT 
                cv.*, 
                cv_lang.title_backend, 
                cv_lang.title_frontend, 
                cv_lang.auto_biography
            FROM cv 
            JOIN cv_lang 
                ON cv.id=cv_lang.id_cv 
            WHERE id = ${idCv} 
                AND cv_lang.id_lang = ${idLang}
            LIMIT 1`;
            connMysql.query(sql, (error, cvResult, fields) => {
                if(error) throw error;
                if(Array.isArray(cvResult) && cvResult.length > 0){
                    const cv = new Cv(...Object.values(cvResult[0]));
                    Address.createFromDbById(cv.id_address, idLang, (address) => {
                        cv.address = address;
                        Education.getListEducationFromDbByIdCv(cv.id, idLang).then((listEducation) => {
                            cv.educations = listEducation;
                            Skill.getListSkillsFromDbByCv(cv.id, idLang).then((listSkills) => {
                                cv.skills = listSkills;
                                SkillGroup.getListUsedSkillsGroupFromDbByCv(cv.id, idLang).then((listGroupSkills) => {
                                    cv.skillsGroup = listGroupSkills;
                                    resolve(cv);
                                }).catch((error) => {
                                    reject({
                                        message: "Cv::createFromDbById::getListUsedSkillsGroupFromDbByCv::catch",
                                        error: error
                                    });
                                });
                            }).catch((error) => { 
                                reject({
                                    message: "Cv::createFromDbById::getListSkillsFromDbByCv::catch",
                                    error: error
                                });
                            });
                        }).catch((error) => {
                            reject({
                                message: "Cv::createFromDbById::getListEducationFromDbByIdCv::catch",
                                error: error
                            });
                        });
                    });
                }else{
                    reject({
                        message: "Cv::createFromDbById::cvResult::error",
                        error: [cvResult, error]
                    });
                }
            });
        });
    }

    /**
     * 
     * @param {FormData} form 
     * @returns {User}
     */
    static createFromForm(form){
        const user = new User(
            null
        );
    }
}

module.exports = Cv;