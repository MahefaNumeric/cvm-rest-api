const Address = require("./Address");
const Template = require("./Template");

class Cv{
    /**
     * 
     * @param {number} id 
     * @param {Template} template 
     * @param {string} slug 
     * @param {Address} address 
     * @param {string} title 
     * @param {string} auto_biography 
     * @param {Date} date_add 
     * @param {Date} date_update 
     */
    constructor(
        id,
        id_template,
        slug,
        id_address,
        date_add,
        date_update,
        title,
        auto_biography
    ){
        this.id = id;
        this.id_template = id_template;
        this.slug = slug;
        this.id_address = id_address;
        this.title = title;
        this.date_add = date_add;
        this.date_update = date_update;
        this.auto_biography = auto_biography;

        // this.template = new Template();
        this.address = null;
    }

    /**
     * 
     * @param {number} idUser 
     * @returns {User}
     */
    static createFromDbById(idCv, idLang, cbFinnished){
        const connMysql = require("../Configs/Databases/db.config");
        const Address = require("../Models/Address");
        const sql = `
        SELECT 
            cv.*, 
            cv_lang.title, 
            cv_lang.auto_biography
        FROM cv 
        JOIN cv_lang 
            ON cv.id=cv_lang.id_cv 
        WHERE id = ${idCv} 
            AND cv_lang.id_lang = ${idLang}
        LIMIT 1`;
        connMysql.query(sql, (error, cvResult, fields) => {
            if(error) throw error;
            if(Array.isArray(cvResult) && cvResult.length > 0){
                const cv = new Cv(...Object.values(cvResult[0]));
                Address.createFromDbById(cv.id_address, 1, (address) => {
                    cv.address = address;
                    cbFinnished && cbFinnished(cv);
                });
            }else{
                console.log("Cv::createFromDbById::cvResult", cvResult, error);
            }
        });
    }

    /**
     * 
     * @param {FormData} form 
     * @returns {User}
     */
    static createFromForm(form){
        const user = new User(
            null
        );
    }
}

module.exports = Cv;