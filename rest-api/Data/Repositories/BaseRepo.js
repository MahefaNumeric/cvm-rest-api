
class BaseRepo {

    /**
     * 
     * @param {Object} object 
     */
    static insertObjectLang(object){
        return new Promise(async (resolve, reject) => {
            if(object.id == null){
                reject({
                    origin: "BaseRepo::insertObjectLang",
                    message: "object.id == null"
                });
                return false;
            }

            const tableName = object._table;
            const definitionsLang = object.getDefinitionsLang();

            // resolve([tableName, definitionsLang]); return;

            const languageService = new LanguageService();
            languageService.getAllLanguage().then(allLanguages => {

                const columnsLang = this.buildSqlColumn(definitionsLang);
                const integrationsSqlPart = this.buildSqlInterogation(columnsLang.length);

                const sql = /* sql */`
                    INSERT INTO ${tableName}_lang (
                        id_${tableName},
                        id_lang,
                        ${columnsLang}
                    ) VALUES 
                    ( ?, ?, ${integrationsSqlPart} ),
                    ( ?, ?, ?, ? )
                `;

                const sqlData = [];
                if(Array.isArray(object.title)){
                    for (let index = 0; index < object.title.length; index++) {
                        const idLang = languageService.convertIsoToId(allLanguages, object.title[index].iso);
                        sqlData.push(...[
                            object.id,
                            idLang,
                            object.title[index].value,
                            object.description[index].value
                        ]); 
                    }
                }
                
                const connMysql = require("../../Configs/Databases/db.config");
                connMysql.query(sql, sqlData, (error, result, fields) => {
                    resolve([object, sqlData, result, error]);
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
            if(i > 1) result = result + "?, ";
            else result = result + "?";
        }
        return result;
    }
}

module.exports = BaseRepo;