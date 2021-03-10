import BaseRepo from './BaseRepo';
import Skill from '../Models/Skill';
import SocialLink from '../Models/SocialLink';
import SocialLinkRepo from './SocialLinkRepo';
import SkillGroupRepo from './SkillGroupRepo';
const connMysql = require("../../Configs/Databases/db.config");

export default class SkillRepo extends BaseRepo<Skill> {
    static MSG_NO_SKILL = "NO_SKILL";
    static MSG_ERROR_RETRIVE_SKILL = "ERROR_RETRIVE_SKILL";

    /**
     * 
     * @param {number} idSkill 
     * @returns {Skill}
     * @todo Filter User
     */
    static createFromDbById(idSkill: number, idLang: number): Promise<Skill>{
        return new Promise((resolve, reject) => {
            const sql = /* sql */`
                SELECT 
                    part_skills.*, 
                    part_skills_lang.title, 
                    part_skills_lang.description
                FROM part_skills 
                JOIN part_skills_lang 
                    ON part_skills.id = part_skills_lang.id_part_skills 
                WHERE id = ?
                    AND part_skills_lang.id_lang = ?
                LIMIT 1
            `;
            const sqlData = [idSkill, idLang];
            connMysql.query(sql, sqlData, (error: any, skillsResult: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(skillsResult) && skillsResult.length > 0) {
                    const skillResultFirst = skillsResult[0];
                    const skill = Skill.createFromObj(skillResultFirst);
                    SkillGroupRepo.getFromDbById(skillResultFirst.id, idLang).then((skillGroup) => {
                        skill.group = skillGroup;
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

    static getListSkillsFromDbByCv(idCv: number, idLang: number): Promise<Skill[]>{
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT 
                    part_skills.id,
                    part_skills.id_user,
                    part_skills.id_skills_group,
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
                    AND part_skills_lang.id_lang = ${idLang}
                WHERE cv_skills.id_cv = ${idCv}
                    AND cv_skills.enable = 1
            `;
            connMysql.query(sql, (error: any, listSkillsResult: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(listSkillsResult)) {
                    if(listSkillsResult.length > 0){
                        const listSkills: Skill[] = [];
                        listSkillsResult.forEach(element => {
                            listSkills.push(Skill.createFromObj(element));
                        });
                        resolve(listSkills);
                    }else{
                        resolve([]);
                    }
                }else{
                    reject({
                        message: "Skill::getListSkillsFromDbByCv::listSkillsResult not array",
                        code: this.MSG_ERROR_RETRIVE_SKILL,
                        data: [listSkillsResult, error]
                    });
                }
            });
        });
    }
}