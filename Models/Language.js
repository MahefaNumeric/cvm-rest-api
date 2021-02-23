
class Language{
    static _table = "languages";

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
     * @returns {Language}
     */
    static createFromDbById(idLang, cbFinnished){
        const connMysql = require("../Configs/Databases/db.config");
        const sql = `
        SELECT 
            ${this._table}.*
        FROM ${this._table}
        WHERE id = ${idLang} 
        LIMIT 1`;
        connMysql.query(sql, (error, languageResult, fields) => {
            if(error) throw error;
            if(Array.isArray(languageResult) && languageResult.length > 0) {
                const language = new Language(...Object.values(languageResult[0]));
                cbFinnished && cbFinnished(language);
            }else{
                console.log("Language::createFromDbById::languageResult", languageResult, error);
            }
        });
    }

}

module.exports = Language;