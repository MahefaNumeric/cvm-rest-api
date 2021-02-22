
class Education{
    static _table = "cv_educations";

    constructor(
        user_id,
        github_url,
        linkedin_url,
        skype_id,
        website_url,
        zoom_id,
    ){
        this.user_id = user_id;
        this.github_url = github_url;
        this.linkedin_url = linkedin_url;
        this.skype_id = skype_id;
        this.website_url = website_url;
        this.zoom_id = zoom_id;
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
        WHERE user_id = ${idEducation} 
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
     * @returns {Array<Education>}
     */
    static getListEducationFromDbByIdCv(idCv, cbFinnished){
        const connMysql = require("../Configs/Databases/db.config");
        const sql = `
        SELECT 
            ${this._table}.*
        FROM ${this._table}
        WHERE user_id = ${idCv} 
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