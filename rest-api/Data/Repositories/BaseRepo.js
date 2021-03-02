const LanguageService = require("../../Services/LanguageService");
const BaseModel = require("../Models/BaseModel");
const SqlUtil = require("../../Utils/Strings/SqlUtil");

class BaseRepo {

    /**
     * 
     * @param {SkillGroup} skillGroup 
     */
    static insert(skillGroup){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sqlSkillGroup = /* sql */`
                INSERT INTO skills_group (
                    slug
                ) VALUES (
                    ?
                )
            `;

            const sqlSkillGroupData = [ skillGroup.slug ];
            connMysql.query(sqlSkillGroup, sqlSkillGroupData, (error, result, fields) => {
                if(error){
                    reject({
                        message: "Error insert",
                        data: [error, result]
                    });
                    return false;
                }

                skillGroup.id = result.insertId;

                this.insertObjectLang(skillGroup)
                    .then(resultInsertSkillGroupLang => {
                        resolve([skillGroup, result, error, resultInsertSkillGroupLang]);
                    })
                    .catch(errorInsertSkillGroupLang => {
                        reject(["insertSkillGroupLang::catch", errorInsertSkillGroupLang, skillGroup, result, error]);
                    });
            });
        });
    }

    /**
     * 
     * @param {BaseModel} model 
     */
    static insertObjectLang(model){
        return new Promise((resolve, reject) => {
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
            languageService.getAllLanguage()
            .then(allLanguages => {
                const columnsLang = SqlUtil.buildSqlColumn(definitionsLang);
                const interogationsSqlPart = SqlUtil.buildSqlInterogation(allLanguages.length);
                const valuesIntergationOnInsert = SqlUtil.buildValuesInterogationsOnInsert(model, interogationsSqlPart);

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