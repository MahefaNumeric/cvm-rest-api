
module.exports = 

class SqlUtil{

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
            result.push( model[keyLang][indexTranslation].value );
        });
        return result;
    }
}
