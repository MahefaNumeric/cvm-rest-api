import BaseRepo from './BaseRepo';
import Project from '../Models/Project';
import LanguageRepo from './LanguageRepo';

export default class ProjectRepo extends BaseRepo<Project> {
    static MSG_NO_PROJECT = "NO_PROJECT";
    static MSG_ERROR_RETRIVE_PROJECT = "ERROR_RETRIVE_PROJECT";

        /**
     * 
     * @param {number} idProject 
     * @returns {Project}
     * @todo Filter User
     */
    static createFromDbById(idProject: number, idLang: number){
        // return new Promise((resolve, reject) => {
        //     const connMysql = require("../../Configs/Databases/db.config");
        //     const sql = /* sql */`
        //         SELECT 
        //             part_projects.*, 
        //             part_projects_lang.title, 
        //             part_projects_lang.description
        //         FROM part_projects 
        //         JOIN part_projects_lang 
        //             ON part_projects.id = part_projects_lang.id_part_skills 
        //         WHERE id = ${idProject} 
        //             AND part_projects_lang.id_lang = ${idLang}
        //         LIMIT 1
        //     `;
        //     connMysql.query(sql, (error, projectsResult, fields) => {
        //         if(error) throw error;
        //         if(Array.isArray(projectsResult) && projectsResult.length > 0) {
        //             const projectResultFirst = projectsResult[0];
        //             const project = new Project(...Object.values(projectResultFirst));
        //             SocialLink.createFromDbById(projectResultFirst.id, (socialLink) => {
        //                 project.socialLink = socialLink;
        //                 resolve(project);
        //             });
        //         }else{
        //             console.log("Project::createFromDbById::projectsResult", projectsResult, error);
        //             reject({
        //                 message: "Project::createFromDbById::projectsResult null"
        //             });
        //         }
        //     });
        // });
    }

    static getListProjectFromDbByCv(idCv: number, idLang: number): Promise<Array<Project>>{
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT 
                    part_projects.id,
                    part_projects.company_id,
                    part_projects.id_user,
                    part_projects.slug,
                    part_projects_lang.title,
                    part_projects_lang.description,
                    part_projects.show_in_portfolio,
                    part_projects.url_access,
                    part_projects.url_preview,
                    DATE_FORMAT(part_projects.dateBegin, '%Y-%m') AS dateBegin,
                    DATE_FORMAT(part_projects.dateEnd, '%Y-%m') AS dateEnd
                FROM part_projects 
                JOIN part_projects_lang
                    ON part_projects_lang.id_part_projects  = part_projects.id 
                    AND part_projects_lang.id_lang = ${idLang}
                JOIN cv_projects
                    ON cv_projects.id_project = part_projects.id 
                    AND cv_projects.id_cv = ${idCv}
                WHERE part_projects.show_in_portfolio = 1
            `;
            connMysql.query(sql, (error: any, listProjectsResult: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(listProjectsResult)) {
                    LanguageRepo.createFromDbById(idLang).then(async language => {
                        if(listProjectsResult.length > 0){
                            const listProjects: Project[] = [];
                            listProjectsResult.forEach(element => {
                                listProjects.push(Project.createFromObj(element, language.code_iso));
                            });
                            resolve(listProjects);
                        }else{
                            resolve([]);
                        }
                    });
                }else{
                    reject({
                        message: "Project::getListProjectFromDbByCv::listProjectsResult not array",
                        code: this.MSG_ERROR_RETRIVE_PROJECT,
                        data: [listProjectsResult, error]
                    });
                }
            });
        });
    }

}