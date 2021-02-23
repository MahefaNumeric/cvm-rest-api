const Address = require("./Address");
const SocialLink = require("./SocialLink");

class Skill{

    constructor(
        id,
        id_user,
        slug,
        date_add,
        date_update,
        title,
        description
    ){
        this.id = id;
        this.id_user = id_user;
        this.slug = slug;
        this.date_add = date_add;
        this.date_update = date_update;

        this.title = title;
        this.description = description;

        this.user = null;
    }

    /**
     * 
     * @param {number} idSkill 
     * @returns {Skill}
     * @todo Filter User
     */
    static createFromDbById(idSkill, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../Configs/Databases/db.config");
            const sql = `
            SELECT 
            part_skills.*, 
                part_skills_lang.title, 
                part_skills_lang.description
            FROM part_skills 
            JOIN part_skills_lang 
                ON part_skills.id = part_skills_lang.id_part_skills 
            WHERE id = ${idSkill} 
                AND part_skills_lang.id_lang = ${idLang}
            LIMIT 1`;
            connMysql.query(sql, (error, skillsResult, fields) => {
                if(error) throw error;
                if(Array.isArray(skillsResult) && skillsResult.length > 0) {
                    const skillResultFirst = skillsResult[0];
                    const skill = new Skill(...Object.values(skillResultFirst));
                    SocialLink.createFromDbById(skillResultFirst.id, (socialLink) => {
                        skill.socialLink = socialLink;
                        resolve(skill);
                    });
                }else{
                    console.log("Skill::createFromDbById::skillsResult", skillsResult, error);
                    reject({
                        message: "Skill::createFromDbById::skillsResult null"
                    });
                }
            });
        });
    }

    static getListSkillsFromDbByCv(idCv, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../Configs/Databases/db.config");
            const sql = `
                SELECT 
                    part_skills.id,
                    part_skills.id_user,
                    part_skills.slug,
                    part_skills.date_add,
                    part_skills.date_update,
                    part_skills_lang.title,
                    part_skills_lang.description
                FROM cv_skills 
                JOIN part_skills 
                    ON cv_skills.id_skills = part_skills.id 
                JOIN part_skills_lang 
                    ON part_skills.id = part_skills_lang.id_part_skills
                WHERE cv_skills.id_cv = ${idCv}
                    AND part_skills_lang.id_lang = ${idLang}
            `;
            connMysql.query(sql, (error, listSkillsResult, fields) => {
                if(error) throw error;
                if(Array.isArray(listSkillsResult) && listSkillsResult.length > 0) {
                    const listSkills = [];
                    listSkillsResult.forEach(element => {
                        listSkills.push(new Skill(...Object.values(element)));
                    });
                    resolve(listSkills);
                }else{
                    console.log("Skill::getListSkillsFromDbByCv::listSkillsResult", listSkillsResult, error);
                    reject({
                        message: "Skill::getListSkillsFromDbByCv::listSkillsResult null"
                    });
                }
            });
        });
    }

}

module.exports = Skill;