const LanguageService = require("../../Services/LanguageService");
const BaseModel = require("../Models/BaseModel");
const SqlUtil = require("../../Utils/Strings/SqlUtil");

class BaseRepo {

    /**
     * 
     * @param {BaseModel} model 
     */
    static insert(model){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                INSERT INTO skills_group (
                    slug
                ) VALUES (
                    ?
                )
            `;

            const sqlData = [ model.slug ];
            connMysql.query(sql, sqlData, (error, result, fields) => {
                if(error){
                    reject({
                        message: "Error insert",
                        data: [error, result]
                    });
                    return false;
                }

                model.id = result.insertId;

                this.insertLang(model)
                    .then(resultInsertSkillGroupLang => {
                        resolve([model, result, error, resultInsertSkillGroupLang]);
                    })
                    .catch(errorInsertSkillGroupLang => {
                        reject(["insertSkillGroupLang::catch", errorInsertSkillGroupLang, model, result, error]);
                    });
            });
        });
    }

    /**
     * 
     * @param {BaseModel} model 
     */
    static insertLang(model){
        return new Promise((resolve, reject) => {
            if(model.id == null){
                reject({
                    origin: "BaseRepo::insertLang",
                    message: "model.id == null"
                });
                return false;
            }

            const definitionsLang = model.getDefinitionsLang();

            // resolve([model._table, definitionsLang]); return;

            const languageService = new LanguageService();
            languageService.getAllLanguage()
            .then(allLanguages => {
                const columnsLang = SqlUtil.buildSqlColumn(definitionsLang);
                const interogationsSqlPart = SqlUtil.buildSqlInterogation(allLanguages.length);
                const valuesIntergationOnInsert = SqlUtil.buildValuesInterogationsOnInsert(model, interogationsSqlPart);

                const sql = /* sql */`
                    INSERT INTO ${model._table}_lang (
                        id_${model._table},
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
                        const arrayValueData = SqlUtil.buildArrayValueData(model, definitionsLang, index);
                        sqlData.push(...[
                            model.id,
                            idLang,
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
}

module.exports = BaseRepo;