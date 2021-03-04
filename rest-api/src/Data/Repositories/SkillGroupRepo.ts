import BaseRepo from './BaseRepo';
import SkillGroup from '../Models/SkillGroup';

export default class SkillGroupRepo extends BaseRepo {
    static MSG_NO_SKILL_GROUP = "NO_SKILL_GROUP";
    static MSG_ERROR_RETRIVE_SKILLGROUP = "ERROR_RETRIVE_SKILLGROUP";

    
    /**
     * Get one by id
     * @param {number} idGroupSkill 
     * @param {number} idLang 
     * @returns {Promise<SkillGroup>}
     * @todo Filter User
     */
    static getFromDbById(idGroupSkill: number, idLang: number){
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
            connMysql.query(sql, (error: any, skillsGroupResult: Array<SkillGroup>, fields: any) => {
                if(error){
                    reject({
                        message: "SkillGroup::createFromDbById::skillsGroupResult error",
                        data: [error]
                    });
                    throw error;
                }
                if(Array.isArray(skillsGroupResult)) {
                    if(skillsGroupResult.length > 0){
                        const skillGroup = SkillGroup.createFromObj(skillsGroupResult[0]);
                        resolve(skillGroup);
                    }else{
                        resolve([]);
                    }
                }else{
                    reject({
                        message: "SkillGroup::createFromDbById::skillsGroupResult null"
                    });
                }
            });
        });
    }

    /**
     * Get list by id CV, only the whom prensent for the given CV
     * @param {number} idCv 
     * @param {number} idLang 
     */
    static getListUsedSkillsGroupFromDbByCv(idCv: number, idLang: number): Promise<SkillGroup[]>{
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
            connMysql.query(sql, (error: any, listSkillsResult: Array<SkillGroup>, fields: any) => {
                if(error) throw error;
                if(Array.isArray(listSkillsResult)) {
                    if(listSkillsResult.length > 0){
                        const list = new Array<SkillGroup>();
                        listSkillsResult.forEach(element => {
                            list.push(SkillGroup.createFromObj(element));
                        });
                        resolve(list);
                    }else{
                        resolve([]);
                    }
                }else{
                    reject({
                        message: "SkillGroup::getListSkillsFromDbByCv::listSkillsResult not array [must be an array]",
                        code: this.MSG_ERROR_RETRIVE_SKILLGROUP,
                        data: [listSkillsResult, error]
                    });
                }
            });
        });
    }

    /**
     * Get list by id CV, independant of all CV
     * @param {number} idLang 
     * @returns {Promise<SkillGroup>}
     */
    static getListAllSkillGroup(idLang: number): Promise<Array<SkillGroup>>{
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT DISTINCT 
                    skills_group.id,
                    skills_group.slug,
                    skills_group_lang.title,
                    skills_group_lang.description
                FROM skills_group 
                JOIN skills_group_lang 
                    ON skills_group_lang.id_skills_group = skills_group.id 
                WHERE skills_group_lang.id_lang = ${idLang}
            `;
            connMysql.query(sql, (error: any, listSkillsResult: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(listSkillsResult)) {
                    if(listSkillsResult.length > 0){
                        const list = new Array<SkillGroup>();
                        listSkillsResult.forEach(element => {
                            list.push(new SkillGroup(
                                element.id, element.slug, element.title, element.description
                            ));
                        });
                        resolve(list);
                    }else{
                        resolve([]);
                    }
                }else{
                    reject({
                        message: "SkillGroup::getListSkillsFromDbByCv::listSkillsResult not array [must be an array]",
                        code: this.MSG_ERROR_RETRIVE_SKILLGROUP,
                        data: [listSkillsResult, error]
                    });
                }
            });
        });
    }

}