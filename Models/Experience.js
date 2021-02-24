class Experiences{
    static _table = 'part_experiences';

    constructor(
        id,
        id_user,
        id_company,
        id_company_position ,
        slug,
        date_begin,
        date_end
    ){
        this.id = id;
        this.id_user = id_user;
        this.id_company = id_company;
        this.id_company_position = id_company_position;
        this.slug = slug;
        this.date_begin = date_begin;
        this.date_end = date_end;

        /**
         * Position on a company
         */
        this.positions = [];
    }

    /**
     * 
     * @param {number} idExperience 
     * @returns {Experiences}
     * @todo Filter User
     */
    // static createFromDbById(idExperience, idLang){
    //     return new Promise((resolve, reject) => {
    //         const connMysql = require("../Configs/Databases/db.config");
    //         const sql = `
    //             SELECT 
    //                 part_experiences.*
    //             FROM part_experiences 
    //             WHERE part_experiences.id = ${idExperience} 
    //                 AND company_positions_lang.id_lang = ${idLang} 
    //             LIMIT 1
    //         `;
    //         connMysql.query(sql, (error, experiencesResult, fields) => {
    //             if(error) throw error;
    //             if(Array.isArray(experiencesResult) && experiencesResult.length > 0) {
    //                 const experience = new Experiences(...Object.values(experiencesResult[0]));
    //                 resolve(experience);
    //             }else{
    //                 console.log("Experiences::createFromDbById::experiencesResult", experiencesResult, error);
    //                 reject({
    //                     message: "Experiences::createFromDbById::experiencesResult null"
    //                 });
    //             }
    //         });
    //     });
    // }

    /**
     * Retrive list Experiences from table cv_experiences
     * @param {*} idCv 
     * @param {*} idLang 
     * @returns {Array<Experiences>}
     */
    static getListExperiencesFromDbByCv(idCv, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../Configs/Databases/db.config");
            const sql = `
                SELECT 
                    cv_experiences.id_cv,
                    cv_experiences.id_experience,

                    part_experiences.id AS idExperience,
                    part_experiences.id_user ,
                    part_experiences.id_company ,
                    part_experiences.id_company_position ,
                    /* part_experiences.slug AS slugExperience, */
                    part_experiences.date_begin,
                    part_experiences.date_end,

                    company_positions.id AS idCompanyPosition,
                    /* company_positions.slug AS slugCompanyPosition, */

                    /* company_positions_lang.id_lang, */
                    company_positions_lang.title AS titleCompanyPosition,
                    company_positions_lang.description AS descriptionCompanyPosition,

                    companies_lang.name AS nameCompany,
                    companies_lang.description AS descriptionCompany

                FROM cv_experiences 
                JOIN part_experiences 
                    ON part_experiences.id = cv_experiences.id_cv 
                JOIN company_positions
                    ON company_positions.id = part_experiences.id_company_position
                JOIN company_positions_lang
                    ON company_positions_lang.id_company_positions = company_positions.id
                JOIN companies_lang
                    ON companies_lang.id_company = part_experiences.id_company 
                WHERE cv_experiences.id_cv = ${idCv} 
                    AND company_positions_lang.id_lang = ${idLang} 
            `;

            connMysql.query(sql, (error, listExperiencesResult, fields) => {
                if(error) throw error;
                if(Array.isArray(listExperiencesResult) && listExperiencesResult.length > 0) {
                    const listSkills = [];
                    listExperiencesResult.forEach(element => {
                        listSkills.push(new Experiences(...Object.values(element)));
                    });
                    resolve(listSkills);
                }else{
                    reject({
                        message: "Experiences::getListExperiencesFromDbByCv::listExperiencesResult null",
                        error: [listExperiencesResult, error]
                    });
                }
            });
        });
    }

}

module.exports = Experiences;