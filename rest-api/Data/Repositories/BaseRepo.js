const LanguageService = require("../../Services/LanguageService");
const BaseModel = require("../Models/BaseModel");

class BaseRepo {

    /**
     * 
     * @param {BaseModel} model 
     */
    static insertObjectLang(model){
        return new Promise(async (resolve, reject) => {
            if(model.id == null){
                reject({
                    origin: "BaseRepo::insertObjectLang",
                    message: "model.id == null"
                });
                return false;
            }

            const tableName = model._table;
            const definitionsLang = model.getDefinitionsLang();

            // resolve([tableName, definitionsLang]); return;

            const languageService = new LanguageService();
            languageService.getAllLanguage().then(allLanguages => {

                const columnsLang = this.buildSqlColumn(definitionsLang);
                const interogationsSqlPart = this.buildSqlInterogation(allLanguages.length);
                const valuesIntergationOnInsert = this.buildValuesInterogationsOnInsert(model, interogationsSqlPart);

                const sql = /* sql */`
                    INSERT INTO ${tableName}_lang (
                        id_${tableName},
                        id_lang,
                        ${columnsLang}
                    ) VALUES 
                    ${valuesIntergationOnInsert}
                `;

                // resolve([columnsLang, interogationsSqlPart, valuesIntergationOnInsert, sql]);

                const sqlData = [];
                if(Array.isArray(model.title)){
                    for (let index = 0; index < model.title.length; index++) {
                        const idLang = languageService.convertIsoToId(allLanguages, model.title[index].iso);
                        const arrayValueData = this.buildArrayValueData(model, definitionsLang, index);
                        sqlData.push(...[
                            model.id,
                            idLang,
                            // model.title[index].value,
                            // model.description[index].value
                            ...arrayValueData
                        ]); 
                    }
                }
                
                const connMysql = require("../../Configs/Databases/db.config");
                connMysql.query(sql, sqlData, (error, result, fields) => {
                    resolve([model, sqlData, result, error]);
                });
            });
        });
    }

    /**
     * 
     * @param {Array<Object>} definitionsLang 
     *  Example : 
        {
            "title": {
                "lang": true
            },
            "description": {
                "lang": true
            }
        }
     * @returns {string} 
        Ex: "title, description"
     */
    static buildSqlColumn(definitionsLang){
        const keys = Object.keys(definitionsLang);
        return keys.join(', ');
    }

    /**
     * 
     * @param {number} number 
     * @returns {string}
     *  Example : "?, ?, ?" if number is 3
     */
    static buildSqlInterogation(number){
        if(!Number.isInteger(number)) throw Error("BaseRepo::buildSqlInterogation, number is not a number");

        let result = "";
        for(let i = number; i > 0; i--){
            if(i > 1) result += "?, ";
            else result += "?";
        }
        return result;
    }

    /**
     * 
     * @param {BaseModel} model 
     * @param {string} interogationsSqlPart 
     * Example : "?, ?, ?"
     * @returns {string}
     * Example : "(?, ?, ?), (?, ?, ?)"
     */
    static buildValuesInterogationsOnInsert(model, interogationsSqlPart){
        const nbOfTranslation = model.title.length
        let result = ``;
        for(let i = 0; i < nbOfTranslation; i++){
            result += `( ?, ?, ${interogationsSqlPart} )`;
            if(i < nbOfTranslation-1) result += ",";
        }
        return result;
    }

    /**
     * 
     * @param {BaseModel} model 
     * Example :
     * {
        "id": 13,
        "slug": "TEST",
        "title": [
            {
                "iso": "fr",
                "value": "Test fr"
            },
            {
                "iso": "en",
                "value": "Test en"
            }
        ],
        ... (Property suite)
     * @param {JSON} definitionsLang
     * Example :
        {
            "title": {
                "lang": true
            },
            "description": {
                "lang": true
            }
     *  }
     * @param {number} indexTranslation
     * Explication :
     *  "propertyLooped": [             <- Property looped
            {                           <- indexTranslation = 0
                "iso": "fr",
                "value": "Test fr"
            },
            {                           <- indexTranslation = 1
                "iso": "en",
                "value": "Test en"
            }
     *  ],
     *
     * @returns {Array}
     */
    static buildArrayValueData(model, definitionsLang, indexTranslation){
        const result = [];
        const definitionsLangKeys = Object.keys(definitionsLang);
        definitionsLangKeys.forEach(keyLang => {
            result.push(
                model[keyLang][indexTranslation].value
            );
        });
        return result;
    }
}

module.exports = BaseRepo;