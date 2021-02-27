
class Language{
    static _table = "languages";

    static MSG_NO_LANGUAGE = "NO_LANGUAGE";
    static MSG_RESULT_NOT_KNOW = "RESULT_NOT_KNOW";

    constructor(
        id,
        name,
        code_iso
    ){
        this.id = id;
        this.name = name;
        this.code_iso = code_iso;
    }

    /**
     * 
     * @param {number} idLang 
     * @param {CallableFunction} cbFinnished
     * @returns {Language}
     */
    static createFromDbById(idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT 
                    ${this._table}.*
                FROM ${this._table}
                WHERE id = ${idLang} 
                LIMIT 1
            `;
            connMysql.query(sql, (error, languageResult, fields) => {
                if(error) throw error;
                if(Array.isArray(languageResult) && languageResult.length > 0) {
                    const language = new Language(...Object.values(languageResult[0]));
                    resolve(language);
                }else{
                    console.log("Language::createFromDbById::languageResult", languageResult, error);
                    reject({
                        message: "Language::createFromDbById::languageResult empty"
                    });
                }
            });
        });
    }
    
    /**
     * 
     * @param {string} isoLang 
     * @param {CallableFunction} cbFinnished 
     * @returns {Language}
     */
    static createFromDbByIso(isoLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT 
                    ${this._table}.*
                FROM ${this._table}
                WHERE code_iso = ? 
                LIMIT 1
            `;
            const sqlParams = [isoLang];
            connMysql.query(sql, sqlParams, (error, languageResult, fields) => {
                if(error) {
                    reject({
                        message: "Language::createFromDbById, error",
                        code: error.code,
                        data: [languageResult, error]
                    });
                };
                if(Array.isArray(languageResult)) {
                    if(languageResult.length > 0){
                        const language = new Language(...Object.values(languageResult[0]));
                        resolve(language);
                    }else{
                        reject({
                            message: "Language::createFromDbById::languageResult null",
                            code: this.MSG_NO_LANGUAGE,
                            data: [languageResult, error]
                        });
                    }
                }else{
                    reject({
                        message: "Language::createFromDbById::languageResult result not array (why?)",
                        code: this.MSG_RESULT_NOT_KNOW,
                        data: [languageResult, error]
                    });
                }
            });
        });
    }

}

module.exports = Language;