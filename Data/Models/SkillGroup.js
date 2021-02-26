
class SkillGroup{
    static MSG_NO_SKILL_GROUP = "NO_SKILL_GROUP";

    constructor(
        id,
        slug,
        title,
        description
    ){
        this.id = id;
        this.slug = slug;
        this.title = title;
        this.description = description;

        this.user = null;
    }

    /**
     * 
     * @param {number} idSkill 
     * @returns {SkillGroup}
     * @todo Filter User
     */
    static createFromDbById(idGroupSkill, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT 
                    skills_group.id, 
                    skills_group.slug, 
                    skills_group_lang.title, 
                    skills_group_lang.description
                FROM skills_group 
                JOIN skills_group_lang 
                    ON skills_group.id = skills_group_lang.id_skills_group  
                WHERE id = ${idGroupSkill} 
                    AND skills_group_lang.id_lang = ${idLang}
                LIMIT 1
            `;
            connMysql.query(sql, (error, skillsGroupResult, fields) => {
                if(error) throw error;
                if(Array.isArray(skillsGroupResult) && skillsGroupResult.length > 0) {
                    const skillGroup = new SkillGroup(...Object.values(skillsGroupResult[0]));
                    resolve(skillGroup);
                }else{
                    reject({
                        message: "SkillGroup::createFromDbById::skillsGroupResult null"
                    });
                }
            });
        });
    }

    static getListUsedSkillsGroupFromDbByCv(idCv, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT DISTINCT 
                    skills_group.id,
                    skills_group.slug,
                    skills_group_lang.title,
                    skills_group_lang.description
                FROM cv_skills 
                JOIN part_skills 
                    ON cv_skills.id_skills = part_skills.id 
                JOIN part_skills_lang 
                    ON part_skills.id = part_skills_lang.id_part_skills
                JOIN skills_group
                    ON skills_group.id = part_skills.id_skills_group
                JOIN skills_group_lang 
                    ON skills_group.id = skills_group_lang.id_skills_group 
                WHERE cv_skills.id_cv = ${idCv}
                    AND part_skills_lang.id_lang = ${idLang}
                    AND skills_group_lang.id_lang = part_skills_lang.id_lang
            `;
            connMysql.query(sql, (error, listSkillsResult, fields) => {
                if(error) throw error;
                if(Array.isArray(listSkillsResult) && listSkillsResult.length > 0) {
                    const listSkills = [];
                    listSkillsResult.forEach(element => {
                        listSkills.push(new SkillGroup(...Object.values(element)));
                    });
                    resolve(listSkills);
                }else{
                    console.log("SkillGroup::getListSkillsFromDbByCv::listSkillsResult", listSkillsResult, error);
                    reject({
                        message: "SkillGroup::getListSkillsFromDbByCv::listSkillsResult null",
                        code: this.MSG_NO_SKILL_GROUP,
                        data: []
                    });
                }
            });
        });
    }

}

module.exports = SkillGroup;