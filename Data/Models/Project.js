
/**
 */
class Project{
    static MSG_NO_PROJECT = "NO_PROJECT";
    static MSG_ERROR_RETRIVE_PROJECT = "ERROR_RETRIVE_PROJECT";

    constructor(
        id,
        company_id,
        id_user,
        slug,
        title,
        description,
        show_in_portfolio,
        url_access,
        url_preview
    ){
        this.id = id;
        this.company_id = company_id;
        this.id_user = id_user;
        this.slug = slug;
        this.title = title;
        this.description = description;
        this.show_in_portfolio = show_in_portfolio;
        this.url_access = url_access;
        this.url_preview = url_preview;
    }

    /**
     * 
     * @param {number} idProject 
     * @returns {Project}
     * @todo Filter User
     */
    static createFromDbById(idProject, idLang){
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

    static getListProjectFromDbByCv(idCv, idLang){
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
                    part_projects.url_preview
                FROM part_projects 
                JOIN part_projects_lang
                    ON part_projects_lang.id_part_projects  = part_projects.id 
                JOIN cv_projects
                    ON cv_projects.id_project = part_projects.id 
                WHERE part_projects_lang.id_lang = ${idLang}
                    AND cv_projects.id_cv = ${idCv}
            `;
            connMysql.query(sql, (error, listProjectsResult, fields) => {
                if(error) throw error;
                if(Array.isArray(listProjectsResult)) {
                    if(listProjectsResult.length > 0){
                        const listProjects = [];
                        listProjectsResult.forEach(element => {
                            listProjects.push(new Project(...Object.values(element)));
                        });
                        resolve(listProjects);
                    }else{
                        resolve([]);
                    }
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

module.exports = Project;