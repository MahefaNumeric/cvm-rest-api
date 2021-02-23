const DateUtils = require("../Utils/DateUtils");
const Language = require("./Language");

class Education{
    static _table = "part_educations";

    constructor(
        isoLang,
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
        this.isoLang = isoLang;
        this.id = id;
        this.id_user = id_user;
        this.slug = slug;
        this.date_begin_friendly = date_begin;
        this.date_begin = date_begin;
        this.date_begin_value = date_begin; // Private (Don't use from class external)
        this.date_end_friendly = date_end;
        this.date_end = date_end;
        this.date_end_value = date_end; // Private (Don't use from class external)
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
    static createFromDbById(idEducation, idLang, cbFinnished){
        const connMysql = require("../Configs/Databases/db.config");
        const sql = `
        SELECT 
            part_educations.*
        FROM part_educations
        JOIN part_educations_lang
            ON part_educations.id = part_educations_lang.id_part_educations
        WHERE id = ${idEducation}
            AND part_educations_lang.id_lang = ${idLang}
        LIMIT 1`;
        connMysql.query(sql, (error, educationResult, fields) => {
            if(error) throw error;
            if(Array.isArray(educationResult) && educationResult.length > 0) {
                Language.createFromDbById(idLang, (language) => {
                    const education = new Education(language.code_iso, ...Object.values(educationResult[0]));
                    cbFinnished && cbFinnished(education);
                });
            }else{
                console.log("Education::createFromDbById::educationResult", educationResult, error);
            }
        });
    }
    
    /**
     * 
     * @param {number} idCv 
     * @param {number} idLang 
     * @returns {Array<Education>}
     */
    static getListEducationFromDbByIdCv(idCv, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../Configs/Databases/db.config");
            const sql = `
            SELECT 
                part_educations.*,
                part_educations_lang.title,
                part_educations_lang.description,
                DATE_FORMAT(date_begin, '%Y-%m') as date_begin,
                DATE_FORMAT(date_end, '%Y-%m') as date_end
            FROM cv_educations
            JOIN part_educations
                ON part_educations.id = cv_educations.id_education
            JOIN part_educations_lang
                ON part_educations.id = part_educations_lang.id_part_educations 
            WHERE id_cv = ?
                AND part_educations_lang.id_lang = ?
            `;
            const sqlParams = [idCv, idLang];
            connMysql.query(sql, sqlParams, (error, listEducationResult, fields) => {
                if(error) throw error;
                if(Array.isArray(listEducationResult) && listEducationResult.length > 0) {
                    Language.createFromDbById(idLang, (language) => {
                        const listEducation = [];
                        listEducationResult.forEach(element => {
                            listEducation.push(new Education(language.code_iso, ...Object.values(element)));
                        });
                        resolve(listEducation);
                    });
                }else{
                    console.log("Education::createFromDbById::listEducationResult", listEducationResult, error);
                    reject({
                        message: "listEducationResult empy ou not an array"
                    });
                }
            }); 
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

    set date_begin(dateBegin) {
        this.date_begin_value = dateBegin;
        this.date_begin_friendly = this.formatDateToFriendly(dateBegin, "fr", false);
    }

    get date_begin() {
        return this.date_begin_value;
    }    

    set date_end(dateEnd) {
        this.date_end_value = dateEnd;
        this.date_end_friendly = this.formatDateToFriendly(dateEnd, "fr", false);
    }

    get date_end() {
        return this.date_end_value;
    }

    formatDateToFriendly(date, isoLang, longMonthName){
        const date_array = date.split("-");
        const year = parseInt(date_array[0]);
        const month = parseInt(date_array[1]);
        const monthName = DateUtils.getMonthName(month, isoLang, longMonthName);
        
        let enFriendlyDate = `${year} ${monthName}`; // Default : EN 
        let result = null;
        switch(String(isoLang).toLowerCase()){
            case "fr":
                result = `${monthName} ${year}`;
                break;
            default:
                result = enFriendlyDate;
                break;
        }
        return result;
    }

}

module.exports = Education;