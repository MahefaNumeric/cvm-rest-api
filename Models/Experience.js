const Company = require("./Company");

class Experiences{
    // static _table = 'part_experiences';

    constructor(
        // id,
        // id_user,
        // id_company,
        // id_company_position ,
        // slug,
        // date_begin,
        // date_end
    ){
        // this.id = id;
        // this.id_user = id_user;
        // this.id_company = id_company;
        // this.id_company_position = id_company_position;
        // this.slug = slug;
        // this.date_begin = date_begin;
        // this.date_end = date_end;

        // List of companies
        this.companies = [];
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

    static buildExperienceByIdCv(idCv, idLang){
        return new Promise((resolve, reject) => {
            const experience = new Experiences();
            Company.getListCompaniesFromDbByCv(idCv, idLang).then((listCompanies) => {
                experience.companies = listCompanies;
                resolve(experience);
            }).catch((error) => {
                reject({
                    message: 'Experience::buildExperienceByIdCv::catch',
                    data: error
                });
            });
        });
    }

}

module.exports = Experiences;