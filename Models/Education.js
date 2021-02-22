
class Education{
    static _table = "part_educations";

    constructor(
        id,
        id_user,
        slug,
        date_begin,
        date_end,
        date_add,
        date_update,
        title,
        description
    ){
        this.id = id;
        this.id_user = id_user;
        this.slug = slug;
        this.date_begin = date_begin;
        this.date_end = date_end;
        this.date_add = date_add;
        this.date_update = date_update;

        this.title = title;
        this.description = description;
    }

    /**
     * 
     * @param {number} idEducation
     * @returns {Education}
     */
    static createFromDbById(idEducation, cbFinnished){
        const connMysql = require("../Configs/Databases/db.config");
        const sql = `
        SELECT 
            ${this._table}.*
        FROM ${this._table}
        WHERE id = ${idEducation}
        LIMIT 1`;
        connMysql.query(sql, (error, educationResult, fields) => {
            if(error) throw error;
            if(Array.isArray(educationResult) && educationResult.length > 0) {
                const education = new this(...Object.values(educationResult[0]));
                cbFinnished && cbFinnished(education);
            }else{
                console.log("Education::createFromDbById::educationResult", educationResult, error);
            }
        });
    }
    
    /**
     * 
     * @param {number} idCv 
     * @param {number} idLang 
     * @param {function(listEducation)} cbFinnished
     * @returns {Array<Education>}
     */
    static getListEducationFromDbByIdCv(idCv, idLang, cbFinnished){
        const connMysql = require("../Configs/Databases/db.config");
        const sql = `
        SELECT 
            part_educations.*,
            part_educations_lang.title,
            part_educations_lang.description,
            DATE_FORMAT(date_begin, '%Y-%m-%d') as date_begin,
            DATE_FORMAT(date_end, '%Y-%m-%d') as date_end
        FROM cv_educations
        JOIN part_educations
            ON cv_educations.id_education = part_educations.id
        JOIN part_educations_lang
            ON part_educations.id = part_educations_lang.id_part_educations 
        WHERE id_cv = ?
            AND part_educations_lang.id_lang = ?
        `;
        const sqlParams = [idCv, idLang];
        connMysql.query(sql, sqlParams, (error, listEducationResult, fields) => {
            if(error) throw error;
            if(Array.isArray(listEducationResult) && listEducationResult.length > 0) {
                const listEducation = [];
                listEducationResult.forEach(element => {
                    listEducation.push(new this(...Object.values(element)));
                });
                cbFinnished && cbFinnished(listEducation);
            }else{
                console.log("Education::createFromDbById::listEducationResult", educationResult, error);
            }
        });
    }

    /**
     * 
     * @param {FormData} form 
     * @returns {Education}
     */
    static createFromForm(form){
        const user = new Education(
            null
        );
    }


}

module.exports = Education;